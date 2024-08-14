using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Web.UI;
using System.Net;

namespace Relampago2
{
    public partial class Marcas : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["ControlSoftCrDbContext"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnEntrada_Click(object sender, EventArgs e)
        {
            // Guardar la hora de entrada en la sesión
            Session["horaEntrada"] = DateTime.Now.TimeOfDay;
            MostrarMensaje("Hora de entrada registrada. Haga clic en 'Salida' para completar la marca.");
            btnEntrada.Enabled = false;
        }

        protected void btnSalida_Click(object sender, EventArgs e)
        {
            // Recuperar la hora de entrada desde la sesión
            if (Session["horaEntrada"] != null)
            {
                TimeSpan horaEntrada = (TimeSpan)Session["horaEntrada"];
                TimeSpan horaSalida = DateTime.Now.TimeOfDay;

                InsertarMarca(horaEntrada, horaSalida);

                // Limpiar la sesión después de insertar la marca
                Session.Remove("horaEntrada");
            }
            else
            {
                MostrarMensaje("No se ha registrado una hora de entrada. Haga clic en 'Entrada' primero.");
            }
        }

        private void InsertarMarca(TimeSpan horaEntrada, TimeSpan horaSalida)
        {
            try
            {
                List<string> mensajesInconsistencias = new List<string>();
                string correoDestino = null;
                int idEmpleado = Convert.ToInt32(Session["idEmpleado"]); // Obtener el idEmpleado de la sesión

                // Formatear las horas de entrada y salida a "hh:mm:ss"
                string horaEntradaFormatted = horaEntrada.ToString(@"hh\:mm\:ss");
                string horaSalidaFormatted = horaSalida.ToString(@"hh\:mm\:ss");

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    int idMarca;
                    using (SqlCommand command = new SqlCommand("sp_InsertarMarca", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@idEmpleado", idEmpleado);
                        command.Parameters.AddWithValue("@horaEntrada", horaEntradaFormatted);
                        command.Parameters.AddWithValue("@horaSalida", horaSalidaFormatted);

                        try
                        {
                            idMarca = Convert.ToInt32(command.ExecuteScalar());
                        }
                        catch (SqlException ex)
                        {
                            if (ex.Number == 50000)
                            {
                                MostrarMensaje("Error: " + ex.Message);
                                return;
                            }
                            throw;
                        }
                    }

                    using (SqlCommand inconsistenciaCommand = new SqlCommand("sp_GenerarInconsistencia", connection))
                    {
                        inconsistenciaCommand.CommandType = CommandType.StoredProcedure;
                        inconsistenciaCommand.Parameters.AddWithValue("@idMarca", idMarca);
                        inconsistenciaCommand.Parameters.Add("@correoDestino", SqlDbType.VarChar, 50).Direction = ParameterDirection.Output;
                        inconsistenciaCommand.Parameters.Add("@seGeneroInconsistencia", SqlDbType.Bit).Direction = ParameterDirection.Output;

                        using (SqlDataReader reader = inconsistenciaCommand.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                mensajesInconsistencias.Add(reader["mensaje"].ToString());
                            }
                        }

                        bool seGeneroInconsistencia = Convert.ToBoolean(inconsistenciaCommand.Parameters["@seGeneroInconsistencia"].Value);
                        if (seGeneroInconsistencia)
                        {
                            correoDestino = inconsistenciaCommand.Parameters["@correoDestino"].Value.ToString();
                            string mensaje = string.Join("<br>", mensajesInconsistencias);
                            EnviarCorreoInconsistencia(correoDestino, mensaje);
                        }
                    }
                }

                MostrarMensaje("Marca registrada correctamente.");
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error: " + ex.Message);
            }
        }

        private void EnviarCorreoInconsistencia(string correoDestino, string mensaje)
        {
            try
            {
                var fromAddress = new MailAddress("kreuzdev@gmail.com", "Equipo ControlSoftCR");
                var toAddress = new MailAddress(correoDestino);
                const string fromPassword = "kgqr aeqr rosm eydn";
                const string subject = "Notificación de Inconsistencia";

                string body = $@"
                <html>
                <body>
                    <h2>Hola,</h2>
                    <p>{mensaje}</p>
                    <br>
                    <p>Saludos,</p>
                    <p>El equipo de ControlSoftCr</p>
                </body>
                </html>";

                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };

                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true
                })
                {
                    smtp.Send(message);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error al enviar correo: " + ex.Message);
                System.Diagnostics.Debug.WriteLine("Stack Trace: " + ex.StackTrace);
            }
        }

        private void MostrarMensaje(string mensaje)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", $"alert('{mensaje}');", true);
        }
    }
}

using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace Relampago2
{
    public partial class Login : System.Web.UI.Page
    {

        private string connectionString = ConfigurationManager.ConnectionStrings["ControlSoftCrDbContext"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void INICIAR_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("sp_VerificarLogin", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Agregar parámetros
                    cmd.Parameters.AddWithValue("@usuario", usuario.Text);
                    cmd.Parameters.AddWithValue("@contraseña", contra.Text);

                    // Parámetros de salida
                    SqlParameter rolParam = new SqlParameter("@rol", SqlDbType.NVarChar, 50)
                    {
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(rolParam);

                    SqlParameter estadoParam = new SqlParameter("@estadoCre", SqlDbType.Bit)
                    {
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(estadoParam);

                    SqlParameter mensajeParam = new SqlParameter("@mensaje", SqlDbType.NVarChar, 100)
                    {
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(mensajeParam);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();

                        // Obtener los valores de salida
                        string rol = rolParam.Value.ToString();
                        bool estadoCre = (bool)estadoParam.Value;
                        string mensaje = mensajeParam.Value.ToString();

                        // Mostrar valores de salida para depuración
                        Debug.WriteLine($"Valor devuelto para @rol: {rol}");
                        Debug.WriteLine($"Valor devuelto para @estadoCre: {estadoCre}");
                        Debug.WriteLine($"Valor devuelto para @mensaje: {mensaje}");

                        if (estadoCre)
                        {
                            Session["idEmpleado"] = usuario.Text;
                            Session["usuario"] = contra.Text;
                            // Redirigir a la vista correspondiente basado en el rol
                            if (rol == "EMPLEADO")
                            {
                                Response.Redirect("Marcas.aspx");
                            }                        
                            // Añadir más roles si es necesario
                        }
                        else
                        {
                            // Mostrar mensaje de error
                            Mensaje(mensaje, "error");
                        }
                    }
                    catch (Exception ex)
                    {
                        // Manejo de excepciones y errores

                    }
                }
            }
        }
        public void Mensaje(string texto, string icono)
        {
            string sweetAlertScript = "<script src='https://cdn.jsdelivr.net/npm/sweetalert2@11'></script>";
            ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert2", sweetAlertScript, false);

            string script = $@"
     setTimeout(function() {{
         Swal.fire({{
             title: '{texto}',
             text: 'Click para continuar',
             icon: '{icono}'
         }});
     }}, 3000);";
            ScriptManager.RegisterStartupScript(this, GetType(), "SweetAlert", script, true);
        }

    }


}

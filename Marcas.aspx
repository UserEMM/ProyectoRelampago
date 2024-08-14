<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Marcas.aspx.cs" Inherits="Relampago2.Marcas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>RH &#8211; RECURSOS CAM</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="manifest" href="/manifest.json">
    <link rel="icon" href="img/logo.png" sizes="192x192" />
    <link rel="apple-touch-icon-precomposed" href="img/logo.png" />
    <meta name="msapplication-TileImage" content="img/logo.png" />
</head>
<body>

<div class="loader-wrapper">
    
    <section class="dots-container">
        <div style="display: block;">
            <img src="img/logo.png" width="160">
            <div style="display: flex; margin-top: 20px;">
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
        <div class="dot"></div>
    </div>
    </div>
      </section>
</div>


<!-- Script para mostrar/ocultar la pantalla de carga -->
<script>
    // Simular tiempo de carga (en este caso, 3 segundos)
    setTimeout(function () {
        document.querySelector('.loader-wrapper').style.display = 'none';
        document.querySelector('.main-content').style.display = 'block';
    }, 2000); // ajusta el tiempo según sea necesario
</script>
<div class="main-content">
    
    <header>
        <nav class="navbar navbar-expand-lg navbar-light bg-transparent">
            <a class="navbar-brand" href="index.aspx"><img src="img/logo.png" width="160"/></a>
            
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="index.aspx">Inicio</a></li>
                </ul>
            </div> 
            <div class="Arriba">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
               </div>
        </nav>
    </header>
    <div class="Texto">
            <h3 class="text-left">Marcas de <br><span class="text">Entrada y Salida</span> </h3>
    <h5 class="text-secundary">Recursos Humanos CAM</h5>
        </div>
    <section class="approval-form border rounded-lg shadow p-4 position-relative">
     
        <img src="img/empleado.png" alt="Imagen de jefe" class="boss-image">
       
        <div class="row" id="row">
            <div class="left">
            <h3 class="text-left">La Gestion Integral es <br><span class="text">Nuestro Compromiso</span> </h3> 
            </div>
            <div class="right">
                <form runat="server">

                     <script type="text/javascript">
        function updateClock() {
            var now = new Date();
            var hours = now.getHours();
            var minutes = now.getMinutes();
            var seconds = now.getSeconds();
            var ampm = hours >= 12 ? 'pm' : 'am';
            hours = hours % 12;
            hours = hours ? hours : 12; // the hour '0' should be '12'
            minutes = minutes < 10 ? '0' + minutes : minutes;
            seconds = seconds < 10 ? '0' + seconds : seconds;
            var strTime = hours + ':' + minutes + ':' + seconds + ' ' + ampm;
            document.getElementById('clock').innerHTML = strTime;
            setTimeout(updateClock, 1000);
        }

        document.addEventListener("DOMContentLoaded", function () {
            updateClock();
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <main>
        <div class="marcas-contenedor">
           <div class="info">
                <h2 id="clock">Hora</h2>
                <div class="buttons">
                    <br />
                    <div class="form-group">
                        <asp:Button ID="btnEntrada" runat="server"  Text="Entrada" class="btn btn-primary"  onclick="btnEntrada_Click"/>
                        </div>
                    <br />
                    <div class="form-group">
                        <asp:Button ID="btnSalida" runat="server" Text="Salida" class="btn btn-primary"  onclick="btnSalida_Click"/>
                        </div>
                </div>
                <br />
            </div>
        </div>


    </main>

                    
                    
                </form>
            </div>
        </div>
    </section>
    <footer class="footer bg-dark text-white mt-5">
        <div class="text-center py-3 bg-darker">
            <p class="mb-0">&copy; 2024. Recursos CAM.</p>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</div>
</body>
</html>

﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Relampago2.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>RH &#8211; RECURSOS CAM</title>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet"/>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="css/style.css"/>
    
    <link rel="icon" href="img/logo.png" sizes="192x192" />
    <link rel="apple-touch-icon-precomposed" href="img/logo.png" />
    <meta name="msapplication-TileImage" content="img/logo.png" />
</head>
<body>

<div class="loader-wrapper">
    
    <section class="dots-container">
        <div style="display: block;">
            <img src="img/logo.png" width="160"/>
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
    setTimeout(function() {
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
                    <li class="nav-item"><a class="nav-link" href="contactenos.aspx">Contactenos</a></li>
                </ul>
            </div> 
            <div class="Arriba">
                 <a href="Login.aspx" class="navbar-brand">
                 <div class="Usuario">
                    <div class="Usu">
                        <asp:Label ID="ROL" runat="server" class="mr-2" style="font-weight: bold;">Iniciar Sesion</asp:Label>
                    </div>
                    <svg xmlns="http://www.w3.org/2000/svg" width="32px" viewBox="0 0 512 512"><path d="M406.5 399.6C387.4 352.9 341.5 320 288 320l-64 0c-53.5 0-99.4 32.9-118.5 79.6C69.9 362.2 48 311.7 48 256C48 141.1 141.1 48 256 48s208 93.1 208 208c0 55.7-21.9 106.2-57.5 143.6zm-40.1 32.7C334.4 452.4 296.6 464 256 464s-78.4-11.6-110.5-31.7c7.3-36.7 39.7-64.3 78.5-64.3l64 0c38.8 0 71.2 27.6 78.5 64.3zM256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zm0-272a40 40 0 1 1 0-80 40 40 0 1 1 0 80zm-88-40a88 88 0 1 0 176 0 88 88 0 1 0 -176 0z"/></svg>    
                </div>
            </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                </div>
        </nav>
    </header>
    <div class="Texto">
        <h3 class="text-left">Bienvenido a <br><span class="text">Recursos Humanos</span><br> CAM</h3>
        <h5 class="text-secundary">La Gestion Integral es Nuestro Compromiso</h5>
        </div>
    <section class="approval-form border rounded-lg shadow p-4 position-relative">
     
        <img src="img/empleado.png" alt="Imagen de jefe" class="boss-image"/>
       
        <div class="row" id="row">
            <div class="left">
                
            </div>
            <div class="right" style="margin-left: 100px;">
                <br/><br/>
                <p>En Recursos Humanos CAM, nos especializamos en proporcionar soluciones innovadoras y de alta calidad para satisfacer las necesidades de nuestros clientes. Con años de experiencia en el sector, estamos comprometidos a ofrecer un servicio excepcional y productos que superen las expectativas.</p>
                <br/><br/>
            </div>
        </div>
    </section>
     <div class="container mt-5">
        <div class="row" >

            <div class="col-md-4">
                <div class="card">
                    <img src="img/image1.png" width="300"  class="card-img-top" alt="Producto 1">
                    <div class="card-body text-center text-white">
                        <p class="card-text" style="color: #6a65f8; font-weight: bold; font-size: 24px;">Control de Vacaciones.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <img src="img/image2.png" width="300" class="card-img-top" alt="Producto 2">
                    <div class="card-body text-center text-white">
                        <p class="card-text" style="color: #6a65f8; font-weight: bold; font-size: 24px;">Control de Marcas.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card">
                    <img src="img/image3.png" width="300"  class="card-img-top" alt="Producto 3">
                    <div class="card-body text-center text-white">
                        <p class="card-text" style="color: #6a65f8; font-weight: bold; font-size: 24px;">Control de permisos.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <footer class="footer bg-dark text-white mt-5">
        <div class="container py-5">
            <div style="display: flex; width: 100%;">
                <div class="col-md-6">
                    <h5 class="text-uppercase">¿Quiénes somos?</h5>
                    <p>En Recursos CAM, nuestra misión es transformar la gestión de recursos humanos a través de la innovación y la tecnología. Nos especializamos en ofrecer soluciones integrales que simplifican y optimizan la administración de talento, desde la contratación hasta el desarrollo profesional continuo.
                        
                        Nuestro equipo está compuesto por expertos en recursos humanos, tecnología y desarrollo de software, comprometidos en proporcionar herramientas que faciliten la gestión eficiente y eficaz del capital humano. Creemos en el poder de las personas y en el impacto positivo que una buena gestión puede tener en el éxito de una empresa.</p>
                </div>
                
                <div class="col-md-6">
                    <h5 class="text-uppercase">¿Qué hacemos?</h5>
                    <p>Gestión de Talento: Facilitamos procesos de reclutamiento, selección y retención de talento con herramientas intuitivas y basadas en datos.
                        Desarrollo Profesional: Ofrecemos plataformas para el seguimiento del desempeño, la capacitación y el crecimiento de los empleados.
                        Automatización de Tareas: Implementamos soluciones que automatizan y simplifican tareas administrativas, permitiendo a los equipos de recursos humanos centrarse en lo que realmente importa.</p>
                </div>
                
        </div>
            
        </div>
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

<?php

// este index es para mostrar en donde se encuentra el crud se puede cambiar el nombre 
//------------------------------------------------------------//

include("connection.php");

?>

<!DOCTYPE html>


    <!--
    Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
    Click nbfs://nbhost/SystemFileSystem/Templates/Other/html.html to edit this template
    -->
    <html>
    <head>
        <title>Noticias</title>
        <link rel="stylesheet" href="css/index.css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/estilos.css" as="style">
        <link rel="stylesheet" href="css/estilos.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" >
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
</head>
<body>



<header>
            <div class="container-fluid bcontent">
                <nav class="navbar navbar-expand-sm navbar-light bg-light">
                    <a class="navbar-brand" href="#">
                        <img src="img\News_Logo.jpg" width="90" height="90" /></a>
                    <div class = "ms-auto">
                        <ul class="navbar-nav">
                            <li class="nav-item"><a class="nav-link Sombreado Sombreado-Dos Tipo-Letra-Tamaño" href="index.html">Inicio</a></li>
                            <li class="nav-item"><a class="nav-link Sombreado Sombreado-Dos Tipo-Letra-Tamaño" href="deportes.html">Deportes</a></li>
                            <li class="nav-item"><a class="nav-link Sombreado Sombreado-Dos Tipo-Letra-Tamaño" href="#">Tecnología</a></li>
                            <li class="nav-item"><a class="nav-link Sombreado Sombreado-Dos Tipo-Letra-Tamaño" href="#">Internacionales</a></li>

                        </ul>
                    </div>
                </nav>
            </div>
        </header>

         <!--Carrusel-->

         <div id="carouselExampleCaptions" class="carousel slide">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="img/box.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Informe Tica</h5>
                  <p>Siempre con usted las 24 horas.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="img/tecnologia 1.jfif" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Informe Tica</h5>
                  <p>Siempre con usted las 24 horas.</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="img/internacionales 1.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5>Informe Tica</h5>
                  <p>Siempre con usted las 24 horas.</p>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>



        <!-- Footer -->
        <footer class="text-center text-white"  style="background-color: #06243f">
            <div class="container p-4">
                <section class="mb-4">
                    <h1> </h1>
                    <img src="img/News_Logo.jpg" width="80" height="80"/>
                    <h2>..</h2>
                    <p> 24/7 SERVICE</p>
                </section>

                <section class="mb-4">
                    <a class="btn btn-outline-light btn-floating m-1" href="#"role="button">
                        <img src="img/facebook.png" width="35" height="35"/>
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="btn btn-outline-light btn-floating m-1" href="#" role="button">
                        <img src="img/instagram.png" width="35" height="35"/>
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="btn btn-outline-light btn-floating m-1" href="#" role="button">
                        <img src="img/youtube.png" width="35" height="35"/>
                        <i class="fab fa-youtube"></i>
                    </a>
                    <a class="btn btn-outline-light btn-floating m-1" href="#" role="button">
                        <img src="img/map.png" width="35" height="35"/>
                        <i class="fab fa-direccion"></i>
                    </a>
                    <a class="btn btn-outline-light btn-floating m-1" href="tel:+50640001365" role="button">
                        <img src="img/phone.png" width="35" height="35"/>
                        <i class="fab fa-phone"></i>
                    </a>
                </section>
            </div>
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                © 2024 Copyright
            </div>
        </footer>
        </body>
        </html>
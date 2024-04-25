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

         <!--CARTS-->

         <div class="row row-cols-1 row-cols-md-3 g-4">
            <div class="col">
              <div class="card h-100">
                <img src="img/basquet.jpg" class="card-img-top" alt="basquet">
                <div class="card-body">
                  <h5 class="card-title">Basquet</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <a class="btn btn-primary" href="#" role="button" style="background-color: #06243f">Leer más</a>
                </div>
                <div class="card-footer">
                  <small class="text-body-secondary">Last updated 3 mins ago</small>
                </div>
              </div>
            </div>

            <div class="col">
              <div class="card h-100">
                <img src="img/box.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This card has supporting text below as a natural lead-in to additional content.</p>
                  <a class="btn btn-primary" href="#" role="button" style="background-color: #06243f">Leer más</a>
                </div>
                <div class="card-footer">
                  <small class="text-body-secondary">Last updated 3 mins ago</small>
                </div>
              </div>
            </div>
            <div class="col">
              <div class="card h-100">
                <img src="img/fut.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                  <a class="btn btn-primary" href="#" role="button" style="background-color: #06243f">Leer más</a>
                </div>
                <div class="card-footer">
                  <small class="text-body-secondary">Last updated 3 mins ago</small>
                </div>
              </div>
            </div>

            <div class="col">
              <div class="card h-100">
                <img src="img/tenis.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                  <a class="btn btn-primary" href="#" role="button" style="background-color: #06243f">Leer más</a>
                </div>
                <div class="card-footer">
                  <small class="text-body-secondary">Last updated 3 mins ago</small>
                </div>
              </div>
            </div>

            <div class="col">
              <div class="card h-100">
                <img src="img/cars.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                  <a class="btn btn-primary" href="#" role="button" style="background-color: #06243f">Leer más</a>
                </div>
                <div class="card-footer">
                  <small class="text-body-secondary">Last updated 3 mins ago</small>
                </div>
              </div>
            </div>

            <div class="col">
              <div class="card h-100">
                <img src="img/12.webp" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                  <a class="btn btn-primary" href="#" role="button" style="background-color: #06243f">Leer más</a>
                </div>
                <div class="card-footer">
                  <small class="text-body-secondary">Last updated 3 mins ago</small>
                </div>
              </div>
            </div>


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
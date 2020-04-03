<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="View_Usuario_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link runat="server" href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link runat="server" href="~/Font-Awesome/css/all.css" rel="stylesheet" />
    <style type="text/css">
        .vertical-nav {
            min-width: 17rem;
            width: 17rem;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.4s;
        }

        .page-content {
            width: calc(100% - 17rem);
            margin-left: 17rem;
            transition: all 0.4s;
        }

        #sidebar.active {
            margin-left: -17rem;
        }

        #content.active {
            width: 100%;
            margin: 0;
        }

        @media (max-width: 768px) {
            #sidebar {
                margin-left: -17rem;
            }

                #sidebar.active {
                    margin-left: 0;
                }

            #content {
                width: 100%;
                margin: 0;
            }

                #content.active {
                    margin-left: 17rem;
                    width: calc(100% - 17rem);
                }
        }

        body {
            /*
                background: #599fd9;
            background: -webkit-linear-gradient(to right, #599fd9, #c2e59c);
            background: linear-gradient(to right, #599fd9, #c2e59c);
            min-height: 100vh;
            overflow-x: hidden;
            */
            
        }

        .separator {
            margin: 3rem 0;
            border-bottom: 1px dashed #fff;
        }

        .text-uppercase {
            letter-spacing: 0.1em;
        }

        .text-gray {
            color: #aaa;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<!--
            <nav class="navbar navbar-dark bg-dark nav-tog navbar-expand-lg ">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand" href="Inicio.aspx">
                <img src="../../Imagenes/WorldEatsDark.png" width="30" height="30" class="d-inline-block align-top" />
                World Eats
            </a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <div class="navbar-nav text-dark text-center">
                    <a href="#" class="text-dark text-center">
                        <asp:LinkButton Text="<i class='fas fa-user-circle'></i><br/>Iniciar sesión" runat="server" />
                    </a>
                    
                </div>
            </div>
        </nav>-->
        <!--<div class="container">
            <nav class="navbar navbar-expand-sm navbar-light bg-light">
            <a class="navbar-brand" href="Inicio.aspx">
                <img src="../../Imagenes/WorldEatsDark.png" width="30" height="30" class="d-inline-block align-top"/>
                World Eats
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse form-inline" id="navbarTogglerDemo02">
                <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                    <li class="nav-item navbar-brand">
                        <asp:LinkButton CssClass="nav-item nav-link text-dark text-center h6 " Text="<i class='fas fa-user-circle'></i>Iniciar sesión" runat="server" PostBackUrl="~/View/Usuario/IniciarSesion.aspx"/>
                    </li>
                </ul>
            </div>
        </nav>
        </div>-->
        
        <!-- -->

        <!--<div class="pos-f-t">
            <div class="collapse" id="navbarToggleExternalContent">
                <div class="p-4 text-center">
                    <asp:LinkButton Text="<i class='fas fa-user-circle'></i>Iniciar sesión" runat="server" PostBackUrl="~/View/Usuario/IniciarSesion.aspx" CssClass="text-dark"/>
                </div>
            </div>
            <nav class="navbar">
                <a class="navbar-brand text-dark" href="Inicio.aspx">
                    <img src="../../Imagenes/WorldEatsDark.png" width="30" height="30" class="d-inline-block align-top"/>
                    World Eats
                </a>
                <button class="navbar-toggler btn btn-secondary btn-lg" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </nav>
        </div>-->
        <div>
        </div>

        <!--  NavBar Vertical
            -->

        <!-- Vertical navbar -->
        <!-- Vertical navbar -->
<div class="vertical-nav bg-white" id="sidebar">
  <div class="py-4 px-3 mb-4 bg-light">
    <div class="media d-flex align-items-center"><img src="https://res.cloudinary.com/mhmd/image/upload/v1556074849/avatar-1_tcnd60.png" alt="..." width="65" class="mr-3 rounded-circle img-thumbnail shadow-sm">
      <div class="media-body">
        <h4 class="m-0">Jason Doe</h4>
        <p class="font-weight-light text-muted mb-0">Web developer</p>
      </div>
    </div>
  </div>

  <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Main</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic bg-light">
                <i class="fa fa-th-large mr-3 text-primary fa-fw"></i>
                Home
            </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic">
                <i class="fa fa-address-card mr-3 text-primary fa-fw"></i>
                About
            </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic bg-light">
                <i class="fa fa-cubes mr-3 text-primary fa-fw"></i>
                Services
            </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic">
                <i class="fa fa-picture-o mr-3 text-primary fa-fw"></i>
                Gallery
            </a>
    </li>
  </ul>

  <p class="text-gray font-weight-bold text-uppercase px-3 small py-4 mb-0">Charts</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic">
                <i class="fa fa-area-chart mr-3 text-primary fa-fw"></i>
                Area charts
            </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic">
                <i class="fa fa-bar-chart mr-3 text-primary fa-fw"></i>
                Bar charts
            </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic">
                <i class="fa fa-pie-chart mr-3 text-primary fa-fw"></i>
                Pie charts
            </a>
    </li>
    <li class="nav-item">
      <a href="#" class="nav-link text-dark font-italic">
                <i class="fa fa-line-chart mr-3 text-primary fa-fw"></i>
                Line charts
            </a>
    </li>
  </ul>
</div>
<!-- End vertical navbar -->


<!-- Page content holder -->
        <div class="page-content p-5" id="content">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4"><i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold">Toggle</small></button>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="../../JS/JavaScript.js"></script> <!-- JS -->
</body>
</html> 
    
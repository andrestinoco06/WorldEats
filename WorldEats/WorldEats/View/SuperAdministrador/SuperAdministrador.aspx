<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/SuperAdministrador/SuperAdministrador.aspx.cs" Inherits="View_SuperAdministrador_SuperAdministrador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Super Administrador</title>
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
        <!-- Vertical navbar -->
        <div class="vertical-nav bg-white" id="sidebar">
            <div class="py-4 px-3 mb-4 bg-light">
                <div class="media d-flex align-items-center">
                    <div class="media-body">
                        <h4 class="m-0">SUPER ADMINISTRADOR</h4>
                        <p class="font-weight-light text-muted mb-0">NOMBRE</p>
                    </div>
                </div>
            </div>

            <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Menú</p>

            <ul class="nav flex-column bg-white mb-0">
                <li class="nav-item">
                    <a href="#" class="nav-link text-dark font-italic bg-light">
                        <i class="fa fa-th-large mr-3 text-primary fa-fw"></i>
                        Inicio
                    </a>
                </li>
            </ul>
        </div>
        <!-- Contenido -->
        <div class="page-content p-5" id="content">
            <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4"><i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold">Menú</small></button>
        </div>
    </form>
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <script src="../../JS/JavaScript.js"></script>
</body>
</html>


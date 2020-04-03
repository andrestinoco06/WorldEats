<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Usuario/IniciarSesion.aspx.cs" Inherits="View_Usuario_IniciarSesion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Iniciar sesión</title>
    <link runat="server" href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link runat="server" href="~/Font-Awesome/css/all.css" rel="stylesheet" />
    <style type="text/css">    
        /*
        body{
            background: #599fd9;
            background: -webkit-linear-gradient(to right, #599fd9, #c2e59c);
            background: linear-gradient(to right, #599fd9, #c2e59c);
            min-height: 100vh;
            overflow-x: hidden;
        }
        */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <nav class="navbar navbar-dark" style="background-color: #ffffff;">
                <a class="navbar-brand text-dark" href="Inicio.aspx">
                    <img src="../../Imagenes/WorldEatsDark.png" width="30" height="30" class="d-inline-block align-top"/>
                    World Eats
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a class="navbar-brand">
                    <asp:LinkButton CssClass="text-dark text-center h6" Text="<i class='fas fa-user-circle mr-2'></i><br/>Iniciar sesión" runat="server" PostBackUrl="~/View/Usuario/IniciarSesion.aspx"/>
                </a>
            </nav>
        </div>  
        <br />
        <br />
        <br />
        <hr />
        <div class="text-center">
            <table class="w-100 p-3" >
                <tr>
                    <td class="w-25">
                    </td>
                    <td class="p-3 bg-light rounded">
                        <div class="text-center">
                            <img src="../../Imagenes/WorldEatsDark.png" width="30" height="30" class="d-inline-block align-top" alt="" />
                            World Eats
                            <br />
                            <br />
                            <asp:Label Text="Documento de identidad" runat="server" class="font-weight-bold h5" />
                            <br />
                            <table class="w-100">
                                <tr>
                                    <td class="w-25"></td>
                                    <td>
                                        <asp:TextBox ID="TB_Doc_Identidad" runat="server" class="form-control text-center" TextMode="SingleLine" />
                                    </td>
                                    <td class="w-25"></td>
                                </tr>
                            </table>
                            <br />
                            <asp:Label Text="Contraseña" runat="server" class="font-weight-bold h5" />
                            <table class="w-100">
                                <tr>
                                    <td class="w-25"></td>
                                    <td>
                                        <asp:TextBox ID="TB_Contrasena" runat="server" class="form-control text-center" TextMode="Password"/>
                                    </td>
                                    <td class="w-25"></td>
                                </tr>
                            </table>
                            <br />
                            <asp:LinkButton ID="B_Iniciar" CssClass="btn btn-outline-dark btn-sm" Text="<i class='fas fa-sign-in-alt mr-2'></i>Iniciar sesión" runat="server" OnClick="B_Iniciar_Click"/>
                            <br />
                            <br />
                            <table class="w-100 p-3">
                                <tr>
                                    <td class="text-left">
                                        <asp:LinkButton Text="Inicio" runat="server" CssClass="text-dark" PostBackUrl="~/View/Usuario/Inicio.aspx"/>
                                    </td>
                                    <td class="text-right">
                                        <asp:LinkButton Text="¿Olvidó su contraseña?" runat="server" CssClass="text-dark" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                    <td class="w-25">
                    </td>
                </tr>
            </table>
        </div>
        <hr />
        <br />
        <div>
            <table class="w-100">
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50"> 
                        <asp:Panel runat="server" ID="panelMensaje" Visible="false" CssClass="alert alert-warning shadow text-center" role="alert">
                            <strong>
                                <asp:Label ID="L_Mensaje" runat="server" />
                            </strong>
                            <asp:LinkButton Text="<span aria-hidden='true'>&times;</span>" runat="server" CssClass="close" ID="B_Cerrar_Panel" OnClick="Click_B_Cerrar_Panel" />
                        </asp:Panel>
                    </td>
                    <td class="w-25"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

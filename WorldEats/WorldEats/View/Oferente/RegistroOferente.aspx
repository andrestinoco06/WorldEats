<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Oferente/RegistroOferente.aspx.cs" Inherits="View_Oferente_RegistroOferente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro oferente</title>
    <link runat="server" href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link runat="server" href="~/Font-Awesome/css/all.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <nav class="navbar navbar-dark" style="background-color: #ffffff;">
                <a class="navbar-brand text-dark" href="../Usuario/Inicio.aspx">
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
        <hr />
        <br />
        <div class="w-100 text-center text-dark"> 
            <h2>Complete el siguiente formulario para pertenecer a World Eats</h2>
        </div>
        <br />
        <hr />
        <br />
        <div class="text-center">
            <table class="w-100 p-3" >
                <tr>
                    <td></td>
                    <td colspan="4">
                        <h5 class="text-info text-center">¡DATOS PERSONALES!</h5>
                        <br />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="text" placeholder="Nombre" ID="TB_Nombre" CssClass="form-control text-center"/>
                        <hr />
                    </td>
                    <td></td>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="text" placeholder="Apellido" ID="TB_Apellido" CssClass="form-control text-center text-primary"/>
                        <hr />
                    </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="email" placeholder="Correo electrónico" ID="TB_Correo" CssClass="form-control text-center"/>
                        <hr />
                    </td>
                    <td></td>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="text" placeholder="Dirección" ID="TB_Direccion" CssClass="form-control text-center text-primary"/>
                        <hr />
                    </td>
                    <td></td>   
                </tr>
                <tr>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="number" placeholder="Edad" ID="TB_Edad" CssClass="form-control text-center"/>
                    </td>
                    <td></td>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="number" placeholder="Teléfono" ID="TB_Telefono" CssClass="form-control text-center text-primary"/>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">
                        <br />
                        <h5 class="text-info text-center">¡DATOS DE ACCESO!</h5>
                        <br />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="text" placeholder="Documento de identidad" ID="TB_Documento" CssClass="form-control text-center"/>
                    </td>
                    <td></td>
                    <td></td>
                    <td class="w-25">
                        <asp:TextBox runat="server" type="password" placeholder="Contraseña" ID="TB_Contrasena" CssClass="form-control text-center text-primary"/>
                    </td>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">
                        <br />
                        <asp:LinkButton id="LB_Registrar" runat="server" CssClass="btn btn-outline-info btn-sm" Text="<i class='fas fa-registered mr-2'></i>Registrar" OnClick="Click_LB_Registrar"/>
                        <br />
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div>
            <table class="w-100">
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <asp:Panel runat="server" ID="P_Mensaje" Visible="false" CssClass="alert alert-warning shadow text-center" role="alert">                        
                                <strong>
                                  <asp:Label ID="L_Mensaje" runat="server" />
                              </strong>
                              <asp:LinkButton Text="<span aria-hidden='true'>&times;</span>" runat="server" CssClass="close" ID="B_Cerrar_Mensaje" OnClick="Click_B_cerrar_mensaje" />
                        </asp:Panel>
                    </td>
                    <td class="w-25"></td>
                </tr>
            </table>
        </div>
        <br />
        <br />
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>

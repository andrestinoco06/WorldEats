<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Usuario/Inicio.aspx.cs" Inherits="View_Usuario_Inicio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Inicio</title>
    <link runat="server" href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <link runat="server" href="~/Font-Awesome/css/all.css" rel="stylesheet" />
    <style type="text/css">
        .label-world-eats{
            width: 100%;
            font-size: 40px;
            text-align: center;
        }
        .table-button {
            width: 100%;
            text-align: center;
        }        
        .table-td{
            width: 50%;
            text-align: center;
        }
        .table-alerta{
            width: 25%;
        }
        .table-tr{
            width: 100%;
            text-align: center;
        }
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
        <div class="label-world-eats" >
            <asp:Label Text="World Eats" runat="server" Font-Bold="True" />
        </div>
        <hr />
        <div>
            <table class="table-button" >
                <tr>
                    <td class="w-25">
                        <asp:LinkButton CssClass="text-dark text-center h6 btn btn-outline-primary" Text="<i class='fas fa-user mr-2'></i>Cliente" runat="server" PostBackUrl="~/View/Usuario/IniciarSesion.aspx"/>
                    </td>
                    <td class="w-25"> 
                        <asp:LinkButton CssClass="text-dark text-center h6 btn btn-outline-warning" Text="<i class='fas fa-user-tie mr-2'></i>Oferente" runat="server" PostBackUrl="~/View/Oferente/RegistroOferente.aspx" data-toggle="modal" data-target="#exampleModal"/>
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header text-center">
                                        <h5 class="modal-title" id="exampleModalLabel">Oferente</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body text-center">
                                        El oferente es aquella persona o empresa que brinda un producto o servicio, normalmente, con el objetivo de obtener ganancias.
                                    </div>
                                    <div class="modal-footer text-center">
                                        <asp:LinkButton runat="server" type="button" class="btn btn-secondary" >Cancelar</asp:LinkButton>
                                        <asp:LinkButton runat="server" type="button" class="btn btn-success" PostBackUrl="~/View/Oferente/RegistroOferente.aspx" >Continuar</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                    <td class="w-25">
                        <asp:Button ID="B_Administrador" Text="Local" runat="server" class="btn btn-outline-warning" OnClick="Administrador_Click"/>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div class="table-button" >
            <asp:Button ID="B_VerRestaurante" Text="Ver local" runat="server" class="btn btn-outline-warning" OnClick="Ver_Click"/>
        </div>
        <div>
            <hr />
            <asp:GridView runat="server" ID="GV_Restaurante" AutoGenerateColumns="false" ItemType="EncapsulateLocal" CssClass="table table-sm table-bordered shadow" HeaderStyle-CssClass="text-center thead-light" Visible="true" OnRowCommand="GV_Restaurante_RowCommand">
                <Columns>   
                    <asp:TemplateField HeaderText="Nombre" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Nombre %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Eslogan" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Eslogan %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Ciudad" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Ciudad %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Direccion" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Direccion %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Telefono" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Telefono %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LB_Ver" Text="Ver" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("Id_local") %>'/>
                                </ItemTemplate>   
                    </asp:TemplateField>
                </Columns>    
                <EmptyDataTemplate>
                    <div class="text-center">
                                <code>¡Ver local!</code>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
        <br />
        <div>
            <table class="table-tr">
                <tr>
                    <td class="table-alerta"></td>
                    <td class="table-td">
                        <asp:Panel runat="server" ID="panelMensaje" Visible="false" CssClass="alert alert-warning shadow" role="alert">                        
                                <strong>
                                  <asp:Label ID="LblMensaje" runat="server" />
                              </strong>
                              <asp:LinkButton Text="<span aria-hidden='true'>&times;</span>" runat="server" CssClass="close" ID="B_cerrar_mensaje" OnClick="B_cerrar_mensaje_Click" />
                        </asp:Panel>
                    </td>
                    <td class="table-alerta"></td>
                </tr>
            </table>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>

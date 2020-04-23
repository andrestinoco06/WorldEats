<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Oferente/Local.aspx.cs" Inherits="View_Oferente_Local" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Local</title>
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
                    <div class="media-body text-primary">
                        <h4 class="m-0">OFERENTE</h4>
                        <asp:Label ID="L_Oferente" Text="" runat="server" Font-Size="18px" />
                    </div>
                </div>
            </div>

            <p class="text-gray font-weight-bold text-uppercase px-3 small pb-4 mb-0">Menú</p>

            <ul class="nav flex-column bg-white mb-0">
                <li class="nav-item">
                    <asp:LinkButton id="LB_Perfil" runat="server" CssClass="btn btn-light w-100 text-dark fa-fw text-left  font-italic" Text="<i class='fa fa-address-card mr-3 text-primary'></i>Perfil" PostBackUrl="~/View/Oferente/Oferente.aspx" />
                </li>
                <li class="nav-item">
                    <asp:LinkButton id="LB_Local" runat="server" CssClass="btn w-100 text-dark fa-fw text-left font-italic" Text="<i class='fas fa-store mr-3 text-primary'></i>Local" PostBackUrl="~/View/Oferente/Local.aspx"/>
                    
                </li>
                <li class="nav-item">
                        <asp:LinkButton id="LB_Productos" runat="server" CssClass="btn btn-light w-100 text-dark fa-fw text-left font-italic" Text="<i class='fas fa-utensils mr-3 text-primary'></i>Productos" PostBackUrl="~/View/Oferente/Productos.aspx"/>
                </li>
                <li class="nav-item">
                        <asp:LinkButton id="LB_Cerrar_Session" runat="server" CssClass="btn w-100 text-dark fa-fw text-left font-italic" Text="<i class='fas fa-door-open mr-3 text-primary'></i>Cerrar sesión" />
                </li>
            </ul>
        </div>
        <!-- Contenido -->
        <div class="page-content p-5" id="content">
            <table class="w-100">
                <tr>
                    <td class="w-25">
                        <button id="sidebarCollapse" type="button" class="btn btn-light bg-white rounded-pill shadow-sm px-4 mb-4"><i class="fa fa-bars mr-2"></i><small class="text-uppercase font-weight-bold">Menú</small></button>
                    </td>
                    <td class="w-50 text-center text-dark">
                        <h2 class="font-weight-light">LOCAL</h2>
                    </td> 
                    <td class="w-25"></td>
                </tr>
            </table>
            <h4 class="font-weight-lighter">Mis locales</h4>
            <hr />
            <br />
            <table>
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <asp:GridView runat="server" ID="GV_Local" AutoGenerateColumns="false" ItemType="EncapsulateLocal" CssClass="table table-sm table-bordered shadow" HeaderStyle-CssClass="text-center thead-light" Visible="true" SelectMethod="GV_Local_GetData" PageSize="5">
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
                                <asp:TemplateField HeaderText="Dirección" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <h6 class="text-muted"><%# Item.Direccion %></h6>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Teléfono" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <h6 class="text-muted"><%# Item.Telefono %></h6>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center">
                                    <code class="text-primary">¡Aún no hay locales registrados para este usuario!</code>
                                    <br />
                                    <code class="text-primary">¡Complete el formulario de abajo!</code>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </td>
                    <td class="w-25"></td>
                </tr>
            </table>
            <br />
            <h4 class="font-weight-lighter">Crear local</h4>
            <hr />
            <table class="w-100">
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <table>
                            <tr>
                                <td class="w-50">
                                     <asp:TextBox ID="TB_Nombre" runat="server" CssClass="form-control text-center" placeholder="Nombre"/>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="w-25"></td>
                </tr>
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <table>
                            <tr>
                                <td class="w-50">
                                     <asp:TextBox ID="TB_Eslogan" runat="server" CssClass="form-control text-center" placeholder="Eslogan"/>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="w-25"></td>
                </tr>
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <table>
                            <tr>
                                <td class="w-50">
                                     <asp:TextBox ID="TB_Ciudad" runat="server" CssClass="form-control text-center" placeholder="Ciudad"/>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="w-25"></td>
                </tr>
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <table>
                            <tr>
                                <td class="w-50">
                                     <asp:TextBox ID="TB_Direccion" runat="server" CssClass="form-control text-center" placeholder="Dirección"/>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="w-25"></td>
                </tr>
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <table>
                            <tr>
                                <td class="w-50">
                                     <asp:TextBox ID="TB_Telefono" runat="server" CssClass="form-control text-center" placeholder="Teléfono"/>
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="w-25"></td>
                </tr>
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <table>
                            <tr>
                                <td class="w-50 text-center">
                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control text-center btn btn-outline-primary text-secondary" placeholder="Categoría" Enabled="false" BorderStyle="None"/>
                                    <br /> <br />
                                    <asp:GridView runat="server" ShowHeader="false" ShowFooter="true" ID="GV_Categoria" AutoGenerateColumns="false" ItemType="EncapsulateCategoria" CssClass="table table-sm table-bordered shadow" HeaderStyle-CssClass="text-center thead-light" Visible="true" OnRowCommand="GV_Categoria_RowCommand" SelectMethod="GV_Categoria_GetData" PageSize="5">
                                        <Columns>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <h6 class="text-muted"><%# Item.Descripcion %></h6>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:Label Text="¿Otra categoría?" runat="server" Font-Size="Smaller" CssClass="text-center font-weight-ligh"/>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LB_Pedir" Text="Seleccionar" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("IdCategoria") %>' />
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    <asp:LinkButton CssClass="text-primary text-center h6 btn btn-outline-primary btn-sm" Text="Crear" type="button" runat="server"  data-toggle="modal" data-target="#exampleModal"/>
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EmptyDataTemplate>
                                            <div class="text-center">
                                                <code class="text-primary">¡Crear categoría!</code>
                                                <br />
                                                <asp:LinkButton CssClass="text-primary text-center h6 btn btn-outline-primary btn-sm" Text="Crear" type="button" runat="server"  data-toggle="modal" data-target="#exampleModal"/>
                                        </EmptyDataTemplate>
                                    </asp:GridView>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header text-center">
                                                    <h5 class="modal-title" id="exampleModalLabel">Categoría</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body text-center w-100">
                                                    <asp:TextBox ID="TB_Categoria" runat="server" CssClass="form-control text-center" placeholder="Nombre" />
                                                </div>
                                                <div class="modal-footer text-center">
                                                    <asp:LinkButton runat="server" type="button" class="btn btn-secondary">Cancelar</asp:LinkButton>
                                                    <asp:LinkButton runat="server" type="button" class="btn btn-success" OnClick="Click_B_Guardar_Categoria">Guardar</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="w-25"></td>
                </tr>
                <tr>
                    <td class="w-25">
                    </td>
                    <td class="w-25">
                        
                    </td>
                    <td class="w-50"></td>
                </tr>
                <tr>
                    <td class="w-25"></td>
                    <td class="w-50">
                        <table>
                            <tr>
                                <td class="w-50">
                                    <div class="row">
                                        <div class="col">
                                            <asp:Button ID="Button1" Text="Guardar" runat="server" CssClass="btn btn-primary btn-block" OnClick="Click_B_Guardar" />
                                        </div>
                                        <div class="col">
                                            <asp:Button ID="Button2" Text="Cancelar" runat="server" CssClass="btn btn-secondary btn-block" OnClick="Click_B_Cancelar"/>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="w-25"></td>
                </tr>
            </table>
            <hr />
            <br />
            <div>
                <table class="w-100">
                    <tr>
                        <td class="w-25"></td>
                        <td class="w-50">
                            <asp:Panel runat="server" ID="P_Mensaje" Visible="false" CssClass="alert alert-success shadow text-center" role="alert">                        
                                    <strong>
                                      <asp:Label ID="L_Mensaje" runat="server" />
                                  </strong>
                                  <asp:LinkButton Text="<span aria-hidden='true'>&times;</span>" runat="server" CssClass="close" ID="B_cerrar_mensaje" OnClick="B_cerrar_mensaje_Click" />
                            </asp:Panel>
                        </td>
                        <td class="w-25"></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="../../JS/JavaScript.js"></script>
</body>
</html>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Local/VerLocal.aspx.cs" Inherits="View_Local_VerLocal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Local</title>
    <link runat="server" href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .table-label{
            width: 100%;
        }
        .table-espacio{
            width: 10%
        }
        .table-espacio-p{
            width: 5%
        }
        .table-td {
            margin-left: 0px;
            width: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <div class="text-center text-primary" >
            <asp:Label ID="L_Nombre" Text="text" runat="server" Font-Size="30px"/>
        </div>
        <hr />
        <div class="text-center text-info" >
            <asp:Label ID="L_Eslogan" Text="text" runat="server" Font-Size="20px"/>
        </div>
        <br />
        <div>
            <table class="table-label text-center">
                <tr>
                    <td>
                        <h4 class="text-dark">Dirección</h4>
                    </td>
                    <td>
                        <h4 class="text-dark">Teléfono</h4>
                    </td>  
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="L_Direccion" Text="text" runat="server" class="text-dark"/>
                    </td>
                    <td>
                        <asp:Label ID="L_Telefono" Text="text" runat="server" />
                    </td>  
                </tr>
            </table>
        </div>
        <br />
        <div class="text-center text-dark">
            <h3>Platos de comida disponibles</h3>
        </div>
        <br />
        <div>
            <table class="table-label">
                <tr>
                    <td class="table-espacio"></td>
                    <td>
                        <asp:GridView runat="server" ID="GV_Comida" AutoGenerateColumns="false" ItemType="EncapsulateComida" CssClass="table table-sm table-bordered shadow" HeaderStyle-CssClass="text-center thead-light" Visible="true" OnRowCommand="GV_Comida_RowCommand" SelectMethod="GV_Comida_GetData">
                <Columns>   
                    <asp:TemplateField HeaderText="Nombre" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Nombre %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripción" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Descripcion %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Precio %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad disponible" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.CantidadDisponible %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LB_Pedir" Text="Seleccionar" runat="server" CausesValidation="False" CommandName="Select" CommandArgument='<%# Bind("IdComida") %>'/>
                                </ItemTemplate>   
                    </asp:TemplateField>
                </Columns>    
                <EmptyDataTemplate>
                    <div class="text-center">
                                <code>¡Los platos han sido agotados, vuelve pronto!</code>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
                    </td>
                    <td class="table-espacio"></td>
                </tr>
            </table>
        </div>
        <br />
        <br />
        <div>
            <table class="table-label text-center">
                <tr>
                    <td class="table-td">
                        <h4 class="text-dark">Producto</h4>
                    </td>
                    <td class="table-td row justify-content-around">
                        <h4 class="text-dark">¿Cuántos desea comprar?</h4>
                    </td>
                </tr>
                <tr>
                    <td class="table-td">
                        <asp:Label ID="L_Comida" Text="Selecciona un producto" runat="server" class="text-warning"/>
                    </td>
                    <td class="table-td text-center">
                        <asp:TextBox id="TB_Cantidad" runat="server" TextMode="Number" class="form-control" Width="50%" />
                    </td>
                </tr>
                <tr>
                    <td class="table-td">
                    </td>
                    <td class="table-td row justify-content-around">
                        <h4 class="text-dark">Dirección</h4>
                    </td>
                </tr>
                <tr>
                    <td rowspan="2">
                        <asp:Button ID="B_Comprar" Text="COMPRAR" runat="server" class="btn btn-success" Visible="false" OnClick="Comprar_Click"/>
                    </td>
                    <td class="table-td text-center">
                        <asp:TextBox id="TB_DireccionC" runat="server" TextMode="SingleLine" class="form-control" Width="50%" />
                    </td>
                </tr>
                <tr>
                    <td class="table-td row justify-content-around">
                        <h4 class="text-dark">Teléfono</h4>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td class="table-td text-center">
                        <asp:TextBox id="TB_TelefonoC" runat="server" TextMode="SingleLine" class="form-control" Width="50%" />
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table class="table-label text-center">
                <tr>
                    <td></td>
                    <td class="table-td">
                        <asp:Panel runat="server" ID="panelMensaje" Visible="false" CssClass="alert alert-success shadow" role="alert">                        
                                <strong>
                                  <asp:Label ID="LblMensaje" runat="server" />
                              </strong>
                              <asp:LinkButton Text="<span aria-hidden='true'>&times;</span>" runat="server" CssClass="close" ID="B_cerrar_mensaje" OnClick="B_cerrar_mensaje_Click" />
                        </asp:Panel>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
        <hr />
        <div class="text-center text-primary" >
            <h3>PEDIDOS REALIZADOS</h3>
        </div>
        <hr />
        <div>
            <table class="table-label">
                <tr>
                    <td class="table-espacio-p"></td>
                    <td>
                        <asp:GridView runat="server" ID="GV_Pedidos" AutoGenerateColumns="false" ItemType="EncapsulatePedido" CssClass="table table-sm table-bordered shadow" HeaderStyle-CssClass="text-center thead-light" Visible="true" SelectMethod="GV_Pedido_GetData">
                <Columns>   
                    <asp:TemplateField HeaderText="Nombre" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.NombreLocal %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comida" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.NombreComida %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Documento identidad" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.DocIdentidad %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cantidad" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Cantidad %></h6>
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
                    <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <h6 class="text-muted"><%# Item.Total %></h6>
                                </ItemTemplate>
                    </asp:TemplateField>
                </Columns>    
                <EmptyDataTemplate>
                    <div class="text-center">
                                <code>¡No hay pedidos!</code>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
                    </td>
                    <td class="table-espacio-p"></td>
                </tr>
            </table>
        </div>
        <hr />
    </form>
</body>
</html>

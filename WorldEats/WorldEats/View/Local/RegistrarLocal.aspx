<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Controller/Local/RegistrarLocal.aspx.cs" Inherits="View_Local_RegistrarLocal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrar local</title>
    <link runat="server" href="~/Content/bootstrap.min.css" rel="stylesheet" />
    <style type="text/css">
        .label-world-eats{
            width: 100%;
            font-size: 40px;
            text-align: center;
        }
        .table-tr{
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="label-world-eats" >
            <asp:Label Text="Registro local World Eats" runat="server" Font-Bold="True" />
        </div>
        <hr />
        <div>
            <table class="table-tr">
                <tr>
                    <td class="table-td">
                        <asp:Label Text="Nombre local:" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox id="TB_NombreLocal" runat="server" TextMode="SingleLine" class="form-control" Width="40%"/>
                    </td>     
                </tr>
                <tr>
                    <td class="table-td">
                        <asp:Label Text="Eslogan:" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox id="TB_Eslogan" runat="server" TextMode="SingleLine" class="form-control" Width="40%"/>
                    </td> 
                </tr>
                <tr>
                    <td class="table-td">
                        <asp:Label Text="Ciudad:" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox id="TB_Ciudad" runat="server" TextMode="SingleLine" class="form-control" Width="40%"/>
                    </td> 
                </tr>
                <tr>
                    <td class="table-td">
                        <asp:Label Text="Dirección:" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox id="TB_Direccion" runat="server" TextMode="SingleLine" class="form-control" Width="40%"/>
                    </td> 
                </tr>
                <tr>
                    <td class="table-td">
                        <asp:Label Text="Teléfono:" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox id="TB_Telefono" runat="server" TextMode="Number" class="form-control" Width="40%"/>
                    </td> 
                </tr>
                <tr>
                    <td class="table-td">
                        <asp:Label Text="C.C. administrador:" runat="server" />
                    </td>
                    <td>
                        <asp:TextBox id="TB_CCAdministrador" runat="server" TextMode="Number" class="form-control" Width="40%"/>
                    </td> 
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table  class="table-tr">
                <tr>
                    <td>
                        <asp:Button ID="B_Cancelar" Text="Cancelar" runat="server" class="btn btn-outline-dark" OnClick="Cancelar_Click"/>
                    </td>
                    <td>
                        <asp:Button ID="B_ReistrarLocal" Text="Registrar" runat="server" class="btn btn-outline-dark" OnClick="Registrar_Click"/>
                    </td>
                </tr>
            </table>
        </div>
        <br />
        <div>
            <table class="table-tr">
                <tr>
                    <td class="table-alerta"></td>
                    <td class="table-td">
                        <asp:Panel runat="server" ID="panelMensaje" Visible="false" CssClass="alert alert-success shadow" role="alert">                        
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
</body>
</html>

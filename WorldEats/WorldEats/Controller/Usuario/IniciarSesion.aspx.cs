using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Usuario_IniciarSesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }

    protected void B_Iniciar_Click (object sender, EventArgs e)
    {
        try
        {
            EncapsulateUsuario usuario = new EncapsulateUsuario();
            usuario.DocIdentidad = TB_Doc_Identidad.Text;
            usuario.Contrasena = TB_Contrasena.Text;

            List<EncapsulateUsuario> listUsuario = new DataUsuario().iniciarSesion(usuario);

            if(listUsuario.Count > 0)
            {
                EncapsulateUsuario usuarioIniciar = listUsuario.First();
                Session["Nombre"] = usuarioIniciar.Nombre;
                Session["Documento"] = usuarioIniciar.DocIdentidad;

                switch (usuarioIniciar.IdRol)
                {
                    case 1:
                        Response.Redirect("~/View/SuperAdministrador/SuperAdministrador.aspx");
                        break;
                    case 2:
                        Response.Redirect("~/View/Oferente/Oferente.aspx");
                        break;
                    case 3:
                        Response.Redirect("Cliente.aspx");
                        break;
                }
            }
            else
            {
                string mensaje = "DATOS DE ACCESO INCORRECTOS";
                mostrarMensaje(mensaje);
                TB_Doc_Identidad.Text = "";
            }

        }
        catch (Exception Ex)
        {
            throw Ex;
        }
    }

    private void mostrarMensaje(String mensaje)
    {
        L_Mensaje.Text = mensaje;
        panelMensaje.Visible = true;
    }

    protected void Click_B_Cerrar_Panel(object sender, EventArgs e)
    {
        panelMensaje.Visible = false;
    }

}
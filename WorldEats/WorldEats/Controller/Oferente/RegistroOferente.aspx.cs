using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Oferente_RegistroOferente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Click_LB_Registrar(object sender, EventArgs e)
    {
        try
        {
            EncapsulateUsuario usuario = new EncapsulateUsuario();
            usuario.Nombre = TB_Nombre.Text;
            usuario.Apellido = TB_Apellido.Text;
            usuario.Correo = TB_Correo.Text;
            usuario.Direccion = TB_Direccion.Text;
            usuario.Edad = int.Parse(TB_Edad.Text);
            usuario.Telefono = long.Parse(TB_Telefono.Text);
            usuario.DocIdentidad = TB_Documento.Text;
            usuario.Contrasena = TB_Contrasena.Text;
            usuario.IdRol = 2;
            bool respuesta = new DataUsuario().registrarUsuario(usuario);
            if(respuesta == true)
            {
                Response.Redirect("~/View/Usuario/IniciarSesion.aspx");
            }
            else
            {
                String mensaje = "¡El documento de identidad ya se encuentra registrado!";
                mostrarMensaje(mensaje);
            }
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
    }

    private void mostrarMensaje(string mensaje)
    {
        L_Mensaje.Text = mensaje;
        P_Mensaje.Visible = true;
    }

    protected void Click_B_cerrar_mensaje(object sender, EventArgs e)
    {
        P_Mensaje.Visible = false;
    }
}
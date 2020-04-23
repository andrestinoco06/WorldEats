using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Oferente_Oferente : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            getOferente();
        }
    }
    

    protected void getOferente()
    {
        string nombre = "Bienvenido " + Session["Nombre"].ToString();
        string documento = Session["Documento"].ToString();
        L_Oferente.Text = nombre;
        List<EncapsulateUsuario> listUsuario = new DataUsuario().leerUsuario().Where(x => x.DocIdentidad == documento).ToList();
        EncapsulateUsuario datosUsuario = listUsuario.First();

        TB_Nombre.Text = datosUsuario.Nombre;
        TB_Apellido.Text = datosUsuario.Apellido;
        TB_Direccion.Text = datosUsuario.Direccion;
        TB_Correo.Text = datosUsuario.Correo;
        TB_Telefono.Text = Convert.ToInt64(datosUsuario.Telefono).ToString();
        TB_Edad.Text = Convert.ToUInt32(datosUsuario.Edad).ToString();
        TB_Documento.Text = datosUsuario.DocIdentidad;
        TB_Contrasena.Attributes.Add("value", datosUsuario.Contrasena);
    }

    protected void Click_B_Habilitar (object sender, EventArgs e)
    {
        B_Aplicar.Visible = true;
        B_Cancelar.Visible = true;
        TB_Nombre.Enabled = true;
        TB_Apellido.Enabled = true;
        TB_Direccion.Enabled = true;
        TB_Correo.Enabled = true;
        TB_Telefono.Enabled = true;
        TB_Edad.Enabled = true;
        TB_Contrasena.Enabled = true;
    }

    protected void Click_B_Aplicar (object sender, EventArgs e)
    {
        try
        {
            EncapsulateUsuario usuario = new EncapsulateUsuario();
            usuario.Nombre = TB_Nombre.Text;
            usuario.Apellido = TB_Apellido.Text;
            usuario.Direccion = TB_Direccion.Text;
            usuario.Correo = TB_Correo.Text;
            usuario.Telefono = Convert.ToInt64(TB_Telefono.Text);
            usuario.Edad = Convert.ToInt32(TB_Edad.Text);
            usuario.DocIdentidad = TB_Documento.Text;
            usuario.Contrasena = TB_Contrasena.Text;
            bool respuesta = new DataUsuario().editarUsuario(usuario);
            if (respuesta == true)
            {
                Response.Redirect(Request.Url.AbsoluteUri);
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

    protected void Click_B_Cancelar (object sender, EventArgs e)
    {
        B_Aplicar.Visible = false;
        B_Cancelar.Visible = false;
        TB_Nombre.Enabled = false;
        TB_Apellido.Enabled = false;
        TB_Direccion.Enabled = false;
        TB_Correo.Enabled = false;
        TB_Telefono.Enabled = false;
        TB_Edad.Enabled = false;
        TB_Contrasena.Enabled = false;
    }

    private void mostrarMensaje(string mensaje)
    {
        L_Mensaje.Text = mensaje;
        P_Mensaje.Visible = true;
    }

    protected void Click_B_Cerrar_Mensaje(object sender, EventArgs e)
    {
        P_Mensaje.Visible = false;
    }

}

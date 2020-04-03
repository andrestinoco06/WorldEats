using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Local_RegistrarLocal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Registrar_Click(object sender, EventArgs e)
    {
        String mensaje;

        try
        {
            EncapsulateLocal local = new EncapsulateLocal();
            local.Nombre = TB_NombreLocal.Text;
            local.Eslogan = TB_Eslogan.Text;
            local.Ciudad = TB_Ciudad.Text;
            local.Direccion = TB_Direccion.Text;
            local.Telefono = long.Parse(TB_Telefono.Text);
            local.Doc_identidad = TB_CCAdministrador.Text;
            local.Id_categoria = 1;
            bool respuesta = new DataLocal().insertarLocal(local);
            if (respuesta == true)
            {
                mensaje = "Datos almacenados correctamente";
                mostrarMensaje(mensaje);
           }
            else
            {
                mensaje = "Datos almacenados incorrectamente";
                mostrarMensaje(mensaje);
            }
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
    }

    protected void Cancelar_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/Usuario/Inicio.aspx");
    }

    private void mostrarMensaje(string mensaje)
    {
        LblMensaje.Text = mensaje;
        panelMensaje.Visible = true;        
    }

    protected void B_cerrar_mensaje_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
        //panelMensaje.Visible = false;
    }
}
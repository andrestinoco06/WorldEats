using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Usuario_Inicio : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GV_Restaurante.DataBind();
        }
    }

    protected void Administrador_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/View/Local/RegistrarLocal.aspx");
    }

    protected void Ver_Click(object sender, EventArgs e)
    {
        List<EncapsulateLocal> busqueda = new DataLocal().leerLocal();
        string mensaje;

        if (busqueda.Count > 0)
        {
            GV_Restaurante.DataSource = busqueda;
            GV_Restaurante.DataBind();
        }
        else
        {
            mensaje = "No se han encontrado datos";
            mostrarMensaje(mensaje);
        }
    }

    private void mostrarMensaje(string mensaje)
    {
        LblMensaje.Text = mensaje;
        panelMensaje.Visible = true;
    }

    protected void B_cerrar_mensaje_Click(object sender, EventArgs e)
    {
        panelMensaje.Visible = false;
    }

    protected void GV_Restaurante_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            Session["local"] = e.CommandArgument.ToString();
            Response.Redirect("~/View/Local/VerLocal.aspx");
        }
    }
}
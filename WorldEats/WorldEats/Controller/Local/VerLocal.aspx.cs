using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Local_VerLocal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        long filtro = Convert.ToInt64(Session["local"]);
        List<EncapsulateLocal> listLocal = new DataLocal().leerLocal().Where(x => x.Id_local == filtro).ToList();

        L_Nombre.Text = listLocal[0].Nombre;
        L_Eslogan.Text = listLocal[0].Eslogan;
        L_Direccion.Text = listLocal[0].Direccion;
        L_Telefono.Text = listLocal[0].Telefono.ToString();
    }

    protected void GV_Comida_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            Session["comida"] = e.CommandArgument.ToString();
            long filtro = Convert.ToInt64(Session["comida"]);
            List<EncapsulateComida> listLocal = new DataComida().leerComida().Where(x => x.IdComida == filtro).ToList();
            L_Comida.Text = listLocal[0].Nombre;
            B_Comprar.Visible = true;
        }
    }

    public List<EncapsulateComida> GV_Comida_GetData()
    {
        long filtro = Convert.ToInt64(Session["local"]);
        List<EncapsulateComida> busqueda = new DataComida().leerComida();
        return busqueda.Where(x => x.IdLocal == filtro).ToList();
    }

    public List<EncapsulatePedido> GV_Pedido_GetData()
    {
        long filtro = Convert.ToInt64(Session["local"]);
        List<EncapsulatePedido> busqueda = new DataPedido().leerPedido();
        return busqueda.Where(x => x.IdLocal == filtro).ToList();
    }

    protected void Comprar_Click(object sender, EventArgs e)
    {
        String mensaje;

        try
        {
            EncapsulatePedido pedido = new EncapsulatePedido();
            pedido.IdLocal = Convert.ToInt64(Session["local"]);
            pedido.DocIdentidad = "1077976549";
            pedido.Cantidad = int.Parse(TB_Cantidad.Text);
            pedido.Direccion = TB_DireccionC.Text;
            pedido.Telefono = long.Parse(TB_TelefonoC.Text);
            pedido.IdComida = Convert.ToInt64(Session["comida"]);
            
            bool respuesta = new DataPedido().insertarPedido(pedido);
            if (respuesta == true)
            {
                mensaje = "Pedido realizado";
                mostrarMensaje(mensaje);
            }
            else
            {
                mensaje = "Error";
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
        LblMensaje.Text = mensaje;
        panelMensaje.Visible = true;
    }

    protected void B_cerrar_mensaje_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.Url.AbsoluteUri);
    }
}
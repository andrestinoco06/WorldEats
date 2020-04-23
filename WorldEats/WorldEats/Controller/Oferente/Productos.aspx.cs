using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Oferente_Productos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getOferente();
    }

    protected void getOferente()
    {
        string nombre = "Bienvenido " + Session["Nombre"].ToString();
        L_Oferente.Text = nombre;
    }

    public List<EncapsulateComida> GV_Comida_GetData()
    {
        List<EncapsulateComida> busqueda = new DataComida().leerComida();
        //List<EncapsulateCategoria> busqueda = new List<EncapsulateCategoria>();
        return busqueda.OrderBy(x => x.Descripcion).ToList();
    }

    protected void GV_Local_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            Session["LocalProducto"] = e.CommandArgument.ToString();
        }
    }

    protected void GV_Comida_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            Session["IdComida"] = e.CommandArgument.ToString();
            EncapsulateComida comida = new EncapsulateComida();
            comida.IdComida = Convert.ToInt64(Session["IdComida"]);
            bool respuesta = new DataComida().eliminarComida(comida);
            GV_Comida.DataBind();
        }
    }

    public List<EncapsulateLocal> GV_Local_GetData()
    {
        string filtro = Session["Documento"].ToString();
        List<EncapsulateLocal> busqueda = new DataLocal().leerLocal();
        return busqueda.Where(X => X.Doc_identidad == filtro).ToList();
    }

    protected void Click_B_Crear (object sender, EventArgs e)
    {
        String mensaje;

        EncapsulateComida comida = new EncapsulateComida();
        comida.Nombre = TB_Nombre.Text;
        comida.Descripcion = TB_Descripcion.Text;
        comida.Precio = Convert.ToInt32(TB_Precio.Text);
        comida.CantidadDisponible = Convert.ToInt32(TB_Cantidad.Text);
        comida.IdLocal = Convert.ToInt64(Session["LocalProducto"]);
        bool respuesta = new DataComida().registrarComida(comida);
        if (respuesta == true)
        {
            mensaje = "Datos almacenados correctamente";
            mostrarMensaje(mensaje);
            GV_Comida.DataBind();
        }
        else
        {
            mensaje = "¡El documento de identidad ya se encuentra registrado!";
            mostrarMensaje(mensaje);
        }
    }

    protected void B_cerrar_mensaje_Click(object sender, EventArgs e)
    {
        P_Mensaje.Visible = false;
    }

    private void mostrarMensaje(string mensaje)
    {
        L_Mensaje.Text = mensaje;
        P_Mensaje.Visible = true;
    }
}
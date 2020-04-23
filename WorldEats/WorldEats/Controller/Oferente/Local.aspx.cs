using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class View_Oferente_Local : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getOferente();
    }

    protected void GV_Categoria_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Select"))
        {
            Session["Categoria"] = e.CommandArgument.ToString();
        }
    }

    public List<EncapsulateCategoria> GV_Categoria_GetData()
    {
        List<EncapsulateCategoria> busqueda = new DataCategoria().leerCategoria();
        //List<EncapsulateCategoria> busqueda = new List<EncapsulateCategoria>();
        return busqueda.OrderBy(x => x.Descripcion).ToList();
    }

    public List<EncapsulateLocal> GV_Local_GetData()
    {
        string filtro = Session["Documento"].ToString();
        List<EncapsulateLocal> busqueda = new DataLocal().leerLocal();
        return busqueda.Where(X => X.Doc_identidad == filtro).ToList();
    }

    protected void Click_B_Guardar(object sender, EventArgs e)
    {
        String mensaje;

        try
        {
            EncapsulateLocal local = new EncapsulateLocal();
            local.Nombre = TB_Nombre.Text;
            local.Eslogan = TB_Eslogan.Text;
            local.Ciudad = TB_Ciudad.Text;
            local.Direccion = TB_Direccion.Text;
            local.Telefono = long.Parse(TB_Telefono.Text);
            local.Doc_identidad = Session["Documento"].ToString();
            local.Id_categoria = Convert.ToInt32(Session["Categoria"]);
            bool respuesta = new DataLocal().insertarLocal(local);
            if (respuesta == true)
            {
                mensaje = "Datos almacenados correctamente";
                mostrarMensaje(mensaje);
                GV_Local.DataBind();
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

    protected void Click_B_Cancelar(object sender, EventArgs e)
    {
        TB_Nombre.Text = "";
        TB_Eslogan.Text = "";
        TB_Ciudad.Text = "";
        TB_Direccion.Text = "";
        TB_Telefono.Text = "";
    }

    protected void Click_B_Guardar_Categoria(object sender, EventArgs e)
    {
        EncapsulateCategoria categoria = new EncapsulateCategoria();
        categoria.Descripcion = TB_Categoria.Text;
        bool respuesta = new DataCategoria().insertarCategoria(categoria);
        GV_Categoria.DataBind();
    }

    private void mostrarMensaje(string mensaje)
    {
        L_Mensaje.Text = mensaje;
        P_Mensaje.Visible = true;
    }

    protected void B_cerrar_mensaje_Click(object sender, EventArgs e)
    {
        P_Mensaje.Visible = false;
    }

    protected void getOferente()
    {
        string nombre = "Bienvenido " + Session["Nombre"].ToString();
        L_Oferente.Text = nombre;
    }
}
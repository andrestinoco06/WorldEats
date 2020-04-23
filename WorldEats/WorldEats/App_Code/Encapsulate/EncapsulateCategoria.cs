using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EncapsulateCategoria
{
    private int idCategoria;
    private string descripcion;

    public int IdCategoria { get => idCategoria; set => idCategoria = value; }
    public string Descripcion { get => descripcion; set => descripcion = value; }
}
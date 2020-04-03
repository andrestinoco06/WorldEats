using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EncapsulateComida
{
    private long idComida, idLocal;
    private string nombre, descripcion, imagen;
    private int precio, cantidadDisponible;

    public long IdComida { get => idComida; set => idComida = value; }
    public long IdLocal { get => idLocal; set => idLocal = value; }
    public string Nombre { get => nombre; set => nombre = value; }
    public string Descripcion { get => descripcion; set => descripcion = value; }
    public string Imagen { get => imagen; set => imagen = value; }
    public int Precio { get => precio; set => precio = value; }
    public int CantidadDisponible { get => cantidadDisponible; set => cantidadDisponible = value; }
}
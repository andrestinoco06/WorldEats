using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EncapsulatePedido
{
    private long idPedido, idLocal, telefono, idComida;
    private string docIdentidad, direccion, nombreLocal, nombreComida;
    private int cantidad, total;

    public long IdPedido { get => idPedido; set => idPedido = value; }
    public long IdLocal { get => idLocal; set => idLocal = value; }
    public long Telefono { get => telefono; set => telefono = value; }
    public long IdComida { get => idComida; set => idComida = value; }
    public string DocIdentidad { get => docIdentidad; set => docIdentidad = value; }
    public string Direccion { get => direccion; set => direccion = value; }
    public string NombreLocal { get => nombreLocal; set => nombreLocal = value; }
    public string NombreComida { get => nombreComida; set => nombreComida = value; }
    public int Cantidad { get => cantidad; set => cantidad = value; }
    public int Total { get => total; set => total = value; }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EncapsulateLocal
{
    private long id_local;
    private string nombre;
    private string logo;
    private string eslogan;
    private string ciudad;
    private string direccion;
    private long telefono;
    private string doc_identidad;
    private int id_categoria;

    public long Id_local { get => id_local; set => id_local = value; }
    public string Nombre { get => nombre; set => nombre = value; }
    public string Logo { get => logo; set => logo = value; }
    public string Eslogan { get => eslogan; set => eslogan = value; }
    public string Ciudad { get => ciudad; set => ciudad = value; }
    public string Direccion { get => direccion; set => direccion = value; }
    public long Telefono { get => telefono; set => telefono = value; }
    public string Doc_identidad { get => doc_identidad; set => doc_identidad = value; }
    public int Id_categoria { get => id_categoria; set => id_categoria = value; }
}
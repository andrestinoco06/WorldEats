using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class EncapsulateUsuario
{

    private string docIdentidad, nombre, apellido, direccion, correo, session, contrasena;
    private int edad, idRol, idEstado;
    private long telefono;

    public string DocIdentidad { get => docIdentidad; set => docIdentidad = value; }
    public string Nombre { get => nombre; set => nombre = value; }
    public string Apellido { get => apellido; set => apellido = value; }
    public string Direccion { get => direccion; set => direccion = value; }
    public string Correo { get => correo; set => correo = value; }
    public string Session { get => session; set => session = value; }
    public string Contrasena { get => contrasena; set => contrasena = value; }
    public int Edad { get => edad; set => edad = value; }
    public int IdRol { get => idRol; set => idRol = value; }
    public int IdEstado { get => idEstado; set => idEstado = value; }
    public long Telefono { get => telefono; set => telefono = value; }

}
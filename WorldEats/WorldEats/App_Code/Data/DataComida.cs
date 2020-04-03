using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

public class DataComida
{
    public List<EncapsulateComida> leerComida()
    {
        List<EncapsulateComida> listComida = new List<EncapsulateComida>();
        DataTable comida = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_leer_comida", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(comida);
        }
        catch (Exception Ex)
        {
            throw Ex;
        }
        finally
        {
            if (conection != null)
            {
                conection.Close();
            }
        }

        listComida = comida.AsEnumerable().Select(m => new EncapsulateComida()
        {
            IdComida = m.Field<long>("id_comida"),
            Nombre = m.Field<string>("nombre"),
            Descripcion = m.Field<string>("descripcion"),
            Precio = m.Field<int>("precio"),
            CantidadDisponible = m.Field<int>("cantidad_disponible"),
            Imagen = m.Field<string>("imagen"),
            IdLocal = m.Field<long>("id_local")
        }).ToList();

        return listComida;
    }
}
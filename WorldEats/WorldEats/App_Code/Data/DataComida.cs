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

    public bool registrarComida(EncapsulateComida comida)
    {
        DataTable dataComida = new DataTable();
        Boolean respuesta = false;
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_registrar_comida", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = comida.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Text).Value = comida.Descripcion;
            dataAdapter.SelectCommand.Parameters.Add("_precio", NpgsqlDbType.Integer).Value = comida.Precio;
            dataAdapter.SelectCommand.Parameters.Add("_cantidad_disponible", NpgsqlDbType.Integer).Value = comida.CantidadDisponible;
            dataAdapter.SelectCommand.Parameters.Add("_id_local", NpgsqlDbType.Bigint).Value = comida.IdLocal;

            conection.Open();
            dataAdapter.Fill(dataComida);
            respuesta = Convert.ToBoolean(dataComida.Rows[0].ItemArray[0]);
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
        return respuesta;
    }

    public bool eliminarComida(EncapsulateComida comida)
    {
        DataTable dataComida = new DataTable();
        Boolean respuesta = false;
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_eliminar_comida", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_id_comida", NpgsqlDbType.Bigint).Value = comida.IdComida;

            conection.Open();
            dataAdapter.Fill(dataComida);
            respuesta = Convert.ToBoolean(dataComida.Rows[0].ItemArray[0]);
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
        return respuesta;
    }

    public List<EncapsulateComida> leerComida1(string filtro)
    {
        List<EncapsulateComida> listComida = new List<EncapsulateComida>();
        DataTable comida = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_leer_comida1", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_doc", NpgsqlDbType.Text).Value = filtro;

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
using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;


public class DataCategoria
{
    public List<EncapsulateCategoria> leerCategoria()
    {
        List<EncapsulateCategoria> listCategoria = new List<EncapsulateCategoria>();
        DataTable categoria = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_leer_categoria", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(categoria);
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

        listCategoria = categoria.AsEnumerable().Select(m => new EncapsulateCategoria()
        {
            IdCategoria = m.Field<int>("id_categoria"),
            Descripcion = m.Field<string>("descripcion")
        }).ToList();

        return listCategoria;
    }

    public bool insertarCategoria(EncapsulateCategoria categoria)
    {
        DataTable dataCategoria = new DataTable();
        Boolean respuesta = false;
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_registrar_categoria", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_descripcion", NpgsqlDbType.Text).Value = categoria.Descripcion;

            conection.Open();
            dataAdapter.Fill(dataCategoria);
            respuesta = Convert.ToBoolean(dataCategoria.Rows[0].ItemArray[0]);
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
}
using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

public class DataLocal
{
    public bool insertarLocal(EncapsulateLocal local)
    {
        DataTable dataLocal = new DataTable();
        Boolean respuesta = false;
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_registrar_local", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = local.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_eslogan", NpgsqlDbType.Text).Value = local.Eslogan;
            dataAdapter.SelectCommand.Parameters.Add("_ciudad", NpgsqlDbType.Text).Value = local.Ciudad;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Text).Value = local.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Bigint).Value = local.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_doc_identidad", NpgsqlDbType.Text).Value = local.Doc_identidad;
            dataAdapter.SelectCommand.Parameters.Add("_id_categoria", NpgsqlDbType.Integer).Value = local.Id_categoria;

            conection.Open();
            dataAdapter.Fill(dataLocal);
            respuesta = Convert.ToBoolean(dataLocal.Rows[0].ItemArray[0]);
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

    public List<EncapsulateLocal> leerLocal()
    {
        List<EncapsulateLocal> listLocal = new List<EncapsulateLocal>();
        DataTable local = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_leer_local", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(local);
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

        listLocal = local.AsEnumerable().Select(m => new EncapsulateLocal()
        {
            Id_local = m.Field<long>("id_local"),
            Nombre = m.Field<string>("nombre"),
            Eslogan = m.Field<string>("eslogan"),
            Ciudad = m.Field<string>("ciudad"),
            Direccion = m.Field<string>("direccion"),
            Telefono = m.Field<long>("telefono"),
            Doc_identidad = m.Field<string>("doc_identidad")
        }).ToList();

        return listLocal.OrderBy(x => x.Nombre).ToList();
    }
}
using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

public class DataPedido
{
    public bool insertarPedido(EncapsulatePedido pedido)
    {
        DataTable dataPedido = new DataTable();
        Boolean respuesta = false;
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_registrar_pedido", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_id_local", NpgsqlDbType.Bigint).Value = pedido.IdLocal;
            dataAdapter.SelectCommand.Parameters.Add("_doc_identidad", NpgsqlDbType.Text).Value = pedido.DocIdentidad;
            dataAdapter.SelectCommand.Parameters.Add("_cantidad", NpgsqlDbType.Integer).Value = pedido.Cantidad;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Text).Value = pedido.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Bigint).Value = pedido.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_id_comida", NpgsqlDbType.Bigint).Value = pedido.IdComida;

            conection.Open();
            dataAdapter.Fill(dataPedido);
            respuesta = Convert.ToBoolean(dataPedido.Rows[0].ItemArray[0]);
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

    public List<EncapsulatePedido> leerPedido()
    {
        List<EncapsulatePedido> listPedido = new List<EncapsulatePedido>();
        DataTable pedido = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("local.f_leer_pedido", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            conection.Open();
            dataAdapter.Fill(pedido);
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

        listPedido = pedido.AsEnumerable().Select(m => new EncapsulatePedido()
        {
            IdLocal = m.Field<long>("id_local"),
            NombreLocal = m.Field<string>("nombre_local"),
            NombreComida = m.Field<string>("nombre_comida"),
            DocIdentidad = m.Field<string>("documento"),
            Cantidad = m.Field<int>("cantidad"),
            Direccion = m.Field<string>("direccion"),
            Telefono = m.Field<long>("telefono"),
            Total = m.Field<int>("total")
        }).ToList();

        return listPedido;
    }
}
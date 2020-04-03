using Npgsql;
using NpgsqlTypes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

public class DataUsuario
{
    public List<EncapsulateUsuario> iniciarSesion(EncapsulateUsuario usuario)
    {
        List<EncapsulateUsuario> listUsuario = new List<EncapsulateUsuario>();
        DataTable dataUsuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_iniciar_sesion", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_doc_identidad", NpgsqlDbType.Text).Value = usuario.DocIdentidad;
            dataAdapter.SelectCommand.Parameters.Add("_contrasena", NpgsqlDbType.Text).Value = usuario.Contrasena;

            conection.Open();
            dataAdapter.Fill(dataUsuario);
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

        listUsuario = dataUsuario.AsEnumerable().Select(m => new EncapsulateUsuario()
        {
            DocIdentidad = m.Field<string>("doc_identidad"),
            Nombre = m.Field<string>("nombre"),
            Apellido = m.Field<string>("apellido"),
            Edad = m.Field<int>("edad"),
            Direccion = m.Field<string>("direccion"),
            Telefono = m.Field<long>("telefono"),
            Correo = m.Field<string>("correo"),
            Session = m.Field<string>("session"),
            Contrasena = m.Field<string>("contrasena"),
            IdRol = m.Field<int>("id_rol"),
            IdEstado = m.Field<int>("id_estado")
        }).ToList();

        return listUsuario;
    }

    public bool registrarUsuario (EncapsulateUsuario usuario)
    {
        DataTable dataUsuario = new DataTable();
        NpgsqlConnection conection = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["Postgres"].ConnectionString);
        Boolean respuesta = false;

        try
        {
            NpgsqlDataAdapter dataAdapter = new NpgsqlDataAdapter("usuario.f_registrar_usuario", conection);
            dataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;

            dataAdapter.SelectCommand.Parameters.Add("_doc_identidad", NpgsqlDbType.Text).Value = usuario.DocIdentidad;
            dataAdapter.SelectCommand.Parameters.Add("_nombre", NpgsqlDbType.Text).Value = usuario.Nombre;
            dataAdapter.SelectCommand.Parameters.Add("_apellido", NpgsqlDbType.Text).Value = usuario.Apellido;
            dataAdapter.SelectCommand.Parameters.Add("_edad", NpgsqlDbType.Integer).Value = usuario.Edad;
            dataAdapter.SelectCommand.Parameters.Add("_direccion", NpgsqlDbType.Text).Value = usuario.Direccion;
            dataAdapter.SelectCommand.Parameters.Add("_telefono", NpgsqlDbType.Bigint).Value = usuario.Telefono;
            dataAdapter.SelectCommand.Parameters.Add("_correo", NpgsqlDbType.Text).Value = usuario.Correo;
            dataAdapter.SelectCommand.Parameters.Add("_session", NpgsqlDbType.Text).Value = HttpContext.Current.Session.SessionID;
            dataAdapter.SelectCommand.Parameters.Add("_contrasena", NpgsqlDbType.Text).Value = usuario.Contrasena;
            dataAdapter.SelectCommand.Parameters.Add("_id_rol", NpgsqlDbType.Integer).Value = usuario.IdRol;

            conection.Open();
            dataAdapter.Fill(dataUsuario);
            respuesta = Convert.ToBoolean(dataUsuario.Rows[0].ItemArray[0]);
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
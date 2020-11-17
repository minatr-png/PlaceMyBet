using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace PlaceMyBetApp.Models
{
    /***Ejercicio 1***/
    public class ApuestasExamenRepository
    {
        private MySqlConnection Connect()
        {
            string connString = "Server=127.0.0.1;Port=3306;DataBase=placemybet;UID=root;password=;SslMode=none";
            MySqlConnection con = new MySqlConnection(connString);

            return con;
        }


        internal List<ApuestasExamen> Retrieve(string equipo)
        {
            MySqlConnection con = Connect();
            MySqlCommand command = con.CreateCommand();
            command.CommandText = "SELECT e.nomLocal, a.dinero FROM eventos e INNER JOIN mercados m ON m.eventoMer = e.idEvento INNER JOIN apuestas a ON a.mercadoApu = m.idMercado WHERE e.nomVisitante = @A;";
            command.Parameters.AddWithValue("@A", equipo);

            try
            {
                con.Open();
                MySqlDataReader res = command.ExecuteReader();

                List<ApuestasExamen> apus = new List<ApuestasExamen>();

                while (res.Read()) apus.Add(new ApuestasExamen(res.GetString(0), res.GetFloat(1)));

                con.Close();
                command.CommandText = "SELECT e.nomVisitante, a.dinero FROM eventos e INNER JOIN mercados m ON m.eventoMer = e.idEvento INNER JOIN apuestas a ON a.mercadoApu = m.idMercado WHERE e.nomLocal = @A;";
                try
                {
                    con.Open();
                    MySqlDataReader res2 = command.ExecuteReader();

                    while (res2.Read()) apus.Add(new ApuestasExamen(res2.GetString(0), res2.GetFloat(1)));

                    con.Close();
                    return apus;
                }
                catch (MySqlException e)
                {
                    Debug.WriteLine("Se ha producido un error: " + e);
                    return null;
                }
            }
            catch (MySqlException e)
            {
                Debug.WriteLine("Se ha producido un error: " + e);
                return null;
            }
        }
    }
    /***Final Ejercicio 1(solo del repository hay más en controller y en la clase)***/
}
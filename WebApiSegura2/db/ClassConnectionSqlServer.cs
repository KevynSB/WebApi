using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace WebApiSegura2.db
{
    public class ClassConnectionSqlServer
    {

        public static SqlConnection conn;
        protected string cadena()
        {
            var cad = ConfigurationManager.AppSettings["SqlConnectionServer"].ToString();
            return cad;
        }
        public void GetConnectionSQL2()
        {
            conn = new SqlConnection(cadena());
        }

        public string GetCon()
        {
            var cad = cadena();
            return cad;
        }
        public DataTable GetDataTableByNameSP(string pmNameDB, string pmNameSP, List<SqlParameter> pmParametros, ref string pmMensaje)
        {
            try
            {
                DataTable tblRes = new DataTable();
                GetConnectionSQL2();
                conn.Open();
                conn.ChangeDatabase(pmNameDB);

                SqlCommand cmd = new SqlCommand(pmNameSP, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                cmd.Parameters.Clear();

                foreach (SqlParameter pm in pmParametros)
                {
                    cmd.Parameters.Add(pm);
                }

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(tblRes);
                conn.Close();
                return tblRes;
            }
            catch (Exception ex)
            {
               
                pmMensaje = ex.Message.ToString();
                return null;
            }

        }

        /// <summary>
        /// llena los parametros del sp con su valor respectivo
        /// </summary>
        /// <param name="name">nombre del parametro</param>
        /// <param name="tipo">tipo de datos</param>
        /// <param name="value"> valor del parametro</param>
        /// <returns>sqlParameter</returns>
        public static SqlParameter CreateCustomParameter(string name, SqlDbType tipo, object value)
        {
            var sqlParameter = new SqlParameter(name, tipo);
            sqlParameter.Value = value;
            return sqlParameter;

        }
    }
}
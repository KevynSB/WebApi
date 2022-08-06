using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApiSegura2.db;

namespace WebApiSegura2.Controllers
{
    [Authorize]
    [RoutePrefix("api/customers")]
    public class CustomersController : ApiController
    {


        [HttpGet]
        public IHttpActionResult GetAll()
        {

            DataTable reponse = null;
            try
            {
                var vrlDb = new ClassConnectionSqlServer();
                string msg = "";

                List<SqlParameter> vrlParametros = new List<SqlParameter>();
                vrlParametros.Add(ClassConnectionSqlServer.CreateCustomParameter("@operacion", SqlDbType.Int, 1));
                reponse = vrlDb.GetDataTableByNameSP("prueba", "getlist", vrlParametros, ref msg);
            }
            catch (Exception ex)
            {
                return Ok(ex.ToString());
                
            }

            return Ok(reponse);

            //var customersFake = new string[] { "customer-1", "customer-2", "customer-3" };
            //return Ok(customersFake);
        }

    }
}

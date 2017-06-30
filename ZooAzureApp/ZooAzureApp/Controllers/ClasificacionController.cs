using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ZooAzureApp.Controllers
{
    public class ClasificacionController : ApiController
    {
        // GET: api/Clasificacion
        public RespuestaApi Get()
        {
            RespuestaApi resultado = new RespuestaApi();
            List<Clasificacion> listaClasific = new List<Clasificacion>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaClasific = Db.GetClasificacion();
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaClasific.Count;
            resultado.dataClasificacion = listaClasific;
            return resultado;
        }

        // GET: api/Clasificacion/5
        public RespuestaApi Get(long id)
        {
            RespuestaApi resultado = new RespuestaApi();
            List<Clasificacion> listaClasific = new List<Clasificacion>();
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    listaClasific = Db.GetClasificacionPorId(id);
                }
                resultado.error = "";
                Db.Desconectar();
            }
            catch
            {
                resultado.error = "Se produjo un error";
            }

            resultado.totalElementos = listaClasific.Count;
            resultado.dataClasificacion = listaClasific;
            return resultado;
        }

        // POST: api/Clasificacion
        [HttpPost]
        public IHttpActionResult Post([FromBody]Clasificacion clasif)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();

                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.AgregarClasificacion(clasif);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.error = "Error al agregar la Clasificación";
            }
            return Ok(resultado);
        }

        // PUT: api/Clasificacion/5
        [HttpPut]
        public IHttpActionResult Put(int id, [FromBody]Clasificacion clasif)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.ActualizarClasificacion(id, clasif);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Error al actualizar la Clasificación";
            }
            return Ok(resultado);
        }

        // DELETE: api/Clasificacion/5
        [HttpDelete]
        public IHttpActionResult Delete(int id)
        {
            RespuestaApi resultado = new RespuestaApi();
            resultado.error = "";
            int filasAfectadas = 0;
            try
            {
                Db.Conectar();
                if (Db.EstaLaConexionAbierta())
                {
                    filasAfectadas = Db.EliminarClasificacion(id);
                }
                resultado.totalElementos = filasAfectadas;
                Db.Desconectar();
            }
            catch (Exception)
            {
                resultado.totalElementos = 0;
                resultado.error = "Error al Eliminar la Clasificación";
            }
            return Ok(resultado);
        }
    }
}

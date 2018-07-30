using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Interfaces;
using DATA;
using ServiceStack.OrmLite;
using System.Data;

namespace DAL.Metodos
{
    public class MReceta : MBase, IReceta
    {
        public void ActualizarReceta(Receta receta)
        {
            _db = _conexion.Open();
            _db.Update(receta);
            _db.Close();
        }

        public Receta BuscarReceta(int id)
        {
            _db = _conexion.Open();
            Receta receta = _db.Select<Receta>(x => x.IdReceta == id).FirstOrDefault();
            _db.Close();
            return receta;
        }

        public void EliminarReceta(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Receta>(x => x.IdReceta == id);
            _db.Close();
        }

        public void InsertarReceta(Receta receta)
        {
            _db = _conexion.Open();
            _db.Insert(receta);
            _db.Close();
        }

        public List<Receta> ListarReceta()
        {
            _db = _conexion.Open();
            List<Receta> lista = _db.Select<Receta>();
            _db.Close();
            return lista;
        }
    }
}

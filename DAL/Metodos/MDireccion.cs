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
    public class MDireccion : MBase, IDireccion
    {
        public void ActualizarDireccion(Direccion direccion)
        {
            _db = _conexion.Open();
            _db.Update(direccion);
            _db.Close();
        }

        public Direccion BuscarDireccion(int id)
        {
            _db = _conexion.Open();
            Direccion direccion = _db.Select<Direccion>(x => x.IdDireccion == id).FirstOrDefault();
            _db.Close();
            return direccion;
        }

        public void EliminarDireccion(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Direccion>(x => x.IdDireccion == id);
            _db.Close();
        }

        public void InsertarDireccion(Direccion direccion)
        {
            _db = _conexion.Open();
            _db.Insert(direccion);
            _db.Close();
        }

        public List<Direccion> ListarDireccion()
        {
            _db = _conexion.Open();
            List<Direccion> lista = _db.Select<Direccion>();
            _db.Close();
            return lista;
        }
    }
}

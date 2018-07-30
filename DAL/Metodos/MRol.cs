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
    public class MRol : MBase, IRol
    {
        public void ActualizarRol(Rol rol)
        {
            _db = _conexion.Open();
            _db.Update(rol);
            _db.Close();
        }

        public Rol BuscarRol(int id)
        {
            _db = _conexion.Open();
            Rol rol = _db.Select<Rol>(x => x.IdRol == id).FirstOrDefault();
            _db.Close();
            return rol;
        }

        public void EliminarRol(int id)
        {
            _db = _conexion.Open();
            _db.Delete<Rol>(x => x.IdRol == id);
            _db.Close();
        }

        public void InsertarRol(Rol rol)
        {
            _db = _conexion.Open();
            _db.Insert(rol);
            _db.Close();
        }

        public List<Rol> ListarRol()
        {
            _db = _conexion.Open();
            List<Rol> lista = _db.Select<Rol>();
            _db.Close();
            return lista;
        }
    }
}

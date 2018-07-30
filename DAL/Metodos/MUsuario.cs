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
    public class MUsuario : MBase, IUsuario
    {
        

        public void ActualizarUsuario(Usuario usuario)
        {
            _db = _conexion.Open();
            _db.Update(usuario);
            _db.Close();
        }

        public Usuario BuscarUsuario(int Id)
        {
            _db = _conexion.Open();           
            Usuario usuario = _db.Select<Usuario>(x => x.IdUsuario == Id).FirstOrDefault();
            _db.Close();
            return usuario;
        }

        public void EliminarUsuario(int Id)
        {
            _db = _conexion.Open();
            _db.Delete<Usuario>(x => x.IdUsuario == Id);
            _db.Close();
        }

        public void InsertarUsuario(Usuario usuario)
        {
            _db = _conexion.Open();
            _db.Insert(usuario);
            _db.Close();
        }

        public List<Usuario> ListarUsuarios()
        {
            _db = _conexion.Open();
            List<Usuario> lista = _db.Select<Usuario>();
            _db.Close();
            return lista;
        }
    }
}

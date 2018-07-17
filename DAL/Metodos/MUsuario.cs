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
            _db.Update(usuario);
        }

        public Usuario BuscarUsuario(int Id)
        {
            return _db.Select<Usuario>(x => x.Id == Id).FirstOrDefault();
        }

        public void EliminarUsuario(int Id)
        {
            _db.Delete<Usuario>(x => x.Id == Id);
        }

        public void InsertarUsuario(Usuario usuario)
        {
            _db.Insert(usuario);
        }

        public List<Usuario> ListarUsuarios()
        {
            return _db.Select<Usuario>();
        }
    }
}

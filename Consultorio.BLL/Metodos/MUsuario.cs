using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MUsuario : MBase, IUsuario
    {
        public void ActualizarUsuario(Usuario usuario)
        {
            mUsuario.ActualizarUsuario(usuario);
        }

        public Usuario BuscarUsuario(int Id)
        {
            return mUsuario.BuscarUsuario(Id);
        }

        public void EliminarUsuario(int Id)
        {
            mUsuario.EliminarUsuario(Id);
        }

        public void InsertarUsuario(Usuario usuario)
        {
            mUsuario.InsertarUsuario(usuario);
        }

        public List<Usuario> ListarUsuarios()
        {
            return mUsuario.ListarUsuarios();
        }
    }
}

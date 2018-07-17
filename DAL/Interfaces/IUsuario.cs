using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace DAL.Interfaces
{
    public interface IUsuario
    {
        List<Usuario> ListarUsuarios();

        Usuario BuscarUsuario(int Id);

        void InsertarUsuario(Usuario usuario);

        void ActualizarUsuario(Usuario usuario);

        void EliminarUsuario(int Id);

    }
}

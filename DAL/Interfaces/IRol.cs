using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace DAL.Interfaces
{
    public interface IRol
    {
        List<Rol> ListarRol();

        Rol BuscarRol(int id);

        void InsertarRol(Rol rol);

        void ActualizarRol(Rol rol);

        void EliminarRol(int id);
    }
}

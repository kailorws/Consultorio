using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace DAL.Interfaces
{
    public interface IDireccion
    {
        List<Direccion> ListarDireccion();

        Direccion BuscarDireccion(int id);

        void InsertarDireccion(Direccion direccion);

        void ActualizarDireccion(Direccion direccion);

        void EliminarDireccion(int id);

    }
}

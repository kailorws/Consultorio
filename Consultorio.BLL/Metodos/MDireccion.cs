using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MDireccion : MBase, IDireccion
    {
        public void ActualizarDireccion(Direccion direccion)
        {
            mDireccion.ActualizarDireccion(direccion);
        }

        public Direccion BuscarDireccion(int id)
        {
            return mDireccion.BuscarDireccion(id);
        }

        public void EliminarDireccion(int id)
        {
            mDireccion.EliminarDireccion(id);
        }

        public void InsertarDireccion(Direccion direccion)
        {
            mDireccion.InsertarDireccion(direccion);
        }

        public List<Direccion> ListarDireccion()
        {
            return mDireccion.ListarDireccion();
        }
    }
}

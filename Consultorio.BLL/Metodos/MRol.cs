using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MRol : MBase, IRol
    {
        public void ActualizarRol(Rol rol)
        {
            mRol.ActualizarRol(rol);
        }

        public Rol BuscarRol(int id)
        {
            return mRol.BuscarRol(id);
        }

        public void EliminarRol(int id)
        {
            mRol.EliminarRol(id);
        }

        public void InsertarRol(Rol rol)
        {
            mRol.InsertarRol(rol);
        }

        public List<Rol> ListarRol()
        {
            return mRol.ListarRol();
        }
    }
}

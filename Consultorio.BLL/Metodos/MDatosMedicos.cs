using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MDatosMedicos : MBase, IDatosMedicos
    {
        public void ActualizarDatosMedicos(DatosMedicos datosMedicos)
        {
            mDatosMedicos.ActualizarDatosMedicos(datosMedicos);
        }

        public DatosMedicos BuscarDatosMedicos(int id)
        {
            return mDatosMedicos.BuscarDatosMedicos(id);
        }

        public void EliminarDatosMedicos(int id)
        {
            mDatosMedicos.EliminarDatosMedicos(id);
        }

        public void InsertarDatosMedicos(DatosMedicos datosMedicos)
        {
            mDatosMedicos.InsertarDatosMedicos(datosMedicos);
        }

        public List<DatosMedicos> ListarDireccion()
        {
            return mDatosMedicos.ListarDireccion();
        }
    }
}

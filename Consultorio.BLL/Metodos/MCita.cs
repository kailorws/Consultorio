using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;
using Consultorio.BLL.Interfaces;

namespace Consultorio.BLL.Metodos
{
    public class MCita : MBase, ICita
    {
        public void ActualizarCita(Cita cita)
        {
            mCita.ActualizarCita(cita);
        }

        public Cita BuscarCita(int id)
        {
            return mCita.BuscarCita(id);
        }

        public void EliminarCita(int id)
        {
            mCita.EliminarCita(id);
        }

        public void InsertarCita(Cita cita)
        {
            mCita.InsertarCita(cita);
        }

        public List<Cita> ListarCita()
        {
            return mCita.ListarCita();
        }
    }
}

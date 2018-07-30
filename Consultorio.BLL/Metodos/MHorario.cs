using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MHorario : MBase, IHorario
    {
        public void ActualizarHorario(Horario horario)
        {
            mHorario.ActualizarHorario(horario);
        }

        public Horario BuscarHorario(int id)
        {
            return mHorario.BuscarHorario(id);
        }

        public void EliminarHorario(int id)
        {
            mHorario.EliminarHorario(id);
        }

        public void InsertarHorario(Horario horario)
        {
            mHorario.InsertarHorario(horario);
        }

        public List<Horario> ListarHorarios()
        {
            return mHorario.ListarHorarios();
        }
    }
}

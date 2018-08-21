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
        Int32 h;
        public void ActualizarHorario(Horario horario)
        {
            mHorario.ActualizarHorario(horario);
        }

        public Horario BuscarHorario(int id)
        {
            return mHorario.BuscarHorario(id);
        }
        public Int32 BuscarIdHorario(string hora)
        {
            
            foreach (Horario ho in mHorario.ListarHorarios())
            {
                if(hora == Convert.ToString(ho.Hora))
                {
                    h = ho.IdHorario;
                }
            }
            return h;
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

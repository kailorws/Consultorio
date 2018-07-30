using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MRecetaMedica : MBase, IRecetaMedica
    {
        public void ActualizarRecetaMedica(RecetaMedica recetaMedica)
        {
            mRecetaMedica.ActualizarRecetaMedica(recetaMedica);
        }

        public RecetaMedica BuscarRecetaMedica(int idR, int idM)
        {
            return mRecetaMedica.BuscarRecetaMedica(idR,idM);
        }

        public void EliminarRecetaMedica(int idR, int idM)
        {
            mRecetaMedica.EliminarRecetaMedica(idR, idM);
        }

        public void InsertarRecetaMedica(RecetaMedica recetaMedica)
        {
            mRecetaMedica.InsertarRecetaMedica(recetaMedica);
        }

        public List<RecetaMedica> ListarRecetaMedica()
        {
            return mRecetaMedica.ListarRecetaMedica();
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace DAL.Interfaces
{
    public interface IRecetaMedica
    {
        List<RecetaMedica> ListarRecetaMedica();

        RecetaMedica BuscarRecetaMedica(int idR, int idM);

        void InsertarRecetaMedica(RecetaMedica recetaMedica);

        void ActualizarRecetaMedica(RecetaMedica recetaMedica);

        void EliminarRecetaMedica(int idR, int idM);
    }
}

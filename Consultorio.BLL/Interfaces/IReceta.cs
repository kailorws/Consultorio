using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace Consultorio.BLL.Interfaces
{
    public interface IReceta
    {
        List<Receta> ListarReceta();

        Receta BuscarReceta(int id);

        void InsertarReceta(Receta receta);

        void ActualizarReceta(Receta receta);

        void EliminarReceta(int id);

    }
}

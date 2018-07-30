using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Consultorio.BLL.Interfaces;
using DATA;

namespace Consultorio.BLL.Metodos
{
    public class MReceta : MBase, IReceta
    {
        public void ActualizarReceta(Receta receta)
        {
            mReceta.ActualizarReceta(receta);
        }

        public Receta BuscarReceta(int id)
        {
            return mReceta.BuscarReceta(id);
        }

        public void EliminarReceta(int id)
        {
            mReceta.EliminarReceta(id);
        }

        public void InsertarReceta(Receta receta)
        {
            mReceta.InsertarReceta(receta);
        }

        public List<Receta> ListarReceta()
        {
            return mReceta.ListarReceta();
        }
    }
}

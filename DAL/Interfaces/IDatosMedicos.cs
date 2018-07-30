using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATA;

namespace DAL.Interfaces
{
    public interface IDatosMedicos
    {
        List<DatosMedicos> ListarDireccion();

        DatosMedicos BuscarDatosMedicos(int id);

        void InsertarDatosMedicos(DatosMedicos datosMedicos);

        void ActualizarDatosMedicos(DatosMedicos datosMedicos);

        void EliminarDatosMedicos(int id);
    }
}

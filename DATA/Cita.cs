using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ServiceStack.DataAnnotations;
namespace DATA
{
    public class Cita
    {
        [AutoIncrement]
        public int IdCita { get; set; }
        
        public int IdHorario { get; set; }

        public int IdUsuario { get; set; }

        public int IdPaciente { get; set; }

        public string Descripcion { get; set; }

        public DateTime Fecha { get; set; }

    }
}

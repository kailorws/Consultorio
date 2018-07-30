using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA
{
    public class Receta
    {
        public int IdReceta { get; set; }

        public string Descripcion { get; set; }

        public DateTime FechaDespacho { get; set; }

        public int IdPaciente { get; set; }

        public bool? Actual { get; set; }

    }

}

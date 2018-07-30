using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA
{
    public class Paciente
    {
        public int IdPaciente { get; set; }

        public string Nombre { get; set; }

        public string Apellido1 { get; set; }

        public string Apellido2 { get; set; }

        public string Sexo { get; set; }

        public DateTime FechaNacimiento { get; set; }

        public string LugarNacimiento { get; set; }

        public string EstadoCivil { get; set; }

        public string Ocupacion { get; set; }

    }

}

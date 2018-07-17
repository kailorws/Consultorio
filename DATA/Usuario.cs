using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA
{
    public class Usuario
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public string Apellido1 { get; set; }

        public string Apellido2 { get; set; }

        public string Contraseña { get; set; }

        public int IdRol { get; set; }

        public string Correo { get; set; }

        public int Telefono { get; set; }

        public bool Temporal { get; set; }

    }
}

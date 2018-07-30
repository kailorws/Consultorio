using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA
{
    public class Usuario
    {
        public int IdUsuario { get; set; }

        public string NombreCompleto { get; set; }

        public string Contraseña { get; set; }

        public string Correo { get; set; }

        public bool Temporal { get; set; }

        public int IdRol { get; set; }

    }
}

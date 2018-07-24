using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA
{
    public class Medicamento
    {
        public int Id { get; set; }

        public string NombreComercial { get; set; }

        public string NombreGenerico { get; set; }

        public double Precio { get; set; }

        public int Cantidad { get; set; }
    }
}

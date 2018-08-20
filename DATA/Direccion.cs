using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA
{
    public class Direccion
    {
        
        public string Ciudad { get; set; }

        public string Provincia { get; set; }

        public string DireccionExacta { get; set; }

        [RegularExpression(@"^8[0-9]{7}|^2[0-9]{7}$|^7[0-9]{7}$|^6[0-9]{7}$", ErrorMessage = "Ingrese un numero telefonico valido")]
        public string Telefono { get; set; }

        [RegularExpression(@"^([\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", ErrorMessage = "Formato de correo invalido")]
        public string Correo { get; set; }

        [Required]
        public int? Cedula { get; set; }

    }
}

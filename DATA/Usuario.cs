using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATA
{
    public class Usuario
    {
        [Required]
        public int IdUsuario { get; set; }

        [Required(ErrorMessage = "Ingrese un nombre")]
        [MinLength(length:5)]
        public string NombreCompleto { get; set; }

        [Required(ErrorMessage = "Ingrese una contraseña correcta")]
        public string Contraseña { get; set; }

        [Required]
        [RegularExpression(@"^([\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$", ErrorMessage = "Formato de correo invalido")]
        public string Correo { get; set; }

        public bool Temporal { get; set; }

        [Required(ErrorMessage = "Seleccione un rol valido")]
        public int IdRol { get; set; }

    }
}

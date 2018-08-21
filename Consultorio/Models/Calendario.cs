﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Consultorio.Models
{
    public class Calendario
    {

        public Calendario()
        {

        }

        public Calendario(TimeSpan time, DateTime fecha, string titulo, string mensaje, int id)
        {
            Hora = time.Hours;
            Minutos = time.Minutes;
            Dia = fecha.Day;
            Mes = fecha.Month-1;
            Ano = fecha.Year;
            Titulo = titulo;
            Mensaje = "<b>Id de cita: "+id+"</b><br/>"+mensaje ;
            Id = id;
        }

        public int Hora { get; set; }
        public int Minutos { get; set; }
        public int Dia { get; set; }
        public int Mes { get; set; }
        public int Ano { get; set; }
        public String Titulo { get; set; }
        public String Mensaje { get; set; }
        public int Id { get; set; }

        
    }
}
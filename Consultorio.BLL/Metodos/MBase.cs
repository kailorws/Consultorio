using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Consultorio.BLL.Metodos
{
    public class MBase
    {
        public DAL.Interfaces.ICita mCita;
        public DAL.Interfaces.IDatosMedicos mDatosMedicos;
        public DAL.Interfaces.IDireccion mDireccion;
        public DAL.Interfaces.IHorario mHorario;
        public DAL.Interfaces.IMedicamento mMedicamento;
        public DAL.Interfaces.IPaciente mPaciente;
        public DAL.Interfaces.IReceta mReceta;
        public DAL.Interfaces.IRecetaMedica mRecetaMedica;
        public DAL.Interfaces.IRol mRol;
        public DAL.Interfaces.IUsuario mUsuario;

        public MBase()
        {

            mCita = new DAL.Metodos.MCita();
            mDatosMedicos = new DAL.Metodos.MDatosMedicos();
            mDireccion = new DAL.Metodos.MDireccion();
            mHorario = new DAL.Metodos.MHorario();
            mMedicamento = new DAL.Metodos.MMedicamento();
            mPaciente = new DAL.Metodos.MPaciente();
            mReceta = new DAL.Metodos.MReceta();
            mRecetaMedica = new DAL.Metodos.MRecetaMedica();
            mRol = new DAL.Metodos.MRol();
            mUsuario = new DAL.Metodos.MUsuario();

        }
    }
}

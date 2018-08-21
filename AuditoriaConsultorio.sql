/*----------------------------------------------------- Auditoria de rol -----------------------------------------------------------*/

CREATE TABLE AuditRol (AuditRol int NOT NULL IDENTITY, IdRol INT, NombreRol VARCHAR(70), FechaOperacion DATE, Operacion varchar(20));


/* Triggers para roles */

CREATE TRIGGER AUDITROL_I on ROL 
AFTER INSERT
AS
BEGIN
INSERT INTO AuditRol(IdRol,NombreRol,FechaOperacion,Operacion) select i.IdRol,i.Nombre, GETDATE(), 'Insertado' from Rol r
inner join inserted i on r.IdRol=i.IdRol
end
go


CREATE TRIGGER AUDITROL_U on ROL
AFTER UPDATE
AS
BEGIN
INSERT INTO AuditRol(IdRol,NombreRol,FechaOperacion,Operacion) select i.IdRol,i.Nombre, GETDATE(),'Actualizado' from Rol r
inner join inserted i on r.IdRol=i.IdRol
end
go


CREATE TRIGGER AUDITROL_D on ROL 
AFTER DELETE
AS 
BEGIN
SET NOCOUNT ON;
DECLARE

@IdRol int,
@Nombre varchar(50)

Select @IdRol = DELETED.IdRol from DELETED;
Select @Nombre = DELETED.Nombre from DELETED;

INSERT INTO AuditRol(IdRol,NombreRol,FechaOperacion,Operacion) values (@IdRol,@Nombre,GETDATE(),'Eliminado');
END
go



/*---------------------------------------- Auditoria de Medicamento ------------------------------------------*/

CREATE TABLE AuditMedicamento (AuditMedicamento int NOT NULL IDENTITY, IdMedicamento INT, NombreGenerico VARCHAR(150), FechaOperacion DATE, Operacion varchar(20));


/* Triggers para Medicamentos */

CREATE TRIGGER AUDITMEDICAMENTO_I on MEDICAMENTO 
AFTER INSERT
AS
BEGIN
INSERT INTO AuditMedicamento(IdMedicamento,NombreGenerico,FechaOperacion,Operacion) select i.IdMedicamento,i.NombreGenerico, GETDATE(), 'Insertado' from Medicamento m
inner join inserted i on m.IdMedicamento=i.IdMedicamento
end
go


CREATE TRIGGER AUDITMEDICAMENTO_U on MEDICAMENTO 
AFTER UPDATE
AS
BEGIN
INSERT INTO AuditMedicamento(IdMedicamento,NombreGenerico,FechaOperacion,Operacion) select i.IdMedicamento,i.NombreGenerico, GETDATE(),'Actualizado' from Medicamento m
inner join inserted i on m.IdMedicamento=i.IdMedicamento
end
go


CREATE TRIGGER AUDITMEDICAMENTO_D on MEDICAMENTO  
AFTER DELETE
AS 
BEGIN
SET NOCOUNT ON;
DECLARE

@Id int,
@Nombre varchar(50)

Select @Id = DELETED.IdMedicamento from DELETED;
Select @Nombre = DELETED.NombreGenerico from DELETED;

INSERT INTO AuditMedicamento(IdMedicamento,NombreGenerico,FechaOperacion,Operacion) values (@Id,@Nombre,GETDATE(),'Eliminado');
END
go




/*-------------------------------- Auditoria de Horario ----------------------------------------------*/

CREATE TABLE AuditHorario (AuditHorario int NOT NULL IDENTITY, IdHorario INT, Hora TIME(0), FechaOperacion DATE, Operacion varchar(20));


/* Triggers para Horario */

CREATE TRIGGER AUDITHORARIO_I on HORARIO 
AFTER INSERT
AS
BEGIN
INSERT INTO AuditHorario(IdHorario,Hora,FechaOperacion,Operacion) select i.IdHorario,i.Hora, GETDATE(), 'Insertado' from Horario h
inner join inserted i on h.IdHorario = i.IdHorario
end
go


CREATE TRIGGER AUDITHORARIO_U on HORARIO 
AFTER UPDATE
AS
BEGIN
INSERT INTO AuditHorario(IdHorario,Hora,FechaOperacion,Operacion) select i.IdHorario,i.Hora, GETDATE(), 'Actualizado' from Horario h
inner join inserted i on h.IdHorario = i.IdHorario
end
go



CREATE TRIGGER AUDITHORARIO_D on HORARIO  
AFTER DELETE
AS 
BEGIN
SET NOCOUNT ON;
DECLARE

@Id int,
@Hora TIME(0)

Select @Id = DELETED.IdHorario from DELETED;
Select @Hora = DELETED.Hora from DELETED;

INSERT INTO AuditHorario(IdHorario,Hora,FechaOperacion,Operacion) values (@Id,@Hora,GETDATE(),'Eliminado');
END
go





/*-------------------------------- Auditoria de Usuario ----------------------------------------------*/

CREATE TABLE AuditUsuario (AuditUsuario int NOT NULL IDENTITY, IdUsuario INT, NombreCompleto VARCHAR(100), Contraseña VARCHAR(50), 
Correo varchar(80), Temporal bit, Rol VARCHAR(70), FechaOperacion DATE, Operacion varchar(20));


/* Triggers para Usuario */


CREATE TRIGGER AUDITUSUARIO_I on USUARIO 
AFTER INSERT
AS
BEGIN
INSERT INTO AuditUsuario(IdUsuario,NombreCompleto,Contraseña,Correo,Temporal,Rol,FechaOperacion,Operacion)
select i.IdUsuario,i.NombreCompleto,i.Contraseña,i.Correo,i.Temporal,(Select Nombre from Rol where IdRol = i.IdRol), GETDATE(), 'Insertado' from Usuario u
inner join inserted i on u.IdUsuario = i.IdUsuario
end
go


CREATE TRIGGER AUDITUSUARIO_U on USUARIO 
AFTER UPDATE
AS
BEGIN
INSERT INTO AuditUsuario(IdUsuario,NombreCompleto,Contraseña,Correo,Temporal,Rol,FechaOperacion,Operacion)
select i.IdUsuario,i.NombreCompleto,i.Contraseña,i.Correo,i.Temporal,(Select Nombre from Rol where IdRol = i.IdRol), GETDATE(), 'Actualizado' from Usuario u
inner join inserted i on u.IdUsuario = i.IdUsuario
end
go


CREATE TRIGGER AUDITUSUARIO_D on USUARIO 
AFTER DELETE
AS 
BEGIN
SET NOCOUNT ON;
DECLARE

@Id int,
@Nombre VARCHAR(100),
@Contraseña VARCHAR(50),
@Correo VARCHAR(80),
@Temporal bit,
@Rol VARCHAR(70)
 

Select @Id = DELETED.IdUsuario from DELETED;
Select @Nombre = DELETED.NombreCompleto from DELETED;
Select @Contraseña = DELETED.Contraseña from DELETED;
Select @Correo = DELETED.Correo from DELETED;
Select @Temporal = DELETED.Temporal from DELETED;
Select @Rol = (Select Nombre from Rol where IdRol = DELETED.IdRol) from DELETED;

INSERT INTO AuditUsuario(IdUsuario,NombreCompleto,Contraseña,Correo,Temporal,Rol,FechaOperacion,Operacion) values (@Id,@Nombre,@Contraseña,@Correo,@Temporal,@Rol,GETDATE(),'Eliminado');
END
go





/*-------------------------------- Auditoria de Paciente ----------------------------------------------*/

CREATE TABLE AuditPaciente (AuditPaciente int NOT NULL IDENTITY, IdPaciente INT, NombreCompleto VARCHAR(150), Sexo VARCHAR(20), FechaNacimiento DATE,
LugarNacimiento VARCHAR(60), EstadoCivil VARCHAR(50), Ocupacion VARCHAR (50), FechaOperacion DATE, Operacion varchar(20));


/* Triggers para Paciente */


CREATE TRIGGER AUDITPACIENTE_I on PACIENTE 
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdPaciente int,
@Nombre VARCHAR(150),
@Sexo VARCHAR(20),
@FechaNacimiento DATE,
@LugarNacimiento VARCHAR(60),
@EstadoCivil VARCHAR(50),
@Ocupacion VARCHAR(50)

Select @IdPaciente = INSERTED.IdPaciente from inserted;
Select @Nombre = (INSERTED.Nombre + ' '+  INSERTED.Apellido1 + ' ' +  INSERTED.Apellido2) from Inserted;
Select @Sexo = INSERTED.Sexo from INSERTED;
Select @FechaNacimiento = INSERTED.FechaNacimiento from INSERTED;
Select @LugarNacimiento = INSERTED.LugarNacimiento from INSERTED;
Select @EstadoCivil = INSERTED.EstadoCivil from INSERTED;
Select @Ocupacion = INSERTED.Ocupacion from INSERTED;

INSERT INTO AuditPaciente (IdPaciente,NombreCompleto,Sexo,FechaNacimiento,LugarNacimiento,EstadoCivil,Ocupacion,FechaOperacion,Operacion) values
 (@IdPaciente,@Nombre,@Sexo,@FechaNacimiento,@LugarNacimiento,@EstadoCivil,@Ocupacion, GETDATE(), 'Insertado') 
end
go


CREATE TRIGGER AUDITPACIENTE_U on PACIENTE 
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdPaciente int,
@Nombre VARCHAR(150),
@Sexo VARCHAR(20),
@FechaNacimiento DATE,
@LugarNacimiento VARCHAR(60),
@EstadoCivil VARCHAR(50),
@Ocupacion VARCHAR(50)

Select @IdPaciente = INSERTED.IdPaciente from inserted;
Select @Nombre = (INSERTED.Nombre + ' '+  INSERTED.Apellido1 + ' ' +  INSERTED.Apellido2) from Inserted;
Select @Sexo = INSERTED.Sexo from INSERTED;
Select @FechaNacimiento = INSERTED.FechaNacimiento from INSERTED;
Select @LugarNacimiento = INSERTED.LugarNacimiento from INSERTED;
Select @EstadoCivil = INSERTED.EstadoCivil from INSERTED;
Select @Ocupacion = INSERTED.Ocupacion from INSERTED;

INSERT INTO AuditPaciente (IdPaciente,NombreCompleto,Sexo,FechaNacimiento,LugarNacimiento,EstadoCivil,Ocupacion,FechaOperacion,Operacion) values
 (@IdPaciente,@Nombre,@Sexo,@FechaNacimiento,@LugarNacimiento,@EstadoCivil,@Ocupacion, GETDATE(), 'Actualizado') 
end
go


CREATE TRIGGER AUDITPACIENTE_D on PACIENTE 
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdPaciente int,
@Nombre VARCHAR(150),
@Sexo VARCHAR(20),
@FechaNacimiento DATE,
@LugarNacimiento VARCHAR(60),
@EstadoCivil VARCHAR(50),
@Ocupacion VARCHAR(50)

Select @IdPaciente = DELETED.IdPaciente from DELETED;
Select @Nombre = (DELETED.Nombre + ' '+  DELETED.Apellido1 + ' ' +  DELETED.Apellido2) from DELETED;
Select @Sexo = DELETED.Sexo from DELETED;
Select @FechaNacimiento = DELETED.FechaNacimiento from DELETED;
Select @LugarNacimiento = DELETED.LugarNacimiento from DELETED;
Select @EstadoCivil = DELETED.EstadoCivil from DELETED;
Select @Ocupacion = DELETED.Ocupacion from DELETED;

INSERT INTO AuditPaciente(IdPaciente,NombreCompleto,Sexo,FechaNacimiento,LugarNacimiento,EstadoCivil,Ocupacion,FechaOperacion,Operacion) values
 (@IdPaciente,@Nombre,@Sexo,@FechaNacimiento,@LugarNacimiento,@EstadoCivil,@Ocupacion, GETDATE(), 'Eliminado') 
end
go




/*-------------------------------- Auditoria de Citas ----------------------------------------------*/


CREATE TABLE AuditCita (AuditCita int NOT NULL IDENTITY, IdCita INT, Horario TIME(0), Usuario VARCHAR(100), 
Paciente VARCHAR(100), Descripcion VARCHAR(300), Fecha date, FechaOperacion DATE, Operacion varchar(20));



CREATE TRIGGER AUDITCITA_I on CITA
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdCita int,
@Horario TIME(0),
@Usuario VARCHAR(100),
@Paciente VARCHAR(100),
@Descripcion VARCHAR(300),
@Fecha date

Select @IdCita = INSERTED.IdCita from inserted;
Select @Horario = (Select Hora from Horario where IdHorario = INSERTED.IdHorario) from inserted;
Select @Usuario = (Select NombreCompleto from Usuario where IdUsuario = inserted.IdUsuario) from INSERTED;
Select @Paciente = (Select Nombre + ' '+  Apellido1 + ' ' +  Apellido2 from Paciente where IdPaciente = inserted.IdPaciente) from INSERTED;
Select @Descripcion = INSERTED.Descripcion from INSERTED;
Select @Fecha = INSERTED.Fecha from INSERTED;

INSERT INTO AuditCita(IdCita,Horario,Usuario,Paciente,Descripcion,Fecha,FechaOperacion,Operacion) values
 (@IdCita,@Horario,@Usuario,@Paciente,@Descripcion,@Fecha, GETDATE(), 'Insertado') 
end
go


CREATE TRIGGER AUDITCITA_U on CITA 
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdCita int,
@Horario TIME(0),
@Usuario VARCHAR(100),
@Paciente VARCHAR(100),
@Descripcion VARCHAR(300),
@Fecha date

Select @IdCita = INSERTED.IdCita from inserted;
Select @Horario = (Select Hora from Horario where IdHorario = INSERTED.IdHorario) from inserted;
Select @Usuario = (Select NombreCompleto from Usuario where IdUsuario = inserted.IdUsuario) from INSERTED;
Select @Paciente = (Select Nombre + ' '+  Apellido1 + ' ' +  Apellido2 from Paciente where IdPaciente = inserted.IdPaciente) from INSERTED;
Select @Descripcion = INSERTED.Descripcion from INSERTED;
Select @Fecha = INSERTED.Fecha from INSERTED;

INSERT INTO AuditCita (IdCita,Horario,Usuario,Paciente,Descripcion,Fecha,FechaOperacion,Operacion) values
 (@IdCita,@Horario,@Usuario,@Paciente,@Descripcion,@Fecha, GETDATE(), 'Actualizado') 
end
go




CREATE TRIGGER AUDITCITA_D on CITA 
AFTER DELETE
AS 
BEGIN
SET NOCOUNT ON;
DECLARE

@IdCita int,
@Horario TIME(0),
@Usuario VARCHAR(100),
@Paciente VARCHAR(100),
@Descripcion VARCHAR(300),
@Fecha date

Select @IdCita = deleted.IdCita from deleted;
Select @Horario = (Select Hora from Horario where IdHorario = deleted.IdHorario) from deleted;
Select @Usuario = (Select NombreCompleto from Usuario where IdUsuario = deleted.IdUsuario) from deleted;
Select @Paciente = (Select Nombre + ' '+  Apellido1 + ' ' +  Apellido2 from Paciente where IdPaciente = deleted.IdPaciente) from deleted;
Select @Descripcion = deleted.Descripcion from deleted;
Select @Fecha = deleted.Fecha from deleted;

INSERT INTO AuditCita (IdCita,Horario,Usuario,Paciente,Descripcion,Fecha,FechaOperacion,Operacion) values
 (@IdCita,@Horario,@Usuario,@Paciente,@Descripcion,@Fecha, GETDATE(), 'Eliminado') 
end
go




/*-------------------------------- Auditoria de Datos Medicos ----------------------------------------------*/


CREATE TABLE AuditDm (AuditDm int NOT NULL IDENTITY, Id_DM int, Cedula int, Tipo_Sangre VARCHAR(9), 
Alergia bit, Tipo_Alergia VARCHAR(100), FechaOperacion DATE, Operacion varchar(20));


CREATE TRIGGER AUDITDM_I on Datos_Medicos
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdDm int,
@Cedula int,
@TS VARCHAR(9),
@Alergia bit,
@TA VARCHAR(100)

Select @IdDm = INSERTED.Id_DM from inserted;
Select @Cedula = inserted.Cedula from inserted;
Select @TS = inserted.Tipo_Sangre from INSERTED;
Select @TA = inserted.Tipo_Alergia from INSERTED;
Select @Alergia = INSERTED.Alergia from INSERTED;

INSERT INTO AuditDm(Id_DM,Cedula,Tipo_Sangre,Alergia,Tipo_Alergia,FechaOperacion,Operacion) values
 (@IdDm,@Cedula,@TS,@Alergia,@TA, GETDATE(), 'Insertado') 
end
go


CREATE TRIGGER AUDITDM_U on Datos_Medicos
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdDm int,
@Cedula int,
@TS VARCHAR(9),
@Alergia bit,
@TA VARCHAR(100)

Select @IdDm = INSERTED.Id_DM from inserted;
Select @Cedula = inserted.Cedula from inserted;
Select @TS = inserted.Tipo_Sangre from INSERTED;
Select @TA = inserted.Tipo_Alergia from INSERTED;
Select @Alergia = INSERTED.Alergia from INSERTED;

INSERT INTO AuditDm(Id_DM,Cedula,Tipo_Sangre,Alergia,Tipo_Alergia,FechaOperacion,Operacion) values
 (@IdDm,@Cedula,@TS,@Alergia,@TA, GETDATE(), 'Actualizado') 
end
go


CREATE TRIGGER AUDITDM_D on Datos_Medicos
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdDm int,
@Cedula int,
@TS VARCHAR(9),
@Alergia bit,
@TA VARCHAR(100)

Select @IdDm = deleted.Id_DM from deleted;
Select @Cedula = deleted.Cedula from deleted;
Select @TS = deleted.Tipo_Sangre from deleted;
Select @TA = deleted.Tipo_Alergia from deleted;
Select @Alergia = deleted.Alergia from deleted;

INSERT INTO AuditDm(Id_DM,Cedula,Tipo_Sangre,Alergia,Tipo_Alergia,FechaOperacion,Operacion) values
 (@IdDm,@Cedula,@TS,@Alergia,@TA, GETDATE(), 'Eliminado') 
end
go



/*-------------------------------- Auditoria de Direcciones de contacto ----------------------------------------------*/


CREATE TABLE AuditDireccion (AuditDireccion int NOT NULL IDENTITY, IdDireccion INT, Ciudad VARCHAR(50), Provincia VARCHAR(50),
 DireccionExacta VARCHAR(120), Telefono VARCHAR(10), Correo VARCHAR(50), Cedula int, FechaOperacion DATE, Operacion varchar(20));


CREATE TRIGGER AUDITDIREC_I on Direccion
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdD int,
@Cedula int,
@Ciudad VARCHAR(50),
@Provincia VARCHAR(50),
@DE VARCHAR(120),
@Tel VARCHAR(10),
@Correo VARCHAR(50)

Select @IdD = INSERTED.IdDireccion from inserted;
Select @Cedula = inserted.Cedula from inserted;
Select @Ciudad = inserted.Ciudad from INSERTED;
Select @Provincia = inserted.Provincia from INSERTED;
Select @DE = INSERTED.DireccionExacta from INSERTED;
Select @Tel = inserted.Telefono from Inserted;
Select @Correo = inserted.Correo from inserted;

INSERT INTO AuditDireccion(IdDireccion,Cedula,Ciudad,Provincia,DireccionExacta,Telefono,Correo,FechaOperacion,Operacion) values
 (@IdD,@Cedula,@Ciudad,@Provincia,@DE,@Tel,@Correo, GETDATE(), 'Insertado') 
end
go


CREATE TRIGGER AUDITDIREC_U on Direccion
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdD int,
@Cedula int,
@Ciudad VARCHAR(50),
@Provincia VARCHAR(50),
@DE VARCHAR(120),
@Tel VARCHAR(10),
@Correo VARCHAR(50)

Select @IdD = INSERTED.IdDireccion from inserted;
Select @Cedula = inserted.Cedula from inserted;
Select @Ciudad = inserted.Ciudad from INSERTED;
Select @Provincia = inserted.Provincia from INSERTED;
Select @DE = INSERTED.DireccionExacta from INSERTED;
Select @Tel = inserted.Telefono from Inserted;
Select @Correo = inserted.Correo from inserted;

INSERT INTO AuditDireccion(IdDireccion,Cedula,Ciudad,Provincia,DireccionExacta,Telefono,Correo,FechaOperacion,Operacion) values
 (@IdD,@Cedula,@Ciudad,@Provincia,@DE,@Tel,@Correo, GETDATE(), 'Actualizado') 
end
go



CREATE TRIGGER AUDITDIREC_D on Direccion
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdD int,
@Cedula int,
@Ciudad VARCHAR(50),
@Provincia VARCHAR(50),
@DE VARCHAR(120),
@Tel VARCHAR(10),
@Correo VARCHAR(50)

Select @IdD = deleted.IdDireccion from deleted;
Select @Cedula = deleted.Cedula from deleted;
Select @Ciudad = deleted.Ciudad from deleted;
Select @Provincia = deleted.Provincia from deleted;
Select @DE = deleted.DireccionExacta from deleted;
Select @Tel = deleted.Telefono from deleted;
Select @Correo = deleted.Correo from deleted;

INSERT INTO AuditDireccion(IdDireccion,Cedula,Ciudad,Provincia,DireccionExacta,Telefono,Correo,FechaOperacion,Operacion) values
 (@IdD,@Cedula,@Ciudad,@Provincia,@DE,@Tel,@Correo, GETDATE(), 'Eliminado') 
end
go





/*-------------------------------- Auditoria de Recetas ----------------------------------------------*/


CREATE TABLE AuditReceta (AuditReceta int NOT NULL IDENTITY, IdReceta INT, Descripcion VARCHAR(200), FechaDespacho DATE,
 Nombre VARCHAR(100), Actual bit DEFAULT 1, FechaOperacion DATE, Operacion varchar(20));


CREATE TRIGGER AUDITRECETA_I on Receta
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdR int,
@Desc varchar(200),
@FD DATE,
@NOMBRE VARCHAR(100),
@ACTUAL BIT

Select @IdR = INSERTED.IdReceta from inserted;
Select @Desc = inserted.Descripcion from inserted;
Select @FD = inserted.FechaDespacho from INSERTED;
Select @NOMBRE = (Select Nombre + ' '+  Apellido1 + ' ' +  Apellido2 from Paciente where IdPaciente = inserted.IdPaciente) from INSERTED;
Select @ACTUAL = inserted.actual from inserted;

INSERT INTO AuditReceta(IdReceta,Descripcion,FechaDespacho,Nombre,Actual,FechaOperacion,Operacion) values
 (@IdR,@Desc,@FD,@NOMBRE,@ACTUAL, GETDATE(), 'Insertado') 
end
go



CREATE TRIGGER AUDITRECETA_U on Receta
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdR int,
@Desc varchar(200),
@FD DATE,
@NOMBRE VARCHAR(100),
@ACTUAL BIT

Select @IdR = INSERTED.IdReceta from inserted;
Select @Desc = inserted.Descripcion from inserted;
Select @FD = inserted.FechaDespacho from INSERTED;
Select @NOMBRE = (Select Nombre + ' '+  Apellido1 + ' ' +  Apellido2 from Paciente where IdPaciente = inserted.IdPaciente) from INSERTED;
Select @ACTUAL = inserted.actual from inserted;

INSERT INTO AuditReceta(IdReceta,Descripcion,FechaDespacho,Nombre,Actual,FechaOperacion,Operacion) values
 (@IdR,@Desc,@FD,@NOMBRE,@ACTUAL, GETDATE(), 'Actualizado') 
end
go


CREATE TRIGGER AUDITRECETA_D on Receta
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdR int,
@Desc varchar(200),
@FD DATE,
@NOMBRE VARCHAR(100),
@ACTUAL BIT

Select @IdR = DELETED.IdReceta from DELETED;
Select @Desc = DELETED.Descripcion from DELETED;
Select @FD = DELETED.FechaDespacho from DELETED;
Select @NOMBRE = (Select Nombre + ' '+  Apellido1 + ' ' +  Apellido2 from Paciente where IdPaciente = DELETED.IdPaciente) from DELETED;
Select @ACTUAL = DELETED.actual from DELETED;

INSERT INTO AuditReceta(IdReceta,Descripcion,FechaDespacho,Nombre,Actual,FechaOperacion,Operacion) values
 (@IdR,@Desc,@FD,@NOMBRE,@ACTUAL, GETDATE(), 'Eliminado') 
end
go


/*-------------------------------- Auditoria de Recetas Medicas ----------------------------------------------*/


CREATE TABLE AuditRM (AuditRM int NOT NULL IDENTITY, IdReceta INT, Medicamento VARCHAR(150), Dosis VARCHAR(150), FechaOperacion DATE, Operacion varchar(20));


CREATE TRIGGER AUDITRM_I on RecetaMedica
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdR int,
@Med varchar(150),
@Dosis VARCHAR(150)

Select @IdR = INSERTED.IdReceta from inserted;
Select @Med = (SELECT NombreGenerico FROM Medicamento where IdMedicamento = inserted.IdMedicamento) from inserted;
Select @Dosis = inserted.Dosis from inserted;

INSERT INTO AuditRM(IdReceta,Medicamento,Dosis,FechaOperacion,Operacion) values
 (@IdR, @Med, @Dosis, GETDATE(), 'Insertado') 
end
go



CREATE TRIGGER AUDITRM_U on RecetaMedica
AFTER UPDATE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdR int,
@Med varchar(150),
@Dosis VARCHAR(150)

Select @IdR = INSERTED.IdReceta from inserted;
Select @Med = (SELECT NombreGenerico FROM Medicamento where IdMedicamento = inserted.IdMedicamento) from inserted;
Select @Dosis = inserted.Dosis from inserted;

INSERT INTO AuditRM(IdReceta,Medicamento,Dosis,FechaOperacion,Operacion) values
 (@IdR, @Med, @Dosis, GETDATE(), 'Actualizado') 
end
go


CREATE TRIGGER AUDITRM_D on RecetaMedica
AFTER DELETE
AS
BEGIN
SET NOCOUNT ON;
DECLARE

@IdR int,
@Med varchar(150),
@Dosis VARCHAR(150)

Select @IdR = DELETED.IdReceta from DELETED;
Select @Med = (SELECT NombreGenerico FROM Medicamento where IdMedicamento = DELETED.IdMedicamento) from DELETED;
Select @Dosis = DELETED.Dosis from DELETED;

INSERT INTO AuditRM(IdReceta,Medicamento,Dosis,FechaOperacion,Operacion) values
 (@IdR, @Med, @Dosis, GETDATE(), 'Eliminado') 
end
go







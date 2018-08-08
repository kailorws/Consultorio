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


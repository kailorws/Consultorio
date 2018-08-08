CREATE TABLE Rol(IdRol INT NOT NULL IDENTITY, Nombre VARCHAR(70) NOT NULL,CONSTRAINT PK_Rol PRIMARY KEY(IdRol));

Insert into Rol Values ('Admistrador');
Insert into Rol Values ('Doctor');
Insert into Rol Values ('Secretaria');

CREATE TABLE Medicamento(IdMedicamento INT NOT NULL, NombreGenerico VARCHAR(150), CONSTRAINT PK_Medicamento PRIMARY KEY (IdMedicamento));

CREATE TABLE Horario(IdHorario INT NOT NULL IDENTITY, Hora TIME(0) NOT NULL, CONSTRAINT PK_Horario PRIMARY KEY(IdHorario));

Insert into Horario VALUES('08:00');
Insert into Horario VALUES('08:30');
Insert into Horario VALUES('09:00');
Insert into Horario VALUES('09:30');
Insert into Horario VALUES('10:00');
Insert into Horario VALUES('10:30');
Insert into Horario VALUES('11:00');
Insert into Horario VALUES('11:30');
Insert into Horario VALUES('12:00');
Insert into Horario VALUES('12:30');
Insert into Horario VALUES('13:00');
Insert into Horario VALUES('13:30');
Insert into Horario VALUES('14:00');
Insert into Horario VALUES('14:30');
Insert into Horario VALUES('15:00');
Insert into Horario VALUES('15:30');
Insert into Horario VALUES('16:00');

CREATE TABLE Usuario(IdUsuario INT NOT NULL IDENTITY, NombreCompleto VARCHAR(100) NOT NULL, Contraseña VARCHAR(50) NOT NULL, Correo varchar(80) NOT NULL, Temporal bit NOT NULL, IdRol INT NOT NULL,
CONSTRAINT FK_Usuario PRIMARY KEY(IdUsuario), 
CONSTRAINT FK_Usuario_Rol FOREIGN KEY (IdRol) REFERENCES Rol (IdRol));

CREATE TABLE Paciente(IdPaciente INT NOT NULL, Nombre VARCHAR(50) NOT NULL, Apellido1 VARCHAR(50) NOT NULL, Apellido2 VARCHAR(50) NOT NULL, Sexo VARCHAR(20), FechaNacimiento DATE NOT NULL,
LugarNacimiento VARCHAR(60), EstadoCivil VARCHAR(50), Ocupacion VARCHAR (50),
CONSTRAINT PK_Paciente PRIMARY KEY(IdPaciente)); 

CREATE TABLE Direccion(IdDireccion INT IDENTITY NOT NULL, Ciudad VARCHAR(50), Provincia VARCHAR(50), DireccionExacta VARCHAR(120), Telefono VARCHAR(10), Correo VARCHAR(50), Cedula int,
CONSTRAINT PK_Direccion PRIMARY KEY (IdDireccion),
CONSTRAINT FK_Direccion_Paciente FOREIGN KEY(Cedula) REFERENCES PACIENTE(IdPaciente));

CREATE TABLE Datos_Medicos(Id_DM int identity not null, Cedula int not null, Tipo_Sangre VARCHAR(9), Alergia bit not null, Tipo_Alergia VARCHAR(100), 
CONSTRAINT PK_DM PRIMARY KEY(Id_DM),
CONSTRAINT FK_DM_Paciente FOREIGN KEY(Cedula) REFERENCES PACIENTE(IdPaciente));

CREATE TABLE Receta(IdReceta INT NOT NULL IDENTITY, Descripcion VARCHAR(200), FechaDespacho DATE NOT NULL, IdPaciente INT NOT NULL, Actual bit DEFAULT 1,
CONSTRAINT PK_Receta PRIMARY KEY (IdReceta),
CONSTRAINT FK_Rec_Pac FOREIGN KEY(IdPaciente) REFERENCES Paciente (IdPaciente));

Create Table RecetaMedica(IdReceta INT, IdMedicamento INT, Dosis VARCHAR(150),
CONSTRAINT PK_RecetaMedica PRIMARY KEY(IdReceta,IdMedicamento),
CONSTRAINT FK_RM_Receta FOREIGN KEY(IdReceta) REFERENCES Receta(IdReceta),
CONSTRAINT FK_RM_Medicina FOREIGN KEY(IdMedicamento) REFERENCES Medicamento(IdMedicamento));

CREATE TABLE Cita (IdCita INT IDENTITY NOT NULL, IdHorario INT NOT NULL, IdUsuario INT NOT NULL, IdPaciente INT, Descripcion VARCHAR(300), Fecha date not null,
CONSTRAINT PK_Cita PRIMARY KEY (IdCita),
CONSTRAINT FK_Cita_Horario FOREIGN KEY (IdHorario) REFERENCES Horario (IdHorario),
CONSTRAINT FK_Cita_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (IdUsuario),
CONSTRAINT FK_Cita_Paciente FOREIGN KEY (IdPaciente) REFERENCES Paciente (IdPaciente));
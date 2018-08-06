# Consultorio
Repositorio para el sistema de Análisis 2
Es un sistema para el consultorio médico de la doctora Xinia Jimenez.

# Prerequisitos de instalación
En caso de querer correr el programa en un ambiente local se necesitara:
Visual Studio 2015 (Hasta la más reciente)
Guia de Prerequisitos, descarga y instalación: https://visualstudio.microsoft.com/es/vs/getting-started/web-install/
SQL Server 2014 (Hasta la más reciente)
Guia de Prerequisitos, descarga y instalación: http://elpaladintecnologico.blogspot.com/2014/07/tutorial-de-instalacion-de-sql-server.html


# Instalación
- Clonar el repositorio de la rama master de GitHub

Base de datos
- Abrir SQL Server
- Generar una conexion al motor de base de datos
- Crear una nueva base de datos dentro de SQL Server (Recomendacion: Nombrarla "Consultorio")
- Extraer el .sql de creacion de las tablas y el .sql de auditorias del repositorio de GitHub
- Correr los scripts de crecion de tablas y auditoria dentro de la nueva base de datos

Nota: Para ingresar al sistema, se recomienda crear datos de prueba personales en la tabla "Usuario";

Programa
- Abrir Visual Studio
- Seleccionar la opcion "Abrir una solucion"
- Ir al repositorio clonado de GitHub
- Abrir la solucion del proyecto
- Verificar que el motor de base de datos tiene sus servicios habilitados y funcionando
- Modificar el archivo BD.settings encontrado en DAL y adaptarlo a la conexion de base de datos local
- Ejecutar la solucion desde UI


# Integrantes
Kailor Murillo Prado  
Esteban Muñoz Jiménez

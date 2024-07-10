CREATE DATABASE SistemaCrucero
Go

Use SistemaCrucero
Go


CREATE TABLE Proveedor(
IdProveedor Int IDENTITY(1,1),
Nombre VARCHAR(150) not null,
Direccion VARCHAR(200) not null,
Telefono CHAR(10),
CONSTRAINT PK_Proveedor PRIMARY KEY (IdProveedor)
)

CREATE TABLE Producto(
IdProducto INT IDENTITY(1,1),
Nombre VARCHAR(100) not null,
PVP Money not null,
FechaExpiracion DATE not null,
Stock INT not null,
Tipo CHAR(10) not null,
Descripcion TEXT,
Constraint PK_Producto PRIMARY KEY (IdProducto)
)


CREATE TABLE Proveedor_Producto(
IdProveedor int not null,
IdProducto int not null,
FechaEntrega DATE not null,
UnidadDeCompra Varchar(10) not null,
CONSTRAINT PK_Proveedor_Producto PRIMARY KEY(IdProveedor,IdProducto),
CONSTRAINT FK_Proveedor FOREIGN KEY(IdProveedor) REFERENCES Proveedor(IdProveedor),
CONSTRAINT FK_Producto FOREIGN KEY(IdProducto) REFERENCES Producto(IdProducto)

)


CREATE TABLE Receta(
IdReceta int Identity(1,1),
NombreReceta VARCHAR(150) not null,
CantidadHecha VARCHAR(100) not null,
Descripcion Text
CONSTRAINT PK_Receta PRIMARY KEY(IdReceta),


)


CREATE TABLE Producto_Receta(
IdProducto int not null,
IdReceta int not null,
RendimientoEstandar Varchar(100),
PasosPreparacion TEXT,
Constraint PK_Producto_Receta PRIMARY KEY(IdProducto,IdReceta),
Constraint FK_IdProducto_1 FOREIGN KEY (IdProducto) REFERENCES Producto(IdProducto),
Constraint FK_Receta_1 FOREIGN KEY (IdReceta) References Receta(IdReceta)

)


Create table Plato(
IdPlato int Identity (1,1),
NombrePlato VARCHAR(300) not null,
Descripcion Text,
Constraint PK_Plato PRIMARY KEY (IdPlato)

)


Create table Plato_Receta(
IdPlato int not null,
IdReceta int not null,
CantidadDeLaRecetaPlato VARCHAR (150),
RendimientoEstandar Varchar(100),
Constraint PK_Plato_Receta PRIMARY KEY (IdPlato,IdReceta),
Constraint FK_Plato_2 FOREIGN KEY(IdPlato) REFERENCES Plato(IdPlato),
CONSTRAINT FK_Receta_2 Foreign Key(IdReceta) References Receta(IdReceta)

)


CREATE TABLE Horario(
IdHorario int Identity(1,1),
HoraInicial time not null,
HoraFinal Time not null,
NombreDelHorario VARCHAR(100),
CONSTRAINT PK_Horario Primary Key (IdHorario),

)


Create table Menu(
IdMenu int identity(1,1),
Nombre Varchar(300) not null,
Descripcion Text,
Servicio VARCHAR(10) not null,
Tipo VARCHAR(20) not null,
Costo Money not null,
Horario int not null,

Constraint Pk_Menu primary Key (IdMenu),
Constraint FK_Horario_Menu Foreign Key (Horario) References Horario(IdHorario)


)


Create table Menu_Plato(
IdMenu int not null,
IdPlato int not null,
Constraint PK_Menu_Plato primary key(IdMenu,IdPlato),
Constraint FK_Menu_1 Foreign Key (IdMenu) References Menu(IdMenu),
Constraint FK_Plato_3 Foreign Key (IdPlato) References Plato(IdPlato)

)


Create table Bar(
IdBar int identity(1,1),
Ubicacion Varchar(150) not null,
Horario int not null,
Constraint PK_Bar primary key(IdBar),
Constraint FK_Bar_Horario Foreign Key (Horario) references Horario(IdHorario)
)


Create table Rol(

IdRol int identity(1,1),
Ocupacion VARCHAR(250) not null,
Descripcion Text,
Constraint PK_Rol Primary Key (IdRol),

)



Create table Tripulante(
IdTripulante int identity(1,1),
Nombre VARCHAR(300) not null,
FechaNacimiento Date not null,
CedulaOIdentificacion CHAR(10) not null,
Rol int,
Constraint PK_Tripulante Primary Key (IdTripulante),
Constraint FK_Rol_1 Foreign Key (Rol) references Rol(IdRol)

)


Create table Guia(

IdGuia int not null,
NivelDeEducacion Varchar(100) not null,
AniosDeExperiencia int not null,
SegundaLenguaDomina Varchar(100) not null,
LenguaMaterna Varchar(100) not null,
Especialidad Varchar(100)



Constraint PK_Guia Primary Key (IdGuia),
Constraint FK_Guia_Tripulante Foreign Key(IdGuia) References Tripulante(IdTripulante)
)

Create table Pasajero(
IdPasajero int Identity(1,1),
Genero Varchar(50) not null,
Nombre Varchar(250) not null,
CedulaOidentificacion Char(10) not null,
Nacionalidad Varchar (100) not null,
FechaNacimiento Date not null,
Correo  Varchar(200) not null,
Telefono Char(10) not null,
ContactoEmergencia Char(10) not null,
Custodio int,
Guia_Asignado int, 
Constraint PK_Pasajero Primary key (IdPasajero),
Constraint FK_Custodio Foreign Key (Custodio) references Pasajero(IdPasajero),
Constraint FK_GuiaAsignado Foreign key (Guia_Asignado) references Guia(IdGuia)

)


Create table Pasajero_Menu(
IdPasajero int not null,
IdMenu int not null,
Estado Varchar(20) not null,
Constraint PK_Pasajero_Menu Primary Key(IdPasajero,IdMenu),
Constraint FK_Pasajero_1 Foreign Key (IdPasajero) References Pasajero(IdPasajero),
Constraint FK_Menu_2 Foreign Key (IdMenu) References Menu(IdMenu)
)

Create table Bar_Pasajero(
IdPasajero int not null,
IdBar int not null,
FechaEntrada Date DEFAULT GETDATE() not null,
Constraint PK_Bar_Pasajero Primary key (IdPasajero, IdBar),
Constraint FK_Bar_1 Foreign Key (IdBar) references Bar(IdBar),
Constraint FK_Pasajero_2 Foreign Key (IdPasajero) references Pasajero(IdPasajero)
)

Create table Cupo(
IdCupo int identity(1,1),
Tipo Varchar(50) not null,
Pasajero int not null,
Constraint Pk_Cupo Primary key (IdCupo),
Constraint FK_Pasajero_3 Foreign Key (Pasajero) references Pasajero (IdPasajero),

)


Create table Venta(
IdVenta int identity(1,1),
NombreVenta Varchar(100),
Pasajero int not null,

Constraint PK_Venta Primary key(IdVenta),
Constraint FK_Pasajero_4 Foreign key (Pasajero) references Pasajero(IdPasajero)

)



Create table Venta_Producto(
IdVenta int not null,
IdProducto int not null,
Cantidad int not null,
Descuento Decimal(5,2) not null,
Subtotal Decimal not null,
Constraint PK_Venta_Producto Primary Key (IdVenta, IdProducto),
Constraint FK_Venta_1 Foreign key (IdVenta) references Venta(IdVenta),
Constraint FK_Producto_5 Foreign key (IdProducto) references Pasajero(IdPasajero)

)


Create table Reporte(
IdReporte int identity(1,1),
FechaReporte Date not null,
Razon Text not null,
Descripcion text,
Tripulante int not null,
Constraint PK_Reporte Primary key (IdReporte),
Constraint FK_Reporte_Tripulante Foreign key (Tripulante) references Tripulante(IdTripulante)
)

Create table Reporte_Pasajero(
IdReporte int not null,
IdPasajero int not null,
AccionATomar text not null,
Constraint PK_Reporte_Pasajero Primary key (IdReporte, IdPasajero),
Constraint FK_Reporte Foreign key (IdReporte) references Reporte(IdReporte),
Constraint FK_Pasajero_6 foreign key (IdPasajero) references Pasajero(IdPasajero)




)

Create table Reserva(
IdReserva int identity(1,1),
Dias int not null,
Noches int not null,
FechaInicio Date not null,
FechaFin Date not null,
Constraint PK_Reserva Primary key (IdReserva),

)


Create table Isla(
IdIsla int identity(1,1),
NombreIsla VARCHAR(150) not null,
Constraint PK_Isla Primary key (IdIsla)
)


Create table Actividad(
IdActividad int identity(1,1),
Nombre Varchar(200) not null, 
Descripcion Text,
Constraint PK_Actividad Primary key (IdActividad)
)


Create table Habitacion(
IdHabitacion int identity(1,1),
CantidadCamas int not null,
Ubicacion Varchar(150) not null,
CapacidadMaxima int not null,
TamanioM2 int not null,
Tipo Varchar(100) not null,
Reserva int not null,
Constraint PK_Habitacion Primary Key (IdHabitacion),
Constraint FK_Reserva_1 Foreign Key (Reserva) references Reserva(IdReserva)
)


Create table Excursion(
IdExcursion int Identity(1,1),
Isla int not null
Constraint PK_Excursion primary key(IdExcursion),
Constraint FK_Isla_1 Foreign key (Isla) References Isla(IdIsla)
)


Create table Excursion_Actividad(
IdExcursion int not null,
IdActividad int not null,
Fecha Date not null,
Constraint PK_Excursion_Actividad primary key (IdExcursion, IdActividad),
Constraint FK_Excursion_1 Foreign key (IdExcursion) references Excursion(IdExcursion),
Constraint FK_Actividad_1 Foreign key (IdActividad) references Actividad(IdActividad)

)



Create table Isla_Reserva(
IdReserva int not null,
IdIsla int not null,
FechaVisitaIsla Date not null,
Constraint PK_Isla_Reserva Primary key (IdReserva, IdIsla),
Constraint FK_Reserva_2 Foreign key(IdReserva) references Reserva(IdReserva),
Constraint FK_Isla_2 Foreign key (IdIsla) references Isla(IdIsla)
)


create table Pasajero_Reserva(
IdReserva int not null,
IdPasajero int not null,
NumeroPersonasReserva int not null,
OfertaMaximaDias int not null,
Constraint PK_Pasajero_Reserva primary key (IdReserva,IdPasajero),
Constraint FK_Reserva_3 Foreign key (IdReserva) references Reserva(IdReserva),
Constraint FK_Pasajero_7 Foreign key (IdPasajero) references Pasajero(IdPasajero)



)


create table Guia_Excursion(
IdGuia int not null,
IdExcursion int not null,
DuracionActividad Varchar(20) not null,
Horario_Actividad int not null,
Constraint PK_Guia_Excursion primary key (IdGuia, IdExcursion),
Constraint FK_Guia_2 Foreign Key (IdGuia) references Guia(IdGuia),
Constraint FK_Excursion_2 foreign key (IdExcursion) references Excursion(IdExcursion)

)
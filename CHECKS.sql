ALTER TABLE Proveedor
ADD CONSTRAINT CHK_Proveedor_Telefono CHECK (Telefono LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE Producto
ADD CONSTRAINT CHK_Producto_PVP CHECK (PVP > 0);

ALTER TABLE Producto
ADD CONSTRAINT CHK_Producto_FechaExpiracion CHECK (FechaExpiracion > GETDATE());

ALTER TABLE Producto
ADD CONSTRAINT CHK_Producto_Stock CHECK (Stock >= 0);

ALTER TABLE Producto
ADD CONSTRAINT CHK_Producto_Tipo CHECK (Tipo IN ('PT','PNT'));

ALTER TABLE Proveedor_Producto
ADD CONSTRAINT CHK_Proveedor_Producto_FechaEntrega CHECK (FechaEntrega > GETDATE());

ALTER TABLE Proveedor_Producto
ADD CONSTRAINT CHK_Proveedor_Producto_UnidadDeCompra CHECK (UnidadDeCompra LIKE '[0-9]% kg' OR UnidadDeCompra LIKE '[0-9]% lb');

ALTER TABLE Receta
ADD CONSTRAINT CHK_Receta_CantidadHecha CHECK (
    CantidadHecha LIKE '[0-9]% kg' OR 
    CantidadHecha LIKE '[0-9]% g' OR
    CantidadHecha LIKE '[0-9]% mg' OR
    CantidadHecha LIKE '[0-9]% lb' OR 
    CantidadHecha LIKE '[0-9]% oz' OR
    CantidadHecha LIKE '[0-9]% ml' OR 
    CantidadHecha LIKE '[0-9]% L'
);

ALTER TABLE Producto_Receta
ADD CONSTRAINT CHK_RendimientoEstandar_Percentage CHECK (
    RendimientoEstandar LIKE '%[0-9]%'
    AND (
        CAST(REPLACE(RendimientoEstandar, '%', '') AS DECIMAL(5, 2)) BETWEEN 1.00 AND 100.00
    )
);


ALTER TABLE Plato_Receta
ADD CONSTRAINT CHK_CantidadDeLaRecetaPlato_Format CHECK (
    CantidadDeLaRecetaPlato LIKE '%[0-9]%'
    AND (
        CantidadDeLaRecetaPlato LIKE '% kg' OR 
        CantidadDeLaRecetaPlato LIKE '% g' OR
        CantidadDeLaRecetaPlato LIKE '% mg' OR
        CantidadDeLaRecetaPlato LIKE '% lb' OR 
        CantidadDeLaRecetaPlato LIKE '% oz' OR
        CantidadDeLaRecetaPlato LIKE '% ml' OR 
        CantidadDeLaRecetaPlato LIKE '% L'
    )
);


ALTER TABLE Plato_Receta
ADD CONSTRAINT CHK_RendimientoEstandar_Percentage_2 CHECK (
    RendimientoEstandar LIKE '%[0-9]%'
    AND (
        CAST(REPLACE(RendimientoEstandar, '%', '') AS DECIMAL(5, 2)) BETWEEN 1.00 AND 100.00
    )
);



ALTER TABLE Horario
ADD CONSTRAINT CHK_HoraInicial_Valid CHECK (HoraInicial >= '00:00:00' AND HoraInicial <= '23:59:59');


ALTER TABLE Horario
ADD CONSTRAINT CHK_HoraFinal_Valid CHECK (HoraFinal >= '00:00:00' AND HoraFinal <= '23:59:59' AND HoraFinal > HoraInicial);


ALTER TABLE Menu
ADD CONSTRAINT CHK_Servicio_Valid CHECK (Servicio IN ('Para Servir', 'Reserva'));


ALTER TABLE Menu
ADD CONSTRAINT CHK_Tipo_Valid CHECK (Tipo IN ('Desayuno', 'Almuerzo', 'Cena'));

ALTER TABLE Menu
ADD CONSTRAINT CHK_Costo_Positive CHECK (Costo > 0);


ALTER TABLE Rol
ADD CONSTRAINT CHK_NumeroMaximoRoles CHECK (
    (Ocupacion = 'Gerente de Crucero' AND IdRol <= 1) OR
    (Ocupacion = 'Asistente de Gerencias' AND IdRol <= 1) OR
    (Ocupacion = 'Guías Turísticos' AND IdRol <= 10) OR
    (Ocupacion = 'Asistente de Camarote' AND IdRol <= 5) OR
    (Ocupacion = 'Camareros de Restaurante' AND IdRol <= 10) OR
    (Ocupacion = 'Barman' AND IdRol <= 2) OR
    (Ocupacion = 'Camareros de Bar' AND IdRol <= 2) OR
    (Ocupacion = 'Asistentes de Tienda' AND IdRol <= 2) OR
    (Ocupacion = 'Personal de Spa / Fitness' AND IdRol <= 8) OR
    (Ocupacion = 'Mantenimiento' AND IdRol <= 5) OR
    (Ocupacion = 'Asistentes de Pasajero' AND IdRol <= 10) OR
    (Ocupacion = 'Servicio de Limpieza' AND IdRol <= 10) OR
    (Ocupacion = 'Timonel' AND IdRol <= 1) OR
    (Ocupacion = 'Capitanes' AND IdRol <= 2) OR
    (Ocupacion = 'Oficiales de Puente' AND IdRol <= 2) OR
    (Ocupacion = 'Oficiales de Máquinas' AND IdRol <= 4) OR
    (Ocupacion = 'Oficiales Radioelectrónico' AND IdRol <= 2) OR
    (Ocupacion = 'Jefe de Máquinas' AND IdRol <= 1)
);


ALTER TABLE Tripulante
ADD CONSTRAINT CHK_FechaNacimiento_Valid CHECK (FechaNacimiento <= GETDATE());


ALTER TABLE Tripulante
ADD CONSTRAINT CHK_CedulaOIdentificacion_Length CHECK (LEN(CedulaOIdentificacion) = 10);


ALTER TABLE Tripulante
ADD CONSTRAINT CHK_CedulaOIdentificacion_Numeric CHECK (ISNUMERIC(CedulaOIdentificacion) = 1);


ALTER TABLE Tripulante
ADD CONSTRAINT CHK_Rol_Valid CHECK (Rol IS NOT NULL);


ALTER TABLE Guia
ADD CONSTRAINT CHK_AniosDeExperiencia_Positive CHECK (AniosDeExperiencia >= 0);


ALTER TABLE Guia
ADD CONSTRAINT CHK_LenguaMaterna_Valid CHECK (LenguaMaterna IN ('Español', 'Inglés', 'Francés', 'Alemán', 'Italiano', 'Portugués', 'Otros'));

ALTER TABLE Guia
ADD CONSTRAINT CHK_Especialidad_Length CHECK (LEN(ISNULL(Especialidad, '')) <= 100);



ALTER TABLE Pasajero
ADD CONSTRAINT CHK_Genero_Valid CHECK (Genero IN ('Masculino', 'Femenino', 'Otro'));


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_CedulaOidentificacion_Length_2 CHECK (LEN(CedulaOidentificacion) = 10);


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_CedulaOidentificacion_Numeric_2 CHECK (ISNUMERIC(CedulaOidentificacion) = 1);


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_FechaNacimiento_Valid_2 CHECK (FechaNacimiento <= GETDATE());


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_Correo_Format CHECK (Correo LIKE '%@%.%');


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_Telefono_Length_2 CHECK (LEN(Telefono) = 10);


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_Telefono_Numeric_2 CHECK (ISNUMERIC(Telefono) = 1);


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_ContactoEmergencia_Length CHECK (LEN(ContactoEmergencia) = 10);


ALTER TABLE Pasajero
ADD CONSTRAINT CHK_ContactoEmergencia_Numeric CHECK (ISNUMERIC(ContactoEmergencia) = 1);

ALTER TABLE Pasajero_Menu
ADD CONSTRAINT CHK_Estado_Valid CHECK (Estado IN ('Pendiente', 'Confirmado', 'Cancelado'));


ALTER TABLE Cupo
ADD CONSTRAINT CHK_Tipo_Valid_cupo CHECK (Tipo IN ('SPA', 'GIMNASIO'));


ALTER TABLE Cupo
ADD CONSTRAINT CHK_Pasajero_NotNull CHECK (Pasajero IS NOT NULL);

ALTER TABLE Venta
ADD CONSTRAINT CHK_NombreVenta_Valid CHECK (
    NombreVenta IN ('Souvenirs', 'Menús de alimentos - extra', 'Snack extra')
);

ALTER TABLE Venta_Producto
ADD CONSTRAINT CHK_Cantidad_Positive CHECK (Cantidad > 0);


ALTER TABLE Venta_Producto
ADD CONSTRAINT CHK_Descuento_Valid CHECK (Descuento >= 0 AND Descuento <= 100);


ALTER TABLE Venta_Producto
ADD CONSTRAINT CHK_Subtotal_Positive CHECK (Subtotal >= 0);


ALTER TABLE Reporte
ALTER COLUMN Razon VARCHAR(255);

ALTER TABLE Reporte
ADD CONSTRAINT CHK_Razon_NotEmpty CHECK (Razon <> '');



ALTER TABLE Reporte
ADD CONSTRAINT CHK_Tripulante_NotNull CHECK (Tripulante IS NOT NULL);


ALTER TABLE Reserva
ADD CONSTRAINT CHK_FechaInicio_FechaFin_DiasNoches 
CHECK (
    (Dias = 3 AND Noches = 2 AND DATEDIFF(DAY, FechaInicio, FechaFin) = 2) OR
    (Dias = 4 AND Noches = 3 AND DATEDIFF(DAY, FechaInicio, FechaFin) = 3) OR
    (Dias = 5 AND Noches = 4 AND DATEDIFF(DAY, FechaInicio, FechaFin) = 4) OR
    (Dias = 7 AND Noches = 6 AND DATEDIFF(DAY, FechaInicio, FechaFin) = 6)
);


ALTER TABLE Isla
ADD CONSTRAINT CHK_NombreIsla_Valido 
CHECK (
    NombreIsla IN ('Isla Santa Cruz', 'Isla San Cristóbal', 'Isla Isabela', 'Isla Floreana')
);

ALTER TABLE Habitacion
ADD CONSTRAINT CHK_CantidadCamas_Positive CHECK (CantidadCamas > 0);


ALTER TABLE Habitacion
ADD CONSTRAINT CHK_CapacidadMaxima_Positive CHECK (CapacidadMaxima > 0);


ALTER TABLE Habitacion
ADD CONSTRAINT CHK_TamanioM2_Positive CHECK (TamanioM2 > 0);


ALTER TABLE Habitacion
ADD CONSTRAINT CHK_Tipo_Valido CHECK (
    Tipo IN ('Doble', 'Triple', 'Suite', 'Individual', 'Familiar')
);



ALTER TABLE Pasajero_Reserva
ADD CONSTRAINT CHK_NumeroPersonasReserva_Positive CHECK (NumeroPersonasReserva > 0);


ALTER TABLE Pasajero_Reserva
ADD CONSTRAINT CHK_OfertaMaximaDias_Positive CHECK (OfertaMaximaDias > 0);


ALTER TABLE Guia_Excursion
ADD CONSTRAINT CHK_DuracionActividad_Valida CHECK (
    DuracionActividad LIKE '[1-9][0-9]* hora%' OR 
    DuracionActividad LIKE '[1-9][0-9]* horas%'   
);
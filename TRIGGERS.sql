CREATE TRIGGER trg_Proveedor_AfterDelete
ON Proveedor
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO


CREATE TRIGGER trg_Producto_AfterDelete
ON Producto
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO



CREATE TRIGGER trg_Proveedor_Producto_AfterDelete
ON Proveedor_Producto
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO


CREATE TRIGGER trg_Receta_AfterDelete
ON Receta
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO


CREATE TRIGGER trg_Producto_Receta_AfterDelete
ON Producto_Receta
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Plato_AfterDelete
ON Plato
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO


CREATE TRIGGER trg_Plato_Receta_AfterDelete
ON Plato_Receta
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Horario_AfterDelete
ON Horario
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Menu_AfterDelete
ON Menu
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Menu_Plato_AfterDelete
ON Menu_Plato
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Bar_AfterDelete
ON Bar
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Rol_AfterDelete
ON Rol
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Tripulante_AfterDelete
ON Tripulante
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Guia_AfterDelete
ON Guia
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Pasajero_AfterDelete
ON Pasajero
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Pasajero_Menu_AfterDelete
ON Pasajero_Menu
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Bar_Pasajero_AfterDelete
ON Bar_Pasajero
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Cupo_AfterDelete
ON Cupo
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Venta_AfterDelete
ON Venta
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Venta_Producto_AfterDelete
ON Venta_Producto
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Reporte_AfterDelete
ON Reporte
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Reporte_Pasajero_AfterDelete
ON Reporte_Pasajero
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Reserva_AfterDelete
ON Reserva
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Isla_AfterDelete
ON Isla
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Actividad_AfterDelete
ON Actividad
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Habitacion_AfterDelete
ON Habitacion
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Excursion_AfterDelete
ON Excursion
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Excursion_Actividad_AfterDelete
ON Excursion_Actividad
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Isla_Reserva_AfterDelete
ON Isla_Reserva
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Pasajero_Reserva_AfterDelete
ON Pasajero_Reserva
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO

CREATE TRIGGER trg_Guia_Excursion_AfterDelete
ON Guia_Excursion
AFTER DELETE
AS
BEGIN
    IF (SELECT COUNT(*) FROM deleted) > 1
    BEGIN
        ROLLBACK TRANSACTION;
        RAISERROR('No se permite eliminar más de un registro a la vez.', 16, 1);
    END
END;
GO



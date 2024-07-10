CREATE PROCEDURE SP_ControlDeRegistroProductos
(
    @IdProducto INT,
    @Nombre VARCHAR(100),
    @PVP MONEY,
    @FechaExpiracion DATE,
    @Stock INT,
    @Tipo CHAR(10),
    @Descripcion TEXT,
    @TIPO_CONTROL CHAR(1) -- M: Modificar, I: Ingresar, E: Eliminar
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN

        -- Eliminar
        IF (@TIPO_CONTROL = 'E')
        BEGIN
            IF EXISTS (SELECT * FROM Producto WHERE IdProducto = @IdProducto)
            BEGIN
                DELETE FROM Producto WHERE IdProducto = @IdProducto;
            END
            ELSE
            BEGIN
                RAISERROR('No se encontró dicho producto para eliminar, ingrese un ID correcto', 16, 1);
            END
        END
        -- Ingresar o Modificar
        ELSE IF (@TIPO_CONTROL = 'I' OR @TIPO_CONTROL = 'M')
        BEGIN
            IF (@TIPO_CONTROL = 'I')
            BEGIN
                INSERT INTO Producto (Nombre, PVP, FechaExpiracion, Stock, Tipo, Descripcion)
                VALUES (@Nombre, @PVP, @FechaExpiracion, @Stock, @Tipo, @Descripcion);
            END
            ELSE
            BEGIN
                IF EXISTS (SELECT * FROM Producto WHERE IdProducto = @IdProducto)
                BEGIN
                    UPDATE Producto
                    SET
                        Nombre = @Nombre,
                        PVP = @PVP,
                        FechaExpiracion = @FechaExpiracion,
                        Stock = @Stock,
                        Tipo = @Tipo,
                        Descripcion = @Descripcion
                    WHERE IdProducto = @IdProducto;
                END
                ELSE
                BEGIN
                    RAISERROR('No se encontró dicho producto para modificar, ingrese un ID correcto', 16, 1);
                END
            END
        END
        ELSE
        BEGIN
            RAISERROR('Ingrese un tipo de control correcto', 16, 1);
        END

        COMMIT TRAN
    END TRY
    BEGIN CATCH
        PRINT 'Error inesperado';

        IF XACT_STATE() <> 0
        BEGIN
            ROLLBACK TRAN;
        END

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END


CREATE PROCEDURE SP_ControlDeRegistroProveedores
(
    @IdProveedor INT,
    @Nombre VARCHAR(150),
    @Direccion VARCHAR(200),
    @Telefono CHAR(10),
    @TIPO_CONTROL CHAR(1) -- M: Modificar, I: Ingresar, E: Eliminar
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN

        -- Eliminar
        IF (@TIPO_CONTROL = 'E')
        BEGIN
            IF EXISTS (SELECT * FROM Proveedor WHERE IdProveedor = @IdProveedor)
            BEGIN
                DELETE FROM Proveedor WHERE IdProveedor = @IdProveedor;
            END
            ELSE
            BEGIN
                RAISERROR('No se encontró dicho proveedor para eliminar, ingrese un ID correcto', 16, 1);
            END
        END
        -- Ingresar o Modificar
        ELSE IF (@TIPO_CONTROL = 'I' OR @TIPO_CONTROL = 'M')
        BEGIN
            IF (@TIPO_CONTROL = 'I')
            BEGIN
                INSERT INTO Proveedor (Nombre, Direccion, Telefono)
                VALUES (@Nombre, @Direccion, @Telefono);
            END
            ELSE
            BEGIN
                IF EXISTS (SELECT * FROM Proveedor WHERE IdProveedor = @IdProveedor)
                BEGIN
                    UPDATE Proveedor
                    SET
                        Nombre = @Nombre,
                        Direccion = @Direccion,
                        Telefono = @Telefono
                    WHERE IdProveedor = @IdProveedor;
                END
                ELSE
                BEGIN
                    RAISERROR('No se encontró dicho proveedor para modificar, ingrese un ID correcto', 16, 1);
                END
            END
        END
        ELSE
        BEGIN
            RAISERROR('Ingrese un tipo de control correcto', 16, 1);
        END

        COMMIT TRAN
    END TRY
    BEGIN CATCH
        PRINT 'Error inesperado';

        IF XACT_STATE() <> 0
        BEGIN
            ROLLBACK TRAN;
        END

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END


CREATE PROCEDURE SP_ControlDeRegistroVentas
(
    @IdVenta INT,
    @NombreVenta VARCHAR(100),
    @Pasajero INT,
    @TIPO_CONTROL CHAR(1) -- M: Modificar, I: Ingresar, E: Eliminar
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN

        -- Eliminar
        IF (@TIPO_CONTROL = 'E')
        BEGIN
            IF EXISTS (SELECT * FROM Venta WHERE IdVenta = @IdVenta)
            BEGIN
                DELETE FROM Venta WHERE IdVenta = @IdVenta;
            END
            ELSE
            BEGIN
                RAISERROR('No se encontró dicha venta para eliminar, ingrese un ID correcto', 16, 1);
            END
        END
        -- Ingresar o Modificar
        ELSE IF (@TIPO_CONTROL = 'I' OR @TIPO_CONTROL = 'M')
        BEGIN
            IF EXISTS (SELECT * FROM Pasajero WHERE IdPasajero = @Pasajero)
            BEGIN
                IF (@TIPO_CONTROL = 'I')
                BEGIN
                    INSERT INTO Venta (NombreVenta, Pasajero)
                    VALUES (@NombreVenta, @Pasajero);
                END
                ELSE
                BEGIN
                    IF EXISTS (SELECT * FROM Venta WHERE IdVenta = @IdVenta)
                    BEGIN
                        UPDATE Venta
                        SET
                            NombreVenta = @NombreVenta,
                            Pasajero = @Pasajero
                        WHERE IdVenta = @IdVenta;
                    END
                    ELSE
                    BEGIN
                        RAISERROR('No se encontró dicha venta para modificar, ingrese un ID correcto', 16, 1);
                    END
                END
            END
            ELSE
            BEGIN
                RAISERROR('No se encontró un pasajero válido, ingrese otro que sí lo sea', 16, 1);
            END
        END
        ELSE
        BEGIN
            RAISERROR('Ingrese un tipo de control correcto', 16, 1);
        END

        COMMIT TRAN
    END TRY
    BEGIN CATCH
        PRINT 'Error inesperado';

        IF XACT_STATE() <> 0
        BEGIN
            ROLLBACK TRAN;
        END

        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
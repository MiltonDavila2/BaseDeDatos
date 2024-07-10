CREATE TRIGGER trg_ControlStock
ON Venta_Producto
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IdProducto INT;
    DECLARE @Cantidad INT;
    DECLARE @StockActual INT;

    -- Cursor para iterar sobre los registros insertados
    DECLARE InsertedCursor CURSOR FOR
    SELECT IdProducto, Cantidad
    FROM Inserted;

    OPEN InsertedCursor;

    FETCH NEXT FROM InsertedCursor INTO @IdProducto, @Cantidad;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Obtener el stock actual del producto
        SELECT @StockActual = Stock
        FROM Producto
        WHERE IdProducto = @IdProducto;

        -- Verificar si hay suficiente stock
        IF @StockActual >= @Cantidad
        BEGIN
            -- Actualizar el stock del producto
            UPDATE Producto
            SET Stock = Stock - @Cantidad
            WHERE IdProducto = @IdProducto;
        END
        ELSE
        BEGIN
            -- Si no hay suficiente stock, lanzar un error y revertir la transacción
            RAISERROR('Stock insuficiente para el producto con IdProducto = %d', 16, 1, @IdProducto);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        FETCH NEXT FROM InsertedCursor INTO @IdProducto, @Cantidad;
    END

    CLOSE InsertedCursor;
    DEALLOCATE InsertedCursor;
END;
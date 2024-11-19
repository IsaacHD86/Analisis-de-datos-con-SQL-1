-- Crear Tabla de Ventas
CREATE TABLE DBO.VENTAS (
NumeroOrden INT NOT NULL,
FechadeOrden DATETIME NOT NULL,
FechadeEntrega DATE,
EstatusdelaOrden VARCHAR(20) NOT NULL,
NombreCliente VARCHAR(50) NOT NULL,
DomiciliodeEntrega VARCHAR(MAX),
CompraOnline VARCHAR(2) NOT NULL,
MetododePago VARCHAR(50) NOT NULL,
Subtotal DECIMAL (10, 2) NOT NULL,
Observaciones NVARCHAR (MAX)
);

-- insertar Valorees en la Tabla Ventas
INSERT INTO DBO.VENTAS
VALUES
(12345, '2024-08-05 18:58:46.867', '2024-08-15', 'PENDIENTE', 'JAIME PEREZ', 'Avenida Siempre Viva 742 Springfield', 'SI', 'TARJETA DE CREDITO', 1830.02,'El cliente indica que solo puede recibir el envío entre semana.' ),
(12346, '2024-08-10 17:58:47.867', '2024-08-16', 'COMPLETADA', 'LUIS LOPEZ', 'Avenida Siempre Viva 743 Springfield', 'SI', 'TARJETA DE DEBITO', 1750.20,'El cliente indica que solo puede recibir el envío por las mañanas.' ),
(12347, '2024-08-12 15:58:48.867', '2024-08-17', 'COMPLETADA', 'ROBERTO GUITIERREZ', 'Avenida Siempre Viva 744 Springfield', 'NO', 'TARJETA DE CREDITO', 11830.77,'El cliente indica que solo puede recibir el envio por las tardes.' ),
(12348, '2024-08-13 16:58:35.867', '2024-08-18', 'EN PROCESO', 'CARLOS LOPEZ', 'Avenida Siempre Viva 745 Springfield', 'SI', 'TARJETA DE DEBITO', 1200.82,'El cliente indica que le llamen antes de hacer la entrega.' ),
(12349, '2024-08-11 11:58:36.867', '2024-08-19', 'CANCELADA', 'PEDRO JAIMES', 'Avenida Siempre Viva 746 Springfield', 'NO', 'EFECTIVO', 4560.30,'El cliente indica que estara de vacaciones toda la semana.' );

-- Cambiar el nombre de la tabla 'Ventas' a 'ordenes'
EXEC sp_rename 'VENTAS', 'Ordenes';

--Agrega una columna nueva para almacenar la Fecha de Envío usamos GETDATE() para agrgar la fecha actual
ALTER TABLE Ordenes
ADD FechadeEnvio DATE

-- agregar las fechas a la columna con GETDATE()
UPDATE Ordenes
SET FechadeEnvio = GETDATE()

--cambiar el nombre (No el tipo de dato) de la columna “CompraOnline” a “BanderaCompraOnline” .
EXEC sp_rename 'Ordenes.CompraOnline', 'BanderaCompraOnline', 'COLUMN';

SELECT *
FROM DBO.Ordenes

--Crea una tabla llamada Prueba con una sola columna e inserta 5 registros aleatorios.
CREATE TABLE dbo.Prueba(
Calificaciones NVARCHAR(50) NOT NULL,
);

-- Agregar 5 registros
INSERT INTO dbo.Prueba
VALUES
('10'),
('REPORBADO'),
('8'),
('APROBADO'),
('9');


TRUNCATE TABLE dbo.Prueba

DROP TABLE dbo.Prueba

SELECT *
FROM DBO.Prueba

-- Sobre la tabla “Ordenes” aplica un DELETE para eliminar sólo aquellos registros cuyo Estatus de la Orden sea “Cancelada”.
DELETE FROM DBO.Ordenes
WHERE EstatusdelaOrden = 'Cancelada'

SELECT *
FROM DBO.Ordenes
CREATE DATABASE proyecto;
USE proyecto;

-- Crear la tabla Sucursal
CREATE TABLE Sucursal (
    Id_Sucursal INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Gerente VARCHAR(225),
    Nombre_Sucursal VARCHAR(255),
    Direccion_Sucursal VARCHAR(255),
    Telefono_Sucursal VARCHAR(20),
    Correo_Sucursal VARCHAR(255)
);

-- Crear la tabla Tipo_Producto
CREATE TABLE Tipo_Producto (
    Id_Tipo_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tipo_Producto VARCHAR(255) NOT NULL
);

-- Crear la tabla Producto
CREATE TABLE Producto (
    Id_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Id_tipo_Producto INT,
    Nombre_Producto VARCHAR(255) NOT NULL,
    Descripcion_Producto TEXT,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_tipo_Producto) REFERENCES Tipo_Producto(Id_Tipo_Producto)
);

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    Id_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Correo VARCHAR(255)
);

-- Crear la tabla Proveedores
CREATE TABLE Proveedores (
    Id_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Empresa VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(20),
    Correo VARCHAR(255)
);

-- Crear la tabla Estado_Factura
CREATE TABLE Estado_Factura (
    Id_Estado_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Estado_Factura VARCHAR(255) NOT NULL
);

-- Crear la tabla Estado_Pago
CREATE TABLE Estado_Pago (
    Id_Estado_Pago INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Estado_Pago VARCHAR(255) NOT NULL
);

-- Crear la tabla Tipo_Impuesto
CREATE TABLE Tipo_Impuesto (
    Id_Tipo_Impuesto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tipo_Impuesto VARCHAR(255) NOT NULL,
    Tasa_Impuesto DECIMAL(5, 2)
);

-- Detalles de factura para facturas de cliente
CREATE TABLE Detalle_Factura_Cliente (
    Id_Detalle_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Id_Factura INT,
    Id_Producto INT,
    Cantidad_Producto INT NOT NULL,
    Total_Detalle DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);

-- Detalles de factura para facturas de proveedor
CREATE TABLE Detalle_Factura_Proveedor (
    Id_Detalle_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Id_Factura INT,
    Id_Producto INT,
    Cantidad_Producto INT NOT NULL,
    Total_Detalle DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);

-- Crear la tabla Factura_Cliente
CREATE TABLE Factura_Cliente (
    Id_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Id_Cliente INT,
    Id_Estado_Pago INT,
    Id_Tipo_Impuesto INT,
    Id_Estado_Factura INT,
    Id_Detalle_Factura INT,
    Fecha_Factura DATE NOT NULL,
    Pago_Impuesto DECIMAL(10, 2) NOT NULL,
    Subtotal_Factura DECIMAL(10, 2) NOT NULL,
    Total_Factura DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    FOREIGN KEY (Id_Estado_Pago) REFERENCES Estado_Pago(Id_Estado_Pago),
    FOREIGN KEY (Id_Tipo_Impuesto) REFERENCES Tipo_Impuesto(Id_Tipo_Impuesto),
    FOREIGN KEY (Id_Estado_Factura) REFERENCES Estado_Factura(Id_Estado_Factura),
    FOREIGN KEY (Id_Detalle_Factura) REFERENCES Detalle_Factura_Cliente(Id_Detalle_Factura)
);

-- Crear la tabla Factura_Proveedor
CREATE TABLE Factura_Proveedor (
    Id_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Id_Proveedor INT,
    Id_Estado_Pago INT,
    Id_Tipo_Impuesto INT,
    Id_Estado_Factura INT,
    Id_Detalle_Factura INT,
    Fecha_Factura DATE NOT NULL,
    Pago_Impuesto DECIMAL(10, 2) NOT NULL,
    Subtotal_Factura DECIMAL(10, 2) NOT NULL,
    Total_Factura DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Proveedor) REFERENCES Proveedores(Id_Proveedor),
    FOREIGN KEY (Id_Estado_Pago) REFERENCES Estado_Pago(Id_Estado_Pago),
    FOREIGN KEY (Id_Tipo_Impuesto) REFERENCES Tipo_Impuesto(Id_Tipo_Impuesto),
    FOREIGN KEY (Id_Estado_Factura) REFERENCES Estado_Factura(Id_Estado_Factura),
    FOREIGN KEY (Id_Detalle_Factura) REFERENCES Detalle_Factura_Cliente(Id_Detalle_Factura)
);

-- Crear la tabla Tipo_Cuenta
CREATE TABLE Tipo_Cuenta (
    Id_Tipo_Cuenta INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tipo_Cuenta VARCHAR(255) NOT NULL
);

-- Crear la tabla Cuenta
CREATE TABLE Cuenta (
    Id_Cuenta INT AUTO_INCREMENT PRIMARY KEY,
    Id_Tipo_Cuenta INT,
    Nombre_Cuenta VARCHAR(255) NOT NULL,
    FOREIGN KEY (Id_Tipo_Cuenta) REFERENCES Tipo_Cuenta(Id_Tipo_Cuenta)
);

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    Id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Usuario VARCHAR(255) NOT NULL,
    Contrasena VARCHAR(255) NOT NULL
);

#inserciones
-- Inserciones de ejemplo en la tabla Sucursal
INSERT INTO Sucursal (Nombre_Sucursal, Nombre_Gerente, Direccion_Sucursal, Telefono_Sucursal, Correo_Sucursal)
VALUES
    ('Sucursal A','Nombre gerente', 'Dirección Sucursal A', '1112223333', 'sucursalA@example.com');

-- Inserciones de ejemplo en la tabla Tipo_Producto
INSERT INTO Tipo_Producto (Nombre_Tipo_Producto)
VALUES
    ('Producto'),
    ('Servicio');

-- Inserciones de ejemplo en la tabla Producto
INSERT INTO Producto (Id_tipo_Producto, Nombre_Producto, Descripcion_Producto, Precio_Unitario)
VALUES
    (1, 'Producto A', 'Descripción del Producto A', 50.00),
    (1, 'Producto B', 'Descripción del Producto B', 75.00),
    (2, 'Servicio X', 'Descripción del Servicio X', 100.00);

-- Inserciones de ejemplo en la tabla Cliente
INSERT INTO Cliente (Nombre, Direccion, Telefono, Correo)
VALUES
    ('Cliente 1', 'Dirección Cliente 1', '1234567890', 'cliente1@example.com'),
    ('Cliente 2', 'Dirección Cliente 2', '9876543210', 'cliente2@example.com');

-- Inserciones de ejemplo en la tabla Proveedores
INSERT INTO Proveedores (Nombre_Empresa, Direccion, Telefono, Correo)
VALUES
    ('Proveedor A', 'Dirección Proveedor A', '1112223333', 'proveedorA@example.com'),
    ('Proveedor B', 'Dirección Proveedor B', '4445556666', 'proveedorB@example.com');

-- Inserciones de ejemplo en la tabla Estado_Factura
INSERT INTO Estado_Factura (Nombre_Estado_Factura)
VALUES
    ('Pendiente'),
    ('Pagada');

-- Inserciones de ejemplo en la tabla Estado_Pago
INSERT INTO Estado_Pago (Nombre_Estado_Pago)
VALUES
    ('Al contado'),
    ('A crédito');

-- Inserciones de ejemplo en la tabla Tipo_Impuesto
INSERT INTO Tipo_Impuesto (Nombre_Tipo_Impuesto, Tasa_Impuesto)
VALUES
    ('IVA 12%', 12.00),
    ('Impuesto al Consumo 5%', 5.00);

-- Inserciones de ejemplo en la tabla Detalle_Factura_Cliente (Detalles de factura para Factura_Cliente)
INSERT INTO Detalle_Factura_Cliente (Id_Factura, Id_Producto, Cantidad_Producto, Total_Detalle)
VALUES
    (1, 1, 2, 40.00),
    (1, 2, 3, 225.00),
    (2, 1, 2, 40.00),
    (3, 2, 3, 225.00),
    (3, 1, 2, 40.00),
    (3, 2, 3, 225.00);

-- Inserciones de ejemplo en la tabla Detalle_Factura_Proveedor (Detalles de factura para Factura_Proveedor)
INSERT INTO Detalle_Factura_Proveedor (Id_Factura, Id_Producto, Cantidad_Producto, Total_Detalle)
VALUES
    (1, 1, 2, 43.00),
    (1, 2, 3, 25.00),
    (2, 1, 2, 43.30),
    (2, 2, 3, 225.06),
    (2, 1, 2, 40.00),
    (3, 2, 3, 22345.00);

-- Inserciones de ejemplo en la tabla Factura_Cliente (Clientes)
INSERT INTO Factura_Cliente (Id_Cliente, Id_Estado_Pago, Id_Tipo_Impuesto, Id_Estado_Factura, Id_Detalle_Factura, Fecha_Factura, Pago_Impuesto, Subtotal_Factura, Total_Factura)
VALUES
    (1, 1, 1, 1, null, '2023-9-30', 160.00, 10034.00, 1510.00),
    (2, 1, 1, 1, null, '2021-10-30', 170.00, 12.00, 110.00),
    (1, 1, 1, 1, null, '2023-10-1', 1012.00, 10.00, 10.00);

-- Inserciones de ejemplo en la tabla Factura_Proveedor (Proveedores)
INSERT INTO Factura_Proveedor (Id_Proveedor, Id_Estado_Pago, Id_Tipo_Impuesto, Id_Estado_Factura, Id_Detalle_Factura, Fecha_Factura, Pago_Impuesto, Subtotal_Factura, Total_Factura)
VALUES
    (1, 1, 1, 1, null, '2023-9-30', 160.00, 10034.00, 1510.00),
    (2, 1, 1, 1, null, '2021-10-30', 170.00, 12.00, 110.00),
    (1, 1, 1, 1, null, '2023-10-1', 1012.00, 10.00, 10.00);

-- Inserciones de ejemplo en la tabla Tipo_Cuenta
INSERT INTO Tipo_Cuenta (Nombre_Tipo_Cuenta)
VALUES
    ('Activo'),
    ('Pasivo');

-- Inserciones de ejemplo en la tabla Cuenta
INSERT INTO Cuenta (Id_Tipo_Cuenta, Nombre_Cuenta)
VALUES
    (1, 'Cuenta de Banco'),
    (2, 'Cuentas por Pagar');

-- Inserciones de ejemplo en la tabla Usuario
INSERT INTO Usuario (Nombre_Usuario, Contrasena)
VALUES
    ('admin', '123');

-- Seleccionar datos de las facturas de clientes con detalles, incluyendo los IDs
SELECT
    FC.Id_Factura AS Numero_Factura,
    FC.Id_Cliente AS ID_Cliente,
    C.Nombre AS Cliente,
    C.Direccion AS Direccion_Cliente,
    C.Telefono AS Telefono_Cliente,
    C.Correo AS Correo_Cliente,
    EF.Id_Estado_Factura AS ID_Estado_Factura,
    EF.Nombre_Estado_Factura AS Estado_Factura,
    EP.Id_Estado_Pago AS ID_Estado_Pago,
    EP.Nombre_Estado_Pago AS Estado_Pago,
    TI.Id_Tipo_Impuesto AS ID_Tipo_Impuesto,
    TI.Nombre_Tipo_Impuesto AS Tipo_Impuesto,
    FC.Fecha_Factura AS Fecha_Factura,
    FC.Pago_Impuesto AS Pago_Impuesto,
    FC.Subtotal_Factura AS Subtotal_Factura,
    FC.Total_Factura AS Total_Factura
FROM Factura_Cliente FC
INNER JOIN Cliente C ON FC.Id_Cliente = C.Id_Cliente
INNER JOIN Estado_Factura EF ON FC.Id_Estado_Factura = EF.Id_Estado_Factura
INNER JOIN Estado_Pago EP ON FC.Id_Estado_Pago = EP.Id_Estado_Pago
INNER JOIN Tipo_Impuesto TI ON FC.Id_Tipo_Impuesto = TI.Id_Tipo_Impuesto;

-- Seleccionar datos de las facturas de proveedores con detalles, incluyendo los IDs
SELECT
    FP.Id_Factura AS Numero_Factura,
    FP.Id_Proveedor AS ID_Proveedor,
    PR.Nombre_Empresa AS Proveedor,
    PR.Direccion AS Direccion_Proveedor,
    PR.Telefono AS Telefono_Proveedor,
    PR.Correo AS Correo_Proveedor,
    EF.Id_Estado_Factura AS ID_Estado_Factura,
    EF.Nombre_Estado_Factura AS Estado_Factura,
    EP.Id_Estado_Pago AS ID_Estado_Pago,
    EP.Nombre_Estado_Pago AS Estado_Pago,
    TI.Id_Tipo_Impuesto AS ID_Tipo_Impuesto,
    TI.Nombre_Tipo_Impuesto AS Tipo_Impuesto,
    FP.Fecha_Factura AS Fecha_Factura,
    FP.Pago_Impuesto AS Pago_Impuesto,
    FP.Subtotal_Factura AS Subtotal_Factura,
    FP.Total_Factura AS Total_Factura
FROM Factura_Proveedor FP
INNER JOIN Proveedores PR ON FP.Id_Proveedor = PR.Id_Proveedor
INNER JOIN Estado_Factura EF ON FP.Id_Estado_Factura = EF.Id_Estado_Factura
INNER JOIN Estado_Pago EP ON FP.Id_Estado_Pago = EP.Id_Estado_Pago
INNER JOIN Tipo_Impuesto TI ON FP.Id_Tipo_Impuesto = TI.Id_Tipo_Impuesto;

-- Seleccionar detalles de factura de clientes con los IDs de las tablas
SELECT
    DF.Id_Detalle_Factura AS Numero_Detalle_Factura,
    FP.Id_Factura AS Id_Factura,
    P.Id_Producto AS ID_Producto,
    P.Nombre_Producto AS Producto,
    P.Precio_Unitario AS Precio_Unitario,
    P.Descripcion_Producto AS Descripcion_Producto,
    TP.Id_Tipo_Producto AS Id_Tipo_Producto,
    TP.Nombre_Tipo_Producto AS Tipo_Producto,
    DF.Cantidad_Producto AS Cantidad,
    DF.Total_Detalle AS Total_por_Producto
FROM Detalle_Factura_Cliente DF
INNER JOIN Factura_Proveedor FP ON DF.Id_Factura = FP.Id_Factura
INNER JOIN Producto P ON DF.Id_Producto = P.Id_Producto
INNER JOIN Tipo_Producto TP ON P.Id_tipo_Producto = TP.Id_Tipo_Producto;

-- Seleccionar detalles de factura de proveedores con los IDs de las tablas
SELECT
    DF.Id_Detalle_Factura AS Numero_Detalle_Factura,
    FP.Id_Factura AS Id_Factura,
    P.Id_Producto AS ID_Producto,
    P.Nombre_Producto AS Producto,
    P.Precio_Unitario AS Precio_Unitario,
    P.Descripcion_Producto AS Descripcion_Producto,
    TP.Id_Tipo_Producto AS Id_Tipo_Producto,
    TP.Nombre_Tipo_Producto AS Tipo_Producto,
    DF.Cantidad_Producto AS Cantidad,
    DF.Total_Detalle AS Total_por_Producto
FROM Detalle_Factura_Proveedor DF
INNER JOIN Factura_Proveedor FP ON DF.Id_Factura = FP.Id_Factura
INNER JOIN Producto P ON DF.Id_Producto = P.Id_Producto
INNER JOIN Tipo_Producto TP ON P.Id_tipo_Producto = TP.Id_Tipo_Producto;

select * from Tipo_Impuesto;




SELECT PR.Nombre_Empresa AS Proveedor, 
                     PR.Telefono AS Telefono_Proveedor,
                     PR.Correo AS Correo_Proveedor, 
                     EF.Nombre_Estado_Factura AS Estado_Factura, 
                     EP.Nombre_Estado_Pago AS Estado_Pago, 
                     TI.Nombre_Tipo_Impuesto AS Tipo_Impuesto, 
                     FP.Fecha_Factura AS Fecha_Factura, 
                     FP.Pago_Impuesto AS Pago_Impuesto, 
                     FP.Subtotal_Factura AS Subtotal_Factura,
                     FP.Total_Factura AS Total_Factura 
                     FROM Factura_Proveedor FP
                     INNER JOIN Proveedores PR ON FP.Id_Proveedor = PR.Id_Proveedor
                     INNER JOIN Estado_Factura EF ON FP.Id_Estado_Factura = EF.Id_Estado_Factura 
                     INNER JOIN Estado_Pago EP ON FP.Id_Estado_Pago = EP.Id_Estado_Pago 
                     INNER JOIN Tipo_Impuesto TI ON FP.Id_Tipo_Impuesto = TI.Id_Tipo_Impuesto 
                     WHERE FP.Id_Factura = 1


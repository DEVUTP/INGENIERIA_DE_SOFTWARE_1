CREATE DATABASE proyecto;
USE proyecto;

    -- Crear la Sucursal
CREATE TABLE Sucursal (
    Id_Sucursal INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Sucursal VARCHAR(255) NOT NULL,
    Direccion_Sucursal VARCHAR(255),
    Telefono_Sucursal VARCHAR(20),
    Correo_Sucursal VARCHAR(255)
);

-- Crear la tabla Tipo_Producto
CREATE TABLE Tipo_Producto (
    Id_Tipo_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tipo_Producto VARCHAR(255) NOT NULL
);-- Si es un producto o un servicio

-- Crear la tabla Producto
CREATE TABLE Producto (
    Id_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Id_tipo_Producto INT,
    Nombre_Producto VARCHAR(255) NOT NULL,
    Descripcion_Producto TEXT,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_tipo_Producto) REFERENCES Tipo_Producto(Id_Tipo_Producto)
);-- Productos que ofresen o se compran 

-- Crear la tabla Detalle_Factura
CREATE TABLE Detalle_Factura (
    Id_Detalle_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Id_Producto INT,
    Cantidad_Producto INT NOT NULL,
    Total_Detalle DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Producto) REFERENCES Producto(Id_Producto)
);-- filas de la factura

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
);-- ya se pago o todavia

-- Crear la tabla Estado_Pago
CREATE TABLE Estado_Pago (
    Id_Estado_Pago INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Estado_Pago VARCHAR(255) NOT NULL
);-- pago al momento o al Credito

-- Crear la tabla Tipo_Factura
CREATE TABLE Tipo_Factura (
    Id_Tipo_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_tipo_Factura VARCHAR(255) NOT NULL
);-- si la factura es de compra o venta

-- Crear la tabla Tipo_Impuesto
CREATE TABLE Tipo_Impuesto (
    Id_Tipo_Impuesto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Tipo_Impuesto VARCHAR(255) NOT NULL,
    Tasa_Impuesto DECIMAL(5, 2)
);-- lista de impuestos que se pueden aplicar

-- Crear la tabla Factura
CREATE TABLE Factura (
    Id_Factura INT AUTO_INCREMENT PRIMARY KEY,
    Id_Detalle_Factura INT,
    Id_Cliente INT,
    Id_Proveedor INT,
    Id_Estado_Pago INT,
    Id_Tipo_Impuesto INT,
    Id_Estado_Factura INT,
    Id_Tipo_Factura INT,
    Fecha_Factura DATE NOT NULL,
    Pago_Impuesto DECIMAL(10, 2) NOT NULL,
    Subtotal_Factura DECIMAL(10, 2) NOT NULL,
    Total_Factura DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Id_Cliente) REFERENCES Cliente(Id_Cliente),
    FOREIGN KEY (Id_Proveedor) REFERENCES Proveedores(Id_Proveedor),
    FOREIGN KEY (Id_Estado_Pago) REFERENCES Estado_Pago(Id_Estado_Pago),
    FOREIGN KEY (Id_Tipo_Impuesto) REFERENCES Tipo_Impuesto(Id_Tipo_Impuesto),
    FOREIGN KEY (Id_Estado_Factura) REFERENCES Estado_Factura(Id_Estado_Factura),
    FOREIGN KEY (Id_Tipo_Factura) REFERENCES Tipo_Factura(Id_Tipo_Factura),
    FOREIGN KEY (Id_Detalle_Factura) REFERENCES Detalle_Factura(Id_Detalle_Factura)
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

-- Inserciones de ejemplo en la tabla Sucursal
INSERT INTO Sucursal (Nombre_Sucursal, Direccion_Sucursal, Telefono_Sucursal, Correo_Sucursal)
VALUES
    ('Sucursal A', 'Dirección Sucursal A', '1112223333', 'sucursalA@example.com'),
    ('Sucursal B', 'Dirección Sucursal B', '4445556666', 'sucursalB@example.com');

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

-- Inserciones de ejemplo en la tabla Detalle_Factura
INSERT INTO Detalle_Factura (Id_Producto, Cantidad_Producto, Total_Detalle)
VALUES
    (1, 2, 100.00),
    (2, 3, 225.00);

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

-- Inserciones de ejemplo en la tabla Tipo_Factura
INSERT INTO Tipo_Factura (Nombre_tipo_Factura)
VALUES
    ('Compra'),
    ('Venta');

-- Inserciones de ejemplo en la tabla Tipo_Impuesto
INSERT INTO Tipo_Impuesto (Nombre_Tipo_Impuesto, Tasa_Impuesto)
VALUES
    ('IVA 12%', 12.00),
    ('Impuesto al Consumo 5%', 5.00);

-- Inserciones de ejemplo en la tabla Factura
INSERT INTO Factura (Id_Detalle_Factura, Id_Cliente, Id_Proveedor, Id_Estado_Pago, Id_Tipo_Impuesto, Id_Estado_Factura, Id_Tipo_Factura, Fecha_Factura, Pago_Impuesto, Subtotal_Factura, Total_Factura)
VALUES
    (1, 1, null, 1, 1, 1, 1, '2023-10-30', 10.00, 100.00, 110.00),
    (2, 2, null, 2, 2, 2, 2, '2023-10-31', 15.00, 150.00, 165.00),
    (1, null, 1, 1, 1, 1, 1, '2023-10-30', 10.00, 100.00, 110.00),
    (2, null, 2, 2, 2, 2, 2, '2023-10-31', 15.00, 150.00, 165.00);

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
    ('Usuario1', 'contrasena1'),
    ('Usuario2', 'contrasena2');


-- Seleccionar datos de la tabla Factura con datos legibles
SELECT
    F.Id_Factura AS Numero_de_Factura,
    TP.Nombre_Tipo_Producto AS Tipo_Producto,
    P.Nombre_Producto AS Producto,
    P.Descripcion_Producto AS Descripcion,
    P.Precio_Unitario AS Precio,
    DF.Cantidad_Producto AS Cantidad,
    DF.Total_Detalle AS Total_por_Producto,
    C.Nombre AS Cliente,
    C.Telefono AS Telefono_Cliente,
    PR.Nombre_Empresa AS Proveedor,
    PR.Telefono AS Telefono_Proveedor,
    EF.Nombre_Estado_Factura AS Estado_Factura,
    EP.Nombre_Estado_Pago AS Estado_Pago,
    TF.Nombre_tipo_Factura AS Tipo_Factura,
    TI.Nombre_Tipo_Impuesto AS Tipo_Impuesto,
    TI.Tasa_Impuesto AS Tasa_Impuesto,
    F.Fecha_Factura AS Fecha_Factura,
    F.Pago_Impuesto AS Pago_Impuesto,
    F.Subtotal_Factura AS Subtotal_Factura,
    F.Total_Factura AS Total_Factura
FROM Factura F
LEFT JOIN Detalle_Factura DF ON F.Id_Detalle_Factura = DF.Id_Detalle_Factura
LEFT JOIN Producto P ON DF.Id_Producto = P.Id_Producto
LEFT JOIN Tipo_Producto TP ON P.Id_tipo_Producto = TP.Id_Tipo_Producto
LEFT JOIN Cliente C ON F.Id_Cliente = C.Id_Cliente
LEFT JOIN Proveedores PR ON F.Id_Proveedor = PR.Id_Proveedor
LEFT JOIN Estado_Factura EF ON F.Id_Estado_Factura = EF.Id_Estado_Factura
LEFT JOIN Estado_Pago EP ON F.Id_Estado_Pago = EP.Id_Estado_Pago
LEFT JOIN Tipo_Factura TF ON F.Id_Tipo_Factura = TF.Id_Tipo_Factura
LEFT JOIN Tipo_Impuesto TI ON F.Id_Tipo_Impuesto = TI.Id_Tipo_Impuesto;


-- Crear la base de datos
CREATE DATABASE MiBaseDeDatos;

-- Usar la base de datos
USE MiBaseDeDatos;

-- Crear la tabla Cliente
CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255)
);

-- Crear la tabla Proveedor
CREATE TABLE Proveedor (
    ID_Proveedor INT AUTO_INCREMENT PRIMARY KEY,
    NombreEmpresa VARCHAR(255),
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255)
);

-- Crear la tabla Producto/Servicio
CREATE TABLE ProductoServicio (
    ID_ProductoServicio INT AUTO_INCREMENT PRIMARY KEY,
    Descripcion VARCHAR(255),
    PrecioUnitario DECIMAL(10, 2),
    CantidadInventario INT
);

-- Crear la tabla Factura de Venta
CREATE TABLE FacturaVenta (
    ID_Factura INT AUTO_INCREMENT PRIMARY KEY,
    FechaEmision DATE,
    ClienteID INT,
    Total DECIMAL(10, 2),
    Estado VARCHAR(20),
    TipoImpuestoID INT,
    TipoTransaccion VARCHAR(10), -- Contado o Crédito
    FOREIGN KEY (ClienteID) REFERENCES Cliente (ID_Cliente),
    FOREIGN KEY (TipoImpuestoID) REFERENCES TiposImpuestos (ID_TipoImpuesto)
);

-- Crear la tabla Factura de Compra
CREATE TABLE FacturaCompra (
    ID_Factura INT AUTO_INCREMENT PRIMARY KEY,
    FechaEmision DATE,
    ProveedorID INT,
    Total DECIMAL(10, 2),
    Estado VARCHAR(20),
    TipoImpuestoID INT,
    TipoTransaccion VARCHAR(10), -- Contado o Crédito
    FOREIGN KEY (ProveedorID) REFERENCES Proveedor (ID_Proveedor),
    FOREIGN KEY (TipoImpuestoID) REFERENCES TiposImpuestos (ID_TipoImpuesto)
);

-- Crear la tabla DetalleFacturaVenta
CREATE TABLE DetalleFacturaVenta (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    FacturaVentaID INT,
    ProductoServicioID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (FacturaVentaID) REFERENCES FacturaVenta (ID_Factura),
    FOREIGN KEY (ProductoServicioID) REFERENCES ProductoServicio (ID_ProductoServicio)
);

-- Crear la tabla DetalleFacturaCompra
CREATE TABLE DetalleFacturaCompra (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    FacturaCompraID INT,
    ProductoServicioID INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (FacturaCompraID) REFERENCES FacturaCompra (ID_Factura),
    FOREIGN KEY (ProductoServicioID) REFERENCES ProductoServicio (ID_ProductoServicio)
);

-- Crear la tabla RegistroPago
CREATE TABLE RegistroPago (
    ID_Pago INT AUTO_INCREMENT PRIMARY KEY,
    FacturaID INT,
    FechaPago DATE,
    MontoPagado DECIMAL(10, 2),
    FOREIGN KEY (FacturaID) REFERENCES FacturaVenta (ID_Factura)
);

-- Crear la tabla TransaccionContable
CREATE TABLE TransaccionContable (
    ID_Transaccion INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Descripcion VARCHAR(255),
    Tipo VARCHAR(10),
    Monto DECIMAL(10, 2),
    CuentaContableID INT,
    FOREIGN KEY (CuentaContableID) REFERENCES PlanCuentasContables (ID_Cuenta)
);

-- Crear la tabla TiposImpuestos
CREATE TABLE TiposImpuestos (
    ID_TipoImpuesto INT AUTO_INCREMENT PRIMARY KEY,
    NombreImpuesto VARCHAR(255),
    TasaImpuesto DECIMAL(5, 2)
);

-- Crear la tabla PlanCuentasContables
CREATE TABLE PlanCuentasContables (
    ID_Cuenta INT AUTO_INCREMENT PRIMARY KEY,
    NombreCuenta VARCHAR(255),
    TipoCuenta VARCHAR(15)
);

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    ID_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    NombreUsuario VARCHAR(50),
    Contraseña VARCHAR(255),
    Rol VARCHAR(50)
);
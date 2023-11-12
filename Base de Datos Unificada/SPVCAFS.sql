create database SPVCAFS; /*Sistema de punto de venta y contable de American Fashion Store*/
use SPVCAFS;
create table cliente(
id_cliente int primary key auto_increment,
cedula_cl varchar(11) unique key not null,
nombre_cl varchar(25) not null,
apellido_cl varchar(25) not null,
telefono_cl int,
direccion_cl varchar(50),
correo_cl varchar(50)
) auto_increment=1000;
create table vendedor(
id_empleado int primary key auto_increment,
cedula_emp varchar(11) unique key not null,
nombre_emp varchar(25) not null,
apellido_emp varchar(25) not null,
cargo_emp varchar(25) not null,
contraseña varchar(50) not null
) auto_increment=2000;
create table proveedor(
id_proveedor int primary key auto_increment,
ruc varchar(15) not null,
nombre_prov varchar(50) not null
)auto_increment=3000;
create table compra(
id_compra int primary key auto_increment,
id_proveedor_cp int not null,
articulo_cp int not null,
cantidad_cp int not null,
precio_cp double not null,
id_tipo_ingreso_cp int not null,
total double not null
)auto_increment=4000;
create table tipo_ingreso(
id_ingreso int primary key auto_increment,
descripcion_in varchar(50) not null
)auto_increment=5000;
create table tipo_cuenta(
id_tipo_cuenta int primary key auto_increment,
descripcion_tc varchar(50) not null
) auto_increment=6000;
create table banco(
id_banco int primary key auto_increment,
descripcion_b varchar(50) not null,
id_cuenta_bancaria int not null
) auto_increment=7000;
create table servicio(
id_servicio int primary key auto_increment,
fecha date not null,
descripcion_ser varchar(25) not null
);
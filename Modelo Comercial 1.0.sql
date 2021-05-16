CREATE SCHEMA IF NOT EXISTS `areacomercial` DEFAULT CHARACTER SET utf8 ;
USE `areacomercial` ;

-- -----------------------------------------------------
-- Table `areacomercial`.`tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areacomercial`.`tbl_usuario` (
  `PK_id_usuario` VARCHAR(25) NOT NULL,
  `nombre_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `apellido_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `username_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `password_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `correo_usuario` VARCHAR(45) NULL DEFAULT NULL,
  `cambio_password` TINYINT NULL DEFAULT NULL,
  `estado_usuario` TINYINT NULL DEFAULT NULL,
  `ultima_conexion` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`PK_id_usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
/*INSERT INTO `areacomercial`.`tbl_usuario` (`PK_id_usuario`, `nombre_usuario`, `apellido_usuarios`, `username_usuario`, `password_usuario`, `correo_usuarios`, `cambio_password`, `estado_usuario`, `ultima_conexion`) VALUES ('1', 'Usuario1', 'Usuario11', 'pruebaUsuario', '12345', 'usuario@gmail.com', '1', '1', '2021-03-23 23:59:59');
*/



-- ----------------------------------------------INVENTARIO--------------------------------------------

-- -----------------------------------------------------
-- Table `areacomercial`.`tbl_inventario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areacomercial`.`tbl_inventario` (
  `PK_id_articulo` INT NOT NULL ,
  `nombre_articulo` VARCHAR(200)NOT NULL,
  `caracteristicas_articulo` VARCHAR(200) NOT NULL,
  `referencia_fabricante` VARCHAR(200) NOT NULL,
  `precio_compra` VARCHAR(200) NOT NULL,
   `margen` VARCHAR(200) NOT NULL,
  `descuento_compra` VARCHAR(200) NOT NULL,
  `decuento_venta` VARCHAR(200) NOT NULL,
  `cantidad_articulo` VARCHAR(200) NOT NULL,
  `caducidad_articulo` VARCHAR(200) NOT NULL,
 PRIMARY KEY (`PK_id_articulo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- --------------------------------------------------------COMPRAS--------------------------------------------
-- -----------------------------------------------------
-- Table `areacomercial`.`tbl_proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areacomercial`.`tbl_proveedor` (
  `PK_id_proveedor` INT NOT NULL ,
  `nombre_proveedor` VARCHAR(45)NOT NULL,
  `direccion_proveedor` VARCHAR(200) NOT NULL,
  `contacto_proveedor` VARCHAR(200) NOT NULL,
  `telefono_proveedor` VARCHAR(200) NOT NULL,
   `nit_proveedor` VARCHAR(200) NOT NULL,
  `email_proveedor` VARCHAR(200) NOT NULL,
   `estatus_proveedor` VARCHAR(200) NOT NULL,
 PRIMARY KEY (`PK_id_proveedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `areacomercial`.`tbl_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areacomercial`.`tbl_producto` (
  `PK_id_producto` INT NOT NULL,
  `nombre_producto` VARCHAR(45) NoT NULL,
  `precio_producto` INT(200) NOT NULL,
  `descripcion_producto` VARCHAR(200) NOT NULL,
  `estatus_producto` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`PK_id_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `areacomercial`.`tbl_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `areacomercial`.`tbl_compra` (
  `PK_id_proveedor` INT NOT NULL,
  `nombre_proveedor` VARCHAR(200) NOT NULL,
  `nit_proveedor` VARCHAR(200) NOT NULL,
  `PK_id_producto` INT NOT NULL,
  `precio_producto` INT(200) NOT NULL,
  `cantidad_producto` INT(200) NOT NULL,
  `total_monto`  INT(200) NOT NULL,
PRIMARY KEY (`PK_id_proveedor`,`PK_id_producto`),
CONSTRAINT `fk_tbl_proveedor1`
FOREIGN KEY (`PK_id_proveedor`)
REFERENCES `areacomercial`.`tbl_proveedor` (`PK_id_proveedor`),
CONSTRAINT `fk_tbl_producto1`
FOREIGN KEY (`PK_id_producto`)
REFERENCES `areacomercial`.`tbl_producto` (`PK_id_producto`))    
  
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;





-- ------------------------------------------------------VENTAS---------------------------------------------

CREATE TABLE  tbl_pedido_factura (
 id_cliente INT NOT NULL AUTO_INCREMENT,
 Cliente  VARCHAR(5)  NOT NULL,
Nit   int (25)  NOT NULL,
telefono VARCHAR(25)  NOT NULL,
producto  int (25)  NOT NULL,
Cantidad  int (25)  NOT NULL,
Precio_por_unidad  int (25)  NOT NULL,
Monto  int (25)  NOT NULL,

 PRIMARY KEY ( id_cliente)
);

CREATE TABLE  depositos (
Id_pedido INT NOT NULL AUTO_INCREMENT,
Cliente  VARCHAR(15)  NOT NULL, 
cuenta  VARCHAR(15)  NOT NULL,
Fecha_inicial VARCHAR(25)  NOT NULL,
Fecha_final VARCHAR(25)  NOT NULL,
Nit int (25)  NOT NULL, 
telefono int (25)  NOT NULL, 
producto int (15)  NOT NULL, 
Detalle VARCHAR(25)  NOT NULL,
Cantidad VARCHAR(25)  NOT NULL, 

 PRIMARY KEY ( Id_pedido)
)ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE  estatus_credito (
Id_cliente int (25)  NOT NULL,  
Fecha_inicial VARCHAR(25)  NOT NULL,
Fecha_final VARCHAR(25)  NOT NULL,
Nit int (25)  NOT NULL, 
Monto int (25)  NOT NULL, 
Estatus_Cliente VARCHAR(25)  NOT NULL, 
teléfono int (25)  NOT NULL, 
Id_producto int (25)  NOT NULL, 
Detalle VARCHAR(25)  NOT NULL,
Cantidad int (25)  NOT NULL, 
Precio_por_unidad int (25)  NOT NULL,
 PRIMARY KEY ( id_cliente)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE  solicitud (
Id_cliente int (25)  NOT NULL,  
Fecha_inicial VARCHAR(25)  NOT NULL,
Fecha_final VARCHAR(25)  NOT NULL,
Nit int (25)  NOT NULL, 
Monto int (25)  NOT NULL, 
Estatus_Cliente VARCHAR(25)  NOT NULL, 
teléfono int (25)  NOT NULL, 
Id_producto int (25)  NOT NULL, 
Detalle VARCHAR(25)  NOT NULL,
Cantidad int (25)  NOT NULL, 
Precio_por_unidad int (25)  NOT NULL,
 PRIMARY KEY ( id_cliente)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE  tbl_cliente (
Id_cliente INT NOT NULL AUTO_INCREMENT, 
cliente VARCHAR(25)  NOT NULL,  
Nit VARCHAR(25)  NOT NULL, 
Monto VARCHAR(25)  NOT NULL, 
Estatus_Cliente VARCHAR(25)  NOT NULL, 
telefono VARCHAR(25)  NOT NULL, 
producto VARCHAR(25)  NOT NULL,  
  PRIMARY KEY (Id_cliente)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
 CREATE TABLE  tbl_acreedores (
Id_acreedores INT NOT NULL AUTO_INCREMENT, 
acreedores VARCHAR(25)  NOT NULL,  
Nit VARCHAR(25)  NOT NULL, 
Monto VARCHAR(25)  NOT NULL, 
Estatus_Cliente VARCHAR(25)  NOT NULL, 
telefono VARCHAR(25)  NOT NULL, 
producto VARCHAR(25)  NOT NULL,  
  PRIMARY KEY (Id_acreedores)
  )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
 
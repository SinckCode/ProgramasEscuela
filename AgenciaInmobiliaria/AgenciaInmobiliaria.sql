-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agenciaInmobiliaria
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `agenciaInmobiliaria` ;

-- -----------------------------------------------------
-- Schema agenciaInmobiliaria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agenciaInmobiliaria` DEFAULT CHARACTER SET utf8 ;
USE `agenciaInmobiliaria` ;

-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`DatosInmueble`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`DatosInmueble` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`DatosInmueble` (
  `idDatosInmueble` VARCHAR(2) NOT NULL,
  `idPropietario` VARCHAR(2) NOT NULL,
  `superficieM2` VARCHAR(45) NULL,
  `Direccion` VARCHAR(45) NULL,
  `Tipo` VARCHAR(45) NULL,
  `VentaRenta` TINYINT NULL,
  `Precio` VARCHAR(45) NULL,
  `Oficina` VARCHAR(45) NULL,
  PRIMARY KEY (`idDatosInmueble`, `idPropietario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Propietario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Propietario` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Propietario` (
  `idPropietario` VARCHAR(2) NOT NULL,
  `idOficina` VARCHAR(2) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Curp` VARCHAR(45) NULL,
  `Escritura` VARCHAR(45) NULL,
  `DatosInmueble` VARCHAR(45) NULL,
  `Tel` VARCHAR(45) NULL,
  PRIMARY KEY (`idPropietario`, `idOficina`),
  CONSTRAINT `fk_Propietario_DatosInmueble1`
    FOREIGN KEY (`idPropietario`)
    REFERENCES `agenciaInmobiliaria`.`DatosInmueble` (`idPropietario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Vendedor` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Vendedor` (
  `idVendedor` VARCHAR(2) NOT NULL,
  `idOficina` VARCHAR(2) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idVendedor`, `idOficina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`DatosCliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`DatosCliente` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`DatosCliente` (
  `idCliente` VARCHAR(2) NOT NULL,
  `idOficina` VARCHAR(2) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Tel` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`, `idOficina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Oficina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Oficina` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Oficina` (
  `idOficina` VARCHAR(2) NOT NULL,
  `idAgenciaInmobiliaria` VARCHAR(2) NOT NULL,
  `Direccion` VARCHAR(45) NULL,
  `CP` VARCHAR(45) NULL,
  `Ficha` VARCHAR(45) NULL,
  PRIMARY KEY (`idOficina`, `idAgenciaInmobiliaria`),
  CONSTRAINT `fk_Oficina_Propietario1`
    FOREIGN KEY (`idOficina`)
    REFERENCES `agenciaInmobiliaria`.`Propietario` (`idOficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Oficina_Vendedor1`
    FOREIGN KEY (`idOficina`)
    REFERENCES `agenciaInmobiliaria`.`Vendedor` (`idOficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Oficina_DatosCliente1`
    FOREIGN KEY (`idOficina`)
    REFERENCES `agenciaInmobiliaria`.`DatosCliente` (`idOficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`AgenciaInmobiliaria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`AgenciaInmobiliaria` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`AgenciaInmobiliaria` (
  `idAgenciaInmobiliaria` VARCHAR(2) NOT NULL,
  `idoficina` VARCHAR(2) NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`idAgenciaInmobiliaria`, `idoficina`),
  CONSTRAINT `fk_AgenciaInmobiliaria_Oficina`
    FOREIGN KEY (`idAgenciaInmobiliaria` , `idoficina`)
    REFERENCES `agenciaInmobiliaria`.`Oficina` (`idAgenciaInmobiliaria` , `idOficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Ficha`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Ficha` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Ficha` (
  `idFicha` VARCHAR(2) NOT NULL,
  `idOficina` VARCHAR(2) NOT NULL,
  `Ref` VARCHAR(45) NULL,
  `visitas` VARCHAR(45) NULL,
  `propietario` VARCHAR(45) NULL,
  `preioVenta` VARCHAR(45) NULL,
  `precioAlquiler` VARCHAR(45) NULL,
  `datosInmueble` VARCHAR(45) NULL,
  PRIMARY KEY (`idFicha`, `idOficina`),
  INDEX `fk_Ficha_Oficina1_idx` (`idOficina` ASC) VISIBLE,
  INDEX `fk_Ficha_DatosInmueble1_idx` (`datosInmueble` ASC) VISIBLE,
  CONSTRAINT `fk_Ficha_Oficina1`
    FOREIGN KEY (`idOficina`)
    REFERENCES `agenciaInmobiliaria`.`Oficina` (`idOficina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_DatosInmueble1`
    FOREIGN KEY (`datosInmueble`)
    REFERENCES `agenciaInmobiliaria`.`DatosInmueble` (`idDatosInmueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Visitas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Visitas` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Visitas` (
  `idVisitas` VARCHAR(2) NOT NULL,
  `Fecha` DATETIME NULL,
  `Hora` TIME NULL,
  `DatosCliente` VARCHAR(45) NULL,
  `Comentarios` VARCHAR(45) NULL,
  PRIMARY KEY (`idVisitas`),
  CONSTRAINT `fk_Visitas_Ficha1`
    FOREIGN KEY (`idVisitas`)
    REFERENCES `agenciaInmobiliaria`.`Ficha` (`visitas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Estancias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Estancias` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Estancias` (
  `idEstancias` VARCHAR(2) NOT NULL,
  `Sanitarios` VARCHAR(45) NULL,
  `Habitaciones` VARCHAR(45) NULL,
  `Cocinas` VARCHAR(45) NULL,
  `Accesos` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstancias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`CaraEspe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`CaraEspe` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`CaraEspe` (
  `idCaraEspe` VARCHAR(2) NOT NULL,
  `gas` TINYINT NULL,
  `puertaBlindada` TINYINT NULL,
  `Estacionamiento` TINYINT NULL,
  PRIMARY KEY (`idCaraEspe`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Villa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Villa` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Villa` (
  `idVilla` VARCHAR(2) NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Estancias` VARCHAR(45) NULL,
  `CaraEspe` VARCHAR(45) NULL,
  PRIMARY KEY (`idVilla`),
  INDEX `fk_Villa_DatosInmueble1_idx` (`Tipo` ASC) VISIBLE,
  INDEX `fk_Villa_Estancias1_idx` (`Estancias` ASC) VISIBLE,
  INDEX `fk_Villa_CaraEspe1_idx` (`CaraEspe` ASC) VISIBLE,
  CONSTRAINT `fk_Villa_DatosInmueble1`
    FOREIGN KEY (`Tipo`)
    REFERENCES `agenciaInmobiliaria`.`DatosInmueble` (`Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Villa_Estancias1`
    FOREIGN KEY (`Estancias`)
    REFERENCES `agenciaInmobiliaria`.`Estancias` (`idEstancias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Villa_CaraEspe1`
    FOREIGN KEY (`CaraEspe`)
    REFERENCES `agenciaInmobiliaria`.`CaraEspe` (`idCaraEspe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Local`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Local` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Local` (
  `idLocal` VARCHAR(2) NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Localcol` VARCHAR(45) NULL,
  `PuertasEntrada` VARCHAR(45) NULL,
  `Diafano` TINYINT NULL,
  `Acondicionado` TINYINT NULL,
  `ZonaCiudad` VARCHAR(45) NULL,
  PRIMARY KEY (`idLocal`),
  INDEX `fk_Local_DatosInmueble1_idx` (`Tipo` ASC) VISIBLE,
  CONSTRAINT `fk_Local_DatosInmueble1`
    FOREIGN KEY (`Tipo`)
    REFERENCES `agenciaInmobiliaria`.`DatosInmueble` (`Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Casa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Casa` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Casa` (
  `idCasa` VARCHAR(2) NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Estancias` VARCHAR(45) NULL,
  `CaraEspe` VARCHAR(45) NULL,
  `ZonaCiudad` VARCHAR(45) NULL,
  PRIMARY KEY (`idCasa`),
  INDEX `fk_Casa_DatosInmueble1_idx` (`Tipo` ASC) VISIBLE,
  INDEX `fk_Casa_Estancias1_idx` (`Estancias` ASC) VISIBLE,
  INDEX `fk_Casa_CaraEspe1_idx` (`CaraEspe` ASC) VISIBLE,
  CONSTRAINT `fk_Casa_DatosInmueble1`
    FOREIGN KEY (`Tipo`)
    REFERENCES `agenciaInmobiliaria`.`DatosInmueble` (`Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Casa_Estancias1`
    FOREIGN KEY (`Estancias`)
    REFERENCES `agenciaInmobiliaria`.`Estancias` (`idEstancias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Casa_CaraEspe1`
    FOREIGN KEY (`CaraEspe`)
    REFERENCES `agenciaInmobiliaria`.`CaraEspe` (`idCaraEspe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenciaInmobiliaria`.`Piso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `agenciaInmobiliaria`.`Piso` ;

CREATE TABLE IF NOT EXISTS `agenciaInmobiliaria`.`Piso` (
  `idPiso` VARCHAR(2) NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  `Estancias` VARCHAR(45) NULL,
  `CaraEspe` VARCHAR(45) NULL,
  `ZonaCiudad` VARCHAR(45) NULL,
  PRIMARY KEY (`idPiso`),
  INDEX `fk_Piso_DatosInmueble1_idx` (`Tipo` ASC) VISIBLE,
  INDEX `fk_Piso_Estancias1_idx` (`Estancias` ASC) VISIBLE,
  INDEX `fk_Piso_CaraEspe1_idx` (`CaraEspe` ASC) VISIBLE,
  CONSTRAINT `fk_Piso_DatosInmueble1`
    FOREIGN KEY (`Tipo`)
    REFERENCES `agenciaInmobiliaria`.`DatosInmueble` (`Tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Piso_Estancias1`
    FOREIGN KEY (`Estancias`)
    REFERENCES `agenciaInmobiliaria`.`Estancias` (`idEstancias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Piso_CaraEspe1`
    FOREIGN KEY (`CaraEspe`)
    REFERENCES `agenciaInmobiliaria`.`CaraEspe` (`idCaraEspe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

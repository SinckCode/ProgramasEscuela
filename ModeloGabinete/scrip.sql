-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema AbogadosPRBM
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AbogadosPRBM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AbogadosPRBM` DEFAULT CHARACTER SET utf8 ;
USE `AbogadosPRBM` ;

-- -----------------------------------------------------
-- Table `AbogadosPRBM`.`Gabinete`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AbogadosPRBM`.`Gabinete` ;

CREATE TABLE IF NOT EXISTS `AbogadosPRBM`.`Gabinete` (
  `gabinete` VARCHAR(2) NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `Domicilio` VARCHAR(40) NULL,
  `CP` VARCHAR(6) NULL,
  `Colonia` VARCHAR(40) NULL,
  `Poblacion` VARCHAR(40) NULL,
  `Estado` VARCHAR(40) NULL,
  `Telefono` VARCHAR(14) NULL,
  `Email` VARCHAR(40) NULL,
  PRIMARY KEY (`gabinete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AbogadosPRBM`.`Procurador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AbogadosPRBM`.`Procurador` ;

CREATE TABLE IF NOT EXISTS `AbogadosPRBM`.`Procurador` (
  `gabinete` VARCHAR(2) NOT NULL,
  `idProcurador` VARCHAR(8) NOT NULL,
  `Nombre` VARCHAR(50) NULL,
  `Domicilio` VARCHAR(40) NULL,
  `CP` VARCHAR(45) NULL,
  `Colonia` VARCHAR(40) NULL,
  `Poblacion` VARCHAR(40) NULL,
  `Estado` VARCHAR(40) NULL,
  `Telefono` VARCHAR(14) NULL,
  `CURP` VARCHAR(13) NULL,
  `Email` VARCHAR(40) NULL,
  PRIMARY KEY (`gabinete`, `idProcurador`),
  CONSTRAINT `fk_Procurador_Gabinete`
    FOREIGN KEY (`gabinete`)
    REFERENCES `AbogadosPRBM`.`Gabinete` (`gabinete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AbogadosPRBM`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AbogadosPRBM`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `AbogadosPRBM`.`Cliente` (
  `gabinete` VARCHAR(2) NOT NULL,
  `idCliente` VARCHAR(8) NOT NULL,
  `RFC` VARCHAR(14) NULL,
  `CURP` VARCHAR(18) NULL,
  `Nombre` VARCHAR(50) NULL,
  `Domicilio` VARCHAR(40) NULL,
  `CP` VARCHAR(6) NULL,
  `Poblacion` VARCHAR(40) NULL,
  `Estado` VARCHAR(40) NULL,
  `Telefono` VARCHAR(14) NULL,
  PRIMARY KEY (`gabinete`, `idCliente`),
  CONSTRAINT `fk_Cliente_Gabinete1`
    FOREIGN KEY (`gabinete`)
    REFERENCES `AbogadosPRBM`.`Gabinete` (`gabinete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AbogadosPRBM`.`Asunto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AbogadosPRBM`.`Asunto` ;

CREATE TABLE IF NOT EXISTS `AbogadosPRBM`.`Asunto` (
  `idNumExpediente` VARCHAR(20) NOT NULL,
  `gabinete` VARCHAR(2) NOT NULL,
  `idCliente` VARCHAR(8) NOT NULL,
  `FechaInicio` DATE NULL,
  `FechaFinal` DATE NULL,
  `Estado` VARCHAR(2) NULL,
  PRIMARY KEY (`idNumExpediente`, `gabinete`),
  INDEX `fk_NumExpediente_Cliente1_idx` (`gabinete` ASC, `idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_NumExpediente_Cliente1`
    FOREIGN KEY (`gabinete` , `idCliente`)
    REFERENCES `AbogadosPRBM`.`Cliente` (`gabinete` , `idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AbogadosPRBM`.`ProcuradorAsunto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AbogadosPRBM`.`ProcuradorAsunto` ;

CREATE TABLE IF NOT EXISTS `AbogadosPRBM`.`ProcuradorAsunto` (
  `gabinete` VARCHAR(2) NOT NULL,
  `idProcurador` VARCHAR(8) NOT NULL,
  `NumExpdiente` VARCHAR(20) NOT NULL,
  `Satisfaccion` VARCHAR(2) NULL,
  PRIMARY KEY (`gabinete`, `idProcurador`, `NumExpdiente`),
  INDEX `fk_ProcuradorAsunto_NumExpediente1_idx` (`gabinete` ASC, `NumExpdiente` ASC) VISIBLE,
  CONSTRAINT `fk_ProcuradorAsunto_Procurador1`
    FOREIGN KEY (`gabinete` , `idProcurador`)
    REFERENCES `AbogadosPRBM`.`Procurador` (`gabinete` , `idProcurador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProcuradorAsunto_NumExpediente1`
    FOREIGN KEY (`gabinete` , `NumExpdiente`)
    REFERENCES `AbogadosPRBM`.`Asunto` (`gabinete` , `idNumExpediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

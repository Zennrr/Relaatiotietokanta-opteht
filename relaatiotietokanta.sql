-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Relaatiotietokanta
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Relaatiotietokanta
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Relaatiotietokanta` DEFAULT CHARACTER SET utf8 ;
USE `Relaatiotietokanta` ;

-- -----------------------------------------------------
-- Table `Relaatiotietokanta`.`käyttäjä`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Relaatiotietokanta`.`käyttäjä` (
  `nimi` VARCHAR(45) NOT NULL,
  `tunnus` INT NULL,
  `salasana` VARCHAR(16) NULL,
  `token` VARCHAR(64) NULL,
  PRIMARY KEY (`nimi`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Relaatiotietokanta`.`dronen kuvat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Relaatiotietokanta`.`dronen kuvat` (
  `id` INT NOT NULL,
  `nimi` VARCHAR(45) NULL,
  `kuvaus` VARCHAR(45) NULL,
  `paikkatieto` INT NULL,
  `ajankohta` INT NULL,
  `drone_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dronen kuvat_drone1_idx` (`drone_id` ASC) VISIBLE,
  CONSTRAINT `fk_dronen kuvat_drone1`
    FOREIGN KEY (`drone_id`)
    REFERENCES `Relaatiotietokanta`.`drone` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Relaatiotietokanta`.`drone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Relaatiotietokanta`.`drone` (
  `id` INT NOT NULL,
  `nimi` VARCHAR(45) NULL,
  `merkki` VARCHAR(45) NULL,
  `malli` VARCHAR(45) NULL,
  `info` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  `käyttäjä_nimi` VARCHAR(45) NOT NULL,
  `dronen kuvat` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_drone_käyttäjä_idx` (`käyttäjä_nimi` ASC) VISIBLE,
  INDEX `fk_drone_dronen kuvat1_idx` (`dronen kuvat` ASC) VISIBLE,
  CONSTRAINT `fk_drone_käyttäjä`
    FOREIGN KEY (`käyttäjä_nimi`)
    REFERENCES `Relaatiotietokanta`.`käyttäjä` (`nimi`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drone_dronen kuvat1`
    FOREIGN KEY (`dronen kuvat`)
    REFERENCES `Relaatiotietokanta`.`dronen kuvat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Relaatiotietokanta`.`lähetysosoite`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Relaatiotietokanta`.`lähetysosoite` (
  `osoite` VARCHAR(45) NOT NULL,
  `dronen kuvat` INT NOT NULL,
  PRIMARY KEY (`osoite`),
  INDEX `fk_lähetysosoite_dronen kuvat1_idx` (`dronen kuvat` ASC) VISIBLE,
  CONSTRAINT `fk_lähetysosoite_dronen kuvat1`
    FOREIGN KEY (`dronen kuvat`)
    REFERENCES `Relaatiotietokanta`.`dronen kuvat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

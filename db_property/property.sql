-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema property
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema property
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `property` DEFAULT CHARACTER SET utf8 ;
USE `property` ;

-- -----------------------------------------------------
-- Table `property`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NULL,
  `email` VARCHAR(200) NULL,
  `password` VARCHAR(50) NULL,
  `tipo` ENUM('purshaser', 'seller') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`permission` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`user_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`user_permission` (
  `user_id` INT NOT NULL,
  `permission_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `permission_id`),
  INDEX `fk_permission_id_idx` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `property`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_permission_id`
    FOREIGN KEY (`permission_id`)
    REFERENCES `property`.`permission` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`user_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`user_rol` (
  `user_id` INT NOT NULL,
  `role_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`),
  INDEX `fk_rol_id_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_rol_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `property`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `property`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`property_types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`property_types` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`property`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`property` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `price` DECIMAL(10,2) NOT NULL,
  `protype_id` INT NOT NULL,
  `sells` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_proptype_id`
    FOREIGN KEY (`id`)
    REFERENCES `property`.`property_types` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `property`.`purshase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `property`.`purshase` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `purshaser_id` VARCHAR(45) NOT NULL,
  `properti_id` VARCHAR(45) NOT NULL,
  `purchase_date` DATE NOT NULL,
  `purchase_price` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_purshase_id`
    FOREIGN KEY (`id`)
    REFERENCES `property`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_properti`
    FOREIGN KEY (`id`)
    REFERENCES `property`.`property` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

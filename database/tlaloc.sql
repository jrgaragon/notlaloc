-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema HbhOn83foM
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `HbhOn83foM` ;

-- -----------------------------------------------------
-- Schema HbhOn83foM
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `HbhOn83foM` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `HbhOn83foM` ;

-- -----------------------------------------------------
-- Table `HbhOn83foM`.`userStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`userStatus` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`userStatus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(50) NOT NULL,
  `description` VARCHAR(250) NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userStatus_user_fk_idx` (`updatedBy` ASC) VISIBLE,
  CONSTRAINT `userStatus_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`user` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `emailId` INT NOT NULL,
  `statusId` INT NOT NULL DEFAULT 1,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_idx` (`updatedBy` ASC) VISIBLE,
  INDEX `user_userStatus_idx` (`statusId` ASC) VISIBLE,
  CONSTRAINT `user`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_userStatus`
    FOREIGN KEY (`statusId`)
    REFERENCES `HbhOn83foM`.`userStatus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`phone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`phone` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`phone` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `typeId` INT NOT NULL,
  `phone` VARCHAR(50) NOT NULL,
  `userId` INT NOT NULL,
  `createdAt` INT NOT NULL,
  `updatedAt` INT NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `phone_user_fk_idx` (`updatedBy` ASC) VISIBLE,
  CONSTRAINT `phone_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`email`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`email` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`email` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `typeId` INT NOT NULL,
  `email` VARCHAR(250) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 0,
  `userId` INT NOT NULL,
  `createdAt` INT NOT NULL,
  `updatedAt` INT NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `email_user_fk0_idx` (`updatedBy` ASC) VISIBLE,
  CONSTRAINT `email_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`role` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(250) NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `role_user_fk_idx` (`updatedBy` ASC) VISIBLE,
  CONSTRAINT `role_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`customerStatus`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`customerStatus` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`customerStatus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(50) NOT NULL,
  `description` VARCHAR(250) NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userStatus_user_fk_idx` (`updatedBy` ASC) VISIBLE,
  CONSTRAINT `customerStatus_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`customer` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NOT NULL,
  `customerCode` VARCHAR(50) NOT NULL,
  `statusId` INT NOT NULL DEFAULT 1,
  `phoneId` INT NOT NULL,
  `emailId` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_user_fk_idx` (`updatedBy` ASC) VISIBLE,
  INDEX `customer_customerStatus_fk_idx` (`statusId` ASC) VISIBLE,
  CONSTRAINT `customer_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `customer_customerStatus_fk`
    FOREIGN KEY (`statusId`)
    REFERENCES `HbhOn83foM`.`customerStatus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`userRoleLink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`userRoleLink` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`userRoleLink` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `roleId` INT NOT NULL,
  `customerId` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userRole_user_fk_idx` (`updatedBy` ASC) VISIBLE,
  INDEX `userRole_user_role_fk_idx` (`userId` ASC) VISIBLE,
  INDEX `userRole_role_fk_idx` (`roleId` ASC) VISIBLE,
  INDEX `user_role_customer_fk_idx` (`customerId` ASC) VISIBLE,
  CONSTRAINT `userRole_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userRole_user_role_fk`
    FOREIGN KEY (`userId`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `userRole_role_fk`
    FOREIGN KEY (`roleId`)
    REFERENCES `HbhOn83foM`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_role_customer_fk`
    FOREIGN KEY (`customerId`)
    REFERENCES `HbhOn83foM`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`action`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`action` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`action` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(250) NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `activty_user_fk_idx` (`updatedBy` ASC) VISIBLE,
  CONSTRAINT `activty_user_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`roleActivityLink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`roleActivityLink` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`roleActivityLink` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleId` INT NOT NULL,
  `activityId` INT NOT NULL,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `role_activity_link_fk_idx` (`updatedBy` ASC) VISIBLE,
  INDEX `role_activity_fk_idx` (`roleId` ASC) VISIBLE,
  INDEX `role_activity_activity_fk_idx` (`activityId` ASC) VISIBLE,
  CONSTRAINT `role_activity_link_fk`
    FOREIGN KEY (`updatedBy`)
    REFERENCES `HbhOn83foM`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `role_activity_fk`
    FOREIGN KEY (`roleId`)
    REFERENCES `HbhOn83foM`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `role_activity_activity_fk`
    FOREIGN KEY (`activityId`)
    REFERENCES `HbhOn83foM`.`action` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HbhOn83foM`.`base`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HbhOn83foM`.`base` ;

CREATE TABLE IF NOT EXISTS `HbhOn83foM`.`base` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `createdAt` DATETIME NOT NULL,
  `updatedAt` DATETIME NOT NULL,
  `updatedBy` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

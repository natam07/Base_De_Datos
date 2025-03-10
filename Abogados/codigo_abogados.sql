CREATE SCHEMA IF NOT EXISTS `abogados`;
USE `abogados` ;
-- -----------------------------------------------------
-- Table `Case_state`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Case_state` (
  `idCase_state` INT NOT NULL,
  `State` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCase_state`));
-- -----------------------------------------------------
-- Table `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cliente` (
  `idCliente` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `phone` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC));
-- -----------------------------------------------------
-- Table `Lawyer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawyer` (
  `idLawyer` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `Professional_card` INT NOT NULL,
  `phone` INT NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLawyer`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `Lawercol_UNIQUE` (`Professional_card` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `adress_UNIQUE` (`adress` ASC));
-- -----------------------------------------------------
-- Table `Case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Case` (
  `idCase` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `start_date` VARCHAR(45) NOT NULL,
  `finish_date` VARCHAR(45) NOT NULL,
  `Case_state_idCase_state` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idCase`),
  UNIQUE INDEX `idCase_UNIQUE` (`idCase` ASC),
  UNIQUE INDEX `start_date_UNIQUE` (`start_date` ASC),
  UNIQUE INDEX `finish_date_UNIQUE` (`finish_date` ASC),
  INDEX `fk_Case_Case_state1_idx` (`Case_state_idCase_state` ASC),
  INDEX `fk_Case_Cliente1_idx` (`Cliente_idCliente` ASC),
  CONSTRAINT `fk_Case_Case_state1`
    FOREIGN KEY (`Case_state_idCase_state`)
    REFERENCES `Case_state` (`idCase_state`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Case_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `Lawyer_has_Case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lawyer_has_Case` (
  `Lawyer_idLawyer` INT NOT NULL,
  `Case_idCase` INT NOT NULL,
  PRIMARY KEY (`Lawyer_idLawyer`, `Case_idCase`),
  INDEX `fk_Lawyer_has_Case_Case1_idx` (`Case_idCase` ASC),
  INDEX `fk_Lawyer_has_Case_Lawyer1_idx` (`Lawyer_idLawyer` ASC),
  CONSTRAINT `fk_Lawyer_has_Case_Lawyer1`
    FOREIGN KEY (`Lawyer_idLawyer`)
    REFERENCES `Lawyer` (`idLawyer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lawyer_has_Case_Case1`
    FOREIGN KEY (`Case_idCase`)
    REFERENCES `Case` (`idCase`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
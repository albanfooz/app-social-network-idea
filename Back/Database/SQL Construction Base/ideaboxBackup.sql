-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ideabox
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ideabox
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ideabox` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ideabox` ;

-- -----------------------------------------------------
-- Table `ideabox`.`categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`categorie` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NOT NULL,
  `description` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NULL DEFAULT NULL,
  `categoriecol` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`membre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`membre` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`idee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`idee` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `membre_id` INT(11) NOT NULL,
  `titre` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NOT NULL,
  `description` TEXT CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_at` DATETIME NULL DEFAULT NULL,
  `type_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_idee_type1_idx` (`type_id` ASC) VISIBLE,
  INDEX `fk_idee_membre1_idx` (`membre_id` ASC) VISIBLE,
  CONSTRAINT `fk_idee_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `ideabox`.`categorie` (`id`),
  CONSTRAINT `fk_idee_membre1`
    FOREIGN KEY (`membre_id`)
    REFERENCES `ideabox`.`membre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`commentaire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`commentaire` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `commentaire_id` INT(11) NULL DEFAULT NULL COMMENT 'commentaire parent',
  `contenu` VARCHAR(500) NOT NULL,
  `membre_id` INT(11) NOT NULL,
  `idee_id` INT(11) NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_commentaire_commentaire_idx` (`commentaire_id` ASC) VISIBLE,
  INDEX `fk_commentaire_membre1_idx` (`membre_id` ASC) VISIBLE,
  INDEX `fk_commentaire_idee1_idx` (`idee_id` ASC) VISIBLE,
  CONSTRAINT `fk_commentaire_commentaire`
    FOREIGN KEY (`commentaire_id`)
    REFERENCES `ideabox`.`commentaire` (`id`),
  CONSTRAINT `fk_commentaire_idee1`
    FOREIGN KEY (`idee_id`)
    REFERENCES `ideabox`.`idee` (`id`),
  CONSTRAINT `fk_commentaire_membre1`
    FOREIGN KEY (`membre_id`)
    REFERENCES `ideabox`.`membre` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`fichier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`fichier` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(800) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NOT NULL,
  `titre` VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NULL DEFAULT NULL,
  `commentaire` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NULL DEFAULT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `commentaire_id` INT(11) NULL DEFAULT NULL,
  `idee_id` INT(11) NULL DEFAULT NULL,
  `membre_id` INT(11) NOT NULL,
  `type` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NULL DEFAULT 'image',
  `deleted_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nom_UNIQUE` (`nom` ASC) VISIBLE,
  INDEX `fk_fichier_commentaire1_idx` (`commentaire_id` ASC) VISIBLE,
  INDEX `fk_fichier_idee1_idx` (`idee_id` ASC) VISIBLE,
  INDEX `fk_fichier_membre1_idx` (`membre_id` ASC) VISIBLE,
  CONSTRAINT `fk_fichier_commentaire1`
    FOREIGN KEY (`commentaire_id`)
    REFERENCES `ideabox`.`commentaire` (`id`),
  CONSTRAINT `fk_fichier_idee1`
    FOREIGN KEY (`idee_id`)
    REFERENCES `ideabox`.`idee` (`id`),
  CONSTRAINT `fk_fichier_membre1`
    FOREIGN KEY (`membre_id`)
    REFERENCES `ideabox`.`membre` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`tag` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`marquer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`marquer` (
  `tag_id` INT(11) NOT NULL,
  `idee_id` INT(11) NOT NULL,
  PRIMARY KEY (`tag_id`, `idee_id`),
  INDEX `fk_tag_has_idee_idee1_idx` (`idee_id` ASC) VISIBLE,
  INDEX `fk_tag_has_idee_tag1_idx` (`tag_id` ASC) VISIBLE,
  CONSTRAINT `fk_tag_has_idee_idee1`
    FOREIGN KEY (`idee_id`)
    REFERENCES `ideabox`.`idee` (`id`),
  CONSTRAINT `fk_tag_has_idee_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `ideabox`.`tag` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`profil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`profil` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fichier_id` INT(11) NULL COMMENT 'photo de profil',
  `membre_id` INT(11) NOT NULL,
  `login` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NOT NULL,
  `password` VARCHAR(200) CHARACTER SET 'utf8' COLLATE 'utf8_icelandic_ci' NOT NULL,
  `e-mail` VARCHAR(100) NULL,
  `score` INT(11) NOT NULL DEFAULT '0',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE,
  INDEX `fk_profil_fichier1_idx` (`fichier_id` ASC) VISIBLE,
  INDEX `fk_profil_membre1_idx` (`membre_id` ASC) VISIBLE,
  CONSTRAINT `fk_profil_fichier1`
    FOREIGN KEY (`fichier_id`)
    REFERENCES `ideabox`.`fichier` (`id`),
  CONSTRAINT `fk_profil_membre1`
    FOREIGN KEY (`membre_id`)
    REFERENCES `ideabox`.`membre` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`vote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`vote` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `positif` TINYINT(4) NULL DEFAULT '1',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `membre_id` INT(11) NOT NULL,
  `commentaire_id` INT(11) NULL DEFAULT NULL,
  `idee_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vote_membre1_idx` (`membre_id` ASC) VISIBLE,
  INDEX `fk_vote_commentaire1_idx` (`commentaire_id` ASC) VISIBLE,
  INDEX `fk_vote_idee1_idx` (`idee_id` ASC) VISIBLE,
  CONSTRAINT `fk_vote_commentaire1`
    FOREIGN KEY (`commentaire_id`)
    REFERENCES `ideabox`.`commentaire` (`id`),
  CONSTRAINT `fk_vote_idee1`
    FOREIGN KEY (`idee_id`)
    REFERENCES `ideabox`.`idee` (`id`),
  CONSTRAINT `fk_vote_membre1`
    FOREIGN KEY (`membre_id`)
    REFERENCES `ideabox`.`membre` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


-- -----------------------------------------------------
-- Table `ideabox`.`Collaborateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ideabox`.`Collaborateur` (
  `idee_id` INT(11) NOT NULL,
  `membre_id` INT(11) NOT NULL,
  PRIMARY KEY (`idee_id`, `membre_id`),
  INDEX `fk_idee_has_membre_membre1_idx` (`membre_id` ASC) VISIBLE,
  INDEX `fk_idee_has_membre_idee1_idx` (`idee_id` ASC) VISIBLE,
  CONSTRAINT `fk_idee_has_membre_idee1`
    FOREIGN KEY (`idee_id`)
    REFERENCES `ideabox`.`idee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idee_has_membre_membre1`
    FOREIGN KEY (`membre_id`)
    REFERENCES `ideabox`.`membre` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_icelandic_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

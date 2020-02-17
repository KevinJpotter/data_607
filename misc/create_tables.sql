-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema survey
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema survey
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `survey` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `survey` ;

-- -----------------------------------------------------
-- Table `survey`.`friends`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `survey`.`friends` (
  `friend_id` INT(11) NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`friend_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `survey`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `survey`.`movies` (
  `movie_id` INT(11) NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `survey`.`ratings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `survey`.`ratings` (
  `rating` INT(11) NOT NULL AUTO_INCREMENT,
  `friend_id` INT(11) NULL DEFAULT NULL,
  `movie_id` INT(11) NULL DEFAULT NULL,
  `score` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`rating`),
  UNIQUE INDEX `rating_UNIQUE` (`rating` ASC) VISIBLE,
  INDEX `friend_id` (`friend_id` ASC) VISIBLE,
  INDEX `movie_id` (`movie_id` ASC) VISIBLE,
  CONSTRAINT `friend_id_fk`
    FOREIGN KEY (`friend_id`)
    REFERENCES `survey`.`friends` (`friend_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `movie_id_fk`
    FOREIGN KEY (`movie_id`)
    REFERENCES `survey`.`movies` (`movie_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

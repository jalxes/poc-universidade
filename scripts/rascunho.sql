CREATE SCHEMA IF NOT EXISTS `db` DEFAULT CHARACTER SET latin1 ;
USE `db` ;

-- -----------------------------------------------------
-- Table `db`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`curso` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`aluno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `curso_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `curso_id`),
  INDEX `fk_aluno_curso1_idx` (`curso_id` ASC),
  CONSTRAINT `fk_aluno_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `db`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`professor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`disciplina` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `professor_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `professor_id`),
  INDEX `fk_disciplina_professor1_idx` (`professor_id` ASC),
  CONSTRAINT `fk_disciplina_professor1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `db`.`professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`faltas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`faltas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `aluno_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `aluno_id`),
  INDEX `fk_faltas_aluno1_idx` (`aluno_id` ASC),
  CONSTRAINT `fk_faltas_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `db`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`matricula` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`notas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `aluno_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `aluno_id`),
  INDEX `fk_notas_aluno1_idx` (`aluno_id` ASC),
  CONSTRAINT `fk_notas_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `db`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`disciplina_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`disciplina_has_curso` (
  `disciplina_id` INT(11) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  PRIMARY KEY (`disciplina_id`, `curso_id`),
  INDEX `fk_disciplina_has_curso_curso1_idx` (`curso_id` ASC),
  INDEX `fk_disciplina_has_curso_disciplina_idx` (`disciplina_id` ASC),
  CONSTRAINT `fk_disciplina_has_curso_disciplina`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `db`.`disciplina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_curso_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `db`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `db`.`aluno_has_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`aluno_has_disciplina` (
  `aluno_id` INT(11) NOT NULL,
  `disciplina_id` INT(11) NOT NULL,
  PRIMARY KEY (`aluno_id`, `disciplina_id`),
  INDEX `fk_aluno_has_disciplina_disciplina1_idx` (`disciplina_id` ASC),
  INDEX `fk_aluno_has_disciplina_aluno1_idx` (`aluno_id` ASC),
  CONSTRAINT `fk_aluno_has_disciplina_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `db`.`aluno` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `db`.`disciplina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

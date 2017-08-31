drop database `db`;
-- -----------------------------------------------------
-- Schema db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db` DEFAULT CHARACTER SET latin1 ;
USE `db` ;

-- -----------------------------------------------------
-- Table `db`.`instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`instituicao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
);


-- -----------------------------------------------------
-- Table `db`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`aluno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `instituicao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `instituicao_id`),
  CONSTRAINT `fk_aluno_instituicao1`
    FOREIGN KEY (`instituicao_id`)
    REFERENCES `db`.`instituicao` (`id`)
);


-- -----------------------------------------------------
-- Table `db`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`disciplina` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `db`.`aluno_has_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`aluno_has_disciplina` (
  `aluno_id` INT(11) NOT NULL,
  `disciplina_id` INT(11) NOT NULL,
  PRIMARY KEY (`aluno_id`, `disciplina_id`),
  CONSTRAINT `fk_aluno_has_disciplina_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `db`.`aluno` (`id`),
  CONSTRAINT `fk_aluno_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `db`.`disciplina` (`id`)
);


-- -----------------------------------------------------
-- Table `db`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`curso` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `instituicao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `instituicao_id`),
  CONSTRAINT `fk_curso_instituicao1`
    FOREIGN KEY (`instituicao_id`)
    REFERENCES `db`.`instituicao` (`id`)
);


-- -----------------------------------------------------
-- Table `db`.`disciplina_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`disciplina_has_curso` (
  `disciplina_id` INT(11) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  PRIMARY KEY (`disciplina_id`, `curso_id`),
  CONSTRAINT `fk_disciplina_has_curso_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `db`.`curso` (`id`),
  CONSTRAINT `fk_disciplina_has_curso_disciplina`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `db`.`disciplina` (`id`)
);


-- -----------------------------------------------------
-- Table `db`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`professor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `curso_id` INT(11) NOT NULL,
  `instituicao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `curso_id`, `instituicao_id`),
  CONSTRAINT `fk_professor_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `db`.`curso` (`id`),
  CONSTRAINT `fk_professor_instituicao1`
    FOREIGN KEY (`instituicao_id`)
    REFERENCES `db`.`instituicao` (`id`)
);


-- -----------------------------------------------------
-- Table `db`.`faltas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`faltas` (
  `aluno_id` INT(11) NOT NULL,
  `disciplina_id` INT(11) NOT NULL,
  `faltascol` DATETIME NOT NULL,
  PRIMARY KEY (`aluno_id`, `disciplina_id`, `faltascol`),
  CONSTRAINT `fk_aluno_has_disciplina1_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `db`.`aluno` (`id`),
  CONSTRAINT `fk_aluno_has_disciplina1_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `db`.`disciplina` (`id`)
);


-- -----------------------------------------------------
-- Table `db`.`nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`nota` (
  `aluno_id` INT(11) NOT NULL,
  `disciplina_id` INT(11) NOT NULL,
  `nota` FLOAT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`aluno_id`, `disciplina_id`, `data`, `nota`),
  CONSTRAINT `fk_aluno_has_disciplina2_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `db`.`aluno` (`id`),
  CONSTRAINT `fk_aluno_has_disciplina2_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `db`.`disciplina` (`id`)
);

-- -----------------------------------------------------
-- Table `db`.`aluno_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db`.`aluno_has_curso` (
  `aluno_id` INT(11) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  PRIMARY KEY (`aluno_id`, `curso_id`),
  CONSTRAINT `fk_aluno_has_curso_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `db`.`aluno` (`id`),
  CONSTRAINT `fk_aluno_has_curso_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `db`.`curso` (`id`)
);

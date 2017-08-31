DROP SCHEMA IF EXISTS `db` ;

-- -----------------------------------------------------
-- Schema db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db` DEFAULT CHARACTER SET latin1 ;
USE `db` ;

-- -----------------------------------------------------
-- Table `instituicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instituicao` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`)
);

-- -----------------------------------------------------
-- Table `aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluno` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `instituicao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `instituicao_id`),
  CONSTRAINT `fk_aluno_instituicao1`
    FOREIGN KEY (`instituicao_id`)
    REFERENCES `instituicao` (`id`)
);
CREATE INDEX `fk_aluno_instituicao1_idx` ON `aluno` (`instituicao_id` ASC);


-- -----------------------------------------------------
-- Table `professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `professor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `instituicao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `instituicao_id`),
  CONSTRAINT `fk_professor_instituicao1`
    FOREIGN KEY (`instituicao_id`)
    REFERENCES `instituicao` (`id`)
);
CREATE INDEX `fk_professor_instituicao1_idx` ON `professor` (`instituicao_id` ASC);


-- -----------------------------------------------------
-- Table `disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `disciplina` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `professor_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `professor_id`),
  CONSTRAINT `fk_disciplina_professor1`
    FOREIGN KEY (`professor_id`)
    REFERENCES `professor` (`id`)
);
CREATE INDEX `fk_disciplina_professor1_idx` ON `disciplina` (`professor_id` ASC);


-- -----------------------------------------------------
-- Table `aluno_has_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluno_has_disciplina` (
  `aluno_id` INT(11) NOT NULL,
  `disciplina_id` INT(11) NOT NULL,
  PRIMARY KEY (`aluno_id`, `disciplina_id`),
  CONSTRAINT `fk_aluno_has_disciplina_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `aluno` (`id`),
  CONSTRAINT `fk_aluno_has_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `disciplina` (`id`)
);
CREATE INDEX `fk_aluno_has_disciplina_disciplina1_idx` ON `aluno_has_disciplina` (`disciplina_id` ASC);
CREATE INDEX `fk_aluno_has_disciplina_aluno1_idx` ON `aluno_has_disciplina` (`aluno_id` ASC);


-- -----------------------------------------------------
-- Table `curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `curso` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `instituicao_id` INT NOT NULL,
  PRIMARY KEY (`id`, `instituicao_id`),
  CONSTRAINT `fk_curso_instituicao1`
    FOREIGN KEY (`instituicao_id`)
    REFERENCES `instituicao` (`id`)
);
CREATE INDEX `fk_curso_instituicao1_idx` ON `curso` (`instituicao_id` ASC);


-- -----------------------------------------------------
-- Table `disciplina_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `disciplina_has_curso` (
  `disciplina_id` INT(11) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  PRIMARY KEY (`disciplina_id`, `curso_id`),
  CONSTRAINT `fk_disciplina_has_curso_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `curso` (`id`),
  CONSTRAINT `fk_disciplina_has_curso_disciplina`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `disciplina` (`id`)
);
CREATE INDEX `fk_disciplina_has_curso_curso1_idx` ON `disciplina_has_curso` (`curso_id` ASC);
CREATE INDEX `fk_disciplina_has_curso_disciplina_idx` ON `disciplina_has_curso` (`disciplina_id` ASC);


-- -----------------------------------------------------
-- Table `falta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `falta` (
  `aluno_id` INT(11) NOT NULL,
  `disciplina_id` INT(11) NOT NULL,
  `falta` DATETIME NOT NULL,
  PRIMARY KEY (`aluno_id`, `disciplina_id`, `falta`),
  CONSTRAINT `fk_aluno_has_disciplina1_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `aluno` (`id`),
  CONSTRAINT `fk_aluno_has_disciplina1_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `disciplina` (`id`)
);
CREATE INDEX `fk_aluno_has_disciplina1_disciplina1_idx` ON `falta` (`disciplina_id` ASC);
CREATE INDEX `fk_aluno_has_disciplina1_aluno1_idx` ON `falta` (`aluno_id` ASC);


-- -----------------------------------------------------
-- Table `nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nota` (
  `aluno_id` INT(11) NOT NULL,
  `disciplina_id` INT(11) NOT NULL,
  `nota` FLOAT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`aluno_id`, `disciplina_id`, `data`, `nota`),
  CONSTRAINT `fk_aluno_has_disciplina2_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `aluno` (`id`),
  CONSTRAINT `fk_aluno_has_disciplina2_disciplina1`
    FOREIGN KEY (`disciplina_id`)
    REFERENCES `disciplina` (`id`)
);
CREATE INDEX `fk_aluno_has_disciplina2_disciplina1_idx` ON `nota` (`disciplina_id` ASC);
CREATE INDEX `fk_aluno_has_disciplina2_aluno1_idx` ON `nota` (`aluno_id` ASC);


-- -----------------------------------------------------
-- Table `aluno_has_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aluno_has_curso` (
  `aluno_id` INT(11) NOT NULL,
  `curso_id` INT(11) NOT NULL,
  PRIMARY KEY (`aluno_id`, `curso_id`),
  CONSTRAINT `fk_aluno_has_curso_aluno1`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `aluno` (`id`),
  CONSTRAINT `fk_aluno_has_curso_curso1`
    FOREIGN KEY (`curso_id`)
    REFERENCES `curso` (`id`)
);
CREATE INDEX `fk_aluno_has_curso_curso1_idx` ON `aluno_has_curso` (`curso_id` ASC);
CREATE INDEX `fk_aluno_has_curso_aluno1_idx` ON `aluno_has_curso` (`aluno_id` ASC);

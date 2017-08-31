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


INSERT INTO `instituicao` (`id`, `nome`) VALUES (0, "FACULSHOW");

INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno01", 0);
INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno02", 0);
INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno03", 0);
INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno04", 0);
INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno05", 0);
INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno06", 0);
INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno07", 0);
INSERT INTO `aluno` (`name`, `instituicao_id`) VALUES ("aluno08", 0);

INSERT INTO `curso` (`name`, `instituicao_id`)  VALUES ("curso01", 0);
INSERT INTO `curso` (`name`, `instituicao_id`)  VALUES ("curso02", 0);

INSERT INTO `professor` (  `name`,  `instituicao_id`) VALUES (  "professor01",  0);
INSERT INTO `professor` (  `name`,  `instituicao_id`) VALUES (  "professor02",  0);
INSERT INTO `professor` (  `name`,  `instituicao_id`) VALUES (  "professor03",  0);
INSERT INTO `professor` (  `name`,  `instituicao_id`) VALUES (  "professor04",  0);

INSERT INTO `disciplina` (`name`, `professor_id`) VALUES ("disciplina01", 1);
INSERT INTO `disciplina` (`name`, `professor_id`) VALUES ("disciplina02", 2);
INSERT INTO `disciplina` (`name`, `professor_id`) VALUES ("disciplina03", 3);
INSERT INTO `disciplina` (`name`, `professor_id`) VALUES ("disciplina04", 4);

INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (1, 1);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (1, 2);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (2, 1);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (2, 2);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (3, 1);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (3, 2);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (4, 1);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (4, 2);

INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (5, 3);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (5, 4);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (6, 3);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (6, 4);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (7, 3);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (7, 4);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (8, 3);
INSERT INTO `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) VALUES (8, 4);

INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  1,  1);
INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  2,  1);
INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  3,  1);
INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  4,  1);

INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  5,  2);
INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  6,  2);
INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  7,  2);
INSERT INTO `aluno_has_curso` (  `aluno_id`,  `curso_id`) VALUES  (  8,  2);

INSERT INTO `disciplina_has_curso` (`disciplina_id`, `curso_id`) VALUES (1, 1);
INSERT INTO `disciplina_has_curso` (`disciplina_id`, `curso_id`) VALUES (2, 1);
INSERT INTO `disciplina_has_curso` (`disciplina_id`, `curso_id`) VALUES (3, 2);
INSERT INTO `disciplina_has_curso` (`disciplina_id`, `curso_id`) VALUES (4, 2);

INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  1,  1,  ADDDATE(NOW(), INTERVAL 1 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  1,  2,  ADDDATE(NOW(), INTERVAL 1 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  1,  2,  ADDDATE(NOW(), INTERVAL 2 DAY));

INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  2,  1,  ADDDATE(NOW(), INTERVAL 0 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  2,  1,  ADDDATE(NOW(), INTERVAL 2 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  2,  2,  ADDDATE(NOW(), INTERVAL 0 DAY));

INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  4,  1,  ADDDATE(NOW(), INTERVAL 0 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  4,  1,  ADDDATE(NOW(), INTERVAL 2 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  4,  2,  ADDDATE(NOW(), INTERVAL 2 DAY));

INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  6,  3,  ADDDATE(NOW(), INTERVAL 2 DAY));

INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  7,  4,  ADDDATE(NOW(), INTERVAL 0 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  7,  4,  ADDDATE(NOW(), INTERVAL 1 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  7,  4,  ADDDATE(NOW(), INTERVAL 2 DAY));

INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  8,  3,  ADDDATE(NOW(), INTERVAL 1 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  8,  3,  ADDDATE(NOW(), INTERVAL 2 DAY));
INSERT INTO `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) VALUES (  8,  4,  ADDDATE(NOW(), INTERVAL 1 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  1,  1,  03, ADDDATE(NOW(), INTERVAL 2 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  1,  2,  07, ADDDATE(NOW(), INTERVAL 0 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  2,  1,  09, ADDDATE(NOW(), INTERVAL 1 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  2,  2,  04, ADDDATE(NOW(), INTERVAL 1 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  3,  1,  10, ADDDATE(NOW(), INTERVAL 1 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  4,  1,  8, ADDDATE(NOW(), INTERVAL 1 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  4,  2,  8, ADDDATE(NOW(), INTERVAL 1 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  5,  3,  0, ADDDATE(NOW(), INTERVAL 0 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  5,  4,  1, ADDDATE(NOW(), INTERVAL 1 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  6,  3,  3, ADDDATE(NOW(), INTERVAL 0 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  6,  4,  2, ADDDATE(NOW(), INTERVAL 0 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  7,  3,  8, ADDDATE(NOW(), INTERVAL 2 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  7,  4,  7, ADDDATE(NOW(), INTERVAL 0 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  8,  3,  5, ADDDATE(NOW(), INTERVAL 0 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  8,  4,  4, ADDDATE(NOW(), INTERVAL 0 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  1,  1,  07, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  1,  2,  04, ADDDATE(NOW(), INTERVAL 3 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  2,  1,  02, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  2,  2,  08, ADDDATE(NOW(), INTERVAL 3 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  3,  1,  10, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  3,  2,  10, ADDDATE(NOW(), INTERVAL 3 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  4,  1,  5, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  4,  2,  4, ADDDATE(NOW(), INTERVAL 3 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  5,  3,  6, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  5,  4,  6, ADDDATE(NOW(), INTERVAL 3 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  6,  3,  9, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  6,  4,  1, ADDDATE(NOW(), INTERVAL 3 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  7,  3,  7, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  7,  4,  5, ADDDATE(NOW(), INTERVAL 3 DAY));

INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  8,  3,  5, ADDDATE(NOW(), INTERVAL 3 DAY));
INSERT INTO `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) VALUES (  8,  4,  4, ADDDATE(NOW(), INTERVAL 3 DAY));

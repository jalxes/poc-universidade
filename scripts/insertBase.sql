insert into `instituicao` (`id`, `nome`) values (0, "FACULSHOW");

insert into `aluno` (`name`, `instituicao_id`) values ("aluno01", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno02", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno03", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno04", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno05", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno06", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno07", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno08", 0);

insert into `curso` (`name`, `instituicao_id`)  values ("curso01", 0);
insert into `curso` (`name`, `instituicao_id`)  values ("curso02", 0);

insert into `professor` (  `name`,  `instituicao_id`) values (  "professor01",  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  "professor02",  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  "professor03",  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  "professor04",  0);

insert into `disciplina` (`name`, `professor_id`) VALUES ("disciplina01", 1);
insert into `disciplina` (`name`, `professor_id`) VALUES ("disciplina02", 2);
insert into `disciplina` (`name`, `professor_id`) VALUES ("disciplina03", 3);
insert into `disciplina` (`name`, `professor_id`) VALUES ("disciplina04", 4);

insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (1, 1);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (1, 2);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (2, 1);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (2, 2);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (3, 1);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (3, 2);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (4, 1);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (4, 2);

insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (5, 3);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (5, 4);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (6, 3);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (6, 4);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (7, 3);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (7, 4);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (8, 3);
insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (8, 4);

insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  1,  1);
insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  2,  1);
insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  3,  1);
insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  4,  1);

insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  5,  2);
insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  6,  2);
insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  7,  2);
insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  8,  2);

insert into `disciplina_has_curso` (`disciplina_id`, `curso_id`) values (1, 1);
insert into `disciplina_has_curso` (`disciplina_id`, `curso_id`) values (2, 1);
insert into `disciplina_has_curso` (`disciplina_id`, `curso_id`) values (3, 2);
insert into `disciplina_has_curso` (`disciplina_id`, `curso_id`) values (4, 2);

-- insert into `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) values (  "aluno_id",  `disciplina_id`,  `falta`);
--
-- insert into `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) values (  "aluno_id",  `disciplina_id`,  `nota`, `data`);
--

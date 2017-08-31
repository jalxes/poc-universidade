insert into `instituicao` (`id`, `nome`) values (0, "FACULSHOW");

insert into `aluno` (`name`, `instituicao_id`) values ("aluno00", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno01", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno02", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno03", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno04", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno05", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno10", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno11", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno12", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno13", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno14", 0);
insert into `aluno` (`name`, `instituicao_id`) values ("aluno15", 0);

insert into `curso` (`name`, `instituicao_id`)  values (`curso01`, 0);
insert into `curso` (`name`, `instituicao_id`)  values (`curso02`, 0);

insert into `professor` (  `name`,  `instituicao_id`) values (  `professor00`,  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  `professor01`,  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  `professor02`,  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  `professor03`,  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  `professor04`,  0);
insert into `professor` (  `name`,  `instituicao_id`) values (  `professor05`,  0);

insert into `disciplina` (`name`, `professor_id`) VALUES (`disciplina00`, `professor_id`);
insert into `disciplina` (`name`, `professor_id`) VALUES (`disciplina01`, `professor_id`);
insert into `disciplina` (`name`, `professor_id`) VALUES (`disciplina02`, `professor_id`);
insert into `disciplina` (`name`, `professor_id`) VALUES (`disciplina03`, `professor_id`);
insert into `disciplina` (`name`, `professor_id`) VALUES (`disciplina04`, `professor_id`);
insert into `disciplina` (`name`, `professor_id`) VALUES (`disciplina05`, `professor_id`);

insert into `aluno_has_disciplina` (`aluno_id`, `disciplina_id`) values (`aluno_id`, `disciplina_id`);

insert into `aluno_has_curso` (  `aluno_id`,  `curso_id`) values  (  `aluno_id`,  `curso_id`)

insert into `disciplina_has_curso` (`disciplina_id`, `curso_id`) values (`disciplina_id`, `curso_id`);

insert into `falta` (  `aluno_id`,  `disciplina_id`,  `falta`) values (  `aluno_id`,  `disciplina_id`,  `falta`);

insert into `nota` (  `aluno_id`,  `disciplina_id`,  `nota`, `data`) values (  `aluno_id`,  `disciplina_id`,  `nota`, `data`);

create database db_cursoDaMinhaVida

use db_cursoDaMinhaVida

-- script DDL
create table tb_categoria(
	id_categoria int not null auto_increment,
	segmento_categoria varchar(255) not null,
	nivel_categoria varchar(255) not null,
    carga_horaria_categoria varchar(255) not null,
    
    primary key (id_categoria)
);

create table tb_curso(
	id_curso int not null auto_increment,
	nome_curso varchar(255) not null,
    requisitos_curso varchar(255) not null,
    professor_curso varchar(255) not null,
    avaliacao_curso decimal(5.2) not null,
    nome_aluno varchar(255) not null,
    fk_categoria int not null,
    
    primary key(id_curso),
    foreign key(fk_categoria) references tb_categoria (id_categoria)
    
);

-- script DML
insert into tb_categoria (segmento_categoria, nivel_categoria, carga_horaria_categoria) value
	("Front-end", "Iniciante", "16 horas"),
	("Front-end", "Intermediário", "30 horas"),
	("Back-end", "Iniciante", "16 horas"),
	("Back-end", "Avançado", "20 horas"),
	("Banco de dados", "Iniciante", "20 horas")
;

insert into tb_curso(nome_curso, requisitos_curso, professor_curso, avaliacao_curso, nome_aluno, fk_categoria) value
	("Introdução ao HTML e CSS", "Sem requisito previo", "Julio Fagundes", 9.20, "Marcelo Abreu", 1),
	("HTML e CSS + JavaScript","Conhecimento previo em HTML e CSS", "Ana Moraes", 8.20, "Leandro Cesar", 2),
	("Introdução ao Java", "Sem requisito previo", "Gustavo Leon", 7.80, "Marcelo Oliveira", 3),
	("Criando um Jogo em Java", "Necessário ter feito os 5 cursos anteriores", "Albert Frois", 9.80, "Michele Abreu", 4),
	("Introdução ao Banco de Dados", "Sem requisito previo", "Filipe Lopes", 8.00, "Thiago Gomes", 5)
;

	select * from tb_curso where avaliacao_curso > 9

	select * from tb_curso where avaliacao_curso between 7 and 10

	select * from tb_curso where nome_curso like '%J%'

    select nome_curso, requisitos_curso, professor_curso, avaliacao_curso, nome_aluno, fk_categoria from tb_curso
    inner join tb_categoria on tb_curso.fk_categoria = tb_categoria.id_categoria;
    
    select nome_curso, requisitos_curso, professor_curso, avaliacao_curso, nome_aluno, fk_categoria from tb_curso
	inner join tb_categoria on tb_curso.fk_categoria = tb_categoria.id_categoria where segmento_categoria = 'front-end';	

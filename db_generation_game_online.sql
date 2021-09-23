create database db_generation_game_online
use db_generation_game_online
-- script DDL

CREATE TABLE tb_classe (
	id_classe INT not null auto_increment,
    nome_classe VARCHAR(255) not null,
	arma_classe VARCHAR(255) not null,
	poder_classe VARCHAR(255) not null,
    
    primary key(id_classe)    
);

create table tb_personagem (
	id_personagem int not null auto_increment,
	nome_personagem VARCHAR(255) not null,
	idade_personagem VARCHAR(255) not null,
	sexo_personagem VARCHAR(255) not null,
	ataque_personagem INT not null,
	defesa_personagem INT not null,
	vida_maxima INT not null,
	fk_classe INT not null,
    
    primary key(id_personagem),
	foreign key(fk_classe) references tb_classe (id_classe)
);

-- script DML

insert into tb_classe(nome_classe, arma_classe, poder_classe) value 
	("Arqueiro", "Arco e Flexa", "Flexa venenosa"),
	("Guerreiro", "Espada", "golpe certeiro"),
	("Troll", "Machado", "chute"),
	("Mago", "Cajado", "raio magico"),
	("Guerreira", "Espada", "golpe certeiro")
;

INSERT INTO tb_personagem (nome_personagem, idade_personagem, sexo_personagem, ataque_personagem, defesa_personagem, vida_maxima, fk_classe) value
	-- nome /       idade /   sexo    / atk / dfs / vida /clss
    ("Henrique",       22, "masculino", 1200, 1800, 5000,  2),
    ("Laurinda",       20,  "feminino", 2100, 1800, 4200,  5),
	("Ebert Richards", 19, "masculino", 2500, 2800, 3500,  4),
	("Euriclécio",     27, "masculino", 1500, 3500, 4000,  3),
	("Felisberto",     25, "masculino", 1200, 2800, 4200,  1)
    ;
    
    update tb_personagem set defesa_personagem = 1800 where defesa_personagem = 5000;
    
    select * from tb_personagem where ataque_personagem > 2000;
    
    select * from tb_personagem where defesa_personagem between 1000 and 2000;
    
	select * from tb_personagem where ataque_personagem > 2000;
      
    select * from tb_personagem where nome_personagem like '%c%';
    
    select nome_personagem, nome_classe, poder_classe, arma_classe from tb_personagem
    inner join tb_classe on tb_personagem.fk_classe = tb_classe.id_classe;
    
    select nome_personagem, nome_classe, poder_classe, arma_classe from tb_personagem
	inner join tb_classe on tb_personagem.fk_classe = tb_classe.id_classe where nome_classe = 'arqueiro';	
    
    
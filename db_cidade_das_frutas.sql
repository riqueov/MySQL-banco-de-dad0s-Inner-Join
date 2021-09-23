create database db_cidade_das_frutas

use db_cidade_das_frutas

-- script DDL
create table tb_categoria(
	id_categoria int not null auto_increment,
	tipo_categoria varchar(255) not null,
	pais_categoria varchar(255) not null,
    cultivo_categoria varchar(255) not null,
    
    primary key (id_categoria)
);

create table tb_produto(
	id_produto int not null auto_increment,
	nome_produto varchar(255) not null,
    preco_produto decimal not null,
    cor_produto varchar(255) not null,
    peso_produto decimal(5.2) not null,
    validade_produto varchar(255) not null,
    fk_categoria int not null,
    
    primary key(id_produto),
    foreign key(fk_categoria) references tb_categoria (id_categoria)
    
);

-- script DML
insert into tb_categoria (tipo_categoria, pais_categoria, cultivo_categoria) value
	("Legume", "Argentina", "natural"),
	("Fruta", "Brasil", "Organico"),
	("Legume", "Brasil", "Organico"),
	("Fruta", "Espanha", "Organico"),
	("Fruta", "Venezuela", "Natural")
;

insert into tb_produto(nome_produto, preco_produto, cor_produto, peso_produto, validade_produto, fk_categoria) value
	("Maçã kg", 6.00, "Vermelha", "1.00", "10/2021", 2),
    ("Maracujá", 30.00, "Verde", "1.00", "10/2021", 5),
    ("Fruta do Conde", 65.00, "Vermelha", "1.00", "11/2021", 4),
    ("Abobrinha", 12.00, "Verde", "1.00", "11/2021", 3),
    ("Xuxu", 8.00, "Verde", "1.00", "12/2021", 1)
;

	select * from tb_produto where preco_produto > 50

	select * from tb_produto where preco_produto between 3 and 60

	select * from tb_produto where nome_produto like '%C%'

    select nome_produto, preco_produto, cor_produto, peso_produto, validade_produto, fk_categoria from tb_produto
    inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria;
    
    select nome_produto, preco_produto, cor_produto, peso_produto, validade_produto, fk_categoria from tb_produto
	inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria where tipo_categoria = 'legume';	

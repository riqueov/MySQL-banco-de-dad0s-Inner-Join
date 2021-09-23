create database db_construindo_a_nossa_vida

use db_construindo_a_nossa_vida

-- script DDL
create table tb_categoria(
	id_categoria int not null auto_increment,
	tipo_categoria varchar(255) not null,
	material_categoria varchar(255) not null,
    qualidade_categoria varchar(255) not null,
    
    primary key (id_categoria)
);

create table tb_produto(
	id_produto int not null auto_increment,
	nome_produto varchar(255) not null,
    preco_produto decimal not null,
    cor_produto varchar(255) not null,
    quantidade_produto int not null,
    transporte_produto varchar(255) not null,
    fk_categoria int not null,
    
    primary key(id_produto),
    foreign key(fk_categoria) references tb_categoria (id_categoria)
    
);

-- script DML
insert into tb_categoria (tipo_categoria, material_categoria, qualidade_categoria) value
	("Janelas e Portas", "Aluminio", "padrão simples"),
	("Janelas e Portas", "Madeira", "padrão premium"),
	("Decoração", "PVC", "padrão medio"),
	("Tintas", "liquido", "padrão premium"),
	("Acessórios", "madeira", "padrão medio")
;

insert into tb_produto(nome_produto, preco_produto, cor_produto, quantidade_produto, transporte_produto, fk_categoria) value
	("Pincel profissional", 30.00, "marrom e preto", 1, "retirada na loja", 5),
    ("Persiana", 250.00, "Preta", 1, "entrega por conta da loja", 3),
    ("Janela", 850.00, "Marrom", 4, "entrega por conta do cliente", 2),
    ("Porta prata", 120.00, "Cromada", 2, "entrega por conta do cliente", 1),
    ("Tinta Suvinil", 40.00, "Verde", 1, "retirada na loja", 4)
;

	select * from tb_produto where preco_produto > 50

	select * from tb_produto where preco_produto between 3 and 60

	select * from tb_produto where nome_produto like '%C%'

    select nome_produto, preco_produto, cor_produto, quantidade_produto, transporte_produto, fk_categoria from tb_produto
    inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria;
    
    select nome_produto, preco_produto, cor_produto, quantidade_produto, transporte_produto, fk_categoria from tb_produto
	inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria where tipo_categoria = 'janelas e portas';	
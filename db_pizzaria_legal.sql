create database db_pizzaria_legal

use db_pizzaria_legal
-- script DDL
create table tb_categoria(
	id_categoria int not null auto_increment,
	sabor_categoria varchar(255) not null,
	tamanho_categoria varchar(255) not null,
    preco_categoria decimal(5,2) not null,
    
    primary key (id_categoria)
);

create table tb_pizza(
	id_pizza int not null auto_increment,
	borda_pizza varchar(255) not null,
    massa_pizza varchar(255) not null,
    promocao_preco decimal(5.2) not null,
    acompanha_refri boolean not null,
    guardanapo_pizza boolean not null,
    fk_categoria int not null,
    
    primary key(id_pizza),
    foreign key(fk_categoria) references tb_categoria (id_categoria)
    
);

select * from tb_pizza
-- script DML
insert into tb_categoria (sabor_categoria, tamanho_categoria, preco_categoria) value
	("Mussarela", "Media", 35.00),
	("Portuguesa", "Grande", 59.00),
	("Calabresa", "Grande", 46.00),
	("Frango com Mussarela", "Grande", 59.00),
	("Banana com chocolate", "Media", 50.00)
;

insert into tb_pizza( borda_pizza, massa_pizza, promocao_preco, acompanha_refri, guardanapo_pizza, fk_categoria) value
	("borda recheada cheddar", "massa tradicional", 0.0, true, false, 2),
    ("borda tradicional", "massa vegana", 5.0, false, false, 1),
    ("borda tradicional", "massa pan", 10.0, true, true, 3),
    ("borda tradicional", "massa tradicional", 5.0, true, false, 4),
    ("borda recheada catupiry", "massa pan", 0.0, true, true, 5)
;

	select * from tb_categoria where preco_categoria > 45

	select * from tb_categoria where preco_categoria between 29 and 60

	select * from tb_categoria where sabor_categoria like '%C%'

    select borda_pizza, massa_pizza, promocao_preco, acompanha_refri, guardanapo_pizza, fk_categoria from tb_pizza
    inner join tb_categoria on tb_pizza.fk_categoria = tb_categoria.id_categoria;
    
    select borda_pizza, massa_pizza, promocao_preco, acompanha_refri, guardanapo_pizza, fk_categoria from tb_pizza
    inner join tb_categoria on tb_pizza.fk_categoria = tb_categoria.id_categoria where tamanho_categoria = 'media';	

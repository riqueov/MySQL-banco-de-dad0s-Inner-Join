create database db_farmacia_do_bem

use db_farmacia_do_bem

-- script DDL
create table tb_categoria(
	id_categoria int not null auto_increment,
	faixa_etaria_categoria varchar(255) not null,
	tipo_categoria varchar(255) not null,
    cor_tarja_categoria varchar(255) not null,
    
    primary key (id_categoria)
);

create table tb_produto(
	id_produto int not null auto_increment,
	nome_produto varchar(255) not null,
    preco_produto int not null,
    qt_comprimidos_produto int not null,
    necessita_prescricao boolean not null,
    generico_produto boolean not null,
    fk_categoria int not null,
    
    primary key(id_produto),
    foreign key(fk_categoria) references tb_categoria (id_categoria)
    
);


-- script DML
insert into tb_categoria (faixa_etaria_categoria, tipo_categoria, cor_tarja_categoria) value
	("Infantil", "uso oral", "Amarela"),
	("Adulto", "uso oral", "Vermelha"),
	("Adulto", "cosmetico", "Não se aplica"),
	("Infantil", "uso nasal", "Amarela"),
	("Adulto", "uso oral", "Preta")
;

insert into tb_produto( nome_produto, preco_produto, qt_comprimidos_produto, necessita_prescricao, generico_produto, fk_categoria) value
	("Novalgina 1G - 6cx", 60.00, 60, false, true, 2),
    ("Xarope Vick", 18.00, 0, false, false, 1),
    ("Batom", 10.00, 0, false, false, 3),
    ("Rinosoro Infantil", 12.00, 12, true, false, 4),
    ("Rivotril", 8.00, 14, true, true, 5)
;

	select * from tb_produto where preco_produto > 50

	select * from tb_produto where preco_produto between 3 and 60

	select * from tb_produto where nome_produto like '%B%'

    select nome_produto, preco_produto, qt_comprimidos_produto, necessita_prescricao, generico_produto, fk_categoria from tb_produto
    inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria;
    
    select nome_produto, preco_produto, qt_comprimidos_produto, necessita_prescricao, generico_produto, fk_categoria from tb_produto
	inner join tb_categoria on tb_produto.fk_categoria = tb_categoria.id_categoria where tipo_categoria = 'cosmetico';	

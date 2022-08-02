--criando um schema
create schema clube_do_livro;

--criando tabelas
create table clube_do_livro.livros(
id_livro int not null,
nome_livro varchar(100) not null,
autoria varchar(100) not null,
editora varchar(100) not null,
categoria varchar(100) not null,
preco decimal(5,2) not null,

primary key (id_livro)
);

create table clube_do_livro.estoque (
id_livro int not null,
qtd_estoque int not null,

primary key (id_livro)
);

create table clube_do_livro.vendas (
id_pedido int not null,
id_vendedor int not null,
id_livro int not null,
qtd_vendida int not null,
data_venda date not null,

primary key (id_vendedor, id_pedido)
);

create table clube_do_livro.vendedores (
id_vendedor int not null,
nome_vendedor varchar(255) not null,

primary key (id_vendedor)
);

--alterando tabela
alter table clube_do_livro.estoque add constraint ce_estoque_livros
foreign key (id_livro)
references clube_do_livro.livros (id_livro)
on delete no action
on update no action;
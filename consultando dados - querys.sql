--consultar todas as colunas da tabela livros
select * 
from clube_do_livro.livros;

--consultar apenas a coluna nome da tabela livros
select nome_livro
from clube_do_livro.livros;

--apelidando uma coluna
select id_livro as "código do livro"
from clube_do_livro.livros;

--recupera informacoes dos livros da categoria Romance
select *
from clube_do_livro.livros
where categoria = 'Romance';

--recupera informacoes dos livros da categoria romance cujo preco seja menor que 48 reais 
select *
from clube_do_livro.livros
where categoria = 'Romance' and preco < 48;

--recupera informacoes da categoria poesia cuja autoria nao é de Luís Vaz de Camoes e nem de Gabriel Pedrosa
select *
from clube_do_livro.livros
where categoria = 'Poesia' and not (autoria = 'Luís Vaz de Camões' or autoria = 'Gabriel Pedrosa');

--ignora duplicacao de dados e ordena
select distinct id_livro
from clube_do_livro.vendas
where id_vendedor = 1
order by 1;

--deletando uma linha
delete
from clube_do_livro.livros
where id_livro = 7;

--alterando valores no preco com 10% de desconto
update clube_do_livro.livros set preco = 0.9*preco;

--agrupando a quantidade de vendas por cada vendedor a partie de dados de tabelas diferentes
select vendas.id_vendedor,
       vendedores.nome_vendedor,
       sum(qtd_vendida)
from clube_do_livro.vendas,
     clube_do_livro.vendedores
where vendas.id_vendedor = vendedores.id_vendedor
group by 1, 2;

--fazendo a mesma consulta acima usando inner join
select vendas.id_vendedor,
       vendedores.nome_vendedor,
       sum(qtd_vendida)
from clube_do_livro.vendas
  join clube_do_livro.vendedores
    on vendas.id_vendedor = vendedores.id_vendedor
group by 1, 2;

--Identificar os livros vendidos na tabela vendas. otimizando a consulta usando apelidos
select a.nome_livro,
  b.qtd_vendida
from clube_do_livro.livros a, clube_do_livro.vendas b
where b.id_livro = a.id_livro;

--recupera a maior venda feita
select max(qtd_vendida)
from clube_do_livro.vendas;

--recupera a maior venda por código de pessoa
select max(qtd_vendida)
from clube_do_livro.vendas
group by (id_vendedor);

--recupera livros disponiveis que ainda nao foram vendidos
select livros.nome_livro,
       vendas.qtd_vendida
from clube_do_livro.livros
  left join clube_do_livro.vendas
    on livros.id_livro = vendas.id_livro
where vendas.qtd_vendida is null;

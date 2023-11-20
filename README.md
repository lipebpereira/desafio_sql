# Desafio SQL Refera

Olá, meu nome é Felipe Barbosa Pereira e este é meu desafio SQL.

Aqui embaixo você pode conferir como ficou o schema design do banco de dados.

![alt text](https://github.com/lipebpereira/desafio_sql/blob/main/tables.png?raw=true)

**Para realizar a criação do banco de dados é necessário rodar o script "create_schema.sql" que se encontra no repositório!**

## Respostas das perguntas
Além disso, também é possível ver as respostas no arquivo .sql que se encontra no repositório

#### Q1: Valor total das vendas e dos fretes por produto e ordem de venda

  ``` 
SELECT venda.Data data_da_venda, cupom.produtoID codigo_do_produto,
produto.Produto nome_do_produto, SUM(cupom.Valor) soma_valor_bruto, 
SUM(cupom.ValorLiquido) soma_valor_liquido,
SUM(venda.ValorFrete) valor_frete
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
JOIN produto ON produto.ProdutoID = cupom.ProdutoID
GROUP BY cupom.ProdutoID, venda.Data
ORDER BY venda.Data  
```
Aqui estou selecionando algumas informaçãoes sobre a venda a partir de diferentes tabelas, como venda, cupom e produto. Além disso estou agrupando pelos diferentes produtos, em seguida, estou ordenando pela data que ocorreu a venda. Após isto os dados estão sendo ordenados pela data que ocorreu a venda. Sendo assim é possível obter o valor total das vendas e dos fretes por produto e ordem de venda.

#### Q2: Valor de venda por tipo de produto
``` 
SELECT categoria.Categoria categoria_do_produto, 
SUM(cupom.Valor) soma_valor_bruto, 
SUM(cupom.ValorLiquido) soma_valor_liquido
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
JOIN produto ON produto.ProdutoID = cupom.ProdutoID
JOIN categoria ON produto.CategoriaID = categoria.CategoriaID
GROUP BY categoria.Categoria  
```
Aqui estou selecionando algumas informaçãoes sobre um produto a partir de diferentes tabelas, como a tabela de venda, cupom e produto. Além disso estou agrupando pelas diferentes categorias de produtos. Sendo assim é possível obter o valor de venda por tipo de produto.

#### Q3: Quantidade e valor das vendas por dia, mês, ano

##### Q3_1: Por dia:
``` 
SELECT YEAR(venda.Data) ano_venda, MONTH(venda.Data) mes_venda,
DAY(venda.Data) dia_venda, SUM(cupom.Valor) soma_valor_bruto, 
SUM(cupom.ValorLiquido) soma_valor_liquido
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY ano_venda, mes_venda, dia_venda
ORDER BY ano_venda, mes_venda, dia_venda
```
Aqui estou selecionando algumas informaçãoes sobre uma venda a partir de diferentes tabelas, como a tabela de venda e cupom. Além disso estou agrupando pelo ano, mes e dia de venda, em seguida, estou ordenando pelos mesmos campos. Sendo assim é possível ver as vendas por dia.

##### Q3_2: Por mês:
``` 
SELECT YEAR(venda.Data) ano_venda, MONTH(venda.Data) mes_venda,
SUM(cupom.Valor) soma_valor_bruto, 
SUM(cupom.ValorLiquido) soma_valor_liquido
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY ano_venda, mes_venda
ORDER BY ano_venda, mes_venda
```
Aqui estou selecionando algumas informaçãoes sobre uma venda a partir de diferentes tabelas, como a tabela de venda e cupom. Além disso estou agrupando pelo ano e mes de venda, em seguida, estou ordenando pelos mesmos campos. Sendo assim é possível ver as vendas por mes.

##### Q3_3: Por ano:
``` 
SELECT YEAR(venda.Data) ano_venda, SUM(cupom.Valor) soma_valor_bruto,
SUM(cupom.ValorLiquido) soma_valor_liquido
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY ano_venda
ORDER BY ano_venda
```
Aqui estou selecionando algumas informaçãoes sobre uma venda a partir de diferentes tabelas, como a tabela de venda e cupom. Além disso estou agrupando pelo ano de venda, em seguida, estou ordenando pelo mesmo campo. Sendo assim é possível ver as vendas por ano.

#### Q4: Lucro dos meses
``` 
SELECT YEAR(venda.Data) ano_venda, MONTH(venda.Data) mes_venda, 
SUM(cupom.Valor)-SUM(cupom.ValorLiquido) lucro_mes
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY ano_venda, mes_venda
ORDER BY ano_venda, mes_venda
```
Aqui estou selecionando algumas informaçãoes sobre o lucro de cada mês a partir de diferentes tabelas, como a tabela de venda e cupom. Além disso estou agrupando pelo ano e mês de venda, em seguida, estou ordenando pelos mesmos campos. Sendo assim é possível ver o lucro a partir de cada mês.

#### Q5: Venda por produto
``` 
SELECT produto.Produto nome_produto, 
COUNT(produto.Produto) quantidade_vendida,SUM(cupom.Valor) soma_valor_bruto 
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
JOIN produto ON cupom.ProdutoID = produto.ProdutoID
GROUP BY produto.Produto
```
Aqui estou selecionando algumas informaçãoes sobre a venda de um produto a partir de diferentes tabelas, como a tabela de produto, venda e cupom. Além disso estou agrupando pelo produto. Sendo assim é possível ver a venda por cada produto.

#### Q6: Venda por cliente, cidade do cliente e estado

##### Q6_1: Por cliente:
``` 
SELECT cliente.ClienteNm nome_cliente, 
COUNT(venda.ClienteID) quantidade_vendida, 
SUM(cupom.Valor) soma_valor_bruto 
FROM venda
JOIN cliente ON venda.ClienteID = cliente.ClienteID
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY cliente.clienteID
```
Aqui estou selecionando algumas informaçãoes sobre a venda de um produto a partir de diferentes tabelas, como a tabela de venda, cliente e cupom. Além disso estou agrupando pelo cliente. Sendo assim é possível ver a venda por cada cliente.

##### Q6_2: Por cidade e estado:
``` 
SELECT cliente.ClienteCidade cidade, 
COUNT(venda.ClienteID) quantidade_vendida, 
SUM(cupom.Valor) soma_valor_bruto FROM venda
JOIN cliente ON venda.ClienteID = cliente.ClienteID
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY cliente.ClienteCidade
```
Aqui estou selecionando algumas informaçãoes sobre a venda de um produto a partir de diferentes tabelas, como a tabela de venda, cliente e cupom. Além disso estou agrupando pela cidade do cliente. Sendo assim é possível ver a venda por cada cidade.


#### Q7: Média de produtos vendidos
``` 
SELECT SUM(cupom.Quantidade)/COUNT(venda.CupomID) 
FROM cupom JOIN venda ON cupom.CupomID = venda.CupomID
```
Aqui estou selecionando algumas informaçãoes sobre as vendas de um produto a partir da tabela cupom. Após isso estou pegando a soma de produtos vendidos e dividindo pela quantidade de vendas, para assim ter a média de produtos vendidos.

#### Q8: Média de compras que um cliente faz
``` 
SELECT COUNT(cupom.CupomID)/COUNT(DISTINCT(cliente.ClienteID)) media_de_compras_por_cliente
FROM cliente
JOIN venda ON cliente.ClienteID = venda.ClienteID
JOIN cupom ON venda.CupomID = cupom.CupomID
```
Aqui estou selecionando algumas informaçãoes sobre as compras a partir da tabela cliente, venda e cupom. Após isso estou pegando a quantidade de cupoms e dividindo pela quantidade de vendas diferentes, para assim ter a média de compras que um cliente faz.

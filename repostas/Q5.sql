/*Aqui estou selecionando algumas informaçãoes sobre a venda de um produto a partir de diferentes tabelas, como a tabela de produto, 
venda e cupom. Além disso estou agrupando pelo produto. 
Sendo assim é possível ver a venda por cada produto.*/

SELECT produto.Produto nome_produto, 
COUNT(produto.Produto) quantidade_vendida,SUM(cupom.Valor) soma_valor_bruto 
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
JOIN produto ON cupom.ProdutoID = produto.ProdutoID
GROUP BY produto.Produto
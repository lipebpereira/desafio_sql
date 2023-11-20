/*Aqui estou selecionando algumas informaçãoes sobre um produto a partir de diferentes tabelas, como a tabela de venda,
cupom e produto. Além disso estou agrupando pelas diferentes categorias de produtos. 
Sendo assim é possível obter o valor de venda por tipo de produto.*/

SELECT categoria.Categoria categoria_do_produto, 
SUM(cupom.Valor) soma_valor_bruto, 
SUM(cupom.ValorLiquido) soma_valor_liquido
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
JOIN produto ON produto.ProdutoID = cupom.ProdutoID
JOIN categoria ON produto.CategoriaID = categoria.CategoriaID
GROUP BY categoria.Categoria  
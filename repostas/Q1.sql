/*Aqui estou selecionando algumas informaçãoes sobre a venda a partir de diferentes tabelas, como venda, cupom e produto.
Além disso estou agrupando pelos diferentes produtos, em seguida, estou ordenando pela data que ocorreu a venda. 
Após isto os dados estão sendo ordenados pela data que ocorreu a venda. Sendo assim é possível obter o valor total das vendas
e dos fretes por produto e ordem de venda.*/

SELECT venda.Data data_da_venda, cupom.produtoID codigo_do_produto,
produto.Produto nome_do_produto, SUM(cupom.Valor) soma_valor_bruto, 
SUM(cupom.ValorLiquido) soma_valor_liquido,
SUM(venda.ValorFrete) valor_frete
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
JOIN produto ON produto.ProdutoID = cupom.ProdutoID
GROUP BY cupom.ProdutoID, venda.Data
ORDER BY venda.Data  
SELECT venda.Data data_da_venda, cupom.produtoID codigo_do_produto,
produto.Produto nome_do_produto, SUM(cupom.Valor) soma_valor_bruto, 
SUM(cupom.ValorLiquido) soma_valor_liquido,
SUM(venda.ValorFrete) valor_frete
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
JOIN produto ON produto.ProdutoID = cupom.ProdutoID
GROUP BY cupom.ProdutoID, venda.Data
ORDER BY venda.Data  
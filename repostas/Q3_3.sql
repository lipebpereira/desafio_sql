/*Aqui estou selecionando algumas informaçãoes sobre uma venda a partir de diferentes tabelas, como a tabela de venda e cupom. 
Além disso estou agrupando pelo ano de venda, em seguida, estou ordenando pelo mesmo campo. 
Sendo assim é possível ver as vendas por ano.*/

SELECT YEAR(venda.Data) ano_venda, SUM(cupom.Valor) soma_valor_bruto,
SUM(cupom.ValorLiquido) soma_valor_liquido
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY ano_venda
ORDER BY ano_venda
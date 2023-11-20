/*Aqui estou selecionando algumas informaçãoes sobre o lucro de cada mês a partir de diferentes tabelas, como a tabela de venda e cupom.
Além disso estou agrupando pelo ano e mês de venda, em seguida, estou ordenando pelos mesmos campos. 
Sendo assim é possível ver o lucro a partir de cada mês.*/

SELECT YEAR(venda.Data) ano_venda, MONTH(venda.Data) mes_venda, 
SUM(cupom.Valor)-SUM(cupom.ValorLiquido) lucro_mes
FROM venda
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY ano_venda, mes_venda
ORDER BY ano_venda, mes_venda
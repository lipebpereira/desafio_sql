/*Aqui estou selecionando algumas informaçãoes sobre a venda de um produto a partir de diferentes tabelas, como a tabela de venda, 
cliente e cupom. Além disso estou agrupando pelo cliente. 
Sendo assim é possível ver a venda por cada cliente.*/

SELECT cliente.ClienteNm nome_cliente, 
COUNT(venda.ClienteID) quantidade_vendida, 
SUM(cupom.Valor) soma_valor_bruto 
FROM venda
JOIN cliente ON venda.ClienteID = cliente.ClienteID
JOIN cupom ON venda.CupomID = cupom.CupomID
GROUP BY cliente.clienteID
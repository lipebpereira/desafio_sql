/*Aqui estou selecionando algumas informaçãoes sobre as compras a partir da tabela cliente, venda e cupom. 
Após isso estou pegando a quantidade de cupoms e dividindo pela quantidade de vendas diferentes, 
para assim ter a média de compras que um cliente faz.*/

SELECT COUNT(cupom.CupomID)/COUNT(DISTINCT(cliente.ClienteID)) media_de_compras_por_cliente
FROM cliente
JOIN venda ON cliente.ClienteID = venda.ClienteID
JOIN cupom ON venda.CupomID = cupom.CupomID
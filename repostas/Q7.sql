/*Aqui estou selecionando algumas informaçãoes sobre as vendas de um produto a partir da tabela cupom. 
Após isso estou pegando a soma de produtos vendidos e dividindo pela quantidade de vendas, para assim ter a média de produtos vendidos.*/

SELECT SUM(cupom.Quantidade)/COUNT(venda.CupomID) media_produtos_vendidos
FROM cupom JOIN venda ON cupom.CupomID = venda.CupomID
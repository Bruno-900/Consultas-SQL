use zoologico_projeto;

-- 1)Listar Todos os Visitantes: Selecione todas as colunas da tabela Visitante.
SELECT * FROM visitante;

-- 2)Nomes e Emails dos Visitantes: Selecione apenas o nome e o email de todos os visitantes.
SELECT Nome,Email
FROM visitante;

-- 3)Visitantes por Idade: Encontre todos os visitantes com mais de 25 anos.
SELECT Idade
FROM visitante 
WHERE idade > 25;

-- 4)Promoções Ativas (Simplificado): Liste todas as promoções que terminaram após '2024-12-31'.
SELECT *
FROM promocao
WHERE Data_Fim > "2025-11-29";
 
-- 5)Tipos de Ingresso e Preços: Mostre o nome (Tipo_Ingresso) e o preço de cada tipo de ingresso, ordenados do mais caro para o mais barato.
SELECT Tipo_Ingresso,Preco
FROM tipo
ORDER BY Preco ASC;

-- 6)Contar Visitantes: Quantos visitantes estão cadastrados no total?
SELECT count(*)
FROM visitante;

-- 7)Detalhes de um Pagamento Específico: Selecione todos os detalhes do pagamento com ID_Pagamento igual a 5 (ou outro ID existente).
SELECT *
FROM detalhes_pagamento
WHERE ID_Pagamento = 5;

-- 8)Compras Recentes: Liste todas as compras (ID_Compra, Data_Compra, Valor_Total) realizadas após '2025-01-01', ordenadas pela data da compra.
SELECT ID_Compra, Data_Compra, Valor_Total
FROM compra
WHERE Data_Compra > "2025-04-13"
Order BY Data_Compra ASC;

-- 9)Administradores por Cargo: Encontre todos os administradores que possuem o cargo 'Gerente'.
SELECT * 
FROM admin
WHERE Cargo = "Gerente";

-- 10)Horários de Funcionamento: Liste todas as descrições e os horários de abertura e encerramento da tabela Horario_Funcionamento.
SELECT Hora_Abertura, Hora_Encerramento, Descricao
FROM horario_funcionamento;

-- 11)Status de Pagamento: Liste todos os diferentes Status_Compra existentes na tabela Pagamento (sem duplicatas).
SELECT DISTINCT Status_Compra
FROM pagamento;

-- 12)Avaliações com Nota Alta: Selecione os comentários (Comentarios) de todas as avaliações com Nota igual a 5.
SELECT Comentarios
FROM avaliacao
WHERE Nota = 5;
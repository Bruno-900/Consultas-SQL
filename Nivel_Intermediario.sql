use zoologico_projeto;

-- 1)Nome do Visitante e Data da Compra: Liste o nome de cada visitante e a data de todas as compras que ele realizou. 
-- (JUNÇÃO: Visitante e Compra).

SELECT v.nome, Data_Compra as Nome_Visitante
FROM visitante v 
INNER JOIN compra c on v.ID_Visitante = c.fk_Visitante_ID_Visitante;


-- 2)Compras com Promoção: Mostre o ID_Compra, Valor_Total e o Codigo_Promocional para todas as compras que utilizaram uma promoção. 
-- (JUNÇÃO: Compra e Promocao).

SELECT c.ID_compra, Valor_Total, Codigo_Promocional as Compra_Promocao
FROM compra c
INNER JOIN Promocao p on ID_Promocao = fk_Promocao_ID_Promocao;

-- 3)Detalhes da Compra e Pagamento: Para cada compra, liste o ID_Compra, Data_Compra, Valor_Total, 
-- o Metodo de pagamento e o Status_Compra. (JUNÇÃO: Compra e Pagamento).

SELECT c.ID_Compra, c.Data_Compra, Valor_Total, p.Metodo, p.Status_Compra as Compra_Metodo
FROM compra c
INNER JOIN pagamento p on ID_Pagamento = fk_Pagamento_ID_Pagamento;

-- 4)Check-ins e Tipo de Ingresso: Liste o ID_CHECKIN, Data_Hora_Checkin e o Tipo_Ingresso correspondente para cada check-in realizado.
-- (JUNÇÃO: CHECKIN_Ingresso e Tipo).

SELECT c.ID_CHECKIN, c.Data_Hora, t.Tipo_Ingresso as Check_tipo 
FROM checkin_ingresso c
INNER JOIN tipo t on ID_Tipo = fk_Tipo_ID_Tipo;

-- 5)Valor Total Gasto por Visitante: Calcule o valor total gasto em compras por cada visitante. 
-- Mostre o Nome do visitante e o Valor_Total gasto. (JUNÇÃO: Visitante, Compra; AGRUPAMENTO: Visitante.ID_Visitante).

SELECT
    v.Nome AS Nome_Visitante,
    SUM(c.Valor_Total) AS Valor_Total_Gasto -- SUM para somar o Valor total que cada visitante gastou(o visitante pode ter feito mais de uma comprar).
FROM visitante v
INNER JOIN compra c ON v.ID_Visitante = c.fk_Visitante_ID_Visitante
GROUP BY v.ID_Visitante, v.Nome
ORDER BY Valor_Total_Gasto DESC;


-- 6)Número de Ingressos Vendidos por Tipo: Conte quantos ingressos (check-ins) foram registrados para cada Tipo_Ingresso. 
-- Mostre o Tipo_Ingresso e a contagem. (JUNÇÃO: CHECKIN_Ingresso, Tipo; AGRUPAMENTO: Tipo.ID_Tipo).

SELECT
    t.Tipo_Ingresso,
    COUNT(c.ID_CHECKIN) AS Quantidade_Ingressos --  COUNT para contar os ingressos
FROM tipo t
INNER JOIN CHECKIN_Ingresso c ON t.ID_Tipo = c.fk_Tipo_ID_Tipo
GROUP BY t.Tipo_Ingresso;


-- 7)Visitantes que Fizeram Avaliação: Liste os nomes dos visitantes que deixaram pelo menos uma avaliação. 
-- (JUNÇÃO: Visitante, Avaliacao; Use DISTINCT ou GROUP BY).

SELECT DISTINCT v.Nome
FROM visitante v
INNER JOIN avaliacao a ON v.ID_Visitante = fk_Visitante_ID_Visitante;

-- 8)Promoções Ativas Atualmente: Liste o Codigo_Promocional e o Tipo_Desconto de todas as promoções que estão ativas na data atual. 
-- (Use CURRENT_DATE).

SELECT Codigo_Promocional, Tipo_Desconto
FROM promocao
WHERE Data_Inicio <= CURRENT_DATE AND Data_Fim >= CURRENT_DATE;

-- 9)Check-ins com Tutor: Liste o ID_CHECKIN e a Data_Hora_Checkin para todos os ingressos que tiveram um tutor associado 
-- (Tutor_s_n = TRUE ou verificando a chave estrangeira fk_Tutor_ID_Tutor).

-- Opção 1: Verificando a coluna booleana Tutor_s_n

SELECT * FROM checkin_ingresso;

SELECT ID_CHECKIN, Data_Hora_Checkin
FROM checkin_ingresso
WHERE Tutor_s_n = 1;

-- Opção 2: Verificando se a chave estrangeira fk_Tutor_ID_Tutor não é NULL

SELECT c.ID_CHECKIN, c.Data_Hora_Checkin
FROM checkin_ingresso c
WHERE c.fk_Tutor_ID_Tutor IS NOT NULL;

-- 10)Média de Preço por Tipo de Ingresso: Calcule o preço médio dos ingressos registrados na tabela CHECKIN_Ingresso para cada Tipo_Ingresso.
-- (JUNÇÃO: CHECKIN_Ingresso, Tipo; AGRUPAMENTO: Tipo.ID_Tipo). 
-- Nota: A tabela CHECKIN_Ingresso tem um campo Preco, que pode ou não ser igual ao Preco na tabela Tipo. 
-- Considere qual preço usar ou se a intenção é verificar a média do preço no momento do check-in.

SELECT t.Tipo_Ingresso,  FORMAT(AVG(ci.Preco), 2) AS Preco_medio -- "FORMAT" para 2 casa após a virgula
FROM CHECKIN_Ingresso ci
INNER JOIN Tipo t ON ci.fk_Tipo_ID_Tipo = t.ID_Tipo
GROUP BY t.ID_Tipo, t.Tipo_Ingresso;

-- 11)Compras Pagas com Cartão: Liste o ID_Compra e Valor_Total de todas as compras cujo método de pagamento 
-- (Metodo na tabela Pagamento) foi 'Cartão de Crédito' (ou similar). (JUNÇÃO: Compra, Pagamento).

SELECT c.ID_Compra, c.Valor_Total AS Compras_Cartao
FROM Compra c
INNER JOIN Pagamento p ON c.fk_Pagamento_ID_Pagamento = p.ID_Pagamento
WHERE p.Metodo LIKE '%Cartão%';

-- 12)Administradores e suas Últimas Ações: Liste o nome de cada administrador e a data/hora da sua ação mais recente registrada em Acoes_Admin.
-- (JUNÇÃO: Admin, Acoes_Admin; AGRUPAMENTO: Admin.ID_admin; Use MAX(Data_Hora))

SELECT a.Nome,MAX(c.Data_Hora) AS Ultima_Acao
FROM Admin a
INNER JOIN Acoes_Admin c ON a.ID_admin = c.fk_Admin_ID_admin
GROUP BY a.ID_admin, a.Nome;
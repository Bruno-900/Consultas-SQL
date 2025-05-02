use zoologico_projeto;

-- 1)Nome do Visitante e Data da Compra: Liste o nome de cada visitante e a data de todas as compras que ele realizou. 
-- (JUNÇÃO: Visitante e Compra).

-- 2)Compras com Promoção: Mostre o ID_Compra, Valor_Total e o Codigo_Promocional para todas as compras que utilizaram uma promoção. 
-- (JUNÇÃO: Compra e Promocao).

-- 3)Detalhes da Compra e Pagamento: Para cada compra, liste o ID_Compra, Data_Compra, Valor_Total, 
-- o Metodo de pagamento e o Status_Compra. (JUNÇÃO: Compra e Pagamento).

-- 4)Check-ins e Tipo de Ingresso: Liste o ID_CHECKIN, Data_Hora_Checkin e o Tipo_Ingresso correspondente para cada check-in realizado.
-- (JUNÇÃO: CHECKIN_Ingresso e Tipo).

-- 5)Valor Total Gasto por Visitante: Calcule o valor total gasto em compras por cada visitante. 
-- Mostre o Nome do visitante e o Valor_Total gasto. (JUNÇÃO: Visitante, Compra; AGRUPAMENTO: Visitante.ID_Visitante).

-- 6)Número de Ingressos Vendidos por Tipo: Conte quantos ingressos (check-ins) foram registrados para cada Tipo_Ingresso. 
-- Mostre o Tipo_Ingresso e a contagem. (JUNÇÃO: CHECKIN_Ingresso, Tipo; AGRUPAMENTO: Tipo.ID_Tipo).

-- 7)Visitantes que Fizeram Avaliação: Liste os nomes dos visitantes que deixaram pelo menos uma avaliação. 
-- (JUNÇÃO: Visitante, Avaliacao; Use DISTINCT ou GROUP BY).

-- 8)Promoções Ativas Atualmente: Liste o Codigo_Promocional e o Tipo_Desconto de todas as promoções que estão ativas na data atual. 
-- (Use CURRENT_DATE).

-- 9)Check-ins com Tutor: Liste o ID_CHECKIN e a Data_Hora_Checkin para todos os ingressos que tiveram um tutor associado 
-- (Tutor_s_n = TRUE ou verificando a chave estrangeira fk_Tutor_ID_Tutor).

-- 10)Média de Preço por Tipo de Ingresso: Calcule o preço médio dos ingressos registrados na tabela CHECKIN_Ingresso para cada Tipo_Ingresso.
-- (JUNÇÃO: CHECKIN_Ingresso, Tipo; AGRUPAMENTO: Tipo.ID_Tipo). 
-- Nota: A tabela CHECKIN_Ingresso tem um campo Preco, que pode ou não ser igual ao Preco na tabela Tipo. 
-- Considere qual preço usar ou se a intenção é verificar a média do preço no momento do check-in.

-- 11)Compras Pagas com Cartão: Liste o ID_Compra e Valor_Total de todas as compras cujo método de pagamento 
-- (Metodo na tabela Pagamento) foi 'Cartão de Crédito' (ou similar). (JUNÇÃO: Compra, Pagamento).


-- 12)Administradores e suas Últimas Ações: Liste o nome de cada administrador e a data/hora da sua ação mais recente registrada em Acoes_Admin.
-- (JUNÇÃO: Admin, Acoes_Admin; AGRUPAMENTO: Admin.ID_admin; Use MAX(Data_Hora))
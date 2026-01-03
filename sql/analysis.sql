-- ==========================================
-- Análise de Dados - ERP / PDV Food
-- Autor: Matheus Reis
-- Objetivo: Extrair insights operacionais
-- ==========================================


-- 1️⃣ Visão geral dos dados
-- Quantidade total de chamados
SELECT COUNT(*) AS total_chamados
FROM tickets;


-- 2️⃣ Chamados por tipo de problema
-- Identificar os problemas mais frequentes
SELECT 
    tipo_problema,
    COUNT(*) AS quantidade
FROM tickets
GROUP BY tipo_problema
ORDER BY quantidade DESC;


-- 3️⃣ Chamados por sistema
-- Ver quais sistemas geram mais impacto operacional
SELECT 
    sistema,
    COUNT(*) AS quantidade
FROM tickets
GROUP BY sistema
ORDER BY quantidade DESC;


-- 4️⃣ Tempo médio de resolução (SLA)
-- Avaliar eficiência do atendimento
SELECT 
    ROUND(AVG(tempo_resolucao_min), 2) AS tempo_medio_min
FROM tickets;


-- 5️⃣ Tempo médio de resolução por prioridade
-- Comparar esforço por criticidade
SELECT 
    prioridade,
    ROUND(AVG(tempo_resolucao_min), 2) AS tempo_medio_min
FROM tickets
GROUP BY prioridade
ORDER BY tempo_medio_min DESC;


-- 6️⃣ Identificação de chamados críticos
-- Chamados com tempo acima de 60 minutos
SELECT *
FROM tickets
WHERE tempo_resolucao_min > 60
ORDER BY tempo_resolucao_min DESC;


-- 7️⃣ Insight de produto:
-- Problemas fiscais e instabilidades no PDV
-- concentram maior tempo de resolução,
-- indicando oportunidade de melhoria no sistema.

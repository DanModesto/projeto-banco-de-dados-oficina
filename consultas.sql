--Recuperações Simples com SELECT Statement
SELECT * FROM Clientes;
SELECT nome, email FROM Clientes;

--Filtros com WHERE Statement
SELECT * FROM Clientes WHERE telefone LIKE '555%';
SELECT * FROM Veiculos WHERE ano_fabricacao > 2010;

--Expressões para Gerar Atributos Derivados
SELECT ordem_id, (valor_total * 0.9) AS valor_com_desconto FROM Ordens_de_Servico;

--Defina Ordenações dos Dados com ORDER BY
SELECT * FROM Veiculos ORDER BY quilometragem DESC;

--Condições de Filtros aos Grupos – HAVING Statement
SELECT AVG(valor_total) AS media_valor_total FROM Ordens_de_Servico HAVING media_valor_total > 500;

--Crie Junções entre Tabelas para Fornecer uma Perspectiva Mais Complexa dos Dados
SELECT o.ordem_id, o.data_inicio, o.descricao_servico, c.nome AS nome_cliente
FROM Ordens_de_Servico AS o
JOIN Veiculos AS v ON o.veiculo_id = v.veiculo_id
JOIN Clientes AS c ON v.cliente_id = c.cliente_id;

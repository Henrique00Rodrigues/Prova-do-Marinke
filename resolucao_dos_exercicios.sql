SELECT funcionario.nome AS Nome_Funcionario, mesa.numero_mesa AS Numero_da_Mesa, SUM(Produto_do_pedido.quantidade * Produto_do_pedido.preco_unitario) AS Valor_Total
FROM funcionario
INNER JOIN mesa ON funcionario.id_funcionario = mesa.id_funcionario
INNER JOIN pedido ON pedido.numero_mesa = mesa.numero_mesa
INNER JOIN Produto_do_pedido ON Produto_do_pedido.numero_pedido = pedido.numero_pedido
GROUP BY funcionario.nome, mesa.numero_mesa
ORDER BY funcionario.nome;

SELECT produto.codigo_produto AS PRODUTO, mesa.numero_mesa AS NUMERO_DA_MESA
FROM produto
INNER JOIN Produto_do_pedido ON Produto_do_pedido.codigo_produto = produto.codigo_produto
INNER JOIN pedido ON pedido.numero_pedido = Produto_do_pedido.numero_pedido
INNER JOIN mesa ON mesa.numero_mesa = pedido.numero_mesa
WHERE mesa.numero_mesa = 1;

DELIMITER //

CREATE PROCEDURE REDEFINIDOR_DE_STATUS_DA_MESA_PARA_LIVRE (IN parametro INT)
BEGIN
UPDATE mesa
SET status = 'livre'
WHERE numero_mesa = parametro

END ;

DELIMITER ;
CREATE OR REPLACE FUNCTION relatorio_diario_quantidade_comprada()
RETURNS TABLE (data date, quantidade_comprada bigint) AS $$
BEGIN
    RETURN QUERY
    SELECT
        date(data_compra) AS data,
        sum(quantidade) AS quantidade_comprada
    FROM
        compras
    GROUP BY
        date(data_compra);
END;
$$ LANGUAGE plpgsql;

SELECT * FROM relatorio_diario_quantidade_comprada();
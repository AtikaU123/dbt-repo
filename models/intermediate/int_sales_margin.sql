SELECT
    p.products_id,
    s.date_date,
    s.orders_id,
    CAST(s.revenue AS FLOAT64) AS revenue,
    CAST(s.quantity AS FLOAT64) AS quantity,
    CAST(p.purchase_price AS FLOAT64) AS purchase_price,
    CAST(ROUND(CAST(s.quantity AS FLOAT64) * CAST(p.purchase_price AS FLOAT64), 2) AS FLOAT64) AS purchase_cost,
    CAST(ROUND(CAST(s.revenue AS FLOAT64) - CAST(s.quantity AS FLOAT64) * CAST(p.purchase_price AS FLOAT64), 2) AS FLOAT64) AS margin
FROM {{ ref('stg_raw__sales') }} s
LEFT JOIN {{ ref('stg_raw__product') }} p
    USING (products_id)
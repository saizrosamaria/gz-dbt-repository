SELECT 
    date_date,
    COUNT(DISTINCT(orders_id)) AS nb_transactions,
    ROUND(SUM(revenue),0) AS revenue,
    ROUND(SUM(margin),0) AS margin,
    ROUND(SUM(operational_margin),0) AS operational_margin,
    ROUND(SUM(purchase_cost),0) AS purchase_cost,
    ROUND(SUM(shipping_fee),0) AS shipping_fee,
    ROUND(SUM(logcost),0) AS logcost,
    ROUND(SUM(ship_cost),0) AS ship_cost,
    ROUND(SUM(quantity),0) AS quantity,
    ROUND(SUM(revenue) / NULLIF(COUNT(DISTINCT orders_id), 0), 2) AS average_basket
FROM {{ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC

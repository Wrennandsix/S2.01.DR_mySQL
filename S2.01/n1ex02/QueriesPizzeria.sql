-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat:
SELECT locality.name AS Locality , COUNT(`order`.product) AS Sold_Drinks
FROM locality
JOIN customer ON locality.locality_id = customer.locality
JOIN `order` ON customer.customer_id = `order`.customer_id
JOIN drink  ON `order`.product = drink.product_id
WHERE locality.locality_id = '1';

-- Llista quantes comandes ha efectuat un determinat empleat/da:

-- Llista comandes preparades en cuina per un treballador
SELECT worker.name, COUNT(`order`.order_id) AS Prepared_Orders
FROM worker 
LEFT JOIN `order` ON worker.worker_id = `order`.cook
WHERE worker.worker_id = '2'
GROUP BY worker.name;

-- LLista comandes repartides per un treballador
SELECT worker.name, COUNT(`orderToDelivery`.order_id) AS Delivered_Orders
FROM worker 
LEFT JOIN `orderToDelivery` ON worker.worker_id = `orderToDelivery`.deliveryMan_id
WHERE worker.worker_id = '1'
GROUP BY worker.name;






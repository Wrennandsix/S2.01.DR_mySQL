-- Llista el total de factures d'un client/a en un període determinat:
SELECT * FROM bill
WHERE buyerID = 35624158
  AND date BETWEEN '2023-01-01 00:00:00' AND '2024-01-01 00:00:00';
  
-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any:
Select * FROM glasses
JOIN bill ON glasses.glassesID = bill.glassesID
WHERE bill.sellerID = '21856354'
  AND YEAR(bill.date) = 2021;
  
-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.:
Select * FROM glasses
JOIN bill ON glasses.glassesID = bill.glassesID
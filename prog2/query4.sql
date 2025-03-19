CREATE VIEW Highest_Order_Salesman AS  
SELECT O.Ord_Date, S.Salesman_id, S.Name, O.Customer_id, O.Purchase_Amt  
FROM ORDERS O  
JOIN SALESMAN S ON O.Salesman_id = S.Salesman_id  
WHERE O.Purchase_Amt = (  
    SELECT MAX(Purchase_Amt)  
    FROM ORDERS  
    WHERE Ord_Date = O.Ord_Date  
);


/* 2. Привести пример функции на PL/SQL, возвращающей кол-во карт по номеру абонента. */


CREATE OR REPLACE FUNCTION CountOFCard 
(SUB_ID_INPUT NUMBER) 
RETURN NUMBER 
IS
ID_CARD NUMBER;
BEGIN 
SELECT COUNT(ID_CARD) 
INTO ID_CARD
FROM CARD
WHERE SUB_ID = SUB_ID_INPUT;
RETURN ID_CARD; 
END CountOFCard;
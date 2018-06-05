/* 3. Привести пример функции  на PL/SQL, возвращающей по номеру абонента данные по карте и абоненту в виде таблицы с полями MSISDN, PAN, EXPIRE. */

CREATE OR REPLACE TYPE TYPEFORFUNCTION AS OBJECT 
(
  MSISDN VARCHAR2(20),
  PAN VARCHAR2(20),
  EXPIRE_DATA DATE
);

CREATE OR REPLACE TYPE TABLEFORFUNCTION AS TABLE OF TYPEFORFUNCTION;

CREATE OR REPLACE FUNCTION RETURNDATA
(SUB_ID_INPUT NUMBER) 
RETURN TABLEFORFUNCTION
IS 
OUTTABLEPARAM TABLEFORFUNCTION;
BEGIN
SELECT CAST(
MULTISET(SELECT MSISDN, PAN
FROM CARD
INNER JOIN SUB
ON CARD.SUB_ID = SUB.ID_SUB
WHERE SUB_ID = SUB_ID_INPUT)
AS TABLEFORFUNCTION)
INTO OUTTABLEPARAM
FROM DUAL;
RETURN OUTTABLEPARAM;
END;

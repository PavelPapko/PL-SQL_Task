/* В системе необходимо регистрировать данные об абонентах и их банковских картах.
   Абонент характеризуется номером MSISDN. 
   Карта характеризуется номером PAN и сроком окончания действия EXPIRE.
   У одного абонента может быть несколько карт.

   1. Привести пример структуры таблиц 
   (лушче всего в виде SQL скрипта по их созданию; можно в виде картинки со схемой базы данных).
*/

CREATE TABLE SUB (
ID_SUB NUMBER GENERATED ALWAYS AS IDENTITY (MINVALUE 1 MAXVALUE 999999999999999) NOT NULL,
MSISDN VARCHAR2(20) NOT NULL,
CONSTRAINT SUB_PK PRIMARY KEY (ID_SUB)
)

CREATE TABLE CARD (
ID_CARD NUMBER GENERATED ALWAYS AS IDENTITY (MINVALUE 1 MAXVALUE 999999999999999) NOT NULL,
PAN VARCHAR2(20) NOT NULL,
EXPIRE_DATE DATE NOT NULL,
SUB_ID NUMBER,
CONSTRAINT CARD_PK PRIMARY KEY (ID_CARD),
CONSTRAINT CARD_FK FOREIGN KEY (SUB_ID) REFERENCES SUB(ID_SUB)
)
--1. Успешную транзакция (COMMIT)
START TRANSACTION;
INSERT INTO organization VALUES(NULL, 'Gel', 4, 300);
INSERT INTO organization VALUES(NULL, 'Belt', 5, 100);
INSERT INTO organization VALUES(NULL, 'Baldur', 12, 450);
COMMIT;
--2. Транзакцию с откатом (ROLLBACK)
START TRANSACTION;
INSERT INTO organization VALUES(NULL, 'Lel', 2, 230);
INSERT INTO organization VALUES(NULL, 'Coll', 7, 1230);
ROOLBACK;
INSERT INTO organization VALUES(NULL, 'Coldr', 4, 423);
COMMIT;
--3. Создать хранимую процедуру с параметрами и вызвать ее
DELIMITER //
CREATE PROCEDURE allWorkers(OUT allWork INT)
BEGIN
    SELECT SUM(number_worker) INTO allWork FROM organization;
END;
//
DELIMITER ;
CALL allWorkers(@a);
SELECT @a;

--4. Создать триггер и вызвать его
DELIMITER |
CREATE TRIGGER trig BEFORE INSERT ON organization
FOR EACH ROW BEGIN
INSERT INTO merchant SET id_merchant = NULL, full_name = 'Baal', age = 20, id_organization = 60;
END;
|
DELIMITER ;
INSERT INTO organization VALUES(NULL, 'Baal', 6, 170);

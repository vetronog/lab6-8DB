--4.1. LEFT JOIN двух таблиц + WHERE по 1 атрибуту
--получить имена продавцов организации Baal
EXPLAIN SELECT full_name FROM merchant
    LEFT JOIN organization ON organization.id_organization = merchant.id_organization
    WHERE organization.name = "Baal";
    
--4.2. RIGHT JOIN двух таблиц + WHERE по 1 атрибуту
--получить имена продавцов организации Baal
EXPLAIN SELECT full_name FROM organization
    RIGHT JOIN merchant ON organization.id_organization = merchant.id_organization
    WHERE organization.name = "Baal";

--4.3. LEFT JOIN двух таблиц + WHERE по 2 атрибутам из 1 таблицы
--получить id_organization в которых работает продавец с именем Kolya, которому 20 лет
EXPLAIN SELECT organization.id_organization FROM organization
    LEFT JOIN merchant ON organization.id_organization = merchant.id_organization
    WHERE full_name = "Kolya" AND merchant.age = 20;
    
--4.4.  LEFT JOIN двух таблиц + WHERE по 1 атрибуту из каждой таблицы 
--получить имена продавцов организации Baal
EXPLAIN SELECT full_name FROM merchant
    LEFT JOIN organization ON organization.id_organization = merchant.id_organization
    WHERE organization.name = "Baal" AND merchant.age > 20;

--4.5. LEFT JOIN трех таблиц + WHERE по 1 атрибуту из каждой таблицы
--получить имена продавцов, которые работают в организации "Baal", чей возраст больше 20, которые совершили продажу позднее 2015-01-01
EXPLAIN SELECT full_name FROM merchant
    LEFT JOIN organization ON organization.id_organization = merchant.id_organization
    LEFT JOIN sale ON merchant.id_merchant=sale.id_merchant
    WHERE organization.name = "Baal" AND merchant.age > 20 AND sale.sale_date > '2015-01-01';

-- 4.6 Подзапрос с IN
-- получить цены товаров в продажах с id 16, 21, 23
EXPLAIN SELECT  price FROM good
    WHERE id_good IN (SELECT id_good FROM good_in_sale WHERE id_sale IN (16, 21, 23));

-- 4.7 Подзапрос с одним из операторов (= > < >= <= <> != <=> LIKE)
-- получить цены товаров в продажах где id_sale больше или равно 1000
EXPLAIN SELECT  price FROM good
    WHERE id_good IN (SELECT id_good FROM good_in_sale WHERE id_sale >= 1000);
    
-- 4.8 ORDER BY 1 атрибут
-- получить продавцов по возрастанию возраста
EXPLAIN SELECT * from merchant WHERE age < 20 ORDER BY age;

-- 4.9 ORDER BY 2 атрибутам
-- получить продавцов по возрастанию возраста и имен по алфавиту
EXPLAIN SELECT * from merchant  WHERE merchant.age > 21 ORDER BY age, full_name;

SHOW DATABASES;
USE data2570001;

CREATE TABLE mystudent(UID INT, 名前 VARCHAR(20), 性別 VARCHAR(20), 高校名 VARCHAR(20), 自宅の市 VARCHAR(20), クラス VARCHAR(4)); 

CREATE TABLE tensu(ID INT, データベース INT, 人工知能 INT, 確率統計 INT);
DROP TABLE mystudent;

ALTER TABLE mystudent ADD 年齢 INT AFTER 性別;

ALTER TABLE seiseki ADD class INT AFTER name;
ALTER TABLE seiseki ADD 線形代数 INT AFTER tensu;
ALTER TABLE seiseki DROP 線形代数;
ALTER TABLE seiseki CHANGE id UID VARCHAR(20);
ALTER TABLE seiseki MODIFY UID INT;

SHOW FIELDS FROM mystudent;
SHOW FIELDS FROM tensu;

INSERT INTO seiseki(UID, name, tensu) VALUE(1, '甲南太郎', 80);
INSERT INTO seiseki(UID, name, tensu) VALUE(2, '神戸花子', 90);
INSERT INTO seiseki(UID, name, tensu) VALUE(3, '知能次郎', 70);

INSERT INTO mystudent VALUE(1001, 'SEOYEONGWOO', '男', '海外校', '神戸市', 1);
INSERT INTO mystudent VALUE(1002, '甲南良子', '女', '神戸二高', '神戸市', 2);
INSERT INTO mystudent VALUE(1003, '神戸太郎', '男', '神戸一高', '芦屋市', 3);
INSERT INTO mystudent VALUE(1004, '兵庫明子', '女', '神戸二高', '西宮市', 1);
INSERT INTO mystudent VALUE(1005, '東灘次郎', '男', '神戸一高', '明石市', 2);
INSERT INTO mystudent VALUE(1006, '岡本洋子', '女', '神戸二高', '神戸市', 3);

INSERT INTO tensu VALUE(1001, 70, 80, 90);
INSERT INTO tensu VALUE(1002, 60, 70, 70);
INSERT INTO tensu VALUE(1003, 40, 55, 40);
INSERT INTO tensu VALUE(1004, 80, 73, 80);
INSERT INTO tensu VALUE(1005, 60, 66, 40);
INSERT INTO tensu VALUE(1006, 50, 50, 60);

INSERT INTO seiseki VALUE(5, '鈴木一郎', 1, 80);
INSERT INTO seiseki VALUE(6, '山田恵子', NULL, 100);
INSERT INTO seiseki VALUE(4, 'SEOYEONGWOO', NULL, 100);


SET SQL_SAFE_UPDATES = 0;
UPDATE mystudent SET 名前 = '知能次郎' WHERE UID=1005;

DELETE FROM seiseki WHERE UID = 3;

SELECT * FROM seiseki ORDER BY tensu DESC;

SELECT * FROM mystudent;
SELECT * FROM tensu;

SELECT * FROM seiseki;


SHOW TABLES;
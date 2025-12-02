# 주키 설정
ALTER TABLE mystudent ADD PRIMARY KEY (UID);
SHOW FIELDS FROM mystudent;

CREATE TABLE gakusei (uid INT, name VARCHAR(20), age INT, PRIMARY KEY(uid));
SHOW FIELDS FROM gakusei;

# 외부키 설정
ALTER TABLE tensu ADD FOREIGN KEY (ID) REFERENCES mystudent (UID);

# 내부 결합
SELECT * FROM mystudent INNER JOIN tensu ON mystudent.UID = tensu.ID;

# 외부 결합
CREATE TABLE class (ID INT, クラス名 VARCHAR(20));
INSERT INTO class VALUE(1, 'さくら');
SHOW FIELDS FROM class;

SELECT * FROM mystudent LEFT OUTER JOIN class ON mystudent.クラス=class.ID;

# 우측 외부 결합
SELECT * FROM mystudent RIGHT OUTER JOIN class ON mystudent.クラス=class.ID;

# SELECT
SELECT * FROM mystudent;
SELECT UID, 名前 FROM mystudent WHERE 年齢>= 22;

SELECT UID, 名前 FROM mystudent WHERE 名前 LIKE '%子'; # mystudent のテーブルで名前に子で終わる人の UID と名前を表示する．
SELECT UID, 名前 FROM mystudent WHERE (名前 LIKE '%SEO%' ) and (性別 ='男'); # mystudent のデーブルで名前に南が付き性別が女性の人の UID と名前を表示する．

# 정렬
SELECT * FROM mystudent WHERE 性別='男' ORDER BY UID;
SELECT * FROM mystudent WHERE 性別='男' ORDER BY UID DESC;

# 중복 데이터 삭제
SELECT DISTINCT 自宅の市 FROM mystudent;

# 집약함수, group by
SELECT * FROM tensu;
SELECT count(*), avg(データベース), sum(人工知能), max(確率統計), min(確率統計) from tensu;
SELECT count(データベース) from tensu;
SELECT count(distinct データベース) from tensu;
SELECT 高校名, avg(年齢) from mystudent group by 高校名;
SELECT 高校名, avg(年齢) from mystudent where クラス=1 group by 高校名;

SELECT UID, 名前, 性別, データベース, 人工知能, 確率統計 from mystudent inner join tensu on mystudent.UID = tensu.ID;

# 演習問題
CREATE TABLE conv (UID INT, 店名 VARCHAR(10) ,県名 VARCHAR(10), 駅からの距離 INT, 広さ INT);
CREATE TABLE uriage11 (ID INT, サンドイッチの売り上げ INT, 売れ筋サンドイッチ VARCHAR(10), おでんの売り上げ INT, 売れ筋おでん VARCHAR(10));
SELECT * FROM conv;
SELECT * FROM uriage11;

INSERT INTO conv VALUE(1001, '灘', '兵庫', 200, 400);
INSERT INTO conv VALUE(1002, '梅田', '大阪', 500, 600);
INSERT INTO conv VALUE(1003, 'なんば', '大阪', 400, 300);
INSERT INTO conv VALUE(1004, '姫路', '兵庫', 350, 500);
INSERT INTO conv VALUE(1005, '西宮', '兵庫', 100, 650);
INSERT INTO conv VALUE(1006, '四条', '京都', 150, 600);
INSERT INTO conv VALUE(1007, '芦屋', '兵庫', 200, 400);
INSERT INTO conv VALUE(1008, '天満', '大阪', 600, 200);
INSERT INTO conv VALUE(1009, '烏丸', '京都', 450, 300);
INSERT INTO conv VALUE(1010, '心斎橋', '大阪', 300, 500);

INSERT INTO uriage11 VALUE(1001, 2000000, 'カツ', 2000000, '大根');
INSERT INTO uriage11 VALUE(1002, 1500000, 'ツナ', 2300000, '卵');
INSERT INTO uriage11 VALUE(1003, 1200000, '卵', 1200000, '大根');
INSERT INTO uriage11 VALUE(1004, 2000000, '野菜', 2500000, '卵');
INSERT INTO uriage11 VALUE(1005, 1600000, 'カツ', 1500000, 'こんにゃく');
INSERT INTO uriage11 VALUE(1006, 800000, '卵', 1200000, 'がんも');
INSERT INTO uriage11 VALUE(1007, 1200000, 'ツナ', 1000000, '大根');
INSERT INTO uriage11 VALUE(1008, 1700000, '野菜', 1700000, 'がんも');
INSERT INTO uriage11 VALUE(1009, 1000000, 'ツナ', 1000000, '卵');
INSERT INTO uriage11 VALUE(1010, 1300000, 'ツナ', 1300000, 'こんにゃく');

# (2)サンドイッチの売り上げの行数，最高値，平均値，最小値をもとめ表示しなさい．
SELECT COUNT(サンドイッチの売り上げ) AS 行数, MAX(サンドイッチの売り上げ) AS 最高値, AVG(サンドイッチの売り上げ) AS 平均値, MIN(サンドイッチの売り上げ) AS 最小 FROM uriage11;

# (3）売れ筋サンドイッチの種類毎の平均をもとめ，売れ筋サンドイッチの種類毎にその平均を表示しなさい
SELECT 売れ筋サンドイッチ AS サンド種類, AVG(サンドイッチの売り上げ) AS 平均売上 FROM uriage11 GROUP BY 売れ筋サンドイッチ;

# (4)店名，県名，おでんの売り上げ，売れ筋おでんを表示しなさい．
SELECT conv.店名,conv.県名, uriage11.おでんの売り上げ, uriage11.売れ筋おでん FROM conv JOIN uriage11 ON conv.UID = uriage11.ID;

# (5)卵が売れ筋サンドイッチの ID と店名と県名とサンドイッチの売り上げを表示しなさい
SELECT uriage11.ID, conv.店名, conv.県名, uriage11.サンドイッチの売り上げ FROM uriage11 JOIN conv ON uriage11.ID = conv.UID WHERE uriage11.売れ筋サンドイッチ = '卵';

# (6)県別の駅からの距離の平均を求め表示しなさい．
SELECT 県名, AVG(駅からの距離) AS 平均距離 FROM conv GROUP BY 県名;

# (7)卵が売れ筋おでんの店名と県名と広さとおでんの売り上げを表示しなさい．
SELECT conv.店名, conv.県名, conv.広さ, uriage11.おでんの売り上げ FROM conv JOIN uriage11 ON conv.UID = uriage11.ID WHERE uriage11.売れ筋おでん = '卵';
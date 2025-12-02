# (1) 演習 2で作成した convの UIDが 1007のデータを店名を堺，県名を大阪，駅からの距離を 700，広さを 400 に変更し，確認せよ
UPDATE conv SET 店名 = '堺', 県名 = '大阪', 駅からの距離 = 700, 広さ = 400 WHERE UID = 1007;
SELECT * FROM conv;

# (2) uriage11の売れ筋サンドイッチのフィールドの名前を No1SWに変更し，確認せよ
ALTER TABLE uriage11 CHANGE COLUMN 売れ筋サンドイッチ No1SW VARCHAR(10);
SELECT * FROM uriage11;

# (3) No1SW の右隣に No1SW 単価と No1SW 個数を INT 型で以下のように入れて確認せよ．この時野菜をポテサラに変え，またこんにゃくを糸コンに変えよ．
ALTER TABLE uriage11 ADD COLUMN No1SW単価 INT AFTER No1SW, ADD COLUMN No1SW個数 INT AFTER No1SW単価;

UPDATE uriage11
SET No1SW単価 = 150,
    No1SW個数 = 5000
WHERE ID = 1010;
    
SELECT * FROM uriage11;

# (4) No1SWが卵以外の No1SWの種類毎のサンドイッチの売り上げの平均を求め表示せよ．
SELECT No1SW, AVG(サンドイッチの売り上げ) AS 平均売上 FROM uriage11 WHERE No1SW != '卵' GROUP BY No1SW;

# (5) 県名毎のサンドイッチの売り上げの平均を求めて，県名と県名毎のサンドイッチの売り上げの平均を表示せよ
SELECT c.県名, AVG(u.サンドイッチの売り上げ) AS 平均売上 FROM uriage11 u JOIN conv c ON u.ID = c.UID GROUP BY c.県名;

# (6) 駅からの距離が 300 以上でかつ広さが 500 以上の店舗の ID とサンドイッチの売り上げとおでんの売り上げを表示せよ．
SELECT c.UID, u.サンドイッチの売り上げ, u.おでんの売り上げ FROM conv c JOIN uriage11 u ON c.UID = u.ID WHERE c.駅からの距離 >= 300 AND c.広さ >= 500;

# (7) 広さが 500の店舗の uriage11のすべてのフィールド名とその値を表示せよ
SELECT u.* FROM uriage11 u JOIN conv c ON u.ID = c.UID WHERE c.広さ = 500;


# (8) 売れ筋おでんが卵で No1SWがツナの店舗数を表示せよ．
SELECT COUNT(*) AS 店舗数 FROM uriage11 u WHERE u.売れ筋おでん = '卵' AND u.No1SW = 'ツナ';
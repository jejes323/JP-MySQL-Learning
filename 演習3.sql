# フィールド（属性）に別名をつける
# 필드(속성)에 별명을 붙이기
SELECT 高校名 AS '神戸の高校' FROM mystudent WHERE 高校名 = '神戸一高';

# IN演算子
# IN 연산자는 값이 괄호 안에 나열된 여러 값(값 리스트) 중 하나와 일치하는지 판단하는 연산자이다.
SELECT * FROM mystudent WHERE 高校名 IN ('海外高', '神戸二高');

# GROUP BY句によってグループ化されたデータに対し，検索条件を指定し絞り込むことができる
# GROUP BY 절로 그룹화된 데이터에 대해 조건을 지정하여 필터링할 수 있다.

	# 例３：サンドイッチの種類ごとの売り上げの合計を出す．
SELECT 売れ筋サンドイッチ, SUM(サンドイッチの売り上げ) AS 合計額 FROM uriage11 GROUP BY 売れ筋サンドイッチ;

	# 例４：サンドイッチの売り上げの合計が 3000000 円以上の売れ筋サンドイッチの品目の合計値を表示
SELECT 売れ筋サンドイッチ, SUM(サンドイッチの売り上げ) as 合計額 FROM uriage11 GROUP BY 売れ筋サンドイッチ HAVING sum(サンドイッチの売り上げ) >=3000000;

# サブクエリ クエリの中でクエリを書くことができる技術
# 서브쿼리 SELECT안에 다른 SELECT를 작성할 수 있음

	# 自分の名前の UID と同じ IDの tensu表の値が表示される．ANYは複数行を表示する場合に入れる．
SELECT * FROM tensu WHERE id=ANY(SELECT UID FROM mystudent WHERE 名前='SEOYEONGWOO');

# CASE 条件に合わせて処理を行います．SQL 文の if 文のようなものです
# CASE 조건에 따라 처리를 수행합니다. SQL에서 if 문과 같은 역할을 합니다.

	# 例６．tensu 表から人工知能が 60 点以上の人を合格，それ以外を不合格として，合否判定の属性に出力し，tensu 表のすべての属性とその値を表示する場合．
SELECT *,
	CASE
		WHEN 人工知能 >=60 THEN '合'
		ELSE '不合格'
	END AS 合否判定
FROM tensu;

# 例７．AND や OR で条件も記載できます．データベースと人工知能が 60 以上の人を合格，それ以外を不合格として tensu 表の合否判定の属性を作成し表示せよ
SELECT *,
	CASE
		WHEN データベース >= 60 AND 人工知能 >=60 THEN '合'
		ELSE '不合格'
	END AS 合否判定
FROM tensu;

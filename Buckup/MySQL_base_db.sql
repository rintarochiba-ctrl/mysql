-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: demo
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'経営管理部'),(2,'技術部'),(3,'営業部');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `job` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sal` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'松田',65,'社長',950000,1),(2,'山田',43,'部長',680000,2),(3,'北條',30,'営業マネージャー',600000,3),(4,'佐藤',28,'エンジニア',500000,2),(5,'鈴木',35,'エンジニア',550000,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'新規開発プロジェクト',4),(2,'マーケティングキャンペーン',3),(3,'製品改善プロジェクト',5);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-20 10:31:05

-- sql課題1

-- SELECT文: **全データ取得** 問題: employeeテーブルの全データを取得するSQL文を書いてください。
-- mysql> SELECT * FROM employee;
-- +----+--------+-----+--------------------------+--------+---------------+
-- | id | name   | age | job                      | sal    | department_id |
-- +----+--------+-----+--------------------------+--------+---------------+
-- |  1 | 松田   |  65 | 社長                     | 950000 |             1 |
-- |  2 | 山田   |  43 | 部長                     | 680000 |             2 |
-- |  3 | 北條   |  30 | 営業マネージャー         | 600000 |             3 |
-- |  4 | 佐藤   |  28 | エンジニア               | 500000 |             2 |
-- |  5 | 鈴木   |  35 | エンジニア               | 550000 |             2 |
-- +----+--------+-----+--------------------------+--------+---------------+

-- **特定の列を取得** 問題: employeeテーブルからnameとsal列のみを取得するSQL文を書いてください。
-- mysql> SELECT name,sal FROM employee;
-- +--------+--------+
-- | name   | sal    |
-- +--------+--------+
-- | 松田   | 950000 |
-- | 山田   | 680000 |
-- | 北條   | 600000 |
-- | 佐藤   | 500000 |
-- | 鈴木   | 550000 |
-- +--------+--------+

-- **WHERE句: 条件付き取得** 問題: employeeテーブルからsalが500,000以上のデータを取得してください。
-- mysql> SELECT * FROM employee WHERE sal >= 500000;
-- +----+--------+-----+--------------------------+--------+---------------+
-- | id | name   | age | job                      | sal    | department_id |
-- +----+--------+-----+--------------------------+--------+---------------+
-- |  1 | 松田   |  65 | 社長                     | 950000 |             1 |
-- |  2 | 山田   |  43 | 部長                     | 680000 |             2 |
-- |  3 | 北條   |  30 | 営業マネージャー         | 600000 |             3 |
-- |  4 | 佐藤   |  28 | エンジニア               | 500000 |             2 |
-- |  5 | 鈴木   |  35 | エンジニア               | 550000 |             2 |
-- +----+--------+-----+--------------------------+--------+---------------+

-- **ORDER BY句: 並び替え** 問題: employeeテーブルをsalの降順で並べ替えてください。
-- mysql> SELECT * FROM employee ORDER BY sal DESC;
-- +----+--------+-----+--------------------------+--------+---------------+
-- | id | name   | age | job                      | sal    | department_id |
-- +----+--------+-----+--------------------------+--------+---------------+
-- |  1 | 松田   |  65 | 社長                     | 950000 |             1 |
-- |  2 | 山田   |  43 | 部長                     | 680000 |             2 |
-- |  3 | 北條   |  30 | 営業マネージャー         | 600000 |             3 |
-- |  5 | 鈴木   |  35 | エンジニア               | 550000 |             2 |
-- |  4 | 佐藤   |  28 | エンジニア               | 500000 |             2 |
-- +----+--------+-----+--------------------------+--------+---------------+

-- **INSERT文: データの追加** 問題: employeeテーブルに以下のデータを追加するSQL文を書いてください。
-- mysql> INSERT INTO employee (name, age, job, sal) VALUES ('佐藤', 35, '営業', 550000);
-- Query OK, 1 row affected (0.01 sec)
-- mysql> SELECT * FROM employee;
-- +----+--------+-----+-----------------+---------+---------------+
-- | id | name   | age | job             | sal     | department_id |
-- +----+--------+-----+-----------------+---------+---------------+
-- |  1 | 松田   |  65 | 社長            | 1000000 |             1 |
-- |  2 | 山田   |  43 | 部長            |  630000 |             2 |
-- |  4 | 佐藤   |  28 | エンジニア      |  500000 |             2 |
-- |  5 | 鈴木   |  35 | エンジニア      |  600000 |             2 |
-- |  6 | 佐藤   |  35 | 営業            |  550000 |             3 |
-- +----+--------+-----+-----------------+---------+---------------+

-- **UPDATE文: データの更新** 問題: employeeテーブルの松田さんの月給を1,000,000に更新するSQL文を書いてください。
-- mysql> UPDATE employee SET sal = 1000000 WHERE name = "松田";
-- Query OK, 1 row affected (0.01 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0
-- mysql> SELECT name,sal FROM employee;
-- +--------+---------+
-- | name   | sal     |
-- +--------+---------+
-- | 松田   | 1000000 |
-- | 山田   |  630000 |
-- | 佐藤   |  500000 |
-- | 鈴木   |  600000 |
-- | 佐藤   |  550000 |
-- +--------+---------+

-- **DELETE文: データの削除** 問題: employeeテーブルから北條さんのデータを削除するSQL文を書いてください。
-- mysql> DELETE FROM project WHERE id=2;
-- Query OK, 1 row affected (0.02 sec)
-- mysql> DELETE FROM employee WHERE name="北條";
-- Query OK, 1 row affected (0.00 sec)
-- mysql> SELECT * FROM employee;
-- +----+--------+-----+-----------------+---------+---------------+
-- | id | name   | age | job             | sal     | department_id |
-- +----+--------+-----+-----------------+---------+---------------+
-- |  1 | 松田   |  65 | 社長            | 1000000 |             1 |
-- |  2 | 山田   |  43 | 部長            |  630000 |             2 |
-- |  4 | 佐藤   |  28 | エンジニア      |  500000 |             2 |
-- |  5 | 鈴木   |  35 | エンジニア      |  600000 |             2 |
-- |  6 | 佐藤   |  35 | 営業            |  550000 |             3 |
-- +----+--------+-----+-----------------+---------+---------------+

-- **COUNT関数: データ件数の取得** 問題: employeeテーブルのデータ件数を取得してください。
-- mysql> SELECT COUNT(*) AS count FROM employee;
-- +-------+
-- | count |
-- +-------+
-- |     5 |
-- +-------+

--**DISTINCT: 重複の排除job** 問題: employeeテーブルのjob列に含まれる重複を排除して取得してください。
-- mysql> SELECT DISTINCT job FROM employee;
-- +-----------------+
-- | job             |
-- +-----------------+
-- | 社長            |
-- | 部長            |
-- | エンジニア      |
-- | 営業            |
-- +-----------------+

--**GROUP BY: データのグループ化** 問題: employeeテーブルをjobごとにグループ化し、各jobごとの社員数を取得してください。
-- mysql> SELECT job,COUNT(*) AS count FROM employee GROUP BY job;
-- +-----------------+-------+
-- | job             | count |
-- +-----------------+-------+
-- | 社長            |     1 |
-- | 部長            |     1 |
-- | エンジニア      |     2 |
-- | 営業            |     1 |
-- +-----------------+-------+


--SQL課題2

--**HAVING: グループ条件** 問題: 各jobごとの社員数を取得し、社員数が2人以上のjobだけを表示してください。
-- mysql> SELECT job,COUNT(*) FROM employee GROUP BY job HAVING COUNT(*) >= 2;
-- +-----------------+----------+
-- | job             | COUNT(*) |
-- +-----------------+----------+
-- | エンジニア      |        2 |
-- +-----------------+----------+

--**INNER JOIN: テーブルの結合** 問題: employeeテーブルとdepartmentテーブルをdepartment_idで結合し、社員名と所属部署名を取得してください。
-- mysql> SELECT employee.name, department.department_name
--        FROM employee
--        INNER JOIN department ON employee.department_id = department.id;
-- +--------+-----------------+
-- | name   | department_name |
-- +--------+-----------------+
-- | 松田   | 経営管理部      |
-- | 山田   | 技術部          |
-- | 佐藤   | 技術部          |
-- | 鈴木   | 技術部          |
-- | 佐藤   | 営業部          |
-- +--------+-----------------+

--**LEFT JOIN: 左結合** 問題: employeeテーブルのすべての社員と、その部署を左結合で取得してください。
-- mysql> SELECT employee.name, department.department_name
--        FROM employee
--        LEFT JOIN department ON employee.department_id = department.id;
-- +--------+-----------------+
-- | name   | department_name |
-- +--------+-----------------+
-- | 松田   | 経営管理部      |
-- | 山田   | 技術部          |
-- | 佐藤   | 技術部          |
-- | 鈴木   | 技術部          |
-- | 佐藤   | 営業部          |
-- +--------+-----------------+

-- **サブクエリ: 条件の入れ子** 問題: 月給が全社員の平均月給より高い社員を取得してください。
-- mysql> SELECT * FROM employee WHERE sal > (SELECT AVG(sal) FROM employee);
-- +----+--------+-----+--------+---------+---------------+
-- | id | name   | age | job    | sal     | department_id |
-- +----+--------+-----+--------+---------+---------------+
-- |  1 | 松田   |  65 | 社長   | 1000000 |             1 |
-- |  2 | 山田   |  43 | 部長   |  680000 |             2 |
-- +----+--------+-----+--------+---------+---------------+

-- **ORDER BYとLIMITの組み合わせ** 問題: employeeテーブルから月給の高い順に3人を取得してください。
-- mysql> SELECT * FROM employee ORDER BY sal DESC LIMIT 3;
-- +----+--------+-----+-----------------+---------+---------------+
-- | id | name   | age | job             | sal     | department_id |
-- +----+--------+-----+-----------------+---------+---------------+
-- |  1 | 松田   |  65 | 社長            | 1000000 |             1 |
-- |  2 | 山田   |  43 | 部長            |  680000 |             2 |
-- |  5 | 鈴木   |  35 | エンジニア      |  550000 |             2 |
-- +----+--------+-----+-----------------+---------+---------------+

-- **ウィンドウ関数: 行番号の付与** 問題: employeeテーブルに対し、salの降順で行番号を付与して表示してください。
-- mysql> SELECT name, sal, ROW_NUMBER() OVER (ORDER BY sal DESC) AS row_num FROM employee;
-- mysql> SELECT name, sal, ROW_NUMBER() OVER (ORDER BY sal DESC) AS row_num FROM employee;
-- +--------+---------+---------+
-- | name   | sal     | row_num |
-- +--------+---------+---------+
-- | 松田   | 1000000 |       1 |
-- | 山田   |  680000 |       2 |
-- | 鈴木   |  550000 |       3 |
-- | 佐藤   |  550000 |       4 |
-- | 佐藤   |  500000 |       5 |
-- +--------+---------+---------+

-- **トランザクション: データ操作** 問題: 以下の操作をトランザクションで管理してください。
--  社員山田の月給を50,000減額する。
--  社員鈴木の月給を50,000増額する。
-- mysql> start TRANSACTION ;
-- UPDATE employee SET sal = sal-50000 WHERE name="山田";
-- UPDATE employee SET sal = sal+50000 WHERE name="鈴木";
-- mysql> commit;
-- mysql> SELECT * FROM employee;
-- +----+--------+-----+-----------------+---------+---------------+
-- | id | name   | age | job             | sal     | department_id |
-- +----+--------+-----+-----------------+---------+---------------+
-- |  1 | 松田   |  65 | 社長            | 1000000 |             1 |
-- |  2 | 山田   |  43 | 部長            |  630000 |             2 |
-- |  4 | 佐藤   |  28 | エンジニア      |  500000 |             2 |
-- |  5 | 鈴木   |  35 | エンジニア      |  600000 |             2 |
-- |  6 | 佐藤   |  35 | 営業            |  550000 |             3 |
-- +----+--------+-----+-----------------+---------+---------------+

-- **CASE文: 条件による値の変更** 問題: employeeテーブルのsalが600,000以上なら"高給", それ未満なら"普通"と表示してください。
-- mysql> SELECT name,sal,CASE WHEN sal >= 600000 THEN "高給" ELSE "普通" END AS sal_category FROM employee;
-- +--------+---------+--------------+
-- | name   | sal     | sal_category |
-- +--------+---------+--------------+
-- | 松田   | 1000000 | 高給         |
-- | 山田   |  630000 | 高給         |
-- | 佐藤   |  500000 | 普通         |
-- | 鈴木   |  600000 | 高給         |
-- | 佐藤   |  550000 | 普通         |
-- +--------+---------+--------------+

-- **複雑なサブクエリ: 最大値の取得** 問題: 月給が各部署内で最大の社員とその部署名を取得してください。
-- mysql>  SELECT e.name, e.sal, d.department_name AS 部署名
--         FROM employee AS e
--         INNER JOIN department AS d ON e.department_id = d.id
--         WHERE e.sal = (
--           SELECT MAX(sal)
--           FROM employee AS e
--           WHERE e.department_id = d.id
--         );
-- +----+--------+-----+--------+---------+---------------+
-- | id | name   | age | job    | sal     | department_id |
-- +----+--------+-----+--------+---------+---------------+
-- |  1 | 松田   |  65 | 社長   | 1000000 |             1 |
-- |  2 | 山田   |  43 | 部長   |  630000 |             2 |
-- +----+--------+-----+--------+---------+---------------+
-- 部署idが3の北條のデータは削除済みのため、表示されない。
--以下2パターン目
-- SELECT e.name, e.sal, d.department_name AS 部署名
-- FROM employee AS e
-- JOIN department AS d ON e.department_id = d.id
-- WHERE e.sal = (
--   SELECT MAX(sal)
--   FROM employee
--   WHERE department_id = d.id
-- );
-- +--------+---------+-----------------+
-- | name   | sal     | 部署名          |
-- +--------+---------+-----------------+
-- | 松田   | 1000000 | 経営管理部      |
-- | 山田   |  630000 | 技術部          |
-- +--------+---------+-----------------+

-- **FULL OUTER JOIN: 全結合** 問題: employeeテーブルとdepartmentテーブルを全結合し、どちらかに存在しないデータをNULLで補完して取得してください。
-- mysql> SELECT * FROM employee FULL OUTER JOIN department ON employee.department_id = department.id;
-- FULL OUTER JOINはMySQLではサポートされていないため、UNIONを使用して実現する。→今回は省略。
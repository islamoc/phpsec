<?php

	namespace phpsec;

	require (__DIR__ . "/../model.php");

	/**
	 * PDO_MySQL wrapper class.
	 * Extends the parent DatabaseModel class.
	 */

	class Database_pdo_mysql extends DatabaseModel {

		public function __construct () {
			$args = func_get_args ();
			if (!isset($args[0]))
				return false;
			if (count($args) > 1) {
				$dbConfig = new DatabaseConfig ('pdo_mysql',$args[0],$args[1],$args[2]);
				parent::__construct ($dbConfig);
				try {
					$this->dbh = new \PDO ("mysql:dbname={$dbConfig->dbname};host={$dbConfig->host};",$dbConfig->username,$dbConfig->password);
				}
				catch (\PDOException $e) {
					echo $e->getMessage();
					die();
				}
			}
			else if (get_class($args[0]) === "PDO") {
				$this->dbh = $args[0];
			}
			$this->dbh->setAttribute (\PDO::ATTR_ERRMODE, \PDO::ERRMODE_SILENT);
		}

		public function __destruct () {
			if (isset($this->dbh)) {
				$this->dbh = NULL;
			}
		}

		function prepare ($query) {
			return new DatabaseStatement_pdo_mysql ($this, $query);
		}

	}

	/**
	 * PDO_MySQL prepared statements class.
	 * Extends the parent DatabaseStatementModel class.
	 */

	class DatabaseStatement_pdo_mysql extends DatabaseStatementModel {

		public function __construct (Database_pdo_mysql $db, $query) {
			parent::__construct ($db, $query);
		}

	}

?>
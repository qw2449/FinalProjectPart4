<?php

require_once 'config.php';

class Database {

    private $error;
    private $stmt;
    private $conn;

    public function __construct() {
        $this->connect();
    }

    private function connect() {

        $this->conn = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        }

        return $this->conn;
    }

    public function query($query) {
        $this->stmt = $this->conn->prepare($query);
        if (!$this->stmt) {
            $this->error = "Prepare failed: " . $this->conn->error;
            die($this->error);
        }
        return $this;
    }

    public function bind($params = []) {
        $types = ''; 
        $values = []; 

        foreach ($params as $param => $value) {
            $types .= $this->getParamType($value);
            $values[] = &$params[$param]; 
        }

        if($types) {
            $this->stmt->bind_param($types, ...$values); 
        }
    }
    private function getParamType($value) {
        switch (true) {
            case is_int($value):
                return 'i';
            case is_double($value):
                return 'd';
            case is_string($value):
                return 's';
            default:
                return 'b'; 
        }
    }

    public function execute() {
        $success = $this->stmt->execute();
        if ($success) {
            return $this->stmt->get_result();
        } else {
            return false;
        }
        
    }

    public function execute1() {
        return $this->stmt->execute();
        
    }
    public function resultSet() {
        $this->execute();
        return $this->stmt->get_result()->fetch_all(MYSQLI_ASSOC);
    }

    public function close() {
        $this->conn->close();
    }
}

?>

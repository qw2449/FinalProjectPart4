<?php

class AdminController {
    private $db;
    private $auth;

    public function __construct($db, $auth) {
        $this->db = $db;
        $this->auth = $auth; // Auth
    }

    public function getAllEvaluations() {
        if (!$this->auth->isUserAdmin()) {
            return false;
        }

        $stmt = $this->db->prepare("SELECT * FROM evaluations");
        $stmt->execute();
        $result = $stmt->get_result();

        $evaluations = [];
        while ($row = $result->fetch_assoc()) {
            $evaluations[] = $row;
        }

        return $evaluations;
    }
}

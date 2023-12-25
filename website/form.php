<?php
require 'config.php'; 
session_start();


if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $age = $_POST['age'] ?: '63.0';
    $sex = $_POST['sex'] ?: '1.0';
    $cp = $_POST['cp'] ?: '1.0';
    $trestbps = $_POST['trestbps'] ?: '145.0';
    $chol = $_POST['chol'] ?: '233.0';
    $fbs = $_POST['fbs'] ?: '1.0';
    $restecg = $_POST['restecg'] ?: '2.0';
    $thalach = $_POST['thalach'] ?: '150.0';
    $exang = $_POST['exang'] ?: '0.0';
    $oldpeak = $_POST['oldpeak'] ?: '2.3';
    $slope = $_POST['slope'] ?: '3.0';
    $ca = $_POST['ca'] ?: '0.0';
    $thal = $_POST['thal'] ?: '6.0';

    $result = Capsule::select('CALL your_procedure(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)', [
        $age, $sex, $cp, $trestbps, $chol, $fbs, $restecg, $thalach, $exang, $oldpeak, $slope, $ca, $thal
    ]);

    echo "Number: " . $result[0]->number . "<br>";
    echo "Description: " . $result[0]->description;
}
?>
<link rel="stylesheet" type="text/css" href="style.css">
<div class="container">
    <h2>Form Submission</h2>
    <form method="post">
        Age: <input type="text" name="age" value="63.0"><br>
        Sex: <input type="text" name="sex" value="1.0"><br>
        CP: <input type="text" name="cp" value="1.0"><br>
        Trestbps: <input type="text" name="trestbps" value="145.0"><br>
        Chol: <input type="text" name="chol" value="233.0"><br>
        FBS: <input type="text" name="fbs" value="1.0"><br>
        Restecg: <input type="text" name="restecg" value="2.0"><br>
        Thalach: <input type="text" name="thalach" value="150.0"><br>
        Exang: <input type="text" name="exang" value="0.0"><br>
        Oldpeak: <input type="text" name="oldpeak" value="2.3"><br>
        Slope: <input type="text" name="slope" value="3.0"><br>
        CA: <input type="text" name="ca" value="0.0"><br>
        Thal: <input type="text" name="thal" value="6.0"><br>
        <input type="submit" value="Submit">
    </form>
</div>

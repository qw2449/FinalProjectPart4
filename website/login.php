<?php
require 'config.php'; 

session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $admin = Capsule::table('admin')->where('username', $username)->first();

    if ($admin && $admin->password === $password) {
        $_SESSION['logged_in'] = true;
        header("Location: form.php");
        exit;
    } else {
        echo "Invalid credentials!";
    }
}
?>
<link rel="stylesheet" type="text/css" href="style.css">

<div class="container">
    <h2>Login</h2>
    <form method="post">
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Login">
    </form>
    <div class="info">Please enter your credentials.</div>
</div>
<?php
require 'vendor/autoload.php';
use Illuminate\Database\Capsule\Manager as Capsule;

$config = require 'config.php';

$capsule = new Capsule;
$capsule->addConnection($config);
$capsule->setAsGlobal();
$capsule->bootEloquent();

session_start();

$username = $_SESSION['username'] ?? null;
$userId = $_SESSION['user_id'] ?? null;

$riskScore = Capsule::table('cardiovascular_chronic_disease_data')
                ->where('person_id', $userId)
                ->value('risk_score');

$insuranceProducts = Capsule::table('insurance_products')->get();
?>
<!DOCTYPE html>
<html lang="en">
<head>

</head>
<body>
    <?php if ($username): ?>
        <div class="container">
            <h1>Welcome, <?php echo $username; ?></h1>

            <div class="report-card">
                <h2>Risk Score: <?php echo $riskScore; ?></h2>
            </div>

            <div class="product-list">
                <?php foreach ($insuranceProducts as $product): ?>
                    <div class="product">
                        <h2><?php echo $product->name; ?></h2>
                        <p>Annual Premium: <?php echo $product->annual_premium; ?></p>
                        <p>Coverage: Up to <?php echo $product->coverage; ?></p>

                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    <?php else: ?>
    <?php endif; ?>
</body>
</html>

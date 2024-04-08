<?php
$host = 'localhost'; // Your database host
$db = 'hope_db'; // Your database name
$user = 'root'; // Your database username
$pass = 'awais123'; // Your database password
$charset = 'utf8mb4';

// Set up the DSN
$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES => false,
];

try {
    // Create a new PDO instance
    $pdo = new PDO($dsn, $user, $pass, $options);

    // Here you should fetch your data from the request and validate/sanitize it
    // For now, let's assume you're getting the data from a POST request directly

    // Prepare the SQL statement
    $stmt = $pdo->prepare("INSERT INTO complaints (Description_the_problem, date, region, Street_num, type_of_animal, Address) VALUES (?, ?, ?, ?, ?, ?)");

    // Replace '$_POST['...']' with the actual names of your form inputs
    $stmt->execute([
        $_POST['description'], // Description_the_problem
        $_POST['date'],        // date
        $_POST['region'],      // region
        $_POST['streetNum'],   // Street_num
        $_POST['typeOfAnimal'],// type_of_animal
        $_POST['address'],     // Address
    ]);

    echo json_encode(['status' => 'success']);
} catch (PDOException $e) {
    // If an error occurs, send it back
    echo json_encode(['status' => 'error', 'message' => $e->getMessage()]);
}
?>

<?php
include "../database/database.php";

try {
    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        // Get form data
        $username = $_POST['username'];
        $food = $_POST['food'];
        $bills = $_POST['bills'];
        $rent = $_POST['rent'];
        $transportation = $_POST['transportation'];
        
        $id = $_POST['id'];

        // Prepare the SQL query for updating
        $stmt = $conn->prepare("UPDATE tracker_tb SET username = ?, Food = ?, Bills = ?, Rent = ?, Transportation = ?, WHERE tracker_ID = ?");
        $stmt->bind_param("siiiii", $name, $food, $bills, $rent, $transportation, $id);

        // Execute the query
        if ($stmt->execute()) {
            header("Location: ../index.php");  // Redirect to the main page
            exit;
        } else {
            echo "Operation failed";
        }
    }

} catch (\Exception $e) {
    echo "Error: " . $e;
}

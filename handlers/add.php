<?php
include '../database/database.php'; // Fix the include path

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Get data from the form
    $username = $_POST['Username'];
    $food = $_POST['food'];
    $bills = $_POST['bills'];
    $rent = $_POST['rent'];
    $transportation = $_POST['transportation'];
    $total_cost = $_POST['total_cost'];
    
    // Prepare the SQL query to insert the data
    $stmt = $conn->prepare("INSERT INTO tracker_tb (Username, Food, Bills, Rent, Transportation, Total_Cost) VALUES (?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("siiiii", $username, $food, $bills, $rent, $transportation, $total_cost);
    
    if ($stmt->execute()) {             
                    header("Location: ../index.php");             
                    exit; 
      }
    if ($stmt->execute()) {
        echo "Data added successfully!";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
    $conn->close();
}
?>

<?php
include '../database/database.php';

try {
    // Get the ID from the URL
    $id = $_GET['id'];

    // Prepare the query to fetch the data for the given ID
    $stmt = $conn->prepare("SELECT * FROM tracker_tb WHERE tracker_ID = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        // Fetch the record for editing
        $tracker = $result->fetch_assoc();
    } else {
        die("Record not found");
    }
    $stmt->close();
} catch (\Exception $e) {
    echo "Error: " . $e;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Update Monthly Expense</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container d-flex justify-content-center mt-5">
        <div class="col-4">
            <h1>Edit Monthly Expense</h1>
            <form action="../handlers/update.php" method="POST">
                <input type="hidden" name="id" value="<?= $tracker['tracker_ID'] ?>" />
                
                <div class="mb-3">
                    <label for="food" class="form-label">Food</label>
                    <input type="number" name="food" class="form-control" value="<?= $tracker['Food'] ?>" required />
                </div>
                
                <div class="mb-3">
                    <label for="bills" class="form-label">Bills</label>
                    <input type="number" class="form-control" name="bills" value="<?= $tracker['Bills'] ?>" required />
                </div>
                
                <div class="mb-3">
                    <label for="rent" class="form-label">Rent</label>
                    <input type="number" class="form-control" name="rent" value="<?= $tracker['Rent'] ?>" required />
                </div>
                
                <div class="mb-3">
                    <label for="transportation" class="form-label">Transportation</label>
                    <input type="number" class="form-control" name="transportation" value="<?= $tracker['Transportation'] ?>" required />
                </div>
                
                <button type="submit" class="btn btn-outline-dark">Save Changes</button>
            </form>
        </div>
    </div>
</body>
</html>

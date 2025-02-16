<?php

include('C:/xampp/htdocs/m/database/database.php');

$query = "SELECT * FROM tracker_tb ORDER BY DateTime DESC";


$result = $conn->query($query);

if (!$result) {
    
    die("Error executing query: " . $conn->error);
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Expenses Tracker</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
  <link href="style.css" rel="stylesheet">
</head>
<body>

<div class="wrapper">
  <div class="text-black p-5 text-center">
    <h1>Expenses Tracker</h1>
  </div>
  
  <!-- Form for adding expenses -->
  <div class="container">
    <form class="form" action="handlers/add.php" method="POST">
      <div class="row p-1 text-center">
        <div class="col">
          <h2>Food</h2>
          <input type="number" name="food" class="form-control small-input" required>
        </div>
        <div class="col">
          <h2>Bills</h2>
          <input type="number" name="bills" class="form-control small-input" required>
        </div>
      </div>

      <div class="row p-3 text-center">
        <div class="col">
          <h2>Rent</h2>
          <input type="number" name="rent" class="form-control small-input" required>
        </div>
        <div class="col">
          <h2>Transportation</h2>
          <input type="number" name="transportation" class="form-control small-input" required>
        </div>
      </div>

      <div class="row p-3 text-center">
        <h2>Name</h2>
        <input type="text" name="Username" class="form-control small-input" required>
      </div>
      <!-- Submit button -->
      <div class="row p-3 text-center">
        <button type="submit" class="btn btn-outline-dark small-input">ADD</button>
      </div>
    </form>

    <!-- Display data in a table -->
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Name</th>
          <th>Food</th>
          <th>Rent</th>
          <th>Bills</th>
          <th>Transportation</th>
          <th>Total Cost</th>
          <th>Date</th>
        </tr>
      </thead>
      <tbody>
        <?php while ($row = $result->fetch_assoc()): ?>
          <tr>
            <td><?php echo $row['Username']; ?></td>
            <td><?php echo $row['Food']; ?></td>
            <td><?php echo $row['Rent']; ?></td>
            <td><?php echo $row['Bills']; ?></td>
            <td><?php echo $row['Transportation']; ?></td>
            <td><?php echo $row['Total_Cost']; ?></td>
            <td><?php echo $row['DateTime']; ?></td>
            <td>
              <a href="/m/views/edit.php?id=<?php echo $row['tracker_ID']; ?>" class="btn btn-warning">Edit</a>
              <a href="/m/handlers/delete.php?id=<?php echo $row['tracker_ID']; ?>" class="btn btn-danger">Delete</a>
            </td>
          </tr>
        <?php endwhile; ?>
      </tbody>
    </table>

    
    <!-- money generator -->
    <div class="money-container">
    <div class="money">&#128181;</div> <!-- 💵 -->
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
    <div class="money">&#128181;</div>
  </div>
</div>

</body>
</html>

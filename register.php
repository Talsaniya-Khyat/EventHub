<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Register</title>
  <?php require 'utils/styles.php'; ?><!--css links. file found in utils folder-->

</head>

<body>
  <?php require 'utils/header.php'; ?>
  <div class="content"><!--body content holder-->
    <div class="container">
      <div class="col-md-6 col-md-offset-3">
        <form method="POST">

          <label>Student Rollno:</label><br>
          <input type="text" name="Rollno" class="form-control" required><br><br>

          <label>Student Name:</label><br>
          <input type="text" name="name" class="form-control" required><br><br>

          <label>Branch:</label><br>
          <input type="text" name="branch" class="form-control" required><br><br>

          <label>Semester:</label><br>
          <input type="text" name="sem" class="form-control" required><br><br>

          <label>Email:</label><br>
          <input type="text" name="email" class="form-control" required><br><br>

          <label>Phone:</label><br>
          <input type="text" name="phone" class="form-control" required><br><br>

          <label>College:</label><br>
          <input type="text" name="college" class="form-control" required><br><br>

          <button type="submit" name="update" required>Submit</button><br><br>
          <a href="Rollno.php"><u>Already registered ?</u></a>
        </form>
      </div>
    </div>
  </div>

  <?php require 'utils/footer.php'; ?>

  <?php
  require 'classes/db1.php';//db connection
  if (isset($_POST["update"])) {
    $Rollno = $_POST["Rollno"];
    $name = $_POST["name"];
    $branch = $_POST["branch"];
    $sem = $_POST["sem"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $college = $_POST["college"];

    if (!empty($Rollno) || !empty($name) || !empty($branch) || !empty($sem) || !empty($email) || !empty($phone) || !empty($college)) {
      include 'classes/db1.php';
      $INSERT = "INSERT INTO participant (Rollno, name,branch,sem,email,phone,college) VALUES('$Rollno','$name','$branch','$sem','$email','$phone','$college')";

      try {
        if ($conn->query($INSERT) === true) {
          echo "<p>Registered Successfully!</p>";
        } else {
          echo "<p>Error: " . $INSERT . "<br>" . $conn->error . "</p>";
        }
      } catch (\Throwable $th) {
        echo "Exception occurred: $th";
      }

      $conn->close();
    } else {
      echo "<p>All fields are required</p>";
    }
  }
  ?>
</body>

</html>
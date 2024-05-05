<?php
require_once 'utils/header.php';
require_once 'utils/styles.php';

$Rollno = $_POST['Rollno'];

include_once 'classes/db1.php';

$query = "SELECT * FROM registered r
          JOIN staff_coordinator s ON r.event_id = s.event_id
          JOIN event_info ef ON r.event_id = ef.event_id
          JOIN student_coordinator st ON r.event_id = st.event_id
          JOIN events e ON r.event_id = e.event_id
          WHERE r.Rollno = '$Rollno'";

$result = mysqli_query($conn, $query);
?>

<div class="content">
    <div class="container">
        <h1>Registered Events</h1>
        <?php if (mysqli_num_rows($result) > 0) { ?>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Student Coordinator</th>
                        <th>Staff Coordinator</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Location</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($result)) { ?>
                        <tr>
                            <td><?php echo $row['event_title']; ?></td>
                            <td><?php echo $row['st_name']; ?></td>
                            <td><?php echo $row['name']; ?></td>
                            <td><?php echo $row['Date']; ?></td>
                            <td><?php echo $row['time']; ?></td>
                            <td><?php echo $row['location']; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php } else {
            echo 'Not Yet Registered for any events';
        } ?>
    </div>
</div>

<?php
// Fetch not registered events
$query = "SELECT * FROM events e
          LEFT JOIN registered r ON e.event_id = r.event_id AND r.Rollno = '$Rollno'
          WHERE r.event_id IS NULL";

$result = mysqli_query($conn, $query);
?>

<div class="content">
    <div class="container">
        <h1>Not Registered Events</h1>
        <?php if (mysqli_num_rows($result) > 0) { ?>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Event Name</th>
                        <th>Student Coordinator</th>
                        <th>Staff Coordinator</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Location</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = mysqli_fetch_array($result)) { ?>
                        <tr>
                            <td><?php echo $row['event_title']; ?></td>
                            <td><?php echo $row['st_name']; ?></td>
                            <td><?php echo $row['name']; ?></td>
                            <td><?php echo $row['Date']; ?></td>
                            <td><?php echo $row['time']; ?></td>
                            <td><?php echo $row['location']; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php } else {
            echo 'No Not Registered Events found';
        } ?>
    </div>
</div>

<?php include 'utils/footer.php'; ?>
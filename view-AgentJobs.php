<?php
$username = "root";
$password = "";
$dbName = "blastonburyfestival";
$servername = "localhost";
$port = 3306;

$connect = mysqli_connect($servername, $username, $password,$dbName,$port);
if ($connect->connect_error) {
die("Connection failed: " . $connect->connect_error);
}
echo "Connected successfully";

$sql = "SELECT * FROM blastonburyfestival.agentjobs";
$result = $connect->query($sql);

echo "<html><body><br><br><h2 style=' text-indent: 180px;'>    AgentJobs View</h2><hr color='green'>";

echo "<table style=' width: 40%; '><tr><th style='border-bottom: 1px solid #ddd; height: 50px; background-color: #04AA6D;
  color: white; '>AGENT ID</th><th style='border-bottom: 1px solid #ddd; height: 50px;background-color: #04AA6D;
  color: white; '>JOBTYPE</th></tr>";


if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<tr><td style='text-align: center; border-bottom: 1px solid #ddd; 
            height: 40px;'>" ."AGENT: "
            . $row["AGENT"]."</td><td style='text-align: center; border-bottom: 1px solid #ddd; height: 40px;'>"
            ."JOBTYPE: ". $row["JOBTYPE"]."</td></tr>";
    }
} else {
    echo "0 results";
}
echo "</table></body></html>";

$connect->close();
?>



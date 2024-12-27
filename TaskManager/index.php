<?php
include("connection.php");
$path=$_SERVER['REQUEST_URI'];
$urisegments = explode("/",$path);
$pathname = $urisegments[3];

if($pathname=="add"){
    if($_POST['taskname']){
        $taskname = $_POST['taskname'];
        $description = $_POST['description'];
        $query = "insert into task_tbl(taskName,description)values('$taskname','$description')";
        $res= $connection->query($query);
        if($res){
            echo json_encode(["status"=>200,"msg"=>"Data successfully inserted"]);
        }

    }
}

if ($pathname == "view") {
    $query = "SELECT * FROM task_tbl";
    $res = $connection->query($query);

    if ($res->num_rows > 0) {
        $data = [];
        while ($row = $res->fetch_assoc()) {
            $data[] = $row;
        }
        echo json_encode(["status" => 200, "data" => $data]);
    } else {
        echo json_encode(["status" => 404, "msg" => "No data found"]);
    }
}

if ($pathname == "search") {

    if (isset($_POST['taskname'])) {
        $searchTerm = "%" . $_POST['taskname'] . "%";

         $query = "SELECT * FROM task_tbl WHERE taskName LIKE '$searchTerm'";
        $res = $connection->query($query);

        if ($res->num_rows > 0) {
            $tasks = [];
            while ($row = $res->fetch_assoc()) {
                $tasks[] = $row;
            }
            echo json_encode(["status" => 200, "msg" => "Search results found", "data" => $tasks]);
        } else {
            echo json_encode(["status" => 404, "msg" => "No tasks found"]);
        }
    } else {
        echo json_encode(["status" => 400, "msg" => "Invalid or missing 'taskname' parameter"]);
    }
}

if ($pathname == "update") {
    if ($_POST['taskid'] && $_POST['taskname']) {
        $taskid = $_POST['taskid'];
        $taskname = $_POST['taskname'];
        $description = $_POST['description'];
        
        $query = "UPDATE task_tbl SET taskName = '$taskname', description = '$description' WHERE taskId = '$taskid'";
        $res = $connection->query($query);
        
        if ($res) {
            echo json_encode(["status" => 200, "msg" => "Data successfully updated"]);
        } else {
            echo json_encode(["status" => 500, "msg" => "Failed to update data"]);
        }
    } else {
        echo json_encode(["status" => 400, "msg" => "Task ID and Task Name are required"]);
    }
}

 if($pathname == "delete") {
        if($_POST['taskid']) {
            $taskid = $_POST['taskid'];
            $query = "DELETE FROM task_tbl WHERE taskId = '$taskid'";
            $res = $connection->query($query);
            if($res) {
                echo json_encode(["status" => 200, "msg" => "Data successfully deleted"]);
            } else {
                echo json_encode(["status" => 500, "msg" => "Failed to delete data"]);
            }
        } else {
            echo json_encode(["status" => 400, "msg" => "Task ID is required"]);
        }
    }


?>
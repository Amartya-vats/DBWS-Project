<?php
    include('../config.php');
    $table_name = mysqli_real_escape_string($conn, $_GET['table']);
    $attribute = mysqli_real_escape_string($conn, $_GET['column']);
    $like = mysqli_real_escape_string($conn, $_GET['like']);
    $query = "SELECT DISTINCT {$attribute} FROM {$table_name} WHERE {$attribute} LIKE '{$like}%'";
    $result = mysqli_query($conn,$query);
    $filtered_data = mysqli_fetch_all($result, MYSQLI_ASSOC);
    mysqli_free_result($result);
    echo json_encode($filtered_data);
    mysqli_close($conn);
?>
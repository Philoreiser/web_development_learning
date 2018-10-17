<?php
include "pdo_sql.php";

function togetherSelectSql() {

    $stmtPrepare = ["sql"=>"", "parameters"=>[] ];   

    $para = array();
    $sql = "SELECT * FROM together ";
    $where = "WHERE ";
    $isCond = false;

    if ( isset($_REQUEST['class']) ) {
        $where .= "class = ? ";
        array_push( $para, $_REQUEST['class']);
        $isCond = true;
    }

    if ( isset($_REQUEST['range']) && isset($_REQUEST['lat']) && isset($_REQUEST['lng']) ) {
        if ($isCond) {
            $where .= " AND ";
        }
        $where .= " isInRange(?,?,?, lat, lng) = 1";
        array_push( $para, $_REQUEST['range'], $_REQUEST['lat'], $_REQUEST['lng']);
        $isCond = true;
        
    }

    if (!$isCond) {
        $where = "";
    }

    $stmtPrepare["sql"] = $sql . $where;
    $stmtPrepare["parameters"] = $para;

    return $stmtPrepare;
}


// $class = $_REQUEST['class'];
// $lat = $_REQUEST['lat'];
// $lng = $_REQUEST['lng'];
// $myRange = $_REQUEST['range'];

$pdo = @new pdo($pdo_dsn, $db_user, $db_password, $pdo_opt);
// $sql = "SELECT * FROM together WHERE class='美食'";
// echo togetherSelectSql($class) . '<br>';
// $sql = togetherSelectSql($class);
$stmtPrepare = togetherSelectSql();

$sql = $stmtPrepare["sql"];
// echo $sql . '<br>';

$stmt = $pdo->prepare($sql);
// $stmt->execute();
$stmt->execute($stmtPrepare["parameters"]);
$rs = $stmt->fetchAll(PDO::FETCH_ASSOC);

// var_dump($rs);
// foreach ($rs as $obj) {
//     foreach ($obj as $key => $value) {
//         echo "{$key}:{$value}" . '<br>';
//     }
//     echo '<br>';
// }


$json = json_encode($rs);
echo $json;

?>
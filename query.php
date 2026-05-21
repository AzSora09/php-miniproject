<?php
session_start();

if (isset($_POST["addtocart"])) {
    if (isset($_SESSION["Cart"])) {
        $count = count($_SESSION["Cart"]);
        $_SESSION["Cart"][$count] = array(
            "id" => $_POST["pid"],
            "name" => $_POST["pname"],
            "price" => $_POST["pprice"],
            "image" => $_POST["pimg"],
            "qty" => $_POST["pqty"]
        );
    } else {
        $_SESSION["Cart"][0] = array(
            "id" => $_POST["pid"],
            "name" => $_POST["pname"],
            "price" => $_POST["pprice"],
            "image" => $_POST["pimg"],
            "qty" => $_POST["pqty"]
        );
    }
}
?>
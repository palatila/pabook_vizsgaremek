<?php

    session_start();

    if(isset($_GET["action"])){

        $action = $_GET["action"];
        $product_id = isset($_GET["id"]) ? $_GET["id"] : null;

        if(!isset($_SESSION["cart"])){

            $_SESSION["cart"] = array();
        }

        switch($action){

            case "add":
                if(!isset($_SESSION["cart"][$product_id])){

                    $_SESSION["cart"][$product_id] = 0;
                }
                $_SESSION["cart"][$product_id]++;
                echo "<META HTTP-EQUIV=Refresh CONTENT='0; URL=cart.php' />";
            break;

            case "remove":
                $_SESSION["cart"][$product_id]--;
                if($_SESSION["cart"][$product_id] == 0){

                    unset($_SESSION["cart"][$product_id]);

                    if(empty($_SESSION["cart"])){

                        unset($_SESSION["cart"]);
                    }
                }
                echo "<META HTTP-EQUIV=Refresh CONTENT='0; URL=cart.php' />";
            break;

            case "empty":
                unset($_SESSION["cart"]);
                echo "<META HTTP-EQUIV=Refresh CONTENT='0; URL=cart.php' />";
            break;

        }
    }
<?php  require_once ('config.inc.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="js/common_functions.js"></script>
    <title>PA Book - Kosár</title>
</head>
<body>
    <div id="user_navigation"></div>


<div id="cart" class="container text-center justify-content-center mt-5 shadow-sm">
    <h2 id="cart_text" class="my3">Kosár tartalma</h2>

    <table width="80%" align="center" cellpadding="8" class="justify-content-center text-center">

        <tr>
            <th>Szerző</th>
            <th>Cím</th>
            <th>Kategoria</th>
            <th>Bruttó ár</th>
            <th>Darab</th>
            <th>Érték</th>
            <th> <a href="cart_move.php?action=empty"> <i class="fas fa-trash-alt"></i> </a> </th>
        </tr>

        <?php

            $cart_price = 0;

            if(isset($_SESSION["cart"])){

                foreach($_SESSION["cart"] as $product_id => $bit){

                    $sql = "SELECT * FROM product WHERE id='$product_id'";

                    $result = mysqli_query($db, $sql);

                    while($row = mysqli_fetch_array($result)){

                        $author = $row["author"];
                        $title = $row["title"];
                        $category_id = $row["category_id"];
                        $price = $row["price"];
                        $sum_price = $price * $bit;

                        echo "

                            <tr align='center'>
                                <td>".$author."</td>
                                <td>".$title."</td>
                                <td>".$category_id."</td>
                                <td>". number_format($price,0,".",".") ." Ft</td>
                                <td>".$bit."</td>                                
                                <td>". number_format($sum_price,0,".",".") ." Ft</td>
                                <td>
                                    <a href='cart_move.php?id=$product_id&action=add'> <i class='fas fa-plus'></i> </a>
                                    <a href='cart_move.php?id=$product_id&action=remove'> <i class='fas fa-minus'></i> </a>
                                </td>
                            </tr>
                        
                        ";

                        $cart_price += $sum_price;
                    }


                }
            }
            else{
                
                echo "<h2 align='center'>A kosár üres!</h2>";
            }

        ?>

        <tr>
            <td colspan="7" align="right">
                <strong>Végösszeg: </strong><?php echo number_format($cart_price,0,".",".")  ?> Ft
            </td>
        </tr>

    </table>

    <?php

        if($_SESSION["customer_email"] == true){

            echo "<a href='order.php' class='order btn btn-success mb-3'>Megrendelem</a>";
        }
        else{

            echo "<a href='login.php' class='order btn btn-success mb-3'>Rendelés leadásához kérjük jelentkezzen be!</a>";
        }

    ?>

    
</div>

<div id="footer"></div>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
       $("#user_navigation").load("user_navigation.html");

        $("#footer").load("footer.html");
    </script> 

</body>
</html>
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
    <title>PA Book - Rendelés</title>
</head>
<body>
    <div id="user_navigation"></div>

<div id="" class="container text-center justify-content-center mt-5 shadow">
   <h2 class="text-center my-3">Megrendelés összesítése</h2>

   <table align="center" width="80%" cellpadding="8" class="justify-content-center text-center shadow-sm py-3">
        <tr>
            <th>Szerző</th>
            <th>Cím</th>
            <th>Kategoria</th>
            <th>Bruttó ár</th>
            <th>Darab</th>
            <th>Érték</th>
        </tr>

        <?php
            $cart_price = 0;

            if(isset($_SESSION["cart"])){

                foreach($_SESSION["cart"] as $product_id => $quantity){

                    $sql = "SELECT * FROM product WHERE id='$product_id'";

                    $result = mysqli_query($db, $sql);

                    while($row = mysqli_fetch_array($result)){

                        $author = $row["author"];
                        $title = $row["title"];
                        $category_id = $row["category_id"];
                        $price = $row["price"];
                        $sum_price = $price * $quantity;

                        echo "

                            <tr align='center'>
                                <td>".$author."</td>
                                <td>".$title."</td>
                                <td>".$category_id."</td>
                                <td>".number_format($price,0,".",".")." Ft</td>
                                <td>".$quantity."</td>
                                <td>".number_format($sum_price,0,".",".")." Ft</td>

                            </tr>
                        
                        ";

                        $cart_price += $sum_price;
                    }
                }
            }

        ?>

        <tr>
            <td colspan="7" align="right">
                <strong>Végösszeg: </strong> <?php echo number_format($cart_price,0,".",".") ?> Ft
            </td>
        </tr>

   </table>




   <?php

        $error = "";
        $error2 = "";

        if(isset($_POST["order-btn"]) && (isset($_POST["check"]) == 1)){

            $billing_postal_code = $_POST["billing_postal_code"];
            $billing_settlement = $_POST["billing_settlement"];
            $billing_address = $_POST["billing_address"];
            $delivery_postal_code = $_POST["delivery_postal_code"];
            $delivery_settlement = $_POST["delivery_settlement"];
            $delivery_address = $_POST["delivery_address"];
            $payment_option = $_POST["payment_option"];
            $shipping_option = $_POST["shipping_option"];
           
            if(empty($billing_postal_code) || empty($billing_settlement) || empty($billing_address) || empty($delivery_postal_code) || empty($delivery_settlement) || empty($delivery_address) || empty($payment_option) || empty($shipping_option)){

                $error = "Rendelés leadásához minden mező kitöltése kötelező!";
            }
            else{
                $sql = "INSERT INTO order_header(customer_id, billing_postal_code, billing_settlement, billing_address, delivery_postal_code, delivery_settlement, delivery_address, payment_option, shipping_option, order_status) VALUES(" . $_SESSION['customer_id'] . ", '" . $billing_postal_code . "', '" . $billing_settlement . "', '" . $billing_address . "', '" . $delivery_postal_code . "', '" . $delivery_settlement . "', '" . $delivery_address . "', '" . $payment_option . "', '". $shipping_option . "', 'N')";
                mysqli_query($db, $sql);
                if ($db->affected_rows > 0) {
                  $order_id = mysqli_insert_id($db);
                  foreach($_SESSION["cart"] as $product_id => $quantity){
                    $sql = "INSERT INTO order_item(order_id, product_id, quantity, price) VALUES(" . $order_id . ", " . $product_id . ", " . $quantity . ", " . $price . ")";
                    mysqli_query($db, $sql);
                  }
  
                  echo "<h3 style='color: green; text-align: center;'>Rendelésed sikeresen rögzítettük!</h3>";
                  unset($_SESSION["cart"]);
                  echo "<META HTTP-EQUIV=Refresh CONTENT='1; URL=order.php' />";
                }
                else {
                  echo "<h3 style='color: red; text-align: center;'>A rendelés mentése sikertelen!</h3>";
                }
            }
        }
        else if(isset($_POST["order"]) && (isset($_POST["check"]) == 0)){

            $error2 = "Vásárlási feltételek elfogadása kötelező!";

            $first_name = $_POST["first_name"];
            $last_name = $_POST["last_name"];
            $email = $_POST["email"];
            $billing_postal_code = $_POST["billing_postal_code"];
            $billing_settlement = $_POST["billing_settlement"];
            $billing_address = $_POST["billing_address"];
            $delivery_postal_code = $_POST["delivery_postal_code"];
            $delivery_settlement = $_POST["delivery_settlement"];
            $delivery_address = $_POST["delivery_address"];
            $payment_option = $_POST["payment_option"];
            $shipping_option = $_POST["shipping_option"];
           
            if(empty($first_name) || empty($last_name) || empty($email) || empty($billing_postal_code) || empty($billing_settlement) || empty($billing_address) || empty($delivery_postal_code) || empty($delivery_settlement) || empty($delivery_address) || empty($payment_option) || empty($shipping_option)){

            $error = "Rendelés leadásához minden mező kitöltése kötelező!";
            }
            
        }




   ?>


   <div id="order" class="container text-center justify-content-center w-50 pb-5">
            
        <form action="" name="order_form" method="post" class="text-center justify-content-center">
            
            <h2 class="d-block"> <?php if(!empty($error)){echo $error;} ?> </h2>

            <label for="last_Name" class="form-label py-2">Vezetéknév</label>
            <input type="text" class="form-control py-2" name="last_name" value="<?php echo $_SESSION['last_name'];?>" readony>
            <label for="first_name" class="form-label py-2">Keresztnév</label>
            <input type="text" class="form-control py-2"" name="first_name" value="<?php echo $_SESSION['first_name'];?>" readony>
            <label for="email" class="form-label py-2">Email</label>
            <input type="text" class="form-control py-2"" name="email" value="<?php echo $_SESSION['customer_email'];?>" readony>
            
            <h3 class="my-2">Számlázási cím:</h3>
            <label for="billing_postal_code" class="form-label py-2"">Irányítószám</label>
            <input type="text" class="form-control py-2"" name="billing_postal_code">
            <label for="billing_settlement" class="form-label py-2">Telepüés</label>
            <input type="text" class="form-control py-2"" name="billing_settlement">
            <label for="billing_address" class="form-label py-2">Utca, házszám</label>
            <input type="text" class="form-control py-2"" name="billing_address">

            <h3 class="my-2">Szállítási cím:</h3>
            <label for="delivery_postal_code" class="form-label py-2">Irányítószám</label>
            <input type="text" class="form-control py-2" name="delivery_postal_code">
            <label for="delivery_settlement" class="form-label py-2">Telepüés</label>
            <input type="text" class="form-control py-2" name="delivery_settlement">
            <label for="delivery_address" class="form-label py-2">Utca, házszám</label>
            <input type="text" class="form-control py-2" name="delivery_address">

            <select name="payment_option" class="py-2 mt-2">                
                <option value="CC">Bankkártya</option>
                <option value="COD">Utánvét</option>
                <option value="WT">Átutalás</option>
            </select>

            <select name="shipping_option" class="py-2 mt-2">
                <option value="GLS">GLS futár</option>
                <option value="DPD">DPD futár</option>
            </select>

            <h4> <?php if(!empty($error2)){echo $error2;} ?> </h4>
            <p class="d-block"> <a href="info.html">Elfogadom a vásárlási feltételeket</a> </p>

            <input type="checkbox" name="check" id="accept_tc" class="py-2">

            <button type="button" name="order-btn" class="order-btn" onClick="if (document.order_form.billing_postal_code.value.length > 0 && document.order_form.billing_settlement.value.length > 0 && document.order_form.billing_address.value.length > 0 && document.order_form.delivery_postal_code.value.length > 0 && document.order_form.delivery_settlement.value.length > 0 && document.order_form.delivery_address.value.length > 0 && document.getElementById('accept_tc').checked) { document.order_form.submit(); } else { alert('Rendelés leadásához minden mező kitöltése kötelező!'); }">Rendelés leadása</button>

        </form>
   </div>
</div>

<div id="footer"></div>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $("#user_navigation").load("user_navigation.html");

        $("#footer").load("footer.html");
    </script> 

</body>
</html>
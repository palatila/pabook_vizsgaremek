<?php
  require_once ('config.inc.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>PA Book Webshop - Rendelések</title>
</head>
<body>
  <?php
    $c = file_get_contents('admin_navigation.html');
    $c = str_ireplace('###admin_email###', $_SESSION['admin_email'], $c);
    echo $c;
  ?>


  <div class="container">

        <h2 class="text-center my-4">Rendelések áttekintése</h2>

        <table class="table table-light table-striped text-center">
            <tr>
                <th>Rendelés azonosító</th>
                <th>Vevő neve</th>
                <th>Vevő e-mail címe</th>
                <th>Szállítási cím</th>
                <th>Számlázási cím</th>
                <th>Rendelés dátum</th>
                <th>Végösszeg</th>
            </tr>

            <?php

                $sql = "
                  SELECT
                    h.id,
                    CONCAT(c.first_name, ' ', c.last_name) customer_name,
                    c.email,
                    CONCAT(h.delivery_postal_code, ' ', h.delivery_settlement, ' ', h.delivery_address) delivery_address,
                    CONCAT(h.billing_postal_code, ' ', h.billing_settlement, ' ', h.billing_address) billing_address,
                    h.order_datetime,
                    si.sum_price
                  FROM
                    order_header h
                    INNER JOIN (SELECT i.order_id, SUM(i.price * i.quantity) sum_price FROM order_item i GROUP BY i.order_id) si ON h.id = si.order_id
                    INNER JOIN customer c ON c.id = h.customer_id
                ";
                $result = $db->query($sql);

                while($row = mysqli_fetch_array($result)){

                    echo '
                        <tr>
                            <td>' . $row['id'] . '</td>
                            <td>' . $row['customer_name'] . '</td>
                            <td>' . $row['email'] . '</td>
                            <td>' . $row['delivery_address'] . '</td>
                            <td>' . $row['billing_address'] . '</td>
                            <td>' . $row['order_datetime'] . '</td>
                            <td>' . number_format($row['sum_price'], 0, '.', ' ') . '</td>
                        </tr>
                    ';
                }
            ?>
        </table>



  </div>

</body>
</html>
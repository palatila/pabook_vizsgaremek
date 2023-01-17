<?php

require_once ('config.inc.php');   

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>PAbook - Admin</title>
</head>
<body>
  <?php
    $c = file_get_contents('admin_navigation.html');
    $c = str_ireplace('###admin_email###', $_SESSION['admin_email'], $c);
    echo $c;
  ?>

  <div class="container">

    <h2 class="text-center my-4">Termékek listázása</h2>

    <table class="w-100 table table-light table-striped text-center mx-auto">

        <tr>
          <th>Azonosító</th>
          <th>Borító</th>
          <th>Szerző</th>
          <th>Cím</th>
          <th>Ár</th>
          <th>Ismertető</th>
          <th>Művelet</th>
        </tr>

        <?php

          $sql = "SELECT * FROM product ORDER BY id";

          $result = mysqli_query($db, $sql);

          while($row = mysqli_fetch_array($result)){

            echo '
              <tr>
                <td>' . $row['id'] . '</td>
                <td> <img src="../img/' . $row['book_img'] . '" alt="' . $row['author'] . ' - ' . $row['title'] . '" title="' . $row['author'] . ' - ' . $row['title'] . '" style="width: 40px; height: 30px;" /></td>
                <td>' . $row['author'] . '</td>
                <td>' . $row['title'] . '</td>
                <td nowrap>' . number_format($row['price'], 0, '.', ' ') . ' Ft</td>
                <td>' . $row['description'] . '</td>
                <td>
                    <a href="admin_modosit.php?id=' . $row['id'] . '"> <i class="fas fa-pen"></i> </a>
                    <a href="admin_torol.php?id=' . $row['id'] . '"> <i class="fas fa-trash"></i> </a>
                </td>
              </tr>
            ';

          }

        ?>

    </table>

  </div>


</body>
</html>
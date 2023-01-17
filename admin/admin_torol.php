<?php

  require_once ('config.inc.php'); 

  $success = "";

  $id = $_GET["id"];

  if(isset($_POST["delete"])){

        $sql = "DELETE FROM product WHERE id='$id'";

        mysqli_query($db, $sql);

        $success = "Termék törölve!";

        echo "<META HTTP-EQUIV=Refresh CONTENT='3; URL=index.php' />";
  }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>PAbook - Admin főoldal</title>
</head>
<body>
  <?php
    $c = file_get_contents('admin_navigation.html');
    $c = str_ireplace('###admin_email###', $_SESSION['admin_email'], $c);
    echo $c;
  ?>


    <div class="container">

        <h2 class="text-center my-3">Termék törlése</h2>

        <span class="d-block text-success text-center mb-3"><?php if(!empty($success)){echo $success;}  ?></span>

        <table class="table table-light text-center mb-3 w-100 mx-auto">
            <tr>
              <th>Azonosító</th>
              <th>Borító</th>
              <th>Szerző</th>
              <th>Cím</th>
              <th>Ár</th>
              <th>Ismertető</th>
            </tr>

            <?php

                if(isset($_GET["id"])){

                    $termekid = $_GET["id"];

                    $sql = "SELECT * FROM product WHERE id='$id'";

                    $result = mysqli_query($db, $sql);

                    while($row = mysqli_fetch_array($result)){

                        $id = $row["id"];
                        $book_img = $row["book_img"];
                        $author = $row["author"];
                        $title = $row["title"];
                        $price = $row["price"];
                        $description = $row["description"];

                        echo "
                        
                            <tr>
                                <td>".$id."</td>
                                <td> <img src='../img/$book_img' alt='$book_img' title='$book_img' style='width: 40px; height: 30px;' /></td>
                                <td>".$author."</td>
                                <td>".$title."</td>
                                <td>".number_format($price,0,".",".")." Ft</td>
                                <td>".$description."</td>
                            </tr>
            
                        ";
                    }
                }

            ?>
        </table>

        <form action="" method="post" class="text-center">
            <button type="submit" name="delete" class="btn btn-danger">Könyv törlése</button>
        </form>

    </div>


</body>
</html>
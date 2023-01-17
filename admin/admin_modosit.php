<?php

require_once ('config.inc.php');

  $success = "";

  $id = $_GET["id"];

  if(isset($_POST["update"])){
    $author = $_POST["author"];
    $title = $_POST["title"];
    $category_id= $_POST["category_id"];
    $price = $_POST["price"];
    $description = $_POST["description"];
    if (strlen($_FILES['book_img']['name'])) {
      $target = "../img/".$_FILES["book_img"]["name"];
      $book_img = $_FILES["book_img"]["name"];
      move_uploaded_file($_FILES["book_img"]["tmp_name"], $target);
      $sql = "UPDATE product SET author='$author', price='$price', title='$title', category_id='$category_id', description='$description', book_img='$book_img' WHERE id='$id'";
    }
    else {
      $sql = "UPDATE product SET author='$author', price='$price', title='$title', category_id='$category_id', description='$description' WHERE id='$id'";
    }
    mysqli_query($db, $sql);
    $success = "Sikeres módosítás!";
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
    <title>PAbook - Admin Termék módosítása</title>
</head>
<body>
  <?php
    $c = file_get_contents('admin_navigation.html');
    $c = str_ireplace('###admin_email###', $_SESSION['admin_email'], $c);
    echo $c;
  ?>


  <div class="container">

    <h2 class="text-center my-4"> Könyv módosítása </h2>

    <?php

        if(isset($_GET["id"])){

            $id = $_GET["id"];

            $sql = "SELECT * FROM product WHERE id='$id'";

            $result = mysqli_query($db, $sql);

            while($row = mysqli_fetch_array($result)){

                ?>

                    <form action="" method="post" class="mx-auto w-75 text-center p-5" enctype="multipart/form-data">

                        <span class="d-block my-3 text-success"> <?php if(!empty($success)){ echo $success; }  ?> </span>

                        <label>Borítókép</label>
                        <input type="file" name="book_img" class="form-control mb-3" value="<?php  echo $row["book_img"];  ?>">

                        <label>Szerző</label>
                        <input type="text" name="author" class="form-control mb-3" value="<?php echo $row["author"];  ?>">

                        <label>Cím</label>
                        <input type="text" name="title" class="form-control mb-3" value="<?php echo $row["title"];  ?>">

                        <label>Caregory_id</label>
                        <input type="text" name="category_id" class="form-control mb-3" value="<?php echo $row["category_id"];  ?>">

                        <label>Ár</label>
                        <input type="text" name="price" class="form-control mb-3" value="<?php echo $row["price"];  ?>">

                        <label>Ismerető</label>
                        <textarea name="description" class="form-control mb-3" cols="30" rows="10"> <?php echo $row["description"]; ?> </textarea>

                        <button type="submit" name="update" class="btn btn-primary">Könyv módosítása</button>

                    </form>


                <?php
            }
        }


    ?>

  </div>


</body>
</html>
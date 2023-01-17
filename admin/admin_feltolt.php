<?php

require_once ('config.inc.php'); 

    $error = "";
    $success = "";

    if(isset($_POST["upload"])){

        $target = "../img/".$_FILES["book_img"]["name"];
        $book_img = $_FILES["book_img"]["name"];
        $author = $_POST["author"];
        $title = $_POST["title"];
        $category_id = $_POST["category_id"];
        $price = $_POST["price"];
        $description = $_POST["description"];
        

        if(empty($book_img) || empty($author) || empty($title) || empty($category_id) || empty($price) || empty($description)){

            $error = "Minden mező kitöltése kötelező!";
        }
        else{

            $sql = "INSERT INTO product(category_id,author,title,price,description,book_img) VALUES('$category_id', '$author', '$title', '$price', '$description', '$book_img')";

            mysqli_query($db, $sql);

            move_uploaded_file($_FILES["book_img"]["tmp_name"], $target);

            $success = "Sikeres termékfeltöltés!";
        }
        

    }


?>

<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <title>PAbook - Admin</title>
</head>
<body>

  <?php
    $c = file_get_contents('admin_navigation.html');
    $c = str_ireplace('###admin_email###', $_SESSION['admin_email'], $c);
    echo $c;
  ?>


    <div class="container">
        <form action="" method="post" class="w-50 mx-auto p-5 text-center shadow-sm" enctype="multipart/form-data">

            <h2 class="mb-3">Termék feltöltése</h2>

            <h5 class="text-success mb-3"><?php if(!empty($success)){echo $success;}  ?></h5>
            <h5 class="text-danger mb-3"><?php if(!empty($error)){echo $error;}  ?></h5>

            <label>Borító kép</label>
            <input type="file" name="book_img" class="form-control my-2">

            <label>Szerző</label>
            <input type="text" name="author" class="form-control my-2">

            <label>Cím</label>
            <input type="text" name="title" class="form-control my-2">

            <label>Kategória</label>
            <select name="category_id" class="form-control my-2">
                <option value="1">Szép Irodalom</option>
                <option value="2">Fantasy</option>
                <option value="3">Ezotéria</option>
                <option value="4">Történelem</option>
                <option value="5">Utazás</option>
                <option value="6">Gasztronómia</option>
                
            </select>

            <label>ÁR</label>
            <input type="text" name="price" class="form-control my-2">
            
            <label>Ismertető</label>
            <textarea name="description" class="form-control my-2" cols="30" rows="10"></textarea>

            <button class="btn btn-primary" name="upload">Termék feltöltése</button>
        </form>
    </div>
</body>
</html>
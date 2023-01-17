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
    <title>PA Book - Könyvek</title>
</head>
<body>
    <div id="user_navigation"></div>

    <div class="container bookcon">

      <?php

          if(isset($_GET["termekid"])){

              $termekid = $_GET["termekid"];

              $sql = "SELECT * FROM product WHERE id='$termekid'";

              $result = mysqli_query($db, $sql);

              while($row = mysqli_fetch_array($result)){

                  $id = $row["id"];
                  $book_img = $row["book_img"];
                  $title = $row["title"];
                  $author = $row["author"];
                  $price = $row["price"];
                  $description = $row["description"];
                  $category_id = $row["category_id"];
                

                  echo "

                      <div id='book_img'>
                          <img src='img/$book_img' alt='$book_img' title='$book_img' />
                      </div>

                      <div id='Könyvadatok'>
                      
                          <div id='title'>
                              <h2>".$title."</h2>
                          </div>

                          <div id='price'>
                              <h3>".number_format($price,0,".",".")." Ft</h3>
                          </div>

                          <div id='category_id'>
                              <p>".$category_id."</p>
                          </div>

                          <div id='description'>
                          <h3>Könyv ismertető:</h3>
                          <p>".$description."</p>
                          </div>

                          <div id='termekkosar'>
                              <a href='cart_move.php?id=$id&action=add' class='btn btn-primary'>Kosárba</a>
                          </div>

                      </div>            
                  ";
              }
          }
      ?>
    </div>

<div id="footer"></div>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            get_category();
        });        
    
        $(document).ready(function() {
            get_book('book_page');
        });

        $("#user_navigation").load("user_navigation.html");

        $("#footer").load("footer.html");
    </script> 

</body>
</html>
<?php
require_once ('config.inc.php');

if (strlen($_SESSION['customer_email'])) {
  header("Location: index.html");
}
?>


<!DOCTYPE html>
<html lang="en">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="js/common_functions.js"></script>
    <title>Bejelentkezés</title>
</head>
<body>

    <div id="user_navigation"></div>

    <div class="container mt-5">
        <form action="" method="post" class="mx-auto w-50 text-center p-5 shadow-sm">
            <h2 class="mb-5"><i class="fa-solid fa-book-open"></i> PA BOOK - Bejelentkezés</h2>

            <span class="mb-3 text-danger d-block"><?php if(!empty($error_login)){echo $error_login;}  ?></span>

            <label>E-mail cím</label>
            <input type="text" name="customer_email" class="form-control mb-3">

            <label>Jelszó</label>
            <input type="password" name="customer_password" class="form-control mb-3">

            <button class="btn btn-success mb-3" name="login">Bejelentkezés</button>

            <p >Nincs még fiókod? <strong><a href="reg.php">Regisztrálj</a></strong> </p>

        </form>
    </div>

    <div id="footer"></div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $("#user_navigation").load("user_navigation.html");
        $("#footer").load("footer.html");
    </script>  
</body>
</html>
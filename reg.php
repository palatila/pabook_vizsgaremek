<?php

    require_once ('config.inc.php'); 

    $error = "";
    $success = "";

    if(isset($_POST["admin_reg"])){

        $email = $_POST["email"];
        $password = $_POST["password"];        
        $last_name = $_POST["last_name"];        
        $first_name = $_POST["first_name"];        

        if(empty($email) || empty($password) || empty($last_name) || empty($first_name)){

            $error= "Regisztrációhoz minden mező kitöltése kötelező!";
        }
        else if(strlen($password) < 8){

            $error = "A jelszó hossza min. 8 karakter legyen!";
        }
        else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){

            $error = "Nem megfelelő e-mail formátum!";
        }
        else{

            $email_exist = "SELECT email FROM admin WHERE email='" . $email . "'";

            $email_result = mysqli_query($db, $email_exist);

            if(mysqli_num_rows($email_result) == 1){

                $error = "Ez az email már szerepel az adatbázisban!";
            }
            else{
                $sql = "INSERT INTO customer(email, password, first_name, last_name) VALUES('" . $email . "', '" . sha1($password) . "', '" . $first_name . "', '" . $last_name . "')";
                mysqli_query($db, $sql);
                if ($db->affected_rows > 0) {
                  $success = "Sikeres regisztráció!";
                }
                else {
                  $error = "A regisztráció sikertelen!";
                }
            }
           
        }
    }

?>

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
    <title>Regisztráció</title>
</head>
<body>

    <div id="user_navigation"></div>

    <div class="container mt-5">
        <form action="" method="post" class="mx-auto w-50 text-center p-5 shadow-sm">
            <h2 class="mb-5"><i class="fa-solid fa-book-open"></i> PA BOOK - Regisztráció</h2>

            <span class="mb-3 text-danger d-block"><?php if(!empty($error)){echo $error;}  ?></span>
            <span class="mb-3 text-success d-block"><?php if(!empty($success)){echo $success;}  ?></span>

            <label>E-mail cím</label>
            <input type="text" name="email" class="form-control mb-3" value="<?php echo (isset($email) ? $email : ''); ?>">

            <label>Vezetéknév</label>
            <input type="text" name="last_name" class="form-control mb-3" value="<?php echo (isset($last_name) ? $last_name : ''); ?>">

            <label>Keresztnév</label>
            <input type="text" name="first_name" class="form-control mb-3" value="<?php echo (isset($first_name) ? $first_name : ''); ?>">

            <label>Jelszó</label>
            <input type="password" name="password" class="form-control">
            <small class="form-text mb-3 d-block">A jelszó hossza min. 8 karakter legyen!</small>

            <button class="btn btn-primary mb-3" name="admin_reg">Regisztráció</button>

           
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
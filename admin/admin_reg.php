<?php

    require_once ('config.inc.php'); 

    $error = "";
    $success = "";

    if(isset($_POST["admin_reg"])){

        $email = $_POST["email"];
        $password = $_POST["password"];        

        if(empty($email) || empty($password)){

            $error= "Regisztrációhoz minden mező kitöltése kötelező!";
        }
        else if(strlen($password) < 8){

            $error = "A jelszó hossza min. 8 karakter legyen!";
        }
        else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){

            $error = "Nem megfelelő e-mail formátum!";
        }
        else{

            $email_exist = "SELECT email FROM admin WHERE email='$email'";

            $email_result = mysqli_query($db, $email_exist);

            if(mysqli_num_rows($email_result) == 1){

                $error = "Létező felhasználónév!";
            }
            else{

                $sql = "INSERT INTO admin(email,password) VALUES('$email', sha1('$password'))";

                mysqli_query($db, $sql);
    
                $success = "Sikeres regisztráció!";

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <title>PAbookk - Admin Regisztráció</title>
</head>
<body>

  <?php
    $c = file_get_contents('admin_navigation.html');
    $c = str_ireplace('###admin_email###', $_SESSION['admin_email'], $c);
    echo $c;
  ?>

    <div class="container">
        <form action="" method="post" class="mx-auto w-50 text-center p-5 shadow-sm">
            <h2 class="mb-5">PAbook- Admin Regisztráció</h2>

            <span class="mb-3 text-danger d-block"><?php if(!empty($error)){echo $error;}  ?></span>
            <span class="mb-3 text-success d-block"><?php if(!empty($success)){echo $success;}  ?></span>

            <label>E-mail cím</label>
            <input type="text" name="email" class="form-control mb-3">

            <label>Jelszó</label>
            <input type="password" name="password" class="form-control">
            <small class="form-text mb-3 d-block">A jelszó hossza min. 8 karakter legyen!</small>

            <button class="btn btn-primary mb-3" name="admin_reg">Regisztráció</button>

           
        </form>
    </div>
</body>
</html>
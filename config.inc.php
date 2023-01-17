<?php
define('DB_HOST', '');
define('DB_USER', '');
define('DB_PASSWORD', '');
define('DB_DATABASE', '');

$db = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE) or die('Error ' . mysqli_error($db));
mysqli_set_charset($db, 'utf8');

session_start();
if (!isset($_SESSION['customer_email'])) {
  $_SESSION['customer_email'] = '';
}
if (!isset($_SESSION['customer_password'])) {
  $_SESSION['customer_password'] = '';
}

if (isset($_POST['customer_email'])) {
  $_SESSION['customer_email'] = $_POST['customer_email'];
}
if (isset($_POST['customer_password'])) {
  $_SESSION['customer_password'] = sha1($_POST['customer_password']);
}

$error_login = '';
if (strlen($_SESSION['customer_email']) || strlen($_SESSION['customer_password'])) {
  $sql = "SELECT COUNT(*) AS cnt FROM customer WHERE email = '" . $_SESSION['customer_email'] . "' AND password = '" . $_SESSION['customer_password'] . "'";
  $res = $db->query($sql);
  $data = $res->fetch_assoc();
  if ($data['cnt'] == 0) {
    $error_login = 'Hibás felhasználónév vagy jelszó!';
    $_SESSION['customer_email'] = '';
    $_SESSION['customer_password'] = '';
  }
  else {
    $sql = "SELECT id, first_name, last_name FROM customer WHERE email = '" . $_SESSION['customer_email'] . "' AND password = '" . $_SESSION['customer_password'] . "'";
    $res = $db->query($sql);
    $data = $res->fetch_assoc();
    $_SESSION['first_name'] = $data['first_name'];
    $_SESSION['last_name'] = $data['last_name'];
    $_SESSION['customer_id'] = $data['id'];
  }
}


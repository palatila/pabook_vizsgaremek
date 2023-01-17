<?php
define('DB_HOST', 'picksystem.eu');
define('DB_USER', 'bfarm');
define('DB_PASSWORD', 'Robi123');
define('DB_DATABASE', 'bfarmdb');

$db = mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_DATABASE) or die('Error ' . mysqli_error($db));
mysqli_set_charset($db, 'utf8');

session_start();

if (!isset($_SESSION['admin_email'])) {
  $_SESSION['admin_email'] = '';
}
if (!isset($_SESSION['admin_password'])) {
  $_SESSION['admin_password'] = '';
}

$error_message = 'Hibás felhasználónév vagy jelszó!';
if (isset($_GET['logout'])) {
  $_SESSION['admin_email'] = '';
  $_SESSION['admin_password'] = '';
  $error_message = 'Sikeres kijelentkezés';
}

if (isset($_POST['admin_email'])) {
  $_SESSION['admin_email'] = $_POST['admin_email'];
}
if (isset($_POST['admin_password'])) {
  $_SESSION['admin_password'] = sha1($_POST['admin_password']);
}

$sql = "SELECT COUNT(*) AS cnt FROM admin WHERE email = '" . $_SESSION['admin_email'] . "' AND password = '" . $_SESSION['admin_password'] . "'";
$res = $db->query($sql);
$data = $res->fetch_assoc();
if ($data['cnt'] == 0) {
  $c = file_get_contents('admin_login.html');
  $c = str_ireplace('###error_message###', $error_message, $c);
  echo $c;
  exit;
}


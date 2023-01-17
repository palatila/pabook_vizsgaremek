<?php
header('Content-Type: application/json; charset=utf-8');

require_once ('config.inc.php');

$request_body = file_get_contents('php://input');
$request_body = json_decode($request_body, true);

switch ($request_body['p_func']) {
  case "main_page":
  case "search_book":
  case "book_page":
  case "category":
  case 'get_category':
    echo get_books($request_body['p_func'], isset($request_body['p_param']) ? $request_body['p_param'] : null);
  break;  
}


switch (isset($_GET['p_func']) ? $_GET['p_func'] : null) {
  case 'get_category':
    echo get_category();
  break;
  case 'get_customer':
    echo get_customer();
  break;
  case 'logout':
    $_SESSION['customer_email'] = '';
    $_SESSION['customer_password'] = '';
    echo json_encode('logout');
  break;
}

function get_books($p_func, $p_param = null) {
  global $db;
  $sql = "SELECT p.id, p.title, p.author, p.price, p.book_img FROM product p ";
  switch ($p_func) {
    case 'main_page':
      $sql .= "ORDER BY p.id DESC LIMIT 6";
    break;
    case 'search_book':
      $sql .= "WHERE p.title LIKE '%" . $p_param . "%' OR p.author LIKE '%" . $p_param . "%'";
    break;
    case 'category':
      $sql .= "WHERE p.category_id = " . ($p_param > 0 ? $p_param : 0) . " ORDER BY p.id DESC";
    break;
    case 'book_page':
      $sql .= "ORDER BY p.id DESC LIMIT 100";
    break;
    default:
      //return json_encode('Invalid parameters!');
    break;
  }
  $res = $db->query($sql);
  if ($res->num_rows == 0) {
    $data = [];
  }
  else {
    $data = $res->fetch_all(MYSQLI_ASSOC);
  }
  return json_encode($data);
}

function get_category() {
  global $db;
  $sql = "SELECT id, name FROM category ORDER BY name ASC";
  $res = $db->query($sql);
  if ($res->num_rows == 0) {
    $data = [];
  }
  else {
    $data = $res->fetch_all(MYSQLI_ASSOC);
  }
  return json_encode($data);
}

function get_customer() {
  $res['customer_email'] = '';
  if (strlen($_SESSION['customer_email'])) {
    $res['customer_email'] = $_SESSION['customer_email'];
  }
  return json_encode($res);
}



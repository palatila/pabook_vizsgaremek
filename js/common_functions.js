function get_book(p_func, p_param = null) {
  var product_div =
    '<div class="col-lg-4 text-center mb-4 p-2 border-0 shadow-sm"><div class="h-100"><a href="book.php?termekid=###product_id###"><img src="img/###img_name###" class="mx-auto py-2" alt="###alt###"></a><div class="card-body"><h5 class="card-title">###title###</h5><p class="card-text">###author###</p><p class="card-text">###price### Ft</p><a href="cart_move.php?id=###product_id###&action=add" class="btn btn-primary">Kosárba</a></div></div></div>';
  var formURL = "rest.php";
  var div = "";
  $.ajax({
    type: "POST",
    url: formURL,
    data: JSON.stringify({
      p_func: p_func,
      p_param: p_param,
    }),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    success: function (response) {
      var nincstalalat = "Nincs találat!";
      if (response == null) {
        document.getElementById("book_container").innerHTML = nincstalalat;
        return;
      }
      var cnt = response.length;
      if (cnt == 0) {
        document.getElementById("book_container").innerHTML = nincstalalat;
        return;
      }
      document.getElementById("book_container").innerHTML = "";
      for (var i = 0; i < cnt; i++) {
        div = product_div.replace("###img_name###", response[i]["book_img"]);
        div = div.replace(
          "###alt###",
          response[i]["author"] + " - " + response[i]["title"]
        );
        div = div.replace("###title###", response[i]["title"]);
        div = div.replace("###author###", response[i]["author"]);
        div = div.replace("###price###", response[i]["price"]);
        div = div.replaceAll("###product_id###", response[i]["id"]);
        document.getElementById("book_container").innerHTML += div;
      }
    },
  });
}

function get_category() {
  var catagory_li =
    '<li class="list-group-item text-center"><a href="#" class="nav-link link-dark px-2 active" onClick="get_book(\'category\', ###id###);">###name###</a></li>';
  var li = "";
  $.get("rest.php?p_func=get_category", function (response) {
    var nincstalalat = "Nincs kategória!";
    if (response == null) {
      document.getElementById("category_container").innerHTML = nincstalalat;
      return;
    }
    var cnt = response.length;
    if (cnt == 0) {
      document.getElementById("category_container").innerHTML = nincstalalat;
      return;
    }
    document.getElementById("category_container").innerHTML =
      '<ul class="nav">';
    for (var i = 0; i < cnt; i++) {
      li = catagory_li.replace("###id###", response[i]["id"]);
      li = li.replace("###name###", response[i]["name"]);
      document.getElementById("category_container").innerHTML += li;
    }
    document.getElementById("category_container").innerHTML += "</ul>";
  });
}

function get_customer() {
  $.get("rest.php?p_func=get_customer", function (response) {
    var navbar =
      '<a href="login.php" class="btn btn-light text-dark me-2">Bejelentkezés</a><a href="reg.php" class="btn btn-primary">Regisztráció</a>';
    if (response["customer_email"].length) {
      navbar =
        response["customer_email"] +
        '<input type="button" class="btn btn-success form-control" value="Kijelentkezés" onclick="logout();">';
    }
    document.getElementById("customer_navigation").innerHTML = navbar;
  });
}

function logout() {
  $.get("rest.php?p_func=logout", function () {
    get_customer();
  });
}

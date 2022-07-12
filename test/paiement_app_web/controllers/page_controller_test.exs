defmodule PaiementAppWeb.PageControllerTest do
  use PaiementAppWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Welcome to paiement home page"
  end

  test "GET /paiement", %{conn: conn} do
    conn = get(conn, "/paiement")
    assert html_response(conn, 200) =~ "Submit transaction"
  end

end

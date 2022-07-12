defmodule PaiementAppWeb.PageController do
  use PaiementAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

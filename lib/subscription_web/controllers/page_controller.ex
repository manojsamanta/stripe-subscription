defmodule SubscriptionWeb.PageController do
  use SubscriptionWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

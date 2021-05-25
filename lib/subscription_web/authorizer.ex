defmodule SubscriptionWeb.Authorizer do

  alias Subscription.Accounts.User
  alias Subscription.Blog.Post
  alias SubscriptionWeb.PaymentController

  def authorize(:show, %Post{} = post, %User{}=user) do
    case user.role do
      "admin"  -> :ok
      "customer"  -> :ok
      "guest" -> {:route, post}
    end
  end

  def authorize(:admin, %Post{} = _post, %User{}=user) do
    if user.role== "admin" do
      :ok 
    else
      {:error, :unauthorized}
    end
  end

end

defmodule SubscriptionWeb.PaymentController do
  use SubscriptionWeb, :controller

  alias Subscription.Payment

  alias Subscription.Blog
  alias Subscription.Blog.Post

  def new(conn, params) do
    render(conn, "new.html", params: params)
  end

  def create(conn, params) do
	IO.inspect params

    email = params["stripeEmail"]
    token = params["stripeToken"]
    amount= params["amount"]
    invoice_id=params["invoice_id"]
    page = params["page"]

    case Stripe.Customer.create(%{source: token, email: email}) do
      
      {:ok, %Stripe.Customer{id: stripe_cus_id}} ->

          case Stripe.Charge.create(%{customer: stripe_cus_id, amount: amount, description: "premium", currency: "usd"}) do
    		  {:ok, %Stripe.Charge{id: stripe_charge_id}} ->
			Payment.subscribe(conn.assigns.current_user)
                        redirect(conn, to: Routes.post_path(conn, :show, page))
    		        # conn
    		        # |> Plug.Conn.send_resp( 200, "Thank You. Your payment is approved. We will send you a confirmation email in a few hours. If you do not hear from us, please email at info@coding4medicine.com.")
    		  {:error, _} ->
    		        conn
    		        |> Plug.Conn.send_resp( 200, "Sorry, your payment is denied. Please try a different card or contact info@coding4medicine.com for other payment options.")
           end

      {:error, p} ->
    		conn
    		|> Plug.Conn.send_resp( 200, "Sorry, your payment is denied. Please try a different card or contact info@coding4medicine.com for other payment options.")
    end
  end

  def webhook do
  end

end

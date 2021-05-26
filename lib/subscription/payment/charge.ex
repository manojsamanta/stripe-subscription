defmodule Subscription.Payment.Charge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "charges" do
    field :stripe_id, :string
    field :amount, :integer

    timestamps()
  end

  @doc false
  def changeset(charge, attrs) do
    charge
    |> cast(attrs, [:stripe_id, :amount])
  end
end

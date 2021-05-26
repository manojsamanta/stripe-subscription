defmodule Subscription.Repo.Migrations.CreatePayment do
  use Ecto.Migration

  def change do
    create table(:charges) do
      add :stripe_id, :string
      add :amount, :integer

      timestamps()
    end

  end
end

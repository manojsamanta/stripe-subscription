defmodule Subscription.Repo.Migrations.CreateBlog do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string
      add :body, :string

      timestamps()
    end

  end
end

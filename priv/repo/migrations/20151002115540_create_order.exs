defmodule Cyrus.Repo.Migrations.CreateOrder do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :name, :string
      add :instructions, :text
      add :status, :string

      timestamps
    end

  end
end

defmodule Bg1.Repo.Migrations.CreateRows do
  use Ecto.Migration

  def change do
    create table(:rows) do
      add :title, :string

      timestamps()
    end
  end
end

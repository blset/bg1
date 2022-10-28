defmodule Bg1.Repo.Migrations.CreateParameters do
  use Ecto.Migration

  def change do
    create table(:parameters) do
      add :phonelink, :string
      add :signature, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:parameters, [:user_id])
  end
end

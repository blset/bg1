defmodule Bg1.Rows.Row do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rows" do
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(row, attrs) do
    row
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end

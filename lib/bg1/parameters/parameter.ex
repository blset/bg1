defmodule Bg1.Parameters.Parameter do
  use Ecto.Schema
  import Ecto.Changeset

  alias Bg1.Accounts.User

  schema "parameters" do
    field :phonelink, :string
    field :signature, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:phonelink, :signature, :user_id])
    |> validate_required([:phonelink, :signature, :user_id])
  end
end

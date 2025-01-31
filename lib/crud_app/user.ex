defmodule CrudApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  # Habilita a conversão automática para JSON
  @derive {Jason.Encoder, only: [:id, :name, :email, :inserted_at, :updated_at]}

  schema "users" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end

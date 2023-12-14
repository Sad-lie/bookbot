defmodule Bookbot.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string
    field :user_id, :integer
    field :book_list_id, :integer

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :user_id, :book_list_id])
    |> validate_required([:username, :email, :password, :user_id, :book_list_id])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
  end
end

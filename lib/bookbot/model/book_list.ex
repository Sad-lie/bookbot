defmodule Bookbot.BookList do
  use Ecto.Schema
  import Ecto.Changeset

  schema "book_lists" do
    field :title, :string
    field :user_id, :integer
    field :book_id, :integer

    timestamps()
  end

  def changeset(book_list, attrs) do
    book_list
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title, :user_id])
  end
end

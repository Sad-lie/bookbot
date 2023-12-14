defmodule Bookbot.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :title, :string
    field :author, :string
    field :book_id, :integer
    field :published_year, :integer
    field :status, :boolean
    field :user_id, :integer

    timestamps()
  end

  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :author, :book_id, :published_year, :status, :user_id])
    |> validate_required([:title, :author, :book_id, :published_year, :status, :user_id])
  end
end

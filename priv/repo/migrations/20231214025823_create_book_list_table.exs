defmodule Bookbot.Repo.Migrations.CreateBookListTable do
  use Ecto.Migration

  def change do
    create table(:book_lists) do
      add :title, :string
      add :book_id, :integer
      add :user_id, :integer


      timestamps()
    end
  end
end

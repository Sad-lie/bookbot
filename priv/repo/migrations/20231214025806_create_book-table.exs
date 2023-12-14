defmodule :"Elixir.Bookbot.Repo.Migrations.CreateBook-table" do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :user_id, :integer
      add :title, :string
      add :author, :string
      add :book_id, :integer
      add :published_year, :integer
      add :status, :boolean

      timestamps()
    end
  end
end

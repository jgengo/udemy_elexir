defmodule Discuss.Comment do
  
  use Ecto.Schema
  import Ecto.Changeset
  
  alias Discuss.Comment


  schema "topics" do
    field :content, :string

    belongs_to :user, Discuss.User
    belongs_to :topic, Dicuss.Topic
  end

  @doc false
  def changeset(%Comment{} = comment, attrs \\ %{}) do
    comment
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end

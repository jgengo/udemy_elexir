defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
 
  alias Discuss.Repo 
  alias Discuss.Topic


  def index(conn, _) do
  	topics = Repo.all(Topic)
  	render conn, "index.html", topics: topics
  end

  def new(conn, _) do
  	changeset = Topic.changeset(%Topic{}, %{})

  	render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
  	changeset = Topic.changeset(%Topic{}, topic)

  	case Repo.insert(changeset) do 
  		{:ok, post } ->
  			conn
  			|> put_flash(:info, "Topic Created")
  			|> redirect(to: topic_path(conn, :index))
  			render conn, "index.html"
  		{:error, changeset } ->
  			render conn, "new.html", changeset: changeset
  	end
  end

end
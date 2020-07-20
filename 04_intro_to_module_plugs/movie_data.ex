defmodule Teacher.MovieData do
  import Plug.Conn
  import Ecto.Query, only: [from: 2]

  def init(opts) do
    Keyword.fetch(opts, :msg)
  end

  def call(conn, msg) do
    movie_total = Repo.one(from m in Movie, select: count("*"))

    case msg do
      {:ok, msg} ->
        custom_msg = "#{msg} #{movie_total}"
        assign(conn, :movie_total_msg, custom_msg)
      :error ->
        default_msg = "We found #{movie_total} movies."
        assign(conn, :movie_total_msg, default_msg)
    end
  end
end
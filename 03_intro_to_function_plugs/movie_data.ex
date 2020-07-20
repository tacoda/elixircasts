defmodule Teacher.MovieData do
  import Plug.Conn

  def movie_total(conn, _opts) do
    assign(conn, :movie_total, 3)
  end

end

# defmodule TeacherWeb.MovieController do
#   #
#   import Teacher.MovieData
#   plug :movie_total
#   #
# end

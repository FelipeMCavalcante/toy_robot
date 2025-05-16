defmodule ToyRobot.Table do
  defstruct x_max: 4, y_max: 4

  alias ToyRobot.Table

  def valid_position?(%Table{x_max: x_max, y_max: y_max}, %{x: x, y: y}) do
    x >= 0 && x <= x_max && y >= 0 && y <= y_max
  end
end

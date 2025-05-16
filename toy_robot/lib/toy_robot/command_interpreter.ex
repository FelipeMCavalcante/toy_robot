defmodule ToyRobot.CommandInterpreter do
  @doc """
  Interpreta uma string de comandos
  """
  def interpret(commands_string) do
    commands_string
    |> String.split("\n", trim: true)
    |> Enum.map(&interpret_line/1)
    |> Enum.filter(&(&1 != nil))
  end

  defp interpret_line("REPORT"), do: :report
  defp interpret_line("MOVE"), do: :move
  defp interpret_line("LEFT"), do: :left
  defp interpret_line("RIGHT"), do: :right

  defp interpret_line("PLACE " <> rest) do
    parts = String.split(rest, ",")

    if length(parts) != 3 do
      nil
    else
      [x_str, y_str, facing_str] = parts

      with {x, ""} <- Integer.parse(x_str),
           {y, ""} <- Integer.parse(y_str),
           facing <- parse_facing(facing_str)
      do
        {:place, x, y, facing}
      else
        _ -> nil
      end
    end
  end

  defp interpret_line(_), do: nil

  defp parse_facing("NORTH"), do: :north
  defp parse_facing("SOUTH"), do: :south
  defp parse_facing("EAST"), do: :east
  defp parse_facing("WEST"), do: :west
  defp parse_facing(_), do: nil
end

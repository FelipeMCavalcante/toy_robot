defmodule ToyRobot.CommandRunner do
  alias ToyRobot.Simulation

  @doc """
  Executa uma lista de comandos em uma simulação
  """
  def run(commands) do
    simulation = Simulation.new()
    run_commands(commands, simulation)
  end

  defp run_commands([], simulation), do: simulation

  defp run_commands([command | rest], simulation) do
    new_simulation = execute_command(command, simulation)
    run_commands(rest, new_simulation)
  end

  defp execute_command(:move, simulation), do: Simulation.move(simulation)
  defp execute_command(:left, simulation), do: Simulation.turn_left(simulation)
  defp execute_command(:right, simulation), do: Simulation.turn_right(simulation)

  defp execute_command(:report, simulation) do
    IO.puts Simulation.report(simulation)
    simulation
  end

  defp execute_command({:place, x, y, facing}, simulation) do
    Simulation.place(simulation, x, y, facing)
  end
end

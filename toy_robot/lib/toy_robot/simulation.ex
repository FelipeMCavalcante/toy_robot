defmodule ToyRobot.Simulation do
  defstruct [:table, :robot]

  alias ToyRobot.{Robot, Table, Simulation}

  @doc """
  Cria uma nova simulação com um tabuleiro e um robô
  """
  def new do
    %Simulation{
      table: %Table{},
      robot: %Robot{}
    }
  end

  @doc """
  Posiciona o robô no tabuleiro se a posição for válida
  """
  def place(simulation, x, y, facing) do
    robot = %Robot{x: x, y: y, facing: facing}

    if Table.valid_position?(simulation.table, robot) do
      %Simulation{simulation | robot: robot}
    else
      simulation
    end
  end

  @doc """
  Move o robô na direção que ele está apontando, se a posição for válida
  """
  def move(%Simulation{robot: robot, table: table} = simulation) do
    new_robot = Robot.move(robot)

    if Table.valid_position?(table, new_robot) do
      %Simulation{simulation | robot: new_robot}
    else
      simulation
    end
  end

  @doc """
  Gira o robô para a esquerda
  """
  def turn_left(%Simulation{robot: robot} = simulation) do
    %Simulation{simulation | robot: Robot.turn_left(robot)}
  end

  @doc """
  Gira o robô para a direita
  """
  def turn_right(%Simulation{robot: robot} = simulation) do
    %Simulation{simulation | robot: Robot.turn_right(robot)}
  end

  @doc """
  Retorna a posição atual do robô
  """
  def report(%Simulation{robot: robot}) do
    direction = case robot.facing do
      :north -> "NORTH"
      :south -> "SOUTH"
      :east -> "EAST"
      :west -> "WEST"
    end

    "O robô está atualmente em (#{robot.x}, #{robot.y}) e está voltado para o #{direction}"
  end
end

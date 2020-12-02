defmodule Day2.Part1 do
  @doc """
      iex> Day2.Part1.part1("day2-sample.txt")
      18
  """
  def part1(filename) do
    parse_input(filename)
    |> Enum.map(&row_checksum/1)
    |> Enum.sum()
  end

  @doc """
      iex> Day2.Part1.part1
      41887
  """
  def part1 do
    part1("day2.txt")
  end

  @doc """
      iex> Day2.Part1.row_checksum([5, 1, 9, 5])
      8
      iex> Day2.Part1.row_checksum([7, 5, 3])
      4
      iex> Day2.Part1.row_checksum([2, 4, 6, 8])
      6
  """
  def row_checksum(row) do
    {min, max} = Enum.min_max(row)
    max - min
  end

  def parse_input(filename) do
    "inputs/#{filename}"
    |> File.stream!()
    # |> Stream.map(&String.trim/1)
    |> Stream.map(fn line -> String.split(line) |> Enum.map(&String.to_integer/1) end)
  end
end

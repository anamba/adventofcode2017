defmodule Day1.Part1 do
  @doc """
      iex> Day1.Part1.part1("1122")
      3
      iex> Day1.Part1.part1("1111")
      4
      iex> Day1.Part1.part1("1234")
      0
      iex> Day1.Part1.part1("91212129")
      9
  """
  def part1(input) do
    # duplicate the first element to the end to simulate wraparound
    # note: reversing the input so we can add to the head instead; shouldn't affect the algorithm
    input =
      input
      |> String.trim()
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)

    [List.first(input) | Enum.reverse(input)]
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn
      [a, a], sum -> sum + a
      _, sum -> sum
    end)
  end

  @doc """
      iex> Day1.Part1.part1
      1158
  """
  def part1 do
    part1(parse_input("day1.txt"))
  end

  def parse_input(filename) do
    "inputs/#{filename}"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.take(1)
    |> List.first()
  end
end

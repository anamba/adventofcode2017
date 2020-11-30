defmodule Day1.Part2 do
  @doc """
      iex> Day1.Part2.part2("1212")
      6
      iex> Day1.Part2.part2("1221")
      0
      iex> Day1.Part2.part2("123425")
      4
      iex> Day1.Part2.part2("123123")
      12
      iex> Day1.Part2.part2("12131415")
      4
  """
  def part2(input) do
    input =
      input
      |> String.trim()
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)

    # create a copy of the list rotated by half
    halflen = div(length(input), 2)
    inputrotated = Enum.take(input, -halflen) ++ Enum.take(input, halflen)

    Enum.zip(input, inputrotated)
    |> Enum.reduce(0, fn
      {a, a}, sum -> sum + a
      _, sum -> sum
    end)
  end

  @doc """
      iex> Day1.Part2.part2
      1132
  """
  def part2 do
    part2(parse_input("day1.txt"))
  end

  def parse_input(filename) do
    "inputs/#{filename}"
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Enum.take(1)
    |> List.first()
  end
end

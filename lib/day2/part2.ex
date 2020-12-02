defmodule Day2.Part2 do
  @doc """
      iex> Day2.Part2.part2("day2-sample2.txt")
      9
  """
  def part2(filename) do
    parse_input(filename)
    |> Enum.map(&clean_division/1)
    |> Enum.sum()
  end

  @doc """
      iex> Day2.Part2.part2
      226
  """
  def part2 do
    part2("day2.txt")
  end

  @doc """
      iex> Day2.Part2.clean_division([5, 9, 2, 8])
      4
      iex> Day2.Part2.clean_division([9, 4, 7, 3])
      3
      iex> Day2.Part2.clean_division([3, 8, 6, 5])
      2
  """
  def clean_division(row) do
    for {a, i} <- Enum.with_index(row) do
      for {b, j} <- Enum.with_index(row) do
        unless i == j do
          Enum.sort([a, b])
        end
      end
    end
    |> Enum.concat()
    |> Enum.filter(& &1)
    |> Enum.uniq()
    |> Enum.map(fn
      [a, a] -> 1
      [a, b] when rem(a, b) == 0 -> div(a, b)
      [a, b] when rem(b, a) == 0 -> div(b, a)
      _ -> nil
    end)
    |> Enum.filter(& &1)
    |> List.first()
  end

  def parse_input(filename) do
    "inputs/#{filename}"
    |> File.stream!()
    # |> Stream.map(&String.trim/1)
    |> Stream.map(fn line -> String.split(line) |> Enum.map(&String.to_integer/1) end)
  end
end

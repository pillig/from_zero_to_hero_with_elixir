defmodule Exercises.Advanced do
  @doc """
  Return the average value of all numbers in the list.
  """

  def average([head | tail]) do
    do_average(tail, head, 1)
  end

  defp do_average([], sum, count) do
    div(sum, count)
  end

  defp do_average([head | tail], sum, count) do
    do_average(tail, head + sum, count + 1)
  end

  @doc """
  Returns a two element tuple with the odd and even numbers of the list.
  """
  def odds_and_evens(list) do
    do_odds_and_evens(list, [], [])
  end

  defp do_odds_and_evens([], odds, evens) do
    {odds, evens}
  end

  defp do_odds_and_evens([head | tail], odds, evens) do
    case rem(head, 2) do
      0 -> do_odds_and_evens(tail, odds, evens ++ [head])
      1 -> do_odds_and_evens(tail, odds ++ [head], evens)
    end
  end

  @doc """
  Returns the three largest numbers of the list
  """
  def three_largest(list) do
    # Enum.sort(list, fn left, right -> left >= right end)
    list
    # |> Enum.sort(&(&1 >= &2)))
    # |> Enum.take(3)
    # |> Enum.sort()
    |> Enum.sort()
    |> Enum.take(-3)
  end

  @doc """
  Capitalize all words in the given string.

  TIP: Use the functions `String.split/2`, `String.capitalize/1`, and `Enum.join/1`.
  """

  def capitalize_helper(source, words_to_change) do
    case words_to_change do
      [] ->
        source

      [head] ->
        String.replace(source, head, String.capitalize(head))

      [head | tail] ->
        capitalize_helper(
          String.replace(source, head, String.capitalize(head), global: false),
          tail
        )
    end
  end

  def capitalize_all(input_string) do
    case input_string do
      "" -> ""
      _ -> capitalize_helper(input_string, String.split(input_string))
    end
  end
end

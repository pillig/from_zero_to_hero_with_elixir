defmodule Exercises.Basics do
  @doc """
  Sums the value of all integer values in a list.
  """
  def sum([]) do
    0
  end

  def sum([elem | tail]) do
     elem + sum(tail)
  end

  @doc """
  Takes the first `count` number of elements of a list and returns them.
  """

  def take([head | tail], n) when n > 0 do
    [head | take(tail, n-1)]
  end

  def take(_list, _count) do
    []
  end

  @doc """
  Returns the minimum element of the list.
  """
  def min([head]) do
    head
  end

  def min([head | tail]) do
    tail_min = min(tail)
    case tail_min < head do
      true -> tail_min
      false -> head
    end
  end
end

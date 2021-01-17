defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> to_charlist
    #  Mapping char value -> -------- digits-  or --------lower case--  or --------- upper case-- or --dash- or -space- or any other special characters...
    |> Enum.map(fn x -> ((x >= 48 and x <= 57) or (x >= 65 and x <= 90) or (x >= 97 and x <= 122) or x == 45 or x == 32 or x > 125) && x || " " end)
    |> to_string
    |> String.split(" ")
    |> Enum.reduce(%{}, fn(tag, acc) -> tag == "" && acc || Map.update(acc, tag, 1, &(&1 + 1)) end)
  end
end

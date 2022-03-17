defmodule Game do
  # pega o nivel e sorteia o numero do intervalo
  def pickup_number(level) do
    level
    |> get_range()
    |> Enum.random()
  end

  # funções para analisar a entrada
  def parse_input(:error) do
    IO.puts("Invalid input")
    Guess.run()
  end

  def parse_input({num, _}), do: num
  def parse_input(data), do: data |> Integer.parse() |> parse_input()

  def get_range(level) do
    case level do
      1 ->
        1..10

      2 ->
        1..100

      3 ->
        1..1000

      _ ->
        IO.puts("Invalid level!")
        Guess.run()
    end
  end

  def show_score(guesses) when guesses > 6 do
    IO.puts("Better look next time!")
  end
  def show_score(guesses) do
    {_, msg} = %{
      (1..1) => "You're a mind rider!",
      (2..4) => "Most impressive",
      (3..6) => "You can do better than that"
    }
    |> Enum.find(fn {key, _} ->
      Enum.member?(key, guesses)
    end)
    IO.puts(msg)
  end
end

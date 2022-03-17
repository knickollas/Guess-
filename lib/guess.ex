defmodule Guess do
  use Application
  alias Game, as: G

  def start(_, _) do
    run()
    {:ok, self()}
  end

  def run() do
    IO.puts("Let's play Guess the Number?\n==========================================\n")

    IO.gets("Pick a difficult level(1, 2 or 3): ")
    |> G.parse_input()
    |> G.pickup_number()
    |> play()
  end

  def play(picked_number) do
    IO.gets("I have my number. What is your guess? ") |> G.parse_input() |> guess(picked_number, 1)
  end

  def guess(usr_guess, picked_num, count) when usr_guess > picked_num, do: IO.gets("too high. Guess again: ") |> G.parse_input() |> guess(picked_num, count + 1)
  def guess(usr_guess, picked_num, count) when usr_guess < picked_num, do: IO.gets("too low. Guess again: ") |> G.parse_input() |> guess(picked_num, count + 1)
  def guess(_usr_guess, _picked_num, count) do
    IO.puts("you got it! #{count} tries")
    G.show_score(count)
  end

end

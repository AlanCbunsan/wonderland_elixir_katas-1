defmodule CardGameWar.Game do

  # feel free to use these cards or use your own data structure"
  def suits, do: [:spade, :club, :diamond, :heart]
  def ranks, do: [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
  def cards do
    for suit <- suits,
        rank <- ranks do
      {suit, rank}
    end
  end

def mallet do 
   cards() |> Enum.shuffle()  |> enum.chung_every(26)
 end

def play() do
   [j1 | [j2]] = mallet()
   war(j1, j2, 1)
 end

 def war([], _, _t)do
    IO.puts("\n")
    {:Winner, :J2}

 def war(_, [], _t) do
    IO.puts("\n")
    {:Winner, :J1}
 end


 def war(j1, j2, t)do

 [h1|t1] = j1
 [h2|t2] = j2
  IO.puts("\n turn" <> to_string(t))
  IO.puts("player1:   mallet:" <> (j1|> length() |> to_string()))
   x = mapp(IO.inspect(h1))
  IO.puts("player2:   mallet:" <> (j2|> length() |> to_string()))
   y = mapp(IO.inspect(h2))

  palo1 = palos(h1)
  palo2 = palos(h2)

cond do 
  x > y ->
IO.puts("player 1 wins this round")
  l = t1++[h1]++[h2]
  war(1, t2, t+1)
IO.puts("player 2 wins this round")
  l = t2++[h1]++[h2]
  war(t1, 1, t+1)
true ->

cond do 
  palo1 > palo2 ->
IO.puts("player 1 wins this round")
  l = t1++[h1]++[h2]
  war(l, t2, t+1)
true ->
IO.puts("player 2 wins this round")
  l = t2++[h1]++[h2]
  war(t1, l, t+1)
  end
 end
end

def mapp({_, value }) do
  x = value
 cond do 
  x == :ace -> 14
  x == :king -> 13
  x == :queen -> 12
  x == :jack -> 11
  true -> value
 end
end

def palos({palo,_})do
 cond do
  palo == :heart -> 4
  palo == :diamond -> 3 
  palo == :club -> 2
  true -> 1
  end
 end
end



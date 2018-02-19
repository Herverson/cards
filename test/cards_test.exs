defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "embaralhando as cartas" do
    deck = Cards.criar_deck()
    refute deck == Cards.embaralhar(deck) 
  end
end

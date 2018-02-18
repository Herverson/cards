defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello
      :world

  """
  def criar_deck do
    valores = ["Ás", "Dois", "Três", "Quatro", "Cinco
    "]
    naipes = ["Corações", "Paus", "Ouros", "Espadas"]

    for naipe <- naipes, valor <- valores, do: "#{valor} de #{naipe}"
  end

  def embaralhar(deck) do
    Enum.shuffle(deck)
  end

  def contem?(deck, carta) do
    Enum.member?(deck, carta)
  end

  def partes(deck, mao) do
    Enum.split(deck, mao)
  end
end

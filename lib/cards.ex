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
    valores = ["Ás", "Dois", "Três", "Quatro", "Cinco"]
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

  def salvar(deck, nomearquivo) do
    binario = :erlang.term_to_binary(deck)
    File.write(nomearquivo, binario)
  end

  def abrir(nomearquivo) do
    case File.read(nomearquivo) do
      {:ok, binario} -> :erlang.binary_to_term(binario)
      {:error, _} -> "Esse arquivo não existe"
    end
  end

end

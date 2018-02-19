defmodule Cards do
  @moduledoc """
    Metódos para criar decks com cartas e mãos
  """
  @doc """
    Retorna uma lista de string com as cartas.
  """
  def criar_deck do
    valores = ["Ás", "Dois", "Três", "Quatro", "Cinco"]
    naipes = ["Corações", "Paus", "Ouros", "Espadas"]

    for naipe <- naipes, valor <- valores, do: "#{valor} de #{naipe}"
  end
  @doc """
    Informe uma lista `deck` para que seja embaralhada.
  """
  def embaralhar(deck) do
    Enum.shuffle(deck)
  end
  @doc """
    Verifica se contém uma carta na lista.
  ## Exemplos
      iex> deck = Cards.criar_deck
      iex> Cards.contem?(deck, "Dois de Paus")
      true
  """
  def contem?(deck, carta) do
    Enum.member?(deck, carta)
  end
  @doc """
    Informe uma lista `deck` para ser dividida para o deck.
    O argumento `tamanho_mao` indica quantas cartas a mão vai ter

  ## Exemplos
      iex> deck = Cards.criar_deck
      iex> {mao, deck} = Cards.partes(deck, 1)
      iex> mao
      ["Ás de Corações"]

  """
  def partes(deck, tamanho_mao) do
    Enum.split(deck, tamanho_mao)
  end
  @doc """
    Informe uma lista `deck`.
    No argumento `nomearquivo` informe o nome do arquivo para salvar.
  """
  def salvar(deck, nomearquivo) do
    binario = :erlang.term_to_binary(deck)
    File.write(nomearquivo, binario)
  end
  @doc """
    No argumento `nomearquivo` informe o nome do arquivo para abrir.
  """
  def abrir(nomearquivo) do
    case File.read(nomearquivo) do
      {:ok, binario} -> :erlang.binary_to_term(binario)
      {:error, _} -> "Esse arquivo não existe"
    end
  end
  @doc """
    Retorna uma lista de string com as cartas.
    o argumento `tamanho_mao` indica o tamanho que a lista vai vetornar
  """
  def criar_mao(tamanho_mao) do
    Cards.criar_deck
    |> Cards.embaralhar
    |> Cards.partes(tamanho_mao)
  end
end

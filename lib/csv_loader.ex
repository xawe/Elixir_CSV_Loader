defmodule CsvLoader do

  @moduledoc """
  This Module loads Bolsa Familia Files
  You can download files here :
  http://www.portaltransparencia.gov.br/download-de-dados/bolsa-familia-pagamentos
  """

  @doc """
  Simple Load using stream

  ## Examples
    iex -S mix
      iex> CsvLoader.load_stream("I:\\Projetos\\Misc\\csvlab\\1.csv")

  """
  def load_stream file do
    begin_time = NaiveDateTime.utc_now
    data =
      file
      |> File.stream!()
      |> CSV.decode(separator: ?;, headers: [:Mesreferencia, :Mescompetencia, :Uf, :Codigomunicipiosiafi, :Nomemunicipio, :Cpffavorecido, :Nisfavorecido, :Nomefavorecido, :Valorparcela])
      |> Enum.to_list
    end_time = NaiveDateTime.utc_now
    {:ok, begin_time, end_time, data}
  end
end

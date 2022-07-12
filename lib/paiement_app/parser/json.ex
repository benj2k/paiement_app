defmodule ParserJson do

  # retreive
  # should be better with a struct response I guess
  def get_body(tx_hash) do

    url = "https://api.ethplorer.io/getTxInfo/" <> tx_hash <> "?apiKey=freekey"
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Not Found"}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
      _ ->
        {:error, "Other Status Code"}
    end

  end

  # return the number of confirmation blocks
  def is_confirmed(tx_hash) do
    {:ok, %{"confirmations" => confirmations}}= get_body(tx_hash)
    confirmations
  end

end

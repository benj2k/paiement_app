defmodule Validator.Transaction do

  # minimal regex to check the format of a ETH transaction
  def is_hash_valid(hash) do

    regex_match_valid = Regex.match?(~r/^0x([A-Fa-f0-9]{64})$/, hash)

    if regex_match_valid do
      {:ok, hash}
    else
      {:error, "Invalid transaction input"}
    end
  end

end

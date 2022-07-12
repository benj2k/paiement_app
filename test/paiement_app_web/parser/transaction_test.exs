defmodule Validator.TransactionTest do
  use PaiementAppWeb.ConnCase, async: true
  # minimal regex to check the format of a ETH transaction


  test "Bad transaction will not match the regex" do
    hash = "0x3f8a9fa99a61721a033a01e5c5af3ceb50"
    is_hash_valid = Validator.Transaction.is_hash_valid(hash)

    assert {:error, "Invalid transaction input"} = is_hash_valid

  end

  test "Good transaction will match the regex" do
    hash = "0x7b6d0e8d812873260291c3f8a9fa99a61721a033a01e5c5af3ceb5e1dc9e7bd0"
    is_hash_valid = Validator.Transaction.is_hash_valid(hash)

    assert {:ok, _hash} = is_hash_valid
  end

end

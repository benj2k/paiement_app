defmodule PaiementAppWeb.PaiementLive do
  use PaiementAppWeb, :live_view
  require Logger

  def mount(_params, _session, socket) do
    {:ok, assign(socket,
      hash: "",
      is_hash_valid: nil
    )}
  end

  # check if transaction hash is correctly formatted
  def handle_event("change_input", params, socket) do
    #pattern matching tx_hash value
    %{"tx_hash" => tx_hash} = params
    %{"tx_hash" => hash} = tx_hash

    # call validator for transaction input field
    is_hash_valid = Validator.Transaction.is_hash_valid(hash)
    #Logger.info  "TX is valid ? #{inspect(is_hash_valid)}"


    # return values depending of validator response
    case is_hash_valid do
      {:ok, _hash} -> {:noreply, assign(socket, is_hash_valid: true, hash: hash)}
      {:error, _err_msg} -> {:noreply, assign(socket, is_hash_valid: false, hash: "")}
    end
  end

  def handle_event("send_transaction", _params, socket) do
    # return a redirect
    {:noreply, redirect(socket, to: Routes.live_path(socket, PaiementAppWeb.PaiementConfirmLive, socket.assigns.hash))}
  end

  # live render
  def render(assigns) do
    ~H"""
    <section class="phx-hero">
      <h1>Paiement page</h1>
      <p>Go !<br />0x7b6d0e8d812873260291c3f8a9fa99a61721a033a01e5c5af3ceb5e1dc9e7bd0</p>
        <form method="get" phx-change="change_input">
          <%= text_input :tx_hash, :tx_hash %>
          <%= if @is_hash_valid do %>
            <button type="button" phx-click="send_transaction">Submit transaction</button>
          <% else %>
            <button type="button" disabled>Submit transaction</button>
          <% end %>
        </form>
    </section>
    """
  end

end

defmodule PaiementAppWeb.PaiementConfirmLive do
  use PaiementAppWeb, :live_view
  require Logger

  @impl true
  def mount(params, session, socket) do

    start_timer(session["interval"] || 1000)
    strftime = session["strftime"] || "%H:%M:%S"
    %{"transaction" => transaction} = params
    state = [strftime: strftime, date: local_date(strftime), transaction: transaction, confirmed: nil]
    {:ok, assign(socket, state)}

  end

  @impl true
  def handle_info(:clock_tick, socket) do
    #Logger.info  "TIC-TAC"

    confirmations = ParserJson.is_confirmed(socket.assigns.transaction)

    if confirmations>2 do
      {:noreply, assign(socket, confirmed: true)}
    else
      {:noreply, assign(socket, confirmed: nil)}
    end

  end

  defp start_timer(interval) do
    :timer.send_interval(interval, self(), :clock_tick)
  end

  defp local_date(format) do
    NaiveDateTime.local_now()
    |> Calendar.strftime(format)
  end

  @impl true
  def render(assigns) do
    ~H"""
    <section class="phx-hero">
      <h1>Paiement confirmation page</h1>
      <p>Go !</p>
      <%= unless @confirmed do %>
        <p>Waiting confirmation ... (<%= @transaction %>)</p>
      <% else %>
        <p>Transaction confirmed !</p>
      <% end %>
    </section>
    """
  end

end

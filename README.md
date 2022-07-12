# Challenge to build a paiement page

To start :
  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

URL : [`localhost:4000`] http://localhost:4000

## Additionals Plugins
  * httpoison
  * poison

These plugins are used to fetch json from URL

## The challenge
No database/ecto, to make things easier (first time using elixir).

One landing/home page, because I don't want to do a full cleanup of the project to only have the pages needed for the challenge ;)
Then one page with a text input form and a button. This page has a very basic control over the input (regex) to avoid sending bad/wrong data.
Once the transaction is correctly filled, the button is available, and allow the user to submit it.
Then the browser will redirect to a confirmation page with the tx as part of the URL, but also as a parameter (see router). On this final page, we have a refresh timer that will regulary check the transaction through the API until we have reached the number of blocks necessary to validate the transaction. Finally, once it's confirmed, we display a confirmation message.

## What's more ?
- Maybe we could have implemented more structs type variable/elements, like a struct for the json response we got from the ETH API.
- Also, since we would need to use other currency (ETH, BTC, UTK etc ...) as paiement, we could implement interfaces (Protcol ? https://yiming.dev/blog/2021/07/18/stop-using-behaviour-to-define-interfaces-use-protocol/)
- Definitly a DB to store everything that could not be stored on the blockchain.


## Websites that helped me
  * Official documentations
  https://hexdocs.pm/phoenix/overview.html
  https://elixir-lang.org/

  * Community
  https://elixirforum.com/
  https://blog.appsignal.com/2022/06/14/a-guide-to-phoenix-liveview-assigns.html
  https://elixircasts.io/
  https://stackoverflow.com/

  
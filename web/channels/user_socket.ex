defmodule Cyrus.UserSocket do
  use Phoenix.Socket

  channel "orders", Cyrus.OrderChannel

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket), do: {:ok, socket}

  def id(_socket), do: nil
end

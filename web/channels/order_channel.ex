defmodule Cyrus.OrderChannel do
  use Phoenix.Channel

  def join("orders", auth_msg, socket) do
    {:ok, socket}
  end

end

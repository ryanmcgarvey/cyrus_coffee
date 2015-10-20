defmodule Cyrus.OrderView do
  use Cyrus.Web, :view

  alias Cyrus.Orders.ButtonGeneration
  def buttons(order) do
    ButtonGeneration.buttons(order)
  end

end

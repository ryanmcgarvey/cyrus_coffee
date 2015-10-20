defmodule Cyrus.Orders.ButtonGeneration do
  alias Cyrus.Orders.Button

  def buttons(order) do
    case order.status do
      "new" -> [
        %Button{name: "Accept", action: :accept},
        %Button{name: "Reject", action: :reject}
      ]
      "accepted" -> [
        %Button{name: "Complete", action: :complete},
        %Button{name: "Cancel", action: :cancel}
      ]
      "completed" -> [
        %Button{name: "Paid", action: :paid},
        %Button{name: "No Show", action: :no_show}
      ]
      "rejected" -> []
      "paid" -> []
      "canceled" -> []
      "now_show" -> []
    end
  end
end

import "deps/phoenix_html/web/static/js/phoenix_html"
import {Socket} from "deps/phoenix/web/static/js/phoenix"
import {RemoteCaller} from "./remote_call"
Elemental.addNamespace(RemoteCaller)

$(document).ready(function() {
  setup_order_container()
  Elemental.load(document)
});


function setup_order_container(){
  let ordersContainer = $("#orders").find("tbody")
  let socket = new Socket("/socket")
  socket.connect()
  let chan = socket.channel("orders", {})

  chan.join().receive("ok", chan => {
    console.log("Welcome!")
  })

  chan.on("new_order", payload => {
    debugger;
    ordersContainer.append(`${payload.body}`)
  })
  chan.on("updated", payload => {
    order_container = ordersContainer.find(`[role='order-${payload.id}']`)
    order_container.empty()
    order_container.append(`${payload.body}`)
  })
}



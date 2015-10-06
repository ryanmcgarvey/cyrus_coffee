import "deps/phoenix_html/web/static/js/phoenix_html"
import {Socket} from "deps/phoenix/web/static/js/phoenix"

$(document).ready(function() {
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
});

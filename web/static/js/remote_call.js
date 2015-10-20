export var RemoteCaller = {
  RemoteCall: function(link) {
    $(link).click(event => {
      event.preventDefault()
      event.stopPropagation()
    })
  }
}

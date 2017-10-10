console.log(JSON.stringify({
  "subtitle": "Network",
  "network": require('pdc-network').map(function (element) {
    element.server.short = element.server.website.replace(/^https?:\/\//, '')
    return element
  })
}))

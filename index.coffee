express = require('express')
Rx = require('rx')
app = express()

sendHelloWorld = (e) ->
  console.log 'handling request'
  e.res.send('Hello World! query from url: ' + (e.req.query.query or 'nothing'))

_requests = new Rx.Subject()
_requests.subscribe(sendHelloWorld)

app.get('/', (req, res) -> _requests.onNext({req: req, res: res}))

app.listen(3000)
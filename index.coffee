express = require('express')
Rx = require('rx')
app = express()

sendHelloWorld = (e) ->
  console.log 'sending hello world'
  e.res.send('Hello World')

_requests = new Rx.Subject()
_requests.subscribe(sendHelloWorld)

app.get('/', (req, res) -> _requests.onNext({req: req, res: res}))

app.listen(3000)
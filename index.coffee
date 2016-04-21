express = require('express')
Rx = require('rx')
app = express()

sendHelloWorld = (e) ->
  e.res.send('Hello World! query from url: ' + (e.req.query.query or 'nothing'))

_requests = new Rx.Subject()
_requests.tap((e) -> console.log('request to', e.req.url)).subscribe(sendHelloWorld)

app.get('/', (req, res) -> _requests.onNext({req: req, res: res}))

app.listen(3000)

exports.app = app
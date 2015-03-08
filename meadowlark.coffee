express = require('express')
app = express()

# 设置模板引擎
handlebars = require('express3-handlebars').create({ defaultLayout:'main' })
app.engine 'handlebars', handlebars.engine
app.set 'views engine', 'handlebars'

app.set 'port', process.env.PROT || 3000


app.get '/', (req, res) ->
  res.type 'text/plain'
  res.send 'Meadowlark Travel'

app.get '/about', (req, res) ->
  res.type 'text/plain'
  res.send 'About Meadowlark Travel'

app.use (req, res) ->
  res.type 'text/plain'
  res.status 404
  res.send '404 - Not Found'

app.use (err, req, res, next) ->
  console.error err.stack
  res.type 'text/plain'
  res.status 500
  res.send '500 - Server Error'

app.listen app.get('port'), () ->
  console.log 'Express started on http://localhost:' +
    app.get('port') + '; press Ctrl-C to terminate.'

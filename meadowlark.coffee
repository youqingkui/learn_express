express = require('express')
app = express()

# 设置模板引擎
handlebars = require('express3-handlebars').create({ defaultLayout:'main' })
app.engine 'handlebars', handlebars.engine
app.set 'views engine', 'handlebars'

app.use(express.static(__dirname + '/public'))

app.set 'port', process.env.PROT || 3000



app.get '/', (req, res) ->
  res.render 'home'

app.get '/about', (req, res) ->
  fortunes = [
    "Conquer your fears or they will conquer you.",
    "Rivers need springs.",
    "Do not fear what you don't know.",
    "You will have a pleasant surprise.", "Whenever possible, keep it simple.",
  ]
  res.render 'about', {fortune:fortunes}

app.use (req, res) ->
  res.render '404'

app.use (err, req, res, next) ->
  console.error err.stack
  res.render '500'

app.listen app.get('port'), () ->
  console.log 'Express started on http://localhost:' +
    app.get('port') + '; press Ctrl-C to terminate.'

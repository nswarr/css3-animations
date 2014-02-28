express = require("express")
http = require("http")
path = require("path")
app = express()

app.configure ->
  app.set "port", process.env.PORT or 7171
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.static(path.join(__dirname, "public"))

app.configure "development", ->
  app.use express.errorHandler()

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
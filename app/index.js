const express = require('express')
const app = express()

app.get('/', function (req, res) {
  res.send('Helslo World!')
})

app.listen(3000, function () {
  console.log('Express app listening on port 3000!')
})

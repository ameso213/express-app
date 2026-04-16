const express = require('express')
const app = express()

app.get('/', (req, res) => {
  res.send('Hello, this is deployment test for my app!') 
})

const PORT = 8081

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`)
})
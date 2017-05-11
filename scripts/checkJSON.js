const {readFileSync} = require('fs')

const date = new Date()
JSON.parse(
  readFileSync(
    `./data/${date.getFullYear()}/${date.getMonth() + 1}/index.json`
  )
)

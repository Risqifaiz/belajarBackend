const express = require('express')
const response = require('./helpers/response')
const routes = require('./routes')
const cors = require('cors')
const app = express()

// This is the route theAPI will call
const port = process.env.PORT || 5001

// Handle Cors
app.use(cors())

// Serialize dan Deserialized Input
app.use(express.json())
app.use(express.urlencoded({ extended: true}))

// Welcom API
app.get('/', async (req, res, next) =>{
    res.status(200).send({
        message: 'Welcom to Api Blogs'
    })
})

// Routes
routes(app)

// Error Hendler
app.use (response.errorHandler)

// App listen
app.listen(port, () => {
    console.log(`Server is listening on http://localhost:${port}`)
})

class _response {
    sendResponse = (res, data) => {
        try {
            if(data.code) {
                res.status(data.code)
                
                delete data.code

                res.send(data)
                return true
            }

            res.status(data && data.status ? 200 : 500)
            res.send(data)
            return true
        } catch (error) {
            console.log('SendResponses response helper error" ', error)

            res.status(400).send({
                status: false,
                error
            })
            return false
        }
    }

    // Default error hendling
    errorHandler = (err, req, res, next) => {
        if (err.name === 'UnautorizedError') {
            res.status(401).send({
                status: false,
                error: 'Invalid Token'
            })
        }

        return res.status(500).send({
            status:false,
            error: err.message
        })
    }
}

module.exports= new _response
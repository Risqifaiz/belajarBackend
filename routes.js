const AuthController = require("./controllers/AuthController");
const CommentController = require("./controllers/CommentController");
const ArtikelController = require("./controllers/ArtikelController");
const UserController = require("./controllers/UserController");

//define url api
const _routes = [
    ['', AuthController],
    ['/artikel', ArtikelController],
    ['/user', UserController],
    ['/comment', CommentController],
]

// http://localhost:5001/api/todos
const routes = (app) => {
    _routes.forEach((route) => {
        const [url, controller] = route
        app.use(`/api${url}`, controller)
    })
}

module.exports = routes
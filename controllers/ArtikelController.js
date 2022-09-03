const { Router } = require('express')
const m$artikel = require('../modules/artikel.module')
const response = require('../helpers/response')
const userSession = require('../helpers/middleware')

const ArtikelController = Router()

/**
 * List Todo
 */
ArtikelController.get('/', userSession, async (req, res, next) => {
    const list = await m$artikel.listArtikel(req.query)

    response.sendResponse(res, list)
})

/**
 * Detail ARtikel
 */
ArtikelController.get('/detail', userSession, async (req, res, next) => {
    // req.query
    // http://localhost:5001/api/todos/detail?id=1
    const detail = await m$artikel.detailArtikel(req.query.id)

    response.sendResponse(res, detail)
})

/**
 * Add Todo
 * @param {string} title
 * @param {string} description
 */
ArtikelController.post('/', userSession, async (req, res, next) => {
    // req.body req.params req.query
    const add = await m$artikel.addArtikel(req.body)

    response.sendResponse(res, add)
})

/**
 * Edit Todo
 * @param {number} id
 * @param {string} title
 * @param {string} description
 */
ArtikelController.put('/', userSession, async (req, res, next) => {
    const edit = await m$artikel.editArtikel(req.body)

    response.sendResponse(res, edit)
})

/**
 * Delete Todo
 * @param {number} id
 */
ArtikelController.delete('/:id', userSession, async (req, res, next) => {
    const del = await m$artikel.deleteArtikel(req.params.id)

    response.sendResponse(res, del)
})

module.exports = ArtikelController

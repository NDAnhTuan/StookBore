import {Router} from 'express'
import getBooks from './controllers/getBooks.js'
import getCategories from './controllers/getCategories.js'
import getOrders from './controllers/getOrders.js'
import getSingleOrder from './controllers/getSingleOrders.js'
import addBook from './controllers/addBook.js'
import deleteBook from './controllers/deleteBook.js'
import updateBook from './controllers/updateBook.js'
import paginationHandler from '#~/middleware/paginationHandler.js'
import addOrders from './controllers/addOrders.js'
import updateOrder from './controllers/updateOrder.js'

const user_router = Router()

user_router.get('/books', paginationHandler, getBooks)
user_router.post('/book', addBook)
user_router.delete('/book', deleteBook)
user_router.put('/book', updateBook)

user_router.get('/categories', getCategories)

user_router.get('/orders', getOrders)
user_router.get('/order', getSingleOrder)
user_router.post('/order', addOrders)
user_router.put('/order', updateOrder)

export default user_router
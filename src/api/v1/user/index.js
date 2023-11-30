import {Router} from 'express'
import getBooks from './controllers/getBooks.js'
import getCategories from './controllers/getCategories.js'
import getOrders from './controllers/getOrders.js'
import getSingleOrder from './controllers/getSingleOrders.js'

const user_router = Router()

user_router.get('/books', getBooks)
user_router.get('/categories', getCategories)
user_router.get('/orders', getOrders)
user_router.get('/order', getSingleOrder)

export default user_router
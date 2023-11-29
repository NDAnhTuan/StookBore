import {Router} from 'express'
import getBooks from './controllers/getBooks.js'
import getCategories from './controllers/getCategories.js'

const user_router = Router()

user_router.get('/books', getBooks)
user_router.get('/categories', getCategories)
export default user_router
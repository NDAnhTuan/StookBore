import getBooks from "./getBooks.js"
import addBook from "./addBook.js"
import deleteBook from "./deleteBook.js"
import updateBook from "./updateBook.js"

class Book{
    getBooks=getBooks
    addBook=addBook
    deleteBook=deleteBook
    updateBook=updateBook
}

export default Book
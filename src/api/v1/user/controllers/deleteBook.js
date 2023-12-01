import Book from "#~/model/book/index.js"

const deleteBook = async (req, res, next) => {
    try {
        const {book_id} = req.query
        const data = await new Book().deleteBook({book_id: parseInt(book_id)})
        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default deleteBook
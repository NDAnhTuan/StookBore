import Book from "#~/model/book/index.js"

const updateBook = async (req, res, next) => {
    try {
        
        const {
            book_id,
            title,
            descriptions,
            publisher,
            author,
            stock,
            current_price,
            edition_version,
            category_id
        } = req.body

        const data = await new Book().updateBook({
            book_id,
            title,
            descriptions,
            publisher,
            author,
            stock,
            current_price,
            edition_version,
            category_id
        })

        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default updateBook
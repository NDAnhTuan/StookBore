import Book from '#~/model/book/index.js'

const addBook = async (req, res, next) => {
    try {
        const {
            title,
            descriptions,
            publisher,
            author,
            stock,
            current_price,
            edition_version,
            category_id
        } = req.body

        const data = await new Book().addBook({
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

export default addBook
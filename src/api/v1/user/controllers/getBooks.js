import Book from "#~/model/book/index.js"

const getBooks = async (req, res, next) => {
    try {
        const { category_id, sortByPrice, searchTitle } = req.query
        const data = await new Book().getBooks({
            category_id: parseInt(category_id),
            sortByPrice: parseInt(sortByPrice),
            searchTitle
        })
        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default getBooks
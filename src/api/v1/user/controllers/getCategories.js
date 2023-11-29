import Category from "#~/model/category/index.js"

const getCategories = async (req, res, next) => {
    try {
        const data = await new Category().getCategories({})
        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default getCategories
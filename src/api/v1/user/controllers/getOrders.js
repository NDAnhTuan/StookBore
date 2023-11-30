import Order from "#~/model/order/index.js"

const getOrders = async (req, res, next) => {
    try {
        const {user_id} = req.query
        const data = await new Order().getOrders({user_id})
        res.status(200).json({data})
    } catch (error) {
        next(error)   
    }
}

export default getOrders
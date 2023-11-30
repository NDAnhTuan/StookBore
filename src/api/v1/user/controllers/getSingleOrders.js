import Order from "#~/model/order/index.js"

const getSingleOrder = async (req, res, next) => {
    try {
        const {order_id} = req.query
        const data = await new Order().getSingleOrder({order_id})
        res.status(200).json({data})
    } catch (error) {
        next(error)   
    }
}

export default getSingleOrder
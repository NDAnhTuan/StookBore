import Order from "#~/model/order/index.js"

const updateOrder = async (req, res, next) => {
    try {
        
        const {
            order_id,
            order_status,
            shipment_status,
        } = req.body

        const data = await new Order().updateOrder({
            order_id,
            order_status,
            shipment_status,
        })
        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default updateOrder
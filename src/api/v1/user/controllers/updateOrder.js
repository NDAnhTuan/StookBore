import Order from "#~/model/order/index.js"

const updateOrder = async (req, res, next) => {
    try {
        
        const {

        } = req.body

        const data = await new Order().updateOrder({

        })
        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default updateOrder
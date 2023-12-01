import Order from "#~/model/order/index.js"
import DateNow from "./dateService.js"

const addOrders = async (req, res, next) => {
    try {
        
        const {
            shipment_method,
            shipment_price,
            street,
            district,
            city,
            country,
            payment_method,
            client_id,

            books // [  {bool_id, quantity}, ......]
        } = req.body

        const now = DateNow()

        const data = await new Order().addOrders({
            
            order_status: "Processing",
            shipment_method,
            shipment_date: now,
            shipment_price,
            shipment_status: 0,
            street,
            district,
            city,
            country,
            payment_method,
            paid_date: now,
            client_id,

            books // [  {bool_id, quantity}, ......]
        })
        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default addOrders
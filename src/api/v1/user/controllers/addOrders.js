import Order from "#~/model/order/index.js"

const addOrders = async (req, res, next) => {
    try {
        
        const {
            order_status,
            shipment_method,
            shipment_date,
            shipment_price,
            shipment_status,
            street,
            district,
            city,
            country,
            payment_method,
            paid_date,
            client_id,

            books // [  {bool_id, quantity}, ......]
        } = req.body

        const data = await new Order().addOrders({
            
            order_status,
            shipment_method,
            shipment_date,
            shipment_price,
            shipment_status,
            street,
            district,
            city,
            country,
            payment_method,
            paid_date,
            client_id,

            books // [  {bool_id, quantity}, ......]
        })
        res.status(200).json({data})
    } catch (error) {
        next(error)
    }
}

export default addOrders
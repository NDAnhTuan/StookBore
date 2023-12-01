import connection from "#~/config/mySql.js"

async function updateOrder({
    order_id,
    order_status,
    shipment_status
}) {

    const [result, fields] = await connection.query(`SELECT * FROM Orders WHERE order_id=${order_id}`)

    const {
        shipment_method,
        shipment_date,
        shipment_price,
        street,
        district,
        city,
        country,
        payment_method,
        paid_date,
        client_id
    } = result[0]

    const {book_id, quantity} = {}

    await connection.query(

        'CALL update_Orders(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
            order_id,
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
            book_id,
            quantity
        ]
    )

    return {
        message: "Update Order successfully"
    }


}

export default updateOrder
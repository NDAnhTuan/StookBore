import connection from "#~/config/mySql.js"

async function updateOrder({
    order_id,
    order_status,
    shipment_status
}) {

    //Not valid type
    if(order_id !== undefined && isNaN(parseInt(order_id))) {
        return Promise.reject({
            status: 404,
            message: `Cannot find Order with order_id: ${order_id}`
        })
    }

    if(shipment_status!== undefined && isNaN(parseInt(shipment_status))) {
        return Promise.reject({
            status: 503,
            message: `Cannot update Order with shipment_status: ${shipment_status}`
        })
    }

    const [result, fields] = await connection.query(`SELECT * FROM Orders WHERE order_id=${order_id}`)

    //Not exist
    if(result.length <=0){
        return Promise.reject({
            status: 404,
            message: `Cannot find Order with order_id: ${order_id}`
        })
    }

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
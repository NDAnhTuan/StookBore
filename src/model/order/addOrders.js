import connection from "#~/config/mySql.js"

async function addOrders({
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

    books // [  {book_id, quantity}, ......]
}) {

    await connection.query(

        'CALL insert_Orders(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
        [
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
          JSON.stringify(books) 
        ],
    )

    return {
        message: "Order successfully"
    }

}   

export default addOrders
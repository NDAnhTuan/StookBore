import connection from "#~/config/mySql.js"

async function getSingleOrder({
    order_id
}) {
    let query = `CALL GetOrderDetails(${order_id})`
    let [details, fields] = await connection.query(query)
    details = details[0]

    let order_infor = {}
    if(details.length > 0){
        const {
            order_id,
            order_status,
            shipment_method,
            shipment_date,
            shipment_price,
            shipment_status,
            payment_method,
            paid_date
        } = details[0]

        //Assign to order_infor
        order_infor = {
            order_id,
            order_status,
            shipment_method,
            shipment_date,
            shipment_price,
            shipment_status,
            payment_method,
            paid_date
        }
    }

    details.map((book) => {
        const {
            book_id,
            book_title,
            book_description,
            book_publisher,
            book_author,
            book_stock,
            book_current_price,
            book_quantity,
            book_edition_version,
            book_category
        } = book

        return {
            book_id,
            book_title,
            book_description,
            book_publisher,
            book_author,
            book_stock,
            book_current_price,
            book_quantity,
            book_edition_version,
            book_category
        }
    });

    return {
        order_infor: order_infor,
        order_detail: details
    }
}

export default getSingleOrder
import connection from "#~/config/mySql.js"


async function addOrders({
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

    books // [  {book_id, quantity}, ......]
}) {


}   

export default addOrders

// p_books = {
//     books: [
//         {
//             book_id: 1,
//             quantity: 3
//         },

//         {
//             book_id: 1,
//             quantity: 3
//         },

//         {
//             book_id: 1,
//             quantity: 3
//         }
//     ]
// }
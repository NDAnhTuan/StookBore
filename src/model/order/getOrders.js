import connection from "#~/config/mySql.js"

async function getOrders({
    user_id
}) {

    let query = `CALL GetCustomerOrders(${user_id})`
    let [result, fields] = await connection.query(query)
    
    return result[0]
}

export default getOrders
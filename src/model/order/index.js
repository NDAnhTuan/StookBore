import getOrders from "./getOrders.js"
import getSingleOrder from "./getSingleOrder.js"
import addOrders from "./addOrders.js"
import updateOrder from "./updateOrder.js"

class Order {
    getOrders=getOrders
    getSingleOrder=getSingleOrder
    addOrders=addOrders
    updateOrder=updateOrder
}

export default Order
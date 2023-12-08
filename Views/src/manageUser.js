let allOrders = [];
let OrdersDetail = [];


function UserhideBackdrop() {
    document.getElementById("manage-user").style.display = "none";
}
function UsershowBackdrop() {
    document.getElementById("manage-user").style.display = "flex";
}

function BackOrder() {
    document.getElementById("content-Order").style.display = "none";
    UsershowBackdrop();
}

function HideOrder() {
    document.getElementById("content-Order").style.display = "none";
}

function BackOrderDetail() {
    document.getElementById("content-Order").style.display = "flex";
    document.getElementById("content-Order-detail").style.display = "none";
}


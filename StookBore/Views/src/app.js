/*=================== Document Title ==================*/
let alertShow = false;
var cateee;
setInterval(() => {
  document.title = 'StookBore 😍';
}, 1000);

/*=================== Modal GetUser ==================*/

// async function GetUserId(){
//   var userID = document.querySelector('.input-UserId').value;
//   const apiUrlOrder = `https://db-stookbore-ass2.onrender.com/v1/user/orders?user_id=${userID}`;
//   try {
//     const response = await fetch(apiIncrease);
//     const data =await response.json();
//     productsDat = data.data;
//     // Call functions or perform operations that depend on productsDat here

//   } catch (error) {
//     console.error('Error fetching data:', error);
//   }
// };



/*==================== ProductsData ===================*/
//-> import productsData
// import { productsDat } from './Products.js';
let productsDat;
let categoryDat;
// function reverseItem() {
//   var parentaTag = document.querySelector('.selectbox-dropdown-content');;
//   var parentaBox = document.querySelector('.selectbox-dropdown');
//   var aTag = document.querySelector("a[onclick='reverseItem()']");
//   console.log("reverseItem", aTag);
//   var macdinh = document.querySelector('.selectbox-dropdown-macdinh');

//   parentaTag.removeChild(aTag);
//   parentaBox.removeChild(macdinh);

//   aTag.classList.remove("selectbox-dropdown-second");
//   aTag.classList.add("selectbox-dropdown-macdinh");
//   macdinh.classList.remove("selectbox-dropdown-macdinh");
//   macdinh.classList.add("selectbox-dropdown-second");

//   macdinh.setAttribute("onclick", "reverseItem()");
//   aTag.removeAttribute("onclick");
  
//   parentaTag.insertBefore(macdinh, parentaTag.firstChild);
//   parentaBox.insertBefore(aTag, parentaBox.firstChild);
//   // =============================== 
//   console.log(aTag.innerText);

// }
// document.addEventListener("DOMContentLoaded", async function () {
//   const apiUrl = "https://db-stookbore-ass2.onrender.com/v1/user/books?sortByPrice=1&per_page=5&current_page=1";

//   try {
//     const response = await fetch(apiUrl);
//     const data = await response.json();
//     console.log("data real: "+data.data);
//     productsDat = data.data;
//     console.log("data của anh Phú:" + productsDat);

//     // Call functions or perform operations that depend on productsDat here
//     processData();
//   } catch (error) {
//     console.error('Error fetching data:', error);
//   }
// });

// function processData() {
//   // Use productsDat here or perform other operations
//   const _temp = productsDat;
//   console.log("!!!" + _temp);
// }

const apiUrl = `https://db-stookbore-ass2.onrender.com/v1/user/books?category_id=1`;
const apiUrlCategory = `https://db-stookbore-ass2.onrender.com/v1/user/categories`;
async function processData() {
  // Use productsDat here or perform other operations
  console.log("after: ",productsDat);
}

console.log("before: ",productsDat);

// async function fetchData() {
//   try {
//     const response = await fetch(apiUrl);
//     const data = await response.json();
//     productsDat = data.data;
//     // Call functions or perform operations that depend on productsDat here

//     // Call another function or perform operations with productsDat here
//     await processData();
//   } catch (error) {
//     console.error('Error fetching data:', error);
//   }
// }

// // Call the fetchData function
// await fetchData();
console.log("end: ",productsDat);

let cart = [];
let buttonsDOM = [];
let buttonsDOMDOM = [];
let productsData = [];

// document.addEventListener("DOMContentLoaded", async function () {
//   // API endpoint
//   const apiUrl = "https://db-stookbore-ass2.onrender.com/v1/user/books?sortByPrice=1&per_page=5&current_page=1";
//   // Fetch data from the API
//   fetch(apiUrl)
//       .then(response => response.json())
//       .then(data => {
//           // Call function to generate 
//           console.log("data của anh Phú:", data.data);
//           setproductsDat(data.data);
//       })
//       .catch(error => console.error('Error fetching data:', error));
// });

// function setproductsDat(data) {
//   productsDat = data;
// }

// console.log("after", productsDat);

/*======================== Modal ======================*/
const cartBtn = document.querySelector('.cart-btn'),
  cartModal = document.querySelector('.cart'),
  backDrop = document.querySelector('.backdrop'),
  closeModalBtn = document.querySelector('.cart-item-confirm');

cartBtn.addEventListener('click', showModal);
closeModalBtn.addEventListener('click', closeModal);
backDrop.addEventListener('click', closeModal);

function showModal() {
  backDrop.style.display = 'block';
  cartModal.style.opacity = '1';
  cartModal.style.position = 'fixed';
  cartModal.style.top = '21%';
}

function closeModal() {
  backDrop.style.display = 'none';
  cartModal.style.opacity = '0';
  cartModal.style.top = '-100%';
}

/*==================== Get Products ===================*/
class Products {
  //-> while loading the page get products from api end point
  getProducts() {
    return productsData;
  }
}

/*================== Display Products =================*/
const OrdersDOM = document.getElementById('content-Order'), OrdersDetailDOM = document.getElementById('content-Order-detail');
const categoryDOM = document.querySelector('.nhomsanpham'),
  productsDOM = document.querySelector('.products-center'),
  cartTotal = document.querySelector('.cart-total'),
  cartItemsCounter = document.querySelector('.cart-items'),
  cartContent = document.querySelector('.cart-content'),
  clearCart = document.querySelector('.clear-cart'),
  searchInput = document.querySelector('.search'),
  userInput = document.querySelector('btn-enter-user');
console.log("OrdersDOM", OrdersDOM); 


class UI {
  //======> Display products on DOM <======
  displayOrdersDetail(orderDetail) {
    let result = '<div class="order-item-list-detail" style="display:flex">';
    
    orderDetail.forEach((item) => {

      result += `
      <div class="product" style="border-right: 1px solid #333;">
        <h4 class="cart-title">Order Infor</h4>
        <div class="product-desc" style="overflow: auto; max-height: 400px; min-height: 300px;">

          <p class="product-title">
            Order id: ${item.order_infor.order_id}
          </p>
          <p>
          Order status: ${item.order_infor.order_status}
          </p>
          <p>
          Shipment Method: ${item.order_infor.shipment_method}
          </p>
          <p>
          Shipment Date: ${item.order_infor.shipment_date}
          </p>
          <p>
          Shipment Price: ${item.order_infor.shipment_price}
          </p>
          <p>
          Shipment Status: ${item.order_infor.shipment_status}
          </p>
          <p>
          Payment Method: ${item.order_infor.payment_method}
          </p>
          <p>
          Paid Date: ${item.order_infor.paid_date}
          </p>
          <p>
          Sub Total: ${item.order_infor.sub_total}
          </p>
          <p>
          Grand Total: ${item.order_infor.grand_total}
          </p>
        </div>
      </div>
      `;
      result += `
      <div class="" style = "overflow:auto;  max-height: 400px; min-height: 300px;">
        <h4 class="cart-title">Order Detail</h4>`;
      item.order_detail.forEach((itemDetail) => {
        console.log("itemDetail", itemDetail);
        result += `
      
        <div class="" style="border: 1px solid #333;">
          <p class="product-title">
            Book id: ${itemDetail.book_id}
          </p>
          <p>
          Name: ${itemDetail.book_title}
          </p>
          <p>
          Price: ${itemDetail.book_current_price}
          </p>
          <p>
          Quantity: ${itemDetail.quantity}
          </p>
        </div>
      `;
      })
      result += `</div>`;
    });
    



    result += `</div>`;
    result += `
    <div style="text-align: center; width: 60%; background-color: #EFEFEF; border-top: 1px solid #333;">
      <button type="button" onclick="BackOrderDetail()" class="Manage-btn-cancel">Back</button>
    </div>
    `;
    OrdersDetailDOM.innerHTML = result;
  }

  displayOrders(orders) {
    let result = '<div class="order-item-list"> <h3 class="cart-title">Order List</h3>';
    
    orders.forEach((item) => {
      result += `
      <div class="product order-item">
  
        <div class="product-desc">
          <p class="product-title">
            Order id: ${item.order_id}
          </p>
        </div>
        <div class = "list-btn-item">
          <button class="btn getDetail" data-id=${item.order_id}>
            Detail
          </button>
        </div>
      </div>
      `;
    });

    result += `</div>`;
    result += `
    <div style="text-align: center; width: 60%; background-color: #EFEFEF; border-top: 1px solid #333;">
      <button type="button" onclick="BackOrder()" class="Manage-btn-cancel">Back</button>
    </div>
    `;
    OrdersDOM.innerHTML = result;
  }
  displayCategory(categorys) {
    let result = '<span>Thể loại</span>';
    console.log("categorys");
    
    categorys.forEach((item) => {
      result += `
      <button class="btn-category" data-id = ${item.category_id}>${item.category_name}</button>
      `;
    });

    categoryDOM.innerHTML = result;
  }
  displayProducts(products) {
    let result = '';
    console.log("display");
    console.log(products);
    
    products.forEach((item) => {
      result += `
      <div class="product lamdepi-container-item">
        <div class="img-container">
            <img
              class="product-img"
              src="mockup/image-20221012114323663.jpg"
              alt="${item.title}"
            />
        </div>

        <div class="product-desc">
          <p class="product-title">
            ${item.title}
          </p>
          <p class="product-price">
            VND ${item.current_price}
          </p>
        </div>
        <div class = "list-btn-item">
          <button class="btn add-to-cart" data-id=${item.book_id}>
            Buy
          </button>
          <button class="btn delete-product" onClick="showDeleteConfirmation(${item.book_id})" data-id=${item.book_id}>
            Delete
          </button>
          <button class="btn edit-product" onClick="showEditForm(${item.book_id})" data-id=${item.book_id}>
            Edit
          </button>
        </div>
      </div>
      `;
    });

    productsDOM.innerHTML = result;
  }

  // =============================================

  // ============================================= getUser

  getUserId() {
    const Enterbtn = document.querySelector('.Manage-user-btn'); 
    console.log("Enterbtn:",Enterbtn);
    Enterbtn.addEventListener('click', () => {
      var userID = document.querySelector('.input-UserId').value;
      fetch(`https://db-stookbore-ass2.onrender.com/v1/user/orders?user_id=${userID}`)
        .then(response => response.json())
        .then(data => {
            allOrders = data.data;
            console.log("get all order",allOrders);
            this.displayOrders(allOrders);
            UserhideBackdrop();
            this.getDetailBtn(); 
        })
        .catch(error => {
            console.error('Error fetching books:', error);
        });
        OrdersDOM.style.display = "flex";
    });
  }

  // ============================================= getUser End



  // ============================================= Detail
  getDetailBtn() {
    const Enterbtns = [...document.querySelectorAll('.getDetail')];
    Enterbtns.forEach((btn) =>{
      console.log("btn detail:", btn);
      const order_id = parseInt(btn.dataset.id);
      btn.addEventListener('click', (e) => {
        fetch(`https://db-stookbore-ass2.onrender.com/v1/user/order?order_id=${order_id}`)
        .then(response => response.json())
        .then(data => {
            OrdersDetail = [...[],(data.data)];
            console.log("get order Detail",OrdersDetail);
            this.displayOrdersDetail(OrdersDetail);
            HideOrder();
        })
        .catch(error => {
            console.error('Error fetching books:', error);
        });
        OrdersDetailDOM.style.display = "flex";
      });
    })
  }
  // ============================================= Detail End


  // deleteProductsBtns() {
  //   const deleteProBtns = [...document.querySelectorAll('.delete-product')];
  //   deleteProBtns.forEach((btn) => {
  //     const book_id = btn.dataset.id;
  //     btn.addEventListener('click', (e) => {
  //       const index = productsData.findIndex((item) => item.book_id === parseInt(book_id));
  //       if (index !== -1) {
  //         productsData.splice(index, 1);
  //         productsDOM.removeChild(btn.parentNode.parentNode);
  //         Storage.saveProducts(productsData);
  //       }
        
  //     });
      
  //   });
  // }
  reverseItem() {
    var mySelect = document.getElementById("sortPro");

    mySelect.addEventListener("change",async function() {
    // Lấy giá trị của lựa chọn được chọn
    var selectedValue = mySelect.value;
    const apiIncrease = `https://db-stookbore-ass2.onrender.com/v1/user/books?category_id=${cateee}&sortByPrice=${selectedValue}`;
    try {
      const response =await fetch(apiIncrease);
      const data =await response.json();
      productsDat = data.data;
      // Call functions or perform operations that depend on productsDat here

    } catch (error) {
      console.error('Error fetching data:', error);
    }
    // Hiển thị giá trị trong console
    // ===============================
    this.displayProducts(productsDat);
    this.getCartBtns();
  }.bind(this));
  
}
  //======> Get products & add to shopping cart <=====
  getCateBtns() {
    const cateBtns = [...document.querySelectorAll('.btn-category')];
    cateBtns.forEach((btn) => {
      const cate_id = parseInt(btn.dataset.id);
      btn.addEventListener('click', async function() {
        cateee = btn.dataset.id;
        const apiCateBook = `https://db-stookbore-ass2.onrender.com/v1/user/books?category_id=${cate_id}`;
        try {
          const response = await fetch(apiCateBook);
          const data = await response.json();
          productsData = data.data;
          
          // Call functions or perform operations that depend on productsDat here
        } catch (error) {
          console.error('Error fetching data:', error);
        }
        this.displayProducts(productsData);
        this.getCartBtns();
        // Storage.saveProducts(productsDat);
      }.bind(this));
    })
  }

  getCartBtns() {
    //-> btns are NodeList -> to convert NodeList to Array
    const addCartBtns = [...document.querySelectorAll('.add-to-cart')];
    console.log("addCartBtns cua getCart: ",addCartBtns);

    buttonsDOMDOM = addCartBtns;

    //-> display products on cart
    addCartBtns.forEach((btn) => {
      const book_id = btn.dataset.id;

      //-> check if product is in the cart
      const isExist = cart.find((p) => p.book_id === parseInt(book_id));

      if (isExist) {
        btn.textContent = 'Added';
        btn.disabled = true;
      }

      btn.addEventListener('click', (e) => {
        //-> when btn clicked to add product to cart
        e.target.textContent = 'Added';
        e.target.disabled = true;

        //-> get products that has been added before, from localStorage
        //-> quantity: 1 -> to find out whether it has been added or not
        const addedProduct = { ...Storage.getProducts(book_id), quantity: 1 };

        //-> update shopping cart
        cart = [...cart, addedProduct];

        //-> save shopping cart to localStorage
        Storage.saveCart(cart);

        //-> update number of items in shoppingCart & totalPrice
        this.setCartValue(cart);

        //-> display added products in shopping cart
        this.addCartItem(addedProduct);
      });
    });
  }

  setCartValue(cart) {
    //-> total price of cart
    let tempCartItems = 0;

    const totalPrice = cart.reduce((acc, curr) => {
      //-> show number of items in cart
      tempCartItems += curr.quantity;

      return acc + curr.quantity * curr.current_price;
    }, 0);

    cartTotal.textContent = `Total price: VND ${totalPrice.toFixed(2)}`;

    cartItemsCounter.textContent = tempCartItems;
  }

  addCartItem(cartItem) {
    const div = document.createElement('div');
    div.classList.add('cart-item');

    div.innerHTML = `
    <img
      class="cart-item-img"
      src="mockup/image-20221012114323663.jpg"
    />

    <div class="cart-item-desc">
      <h4>${cartItem.title}</h4>
      <h5>VND ${cartItem.current_price}</h5>
    </div>

    <div class="cart-item-controller">
      <i class="ti-angle-up arrow-up" data-id=${cartItem.book_id} ></i>
      <p>${cartItem.quantity}</p>
      <i class="ti-angle-down arrow-down" data-id=${cartItem.book_id} ></i>
    </div>

    <i class="ti-trash trash" data-id=${cartItem.book_id} ></i>
    `;

    cartContent.append(div);
  }

  // Add order
  addOrder() {
    const confirmOrder = document.querySelector('.cart-item-confirm');

    confirmOrder.addEventListener('click', () => {
      if (cart.length === 0) {
        this.clearCart();
        return;
      }

      const quant = [...document.querySelectorAll(`.cart-item-controller`)];
      console.log("quanttttttttt", quant);
      let temp_quant = [];
      quant.forEach((q) => {
        temp_quant.push(parseInt(q.innerText));
      })
      console.log("temp_quant", temp_quant);


      const idBook = [...document.querySelectorAll(`.ti-trash.trash`)];
      console.log("idBookkkkk", idBook);
      let temp_idBook = [];
      idBook.forEach((idd) => {
        temp_idBook.push(parseInt(idd.dataset.id));
      })
      console.log("temp_idBook", temp_idBook);

      let temp_books = [];
      // Assuming both arrays have the same length
      for (let i = 0; i < temp_idBook.length; i++) {
        const temp_b = {
          book_id: temp_idBook[i],
          quantity: temp_quant[i]
        };
        temp_books.push(temp_b);
      }

      console.log("books", temp_books);
      const orderAPI = `https://db-stookbore-ass2.onrender.com/v1/user/order`;
      const orderStuff = {
        shipment_method: "Fast",
        shipment_price: 20000,
        street: "123",
        district: "Dong Hoa",
        city: "HCM",
        country: "Vietnam",
        payment_method: "Cash",
        client_id: 1,
        books:  temp_books
      }

        fetch(orderAPI, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify(orderStuff)
        })
        .then(response => {
          if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
          }
          return response.json();
        })
        .then(data => console.log(data))
        .catch(error => {
          console.error('Error:', error);
          hideBackdrop();
        });
        this.clearCart();
        alert("Order successfully!");
    })

      
  };

  //======> Save information when page refreshed <=====
  setUpApp() {
    //-> get cart from localStorage - update global cart
    cart = Storage.getCart() || [];

    //-> addCartItem to Modal
    cart.forEach((cartItem) => {
      const addedCart = document.querySelector(`[data-id="${cartItem.book_id}"].add-to-cart`);
      console.log("!!!", addedCart);
      if (addedCart) {
        addedCart.textContent = 'Added';
        addedCart.disabled = true;
      }

      //-> display added products in shopping cart
      this.addCartItem(cartItem);
    });

    // Update values: price + item
    this.setCartValue(cart);
  }

  //======> Shopping-Cart functionality <=====
  cartLogic() {
    //-> clear cart
    clearCart.addEventListener('click', () => this.clearCart());

    //-> get cartContent to manipulate inc, dec and remove buttons
    cartContent.addEventListener('click', (e) => handleClick(e));

    const handleClick = (e) => {
      let target = e.target;

      if (target.classList.contains('arrow-up')) {
        increaseQuantity(target);
      } else if (target.classList.contains('trash')) {
        removeItemFromCart(target);
      } else if (target.classList.contains('arrow-down')) {
        decreaseQuantity(target);
      }
    };

    //-> increase products <-
    const increaseQuantity = (target) => {
      //get item from cart
      const addedItem = cart.find((c) => c.book_id === parseInt(target.dataset.id));
      addedItem.quantity++;

      //update total shopping cart value
      this.setCartValue(cart);

      Storage.saveCart(cart);

      //update cart item number in Modal
      target.nextElementSibling.textContent = addedItem.quantity;
    };

    //-> remove products <-
    const removeItemFromCart = (target) => {
      const removedItem = cart.find(
        (c) => c.book_id === parseInt(target.dataset.id)
      );

      //remove from cart item
      this.removeItem(removedItem.book_id);

      Storage.saveCart(cart);

      //remove product from cart content
      //its parentElement = cart-item
      cartContent.removeChild(target.parentElement);
    };

    //-> decrease products <-
    const decreaseQuantity = (target) => {
      const subtractedItem = cart.find(
        (c) => c.book_id === parseInt(target.dataset.id)
      );

      //remove when one product remained
      if (subtractedItem.quantity === 1) {
        this.removeItem(subtractedItem.book_id);

        //first parentElement = cart-item-controller
        //second parentElement = cart-item
        cartContent.removeChild(target.parentElement.parentElement);
      } else {
        subtractedItem.quantity--;

        //update cart value
        this.setCartValue(cart);

        Storage.saveCart(cart);

        //update cart item number in Modal
        target.previousElementSibling.textContent = subtractedItem.quantity;
      }
    };
  }

  clearCart() {
    //-> get all carts and pass id to removeItem()
    cart.forEach((cItem) => this.removeItem(cItem.book_id));

    //-> remove cart-content children from Modal
    while (cartContent.children.length > 0) {
      cartContent.removeChild(cartContent.children[0]);
    }

    closeModal();
  }

  removeItem(book_id) {
    //-> update cart
    cart = cart.filter((c) => c.book_id !== parseInt(book_id));

    //-> update total price & cart items
    this.setCartValue(cart);

    //-> update localStorage
    Storage.saveCart(cart);
    
    //-> get carts  and update text and disabled
    var button = buttonsDOMDOM.find(
      (btn) => parseInt(btn.dataset.id) === parseInt(book_id)
    );
    if (!button) {
      button = buttonsDOM.find(
        (btn) => parseInt(btn.dataset.id) === parseInt(book_id)
      ); 
    }
    console.log("Butto remove", button);
    button.textContent = 'Buy';
    button.disabled = false;
  }

  //======> Search Products <======
  searchItem() {
    searchInput.addEventListener('input', (e) => {
      const searchValue = e.target.value.toLowerCase();

      const filteredProducts = productsDat.filter((product) => {
        return product.title.toLowerCase().includes(searchValue);
      });

      this.displayProducts(filteredProducts);
      this.getCartBtns();
    });
  }
}

/*==================== localStorage ===================*/
class Storage {
  // save loaded products and set "products" on localStorage
  static saveProducts(products) {
    localStorage.setItem('products', JSON.stringify(products));
  }
  static getProducts(book_id) {
    const _products = JSON.parse(localStorage.getItem('products'));
    console.log("get product i: ", _products);
    console.log("get i",_products.find((p) => p.book_id === parseInt(book_id)));
    // parseInt(): convert string to integer
    return _products.find((p) => p.book_id === parseInt(book_id));
  }

  static getProductss() {
    const _products = JSON.parse(localStorage.getItem('products'));

    // return JSON.parse(localStorage.getItem('products'));
    return _products;
  }

  static saveCart(cart) {
    console.log("Tôi có chạy save cart mà");
    localStorage.setItem('cart', JSON.stringify(cart));
  }

  static getCart() {
    return JSON.parse(localStorage.getItem('cart'));
  }
}


/*================ Show products on DOM ===============*/
document.addEventListener('DOMContentLoaded', async function() {
  // Cater_id
  const ui = new UI();
  const apiCateBook = `https://db-stookbore-ass2.onrender.com/v1/user/books`;
        try {
          const response = await fetch(apiCateBook);
          const data = await response.json();
          productsDat = data.data;
          ui.displayProducts(productsDat);
          ui.getCartBtns();
          const addCartBtns = [...document.querySelectorAll('.add-to-cart')];

          buttonsDOM = addCartBtns;
          productsData = productsDat;
          console.log("DOM", buttonsDOM);
          Storage.saveProducts(productsDat);
          // Call functions or perform operations that depend on productsDat here
        } catch (error) {
          console.error('Error fetching data:', error);
        }
  try {
    const response = await fetch(apiUrlCategory);
    const data = await response.json();
    categoryDat = data.data;
    
  } catch (error) {
    console.error('Error fetching data:', error);
  }
  console.log("Beforehehe");
  // try {
  //   const response = await fetch(apiUrl);
  //   const data = await response.json();
  //   productsDat = data.data;
    
  //   // Call functions or perform operations that depend on productsDat here
  //   processData();
  // } catch (error) {
  //   console.error('Error fetching data:', error);
  // }

  
  console.log("chay cai nay");
  const products = new Products();
  // const productsDT = productsDat;
  // console.log(products.getProducts());
  // console.log("get Products: "+Storage.getProductss());
  
  //-> display products on DOM
  ui.displayCategory(categoryDat);
  ui.getCateBtns(); 

  // ui.displayProducts(productsDat);

  //-> get 
  ui.reverseItem();
  // ui.getCartBtns();
  // ui.deleteProductsBtns();
  
  //-> get card and set up app
  ui.setUpApp();

  ui.cartLogic();

  ui.searchItem();
  

  ui.getUserId();

  ui.addOrder();
  //-> Display saved products on page loading
  // Storage.saveProducts(productsDat);

});


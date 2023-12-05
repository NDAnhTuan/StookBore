/*=================== Document Title ==================*/
let alertShow = false;

setInterval(() => {
  document.title = 'StookBore 😍';
}, 1000);

/*==================== ProductsData ===================*/
//-> import productsData
import { productsDat } from './Products.js';

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
const productsDOM = document.querySelector('.products-center'),
  cartTotal = document.querySelector('.cart-total'),
  cartItemsCounter = document.querySelector('.cart-items'),
  cartContent = document.querySelector('.cart-content'),
  clearCart = document.querySelector('.clear-cart'),
  searchInput = document.querySelector('.search');

let cart = [];
let buttonsDOM = [];
let productsData = productsDat;

class UI {
  //======> Display products on DOM <======
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
              src="${item.imageUrl}"
              alt="${item.title}"
            />
        </div>

        <div class="product-desc">
          <p class="product-title">
            ${item.title}
          </p>
          <p class="product-price">
            $${item.price}
          </p>
        </div>
        <div class = "list-btn-item">
          <button class="btn add-to-cart" data-id=${item.id}>
            Buy
          </button>
          <button class="btn delete-product" data-id=${item.id}>
            Delete
          </button>
          <button class="btn edit-product" data-id=${item.id}>
            Edit
          </button>
        </div>
      </div>
      `;
    });

    productsDOM.innerHTML = result;
  }

  // =============================================
  deleteProductsBtns() {
    const deleteProBtns = [...document.querySelectorAll('.delete-product')];
    console.log("Tôi đang chạy delete");
    deleteProBtns.forEach((btn) => {
      const id = btn.dataset.id;
      console.log("Tôi đang chạy delete id = " + id);
      btn.addEventListener('click', (e) => {
        console.log("tôi ấn vô id = " + id);
        const index = productsData.findIndex((item) => item.id === parseInt(id));
        console.log("is " + index);
        if (index !== -1) {
          console.log("chạy thôi");
          console.log(productsData);
          productsData.splice(index, 1);
          console.log(btn.parentNode.parentNode);
          productsDOM.removeChild(btn.parentNode.parentNode);
          Storage.saveProducts(productsData);
          // productsDOM.innerHTML = "";
          // this.displayProducts(productsData);
          // this.getCartBtns();
        }
        
      });
      
    });
  }
  //======> Get products & add to shopping cart <=====
  getCartBtns() {
    //-> btns are NodeList -> to convert NodeList to Array
    const addCartBtns = [...document.querySelectorAll('.add-to-cart')];
    // console.log(addCartBtns);

    buttonsDOM = addCartBtns;

    //-> display products on cart
    addCartBtns.forEach((btn) => {
      // console.log(btn.dataset.id);
      const id = btn.dataset.id;

      //-> check if product is in the cart
      const isExist = cart.find((p) => p.id === id);

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
        const addedProduct = { ...Storage.getProducts(id), quantity: 1 };

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

      return acc + curr.quantity * curr.price;
    }, 0);

    cartTotal.textContent = `Total price: $ ${totalPrice.toFixed(2)}`;

    cartItemsCounter.textContent = tempCartItems;
  }

  addCartItem(cartItem) {
    const div = document.createElement('div');
    div.classList.add('cart-item');

    div.innerHTML = `
    <img
      class="cart-item-img"
      src="${cartItem.imageUrl}"
    />

    <div class="cart-item-desc">
      <h4>${cartItem.title}</h4>
      <h5>$ ${cartItem.price}</h5>
    </div>

    <div class="cart-item-controller">
      <i class="ti-angle-up arrow-up" data-id=${cartItem.id} ></i>
      <p>${cartItem.quantity}</p>
      <i class="ti-angle-down arrow-down" data-id=${cartItem.id} ></i>
    </div>

    <i class="ti-trash trash" data-id=${cartItem.id} ></i>
    `;

    cartContent.append(div);
  }

  //======> Save information when page refreshed <=====
  setUpApp() {
    //-> get cart from localStorage - update global cart
    cart = Storage.getCart() || [];

    //-> addCartItem to Modal
    cart.forEach((cartItem) => {
      const addedCart = document.querySelector(`[data-id="${cartItem.id}"]`);

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
      const addedItem = cart.find((c) => c.id === parseInt(target.dataset.id));
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
        (c) => c.id === parseInt(target.dataset.id)
      );

      //remove from cart item
      this.removeItem(removedItem.id);

      Storage.saveCart(cart);

      //remove product from cart content
      //its parentElement = cart-item
      cartContent.removeChild(target.parentElement);
    };

    //-> decrease products <-
    const decreaseQuantity = (target) => {
      const subtractedItem = cart.find(
        (c) => c.id === parseInt(target.dataset.id)
      );

      //remove when one product remained
      if (subtractedItem.quantity === 1) {
        this.removeItem(subtractedItem.id);

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
    cart.forEach((cItem) => this.removeItem(cItem.id));

    //-> remove cart-content children from Modal
    while (cartContent.children.length > 0) {
      cartContent.removeChild(cartContent.children[0]);
    }

    closeModal();
  }

  removeItem(id) {
    // console.log(id);
    //-> update cart
    cart = cart.filter((c) => c.id !== id);

    //-> update total price & cart items
    this.setCartValue(cart);

    //-> update localStorage
    Storage.saveCart(cart);

    //-> get carts  and update text and disabled
    const button = buttonsDOM.find(
      (btn) => parseInt(btn.dataset.id) === parseInt(id)
    );

    button.textContent = 'Buy';
    button.disabled = false;
  }

  //======> Search Products <======
  searchItem() {
    searchInput.addEventListener('input', (e) => {
      const searchValue = e.target.value.toLowerCase();

      const filteredProducts = productsData.filter((product) => {
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
    console.log("Tôi có chạy saveProducts mà");
    localStorage.setItem('products', JSON.stringify(products));
  }

  static getProducts(id) {
    const _products = JSON.parse(localStorage.getItem('products'));
    console.log(_products);
    // parseInt(): convert string to integer
    return _products.find((p) => p.id === parseInt(id));
  }

  static getProducts() {
    return JSON.parse(localStorage.getItem('products'));
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
document.addEventListener('DOMContentLoaded', () => {
  const products = new Products();
  const productsData = Storage.getProducts() || products.getProducts();

  const ui = new UI();
  //-> display products on DOM
  ui.displayProducts(productsData);

  //-> get buttons
  ui.getCartBtns();
  ui.deleteProductsBtns();
  //-> get card and set up app
  ui.setUpApp();

  ui.cartLogic();

  ui.searchItem();

  //-> Display saved products on page loading
  Storage.saveProducts(productsData);
});

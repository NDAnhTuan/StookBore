//======================================NOT UES (FETCH ALL BOOKS)==========================
// document.addEventListener("DOMContentLoaded", function () {
//     // API endpoint
//     console.log("chay ham anh phú");
//     const apiUrl = "https://db-stookbore-ass2.onrender.com/v1/user/books?sortByPrice=1&per_page=5&current_page=1";
//     // Fetch data from the API
//     fetch(apiUrl)
//         .then(response => response.json())
//         .then(data => {
//             // Call function to generate table
//             // console.log(data.data);
//             // generateTable(data.data);
//         })
//         // .catch(error => console.error('Error fetching data:', error));
// });


// function generateTable(data) {
//     // Get the container element
//     const tableContainer = document.getElementById("table-container");

//     // Create a table element
//     const table = document.createElement("table");

//     // Create the table header
//     const headerRow = table.insertRow();
//     for (const key in data[0]) {
//         const th = document.createElement("th");
//         th.textContent = key.charAt(0).toUpperCase() + key.slice(1); // Capitalize the first letter
//         headerRow.appendChild(th);
//     }

//     // Add a new header cell for the "Actions" column
//     const actionsHeader = document.createElement("th");
//     actionsHeader.textContent = "Actions";
//     headerRow.appendChild(actionsHeader);

//     // Create table rows and cells
//     data.forEach(item => {
//         const row = table.insertRow();
//         for (const key in item) {
//             const cell = row.insertCell();
//             cell.textContent = item[key];
//         }

//         const actionCell = row.insertCell();
        
//         const buttonContainer = document.createElement("div");
//         buttonContainer.classList.add("button-container");

//         const editButton = document.createElement("button");
//         editButton.textContent = "Edit";
//         editButton.classList.add("Manage-btn-edit");
//         editButton.addEventListener("click", function() {
//             const itemId = row.cells[0].textContent; // Assuming the ID is in the first column
//             // Add your edit logic here using the itemId
//             console.log("Edit button clicked for ID: " + itemId);
//         });
//         buttonContainer.appendChild(editButton);

//         const deleteButton = document.createElement("button");
//         deleteButton.textContent = "Delete";
//         deleteButton.classList.add("Manage-btn-delete");
//         deleteButton.addEventListener("click", function() {
//             const itemId = row.cells[0].textContent; // Assuming the ID is in the first column
//             // Add your delete logic here using the itemId
//             console.log("Delete button clicked for ID: " + itemId);
//         });
//         buttonContainer.appendChild(deleteButton);

//         actionCell.appendChild(buttonContainer);
//     });

//     // Append the table to the container
//     tableContainer.appendChild(table);
// }

// var button = document.getElementById("Manage-btn");
// button.addEventListener("click", function() {
//     window.location.href = "manageBook.html";
// });
//======================================NOT UES==========================




//=====================BEGIN ADD BOOK=========================
function hideBackdrop() {
    document.getElementById("backdrop").style.display = "none";
}
function showBackdrop() {
        document.getElementById("backdrop").style.display = "flex";
}


function addBook() {
        // Validate the form fields
    var title = document.getElementById('title').value;
    var descriptions = document.getElementById('descriptions').value;
    var publisher = document.getElementById('publisher').value;
    var author = document.getElementById('author').value;
    var stock = document.getElementById('stock').value;
    var current_price = document.getElementById('current_price').value;
    var edition_version = document.getElementById('edition_version').value;
    var category_id = document.getElementById('category_id').value;
    if (title === '') {
        alert('Please fill out title');
        return;
    }
    else if (descriptions === '') {
        alert('Please fill out descriptions');
        return;
    } else if (publisher === '') {
        alert('Please fill out publisher');
        return;
    } else if (author === '') {
        alert('Please fill out author');
        return;
    } else if (stock === '') {
        alert('Please fill out stock');
        return;
    } else if (current_price === '') {
        alert('Please fill out current price');
        return;
    } else if (edition_version === '') {
        alert('Please fill out edition version');
        return;
    } else if (category_id === '') {
        alert('Please fill out category id');
        return;
    }

    const form = document.getElementById("addBookForm");
    const formData = new FormData(form);

    fetch('https://db-stookbore-ass2.onrender.com/v1/user/book', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(Object.fromEntries(formData)),
    })
    .then(response => response.json())
    .then(data => {
        alert('Book Add successfully');
        hideBackdrop();
    })
    .catch(error => {
        console.error('Error adding book:', error);
        hideBackdrop();
    });
}
    
//==========================END ADD BOOK===========================
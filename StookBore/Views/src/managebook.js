document.addEventListener("DOMContentLoaded", function () {
    // API endpoint
    const apiUrl = "https://db-stookbore-ass2.onrender.com/v1/user/books?sortByPrice=1&per_page=5&current_page=1";
    // Fetch data from the API
    fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
            // Call function to generate table
            generateTable(data.data);
        })
        .catch(error => console.error('Error fetching data:', error));
});


function generateTable(data) {
    // Get the container element
    const tableContainer = document.getElementById("table-container");

    // Create a table element
    const table = document.createElement("table");

    // Create the table header
    const headerRow = table.insertRow();
    for (const key in data[0]) {
        const th = document.createElement("th");
        th.textContent = key.charAt(0).toUpperCase() + key.slice(1); // Capitalize the first letter
        headerRow.appendChild(th);
    }

    // Add a new header cell for the "Actions" column
    const actionsHeader = document.createElement("th");
    actionsHeader.textContent = "Actions";
    headerRow.appendChild(actionsHeader);

    // Create table rows and cells
    data.forEach(item => {
        const row = table.insertRow();
        for (const key in item) {
            const cell = row.insertCell();
            cell.textContent = item[key];
        }

        // Add "Edit" and "Delete" buttons to the same cell
        const actionCell = row.insertCell();
        
        const buttonContainer = document.createElement("div");
        buttonContainer.classList.add("button-container"); 

        const editButton = document.createElement("button");
        editButton.textContent = "Edit";
        editButton.classList.add("Manage-btn-edit"); // Add the class "manage-btn"
        editButton.addEventListener("click", function() {
            const itemId = row.cells[0].textContent; // Assuming the ID is in the first column
            // Add your edit logic here using the itemId
            console.log("Edit button clicked for ID: " + itemId);
        });
        buttonContainer.appendChild(editButton);

        const deleteButton = document.createElement("button");
        deleteButton.textContent = "Delete";
        deleteButton.classList.add("Manage-btn-delete"); // Add the class "manage-btn"
        deleteButton.addEventListener("click", function() {
            const itemId = row.cells[0].textContent; // Assuming the ID is in the first column
            // Add your delete logic here using the itemId
            console.log("Delete button clicked for ID: " + itemId);
        });
        buttonContainer.appendChild(deleteButton);

        actionCell.appendChild(buttonContainer);
    });

    // Append the table to the container
    tableContainer.appendChild(table);
}

var button = document.getElementById("Manage-btn");
button.addEventListener("click", function() {
    window.location.href = "manageBook.html";
});


//=====================BEGIN ADD BOOK=========================
function showBackdrop() {
        document.getElementById("backdrop").style.display = "flex";
    }

    function hideBackdrop() {
        document.getElementById("backdrop").style.display = "none";
    }

    function addBook() {
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
            // Handle the response as needed
            console.log('Book added successfully:', data);
            hideBackdrop();
        })
        .catch(error => {
            console.error('Error adding book:', error);
            hideBackdrop();
        });
}
    
//==========================END ADD BOOK===========================
function DateNow() {
    // Get the components of the date
    let date = new Date()
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    const day = String(date.getDate()).padStart(2, '0');
  
    // Format the date as 'yyyy-mm-dd'
    const formattedDate = `${year}-${month}-${day}`;
  
    return formattedDate;
}

export default DateNow
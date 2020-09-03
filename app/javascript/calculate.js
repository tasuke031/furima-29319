function calculateTotal() {

  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const profitPrice = document.getElementById("profit")

  itemPrice.addEventListener('input', function(){
    const tax = itemPrice.value * 0.1
    const profit = itemPrice.value * 0.9
    taxPrice.innerHTML = tax
    profitPrice.innerHTML = profit  
  })
}

window.addEventListener('load', calculateTotal)

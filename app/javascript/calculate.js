function calculateTotal() {

  const itemPrice = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price")
  const profitPrice = document.getElementById("profit")

  itemPrice.addEventListener('input', function(){
    const a = itemPrice.value * 0.1
    const b = itemPrice.value * 0.9
    
    const tax = Math.floor(a)
    const profit = Math.floor(b)

    taxPrice.innerHTML = tax
    profitPrice.innerHTML = profit
  })
}

window.addEventListener('load', calculateTotal)

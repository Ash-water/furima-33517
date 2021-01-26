window.addEventListener('load', () => {
  console.log('Hello You');
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    console.log(inputValue)
    const addTaxDom = document.getElementById("add-tax-price");
    tax = inputValue * 0.1
    addTaxDom.innerHTML = Math.floor(tax)
    const addProfit = document.getElementById("profit");
    profit = inputValue - tax
    addProfit.innerHTML = Math.floor(profit)
  })
});
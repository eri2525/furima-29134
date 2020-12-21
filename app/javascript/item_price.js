window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    const salesProfit = document.getElementById("profit");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    salesProfit.innerHTML = Math.floor(inputValue * 0.9) ;
  })

});



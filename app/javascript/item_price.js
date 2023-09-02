function item_price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const salesProfitDom = document.getElementById("profit");
    salesProfitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
  })
};

window.addEventListener('turbo:load', item_price);
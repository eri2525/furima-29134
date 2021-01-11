const pay = () => {
  Payjp.setPublicKey("pk_test_3a13a3bda377d9fef70f6687");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => { 
  
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("user_transaction[number]"),
      cvc: formData.get("user_transaction[cvc]"),
      exp_month: formData.get("user_transaction[exp_month]"),
      exp_year: `20${formData.get("user_transaction[exp_year]")}`,
    };
    console.log(card)

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        console.log(token)
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden" >`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);
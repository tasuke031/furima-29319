const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener('submit', (e) => {
    e.preventDefault();

    const formResult = document.getElementById("charge-form");
    const formData = new FomtData(formResult);

    const card = {
      number: formData.get("number"),
      exp_month: formData.get("exp-month"),
      exp_year: `20${formData.get("exp-year")}`,
      cvc: formData.get("cvc"),
    };
    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type ="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("number").removeAttribute("name");
      document.getElementById("exp_month").removeAttribute("name");
      document.getElementById("exp-year").removeAttribute("name");
      document.getElementById("cvc").removeAttribute("name");

      document.getElementById("charge-form").submit();
      document.getElementById("charge-form").reset();
    });
  });
};

window.addEventListener('load', pay);
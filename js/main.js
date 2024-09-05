const transactType = document.querySelector("#transact-type");

const paymentCard = document.querySelector(".payment");
const transferCard = document.querySelector(".transfer");
const depositCard = document.querySelector(".deposit");
const withdrawCard = document.querySelector(".withdraw");

transactType.addEventListener("change", function() {
    // Hide all cards initially
    paymentCard.style.display = "none";
    transferCard.style.display = "none";
    depositCard.style.display = "none";
    withdrawCard.style.display = "none";
    
    // Show the relevant card based on the selected transaction type
    switch (transactType.value) {
        case "Payment":
            paymentCard.style.display = "block";
            break;
        case "Transfer":
            transferCard.style.display = "block";
            break;
        case "Deposit":
            depositCard.style.display = "block";
            break;
        case "Withdraw":
            withdrawCard.style.display = "block";
            break;
        default:
            // No selection or invalid selection, keep all hidden
            paymentCard.style.display = "none";
            transferCard.style.display = "none";
            depositCard.style.display = "none";
            withdrawCard.style.display = "none";
            break;
    }
});


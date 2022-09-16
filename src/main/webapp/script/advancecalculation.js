/**
 * 
 */
function calculatePriceAmount() {
	console.log("inside function")
	let price = document.getElementById("price").value;
	let availableQuantity = document.getElementById("avl_qty").value;
	let qty = document.getElementById("qty").value;
	if(availableQuantity<qty){
		window.alert("We only have" + availableQuantity + "books. Please Order less than" + availableQuantity + "or Order later");
	}
	else{
		let totalPrice = qty * price;
	document.getElementById("totalPrice").value = totalPrice;
	}
	
}

function calculatePriceAmount() {
	console.log("inside function")
	let price = parseInt(document.getElementById("price").value);
	let availableQuantity = parseInt(document.getElementById("avl_qty").value);
	let qty = parseInt(document.getElementById("qty").value);
	let quantity = document.getElementById("qty").value;
	console.log(typeof(quantity));
	if(availableQuantity < qty){
		console.log(qty + " " + availableQuantity);
		document.getElementById("qty").value = "";
		document.getElementById("totalPrice").value = 0;
		window.alert("We only have " + availableQuantity + " books. Please Order less than " + availableQuantity + " or Order later!"); 
	}
	else{
		if(quantity === ""){
			document.getElementById("totalPrice").value = 0;
		}
		else{
			let totalPrice = qty * price;
			document.getElementById("totalPrice").value = totalPrice;
		}
		
	}
	
}
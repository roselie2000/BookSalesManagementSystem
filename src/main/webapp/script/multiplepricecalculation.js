function setPrice(trigger){
		let container = document.getElementById(trigger);
		let qty = container.querySelector('.qty').value;
		let price = container.querySelector('.price');
		let defaultPrice = document.getElementById("price").value;
		if(qty <= 0){
			price.value = defaultPrice;
		}
		else{
			let total = defaultPrice * qty;
			price.value = total;
		}
	}
	
	function sumAllPrice(){
		let allPrice = document.querySelectorAll('.price');
		let sum = 0;
		for(let i=0; i<allPrice.length; i++){
			let num = parseInt(allPrice[i].value);
			sum += num;
		}
		document.getElementById('totalPrice').innerHTML = sum;
	}
	
		function increaseQuantity(trigger){
			let container = document.getElementById(trigger);
			let qty = parseInt(container.querySelector('.qty').value);
			const price = document.getElementById("price").value
			if(Number.isNaN(qty)){
				qty = 1;
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
			}
			else{
				qty++;
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
			}
			
		}
		
		function decreaseQuantity(trigger){
			let container = document.getElementById(trigger);
			let qty = parseInt(container.querySelector('.qty').value);
			const price = document.getElementById("price").value;
			qty--;
			if(qty <= 1){
				qty = 1;
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
				
			}
			else{
				container.querySelector('.qty').value = qty;
				let total = price * qty;
				container.querySelector('.price').value = total;
				sumAllPrice();
			}
			
		}
function sumAllPrice(){
	let allPrice = document.querySelectorAll('.price');
	let sum = 0;
	for(let i=0; i<allPrice.length; i++){
		let num = parseInt(allPrice[i].innerHTML);
		sum += num;
	}
 	document.getElementsByClassName('totalPrice')[0].innerHTML = "Rs. " + sum; 
}

function checkMonth(){
	let month = document.getElementById("month").value;
	if(month>12 || month<=0){
		window.alert("The month should be within 1 to 12!");
		document.getElementById("month").value = "";
	}
}

function checkYear(){
	let year = document.getElementById("year").value;
	console.log(year);
	if(year < 22 || year > 27){
		window.alert("The expire year of card should be within 22 to 26!!");
		document.getElementById("year").value = "";
	}
}

function member(msg,clk) {
	   let confirmBox = $("#container");
	   confirmBox.find(".msg").text(msg);
	   confirmBox.find(".yes").unbind().click(function()
	   {
	   confirmBox.hide();
	   });
	   confirmBox.find(".yes").click(clk);
	   confirmBox.show();
	  }
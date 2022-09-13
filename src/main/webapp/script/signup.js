/**
 * 
 */
 function myFunction() {
	  let x = document.getElementById("pwd");
	  if (x.type === "password") {
	    x.type = "text";
	  } else {
	    x.type = "password";
	  }
	}
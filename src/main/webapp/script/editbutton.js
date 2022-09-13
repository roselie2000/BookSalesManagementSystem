/**
 * 
 */
 function enable(trigger){
			let cont=trigger.querySelectorAll('.inactive');
			for(let i = 0; i < cont.length; i++){
				cont[i].classList.add('active');
			}
		}
		
		function disable(trigger){
			let cont=trigger.querySelectorAll('.active');
			for(let i = 0; i < cont.length; i++){
				cont[i].classList.add('inactive');
			}
		}
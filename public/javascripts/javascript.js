$(function() {
	var sortListBtn = document.querySelector('#submit-list');

	sortListBtn.addEventListener('click', function() {
		var unsortedList = document.getElementById('unsorted-list-input').value;
		var useAscii = document.getElementById('ascii').checked;
		var useReverse = document.getElementById('reverse').checked;

		$.post('/sortit', {
			unsorted: unsortedList, 
			ascii: useAscii, 
			reverse: useReverse
		})
		.done(function(data) {
			document.getElementById('sorted-list-output').value = data;
			document.getElementById('result-text').innerHTML = 'Sorted!';
		})
		.fail(function(data) {
			document.getElementById('result-text').innerHTML = 'Sort failed :(';
		});
	});
		
	// var request = new XMLHttpRequest();
	// request.open('POST', '/sortit', true);
	// request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
	// request.onreadystatechange = function() {
	// 	if(request.readyState == 4 && request.status == 200) {
	// 		alert(request.responseText);
	// 	}
	// }
	// request.send({
	// 	unsorted: unsortedList, 
	// 	ascii: useAscii, 
	// 	reverse: useReverse
	// });

	var copyListBtn = document.querySelector('#copy-list');

	copyListBtn.addEventListener('click', function() {  
	  var sortedList = document.querySelector('#sorted-list-output');  
	  sortedList.select();

	  try {  
	    var successful = document.execCommand('copy');  
	    var msg = successful ? 'Copied!' : 'Copying is not supported';  
	    document.getElementById('result-text').innerHTML = 'Copied!'; 
	  } catch(err) {  
	    console.log('Oops, unable to copy');  
	  }  
	});

});
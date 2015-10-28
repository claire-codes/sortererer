document.addEventListener('DOMContentLoaded', function() {
	var sortListBtn = document.querySelector('#submit-list');

	sortListBtn.addEventListener('click', function() {
		var unsortedList = document.getElementById('unsorted-list-input').value;
		var useAscii = document.getElementById('ascii').checked;
		var useReverse = document.getElementById('reverse').checked;
		
		var request = new XMLHttpRequest();
		request.open('POST', '/sortit', true);
		request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
		request.onreadystatechange = function() {
			if (request.readyState == 4 && request.status == 200) {
				document.getElementById('sorted-list-output').value = request.responseText;
				document.getElementById('result-text').innerHTML = 'Sorted!';
			} else {
				document.getElementById('result-text').innerHTML = 'Sort failed :(';
			}
		};
		request.send(encodeURI('unsorted=' + unsortedList + '&ascii=' + useAscii + '&reverse=' + useReverse));
		
	});

	var copyListBtn = document.querySelector('#copy-list');

	copyListBtn.addEventListener('click', function() {  
		var sortedList = document.querySelector('#sorted-list-output');  
		sortedList.select();

		try {
			var successful = document.execCommand('copy');
		} catch(err) {
			console.log(err);  
		}
		document.getElementById('result-text').innerHTML = 'Copied!'; 
	});

});
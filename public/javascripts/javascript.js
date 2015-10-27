document.addEventListener("DOMContentLoaded", function(event) {
	var sortListBtn = document.querySelector('#submit-list');

	sortListBtn.addEventListener('click', function() {
		var unsortedList = encodeURI(document.getElementById('unsorted-list-input').value);
		var useAscii = encodeURI(document.getElementById('ascii').checked);
		var useReverse = encodeURI(document.getElementById('reverse').checked);
		
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
		}
		request.send('unsorted=' + unsortedList + '&ascii=' + useAscii + '&reverse=' + useReverse);
		
	});

	var copyListBtn = document.querySelector('#copy-list');

	copyListBtn.addEventListener('click', function() {  
	  var sortedList = document.querySelector('#sorted-list-output');  
	  sortedList.select();

	  try {  
	    var successful = document.execCommand('copy');  
	    var msg = successful ? 'Copied!' : 'Copying is not supported';  
	    document.getElementById('result-text').innerHTML = 'Copied!'; 
	  } catch(err) {  
	    document.getElementById('result-text').innerHTML = 'Oops, unable to copy';  
	  }  
	});

});
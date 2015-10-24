$(function() {
	console.log("Dammit");
	$('#submit-list').click(function() {
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
	});

	$('#copy-list').click(function() {

	});
});
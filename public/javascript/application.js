var setUpHandlers = function() {
	$('#get_students').click(function() {
		$.ajax({
			url: '/students',
			type: 'GET',
			dataType: 'json',
			success: function(data) {
				var resultsDiv = $('#results');
				$.each(data, function(index, item) {
					var paragraph = $("<p>" + item.first_name + " " + item.surname + "</p>");
					resultsDiv.append(paragraph);
				});
			}
		});
	});
}
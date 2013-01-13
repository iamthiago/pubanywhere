$(document).ready(function() {
	
	//backoffice	
	$('#tbListPubs').dataTable();
	
	$('#tbListPubs tbody').on('click', 'tr', function(){
		location.href="/pubs/editPub/" + this.id;
	});
});
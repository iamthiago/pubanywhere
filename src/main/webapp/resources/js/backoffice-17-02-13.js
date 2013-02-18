$(document).ready(function() {
	
	//backoffice	
	$('#tbListPubs').dataTable();
	
	$('#tbListPubs tbody').on('click', 'tr', function(){
		location.href="/backoffice/editPub/" + this.id;
	});
	
	$('#save').button();
	
	$('#passwordModal').dialog({ autoOpen: false });
	
	$('#btnChangePassword').click(function(e){
		e.preventDefault();
		$('#passwordModal').dialog({
			autoOpen: false,
			modal: true,
			draggable: false,
			height: 230,
			width: 325,
			resizable: false
		}).dialog('open');
		
		$('#passError').hide();
	});
	
	$('#save').click(function(e){
		e.preventDefault();
		var senha = $('#senha').val();
		var confirmSenha = $('#confirmarSenha').val();
		
		if(senha != '' && confirmSenha != '') {
			if(senha == confirmSenha){
				$('#passwordForm').submit();
			} else {
				$('#passError').show();
			}
		} else {
			$('#passError').show();
		}
	});
	
});
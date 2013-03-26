$(document).ready(function() {
	$('#btnLogin, #btnCreateNewUser, #btnSendPassword').button();
	
	$('#div-signIn').show();
	$('#div-signUp').hide();
	$('#div-password').hide();
	
	$('#btnSignUp').click(function(){
		$('#div-signIn').hide();
		$('#div-password').hide();
		$('#div-signUp').show();
	});
	
	$('#btnPassSignIn').click(function(){
		$('#div-signIn').show();
		$('#div-signUp').hide();
		$('#div-password').hide();
	});
	
	$('#btnCreateSignIn').click(function(){
		$('#div-signIn').show();
		$('#div-signUp').hide();
		$('#div-password').hide();
	});
	
	$('#btnForgotPassword').click(function(){
		$('#div-signIn').hide();
		$('#div-signUp').hide();
		$('#div-password').show();
	});
	
	
	/*login actions*/	
	$('#btnCreateNewUser').click(function(e){
		e.preventDefault();
		$.post("/user/createNewUser", $("#userForm").serialize())
			.done(function(data) {
				resultMessageModal(data);
			});
	});
	
	$('#btnSendPassword').click(function(e){
		e.preventDefault();
		$.post("/user/forgotPassword", $("#passwordForm").serialize())
			.done(function(data) {
				resultMessageModal(data);
			});
	});
});
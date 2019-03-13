<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
    font-family: Arial, Helvetica, sans-serif;
    background-color: black;
}

*{
    box-sizing: border-box;
}

/* Add padding to containers */
.container {
    padding: 16px;
    background-color: white;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Add a blue text color to links */
a {
    color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
    background-color: #f1f1f1;
    text-align: center;
}
</style>
</head>

<script>

function redirect(id){
	var elem=document.getElementById(id);
	elem.submit();
}

</script>
<body style="background-color: whitesmoke;">
		<div id="signinDiv" style="width: 35%;margin:0 auto;">
			<div class="container">
				<i class="fa fa-window-close-o" style="font-size:100px;color:red;padding-left: 40%;"></i>
				<h2 align="center">Something went Wrong.</h2>
				<p align="center">Please Try Again.</p>
				<hr>
			</div>
			<div class="container signin" style="display:block">
				<p><a href="javascript:redirect('home')">Home</a> | <a href="javascript:redirect('signin')">Sign-in/Sign-up</a></p>
			 </div>			  
		</div>
		<form id="home" action="welcome" method="post" ></form>
		<form id="signin" action="login.jsp" method="post"></form>
</body>
<br>
<br>
<jsp:include page="footer.jsp"/>
</html>

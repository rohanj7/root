<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="s" uri="/struts-tags" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
    font-family: Arial, Helvetica, sans-serif;
    background-color: black;
}

* {
    box-sizing: border-box;
}

/* Add padding to containers */
.container {
    padding: 16px;
    background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

/* Overwrite default styles of hr */
hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn,.loginbtn{
    background-color: #4CAF50;
    color: white;
    padding: 16px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

.registerbtn:hover,.loginbtn:hover{
    opacity: 1;
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
		//elem.setAttribute("action","login.jsp");
		elem.submit();
	}
</script>
<body style="background-color: whitesmoke;">


		<div id="signinDiv" style="width: 35%;margin:0 auto;">
			<div class="container">
				<i class="fa fa-user" style="font-size:100px;color:green;padding-left: 40%;"></i>
				<h2 align="center">
					<s:if test="%{status!=null}">
						<s:if test="%{status=='notfound' || status=='incorrect'}">
							Incorrect credentials!! Please try again.
						</s:if>
						<s:else>
							User Already Exist
						</s:else>
					</s:if>
				</h2>
				<s:if test="%{status!=null}">
					<s:if test="%{status!='notfound' && status!='incorrect'}">
						<p align="center">User Status : 
								<s:if test="%{status=='active'}">
									<span style="color:green" >ACTIVE</span>
								</s:if>
								<s:else>
				    				<span style="color:red" >INACTIVE</span>
				    			</s:else>
						</p>
					</s:if>
				</s:if>
				<p align="center">Please contact your administrator to enable your account if status is "<span style="color:red" >INACTIVE</span>".</p>
				<hr>
			</div>
			
			<div class="container signin" style="display:block">
				<p><a href="javascript:redirect('home')">Home</a> | <a href="javascript:redirect('signin')">Sign in</a></p>
			 </div>			  
		</div>
		
		
		<form id="home" action="welcome" method="post" ></form>
		<form id="signin" action="login.jsp" method="post"></form>
		
		
</body>
<br>
<br>
<jsp:include page="footer.jsp"/>
</html>

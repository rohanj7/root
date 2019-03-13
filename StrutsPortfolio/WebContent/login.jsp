<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<body style="background-color: whitesmoke;">
		
		<div><a href="javascript:redirect('home')" >Home page</a></div>
		<div id="header" style="width: 35% !important;margin:0 auto;">
			<div class="container" style="border-bottom: dotted;padding-bottom: 0px;color: brown;">
				<p align="center" style="font-size: 34px;"><i class="fa fa-child" style="font-size:55px"></i><b>Student Portal</b></p>
			</div>
		</div>
		
		<div id="signinDiv" style="width: 35% !important;margin:0 auto;">
			<form id="signin" action="login" method="POST">
			  <div class="container">
				<h2>LOGIN</h2>
				<p>Enter Credentials To Login</p>
				<hr>

				<label for="email"><b>Roll Number</b></label>
				<input type="text" placeholder="Enter Roll Number" name="rollnumber" required>

				<label for="psw"><b>Password</b></label>
				<input type="password" placeholder="Enter Password" name="userPassword" required>

				<p> <a href="#">Forgot Password</a>.</p>
				<button type="submit" class="loginbtn">Login</button>
				
				<div class="container signin" style="display:block">
					<p><a href="javascript:switchTo('signupDiv')" >Create Account</a></p>
				</div>
			  
			  </div>
			  
			</form>
		</div>
		
		<div id="signupDiv" style="width: 35%;margin:0 auto;display:none">
			<form id="singup" action="register" method="POST">
			  <div class="container">
				<h1>Register</h1>
				<p>Please fill in this form to create an account.</p>
				<hr>

				<label for="email"><b>Email</b></label>
				<input type="text" placeholder="Enter Email" name="email" required>
				
				<label for="rollNo"><b>Roll No.</b></label>
				<input type="text" placeholder="Enter Roll Number" name="rollNo" required>
				
				<label for="firstName"><b>First Name</b></label>
				<input type="text" placeholder="Enter First Name" name="firstName" required>
				
				<label for="lastName"><b>Last Name</b></label>
				<input type="text" placeholder="Enter last Name" name="lastName" required>
				
				<div style="padding-bottom:15px">
					<label for="dob"><b>DOB</b></label>
					<input type="date" placeholder="DD/MM/YYYY" name="dob" style="width:100%;height:45px;" required>
				</div>
				
				<label for="yoj"><b>Year of Joining</b></label>
				<input type="text" placeholder="Enter Year of Joining" name="yoj" required>
				
				<label for="sem"><b>Semester</b></label>
				<select name="sem" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
				</select>
				
				<label for="course"><b>Course</b></label>
				<div style="padding-top: 5px;padding-bottom: 15px;">
					<select name="prog" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<s:iterator value="programmeD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
				</div>
				
				<label for="branch"><b>Branch</b></label>
				<div style="padding-top: 5px;padding-bottom: 15px;">
					<select name="branch" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<s:iterator value="branchD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
				</div>
				
				<label for="section"><b>Section</b></label>
				<select name="section" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<option value="A">A</option>
						<option value="B">B</option>
				</select>
				
				<div style="padding-top:15px;padding-bottom:15px">
					<label for="mobNum"><b>Mobile Number</b></label>
					<input type="digit" placeholder="Enter Mobile Number" name="mobNum" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;" required>
				</div>
				<label for="psw"><b>Password</b></label>
				<input id="psw1" type="password" placeholder="Enter Password" name="psw" required>

				<label ><b>Repeat Password</b></label>
				<input id="psw2" type="password" placeholder="Repeat Password" required>
				<hr>
				<p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

				<button type="submit" class="registerbtn">Register</button>
			  </div>
			  
			  <div class="container signin" style="display:block">
				<p>Already have an account? <a href="javascript:switchTo('signinDiv')">Sign in</a>.</p>
			  </div>
			</form>
		</div>
		<form id="home" method="post" action="welcome"></form>
<script>

function switchTo(id){

	if(id == "signinDiv"){
		document.getElementById("signinDiv").style.display="block";
		document.getElementById("signupDiv").style.display="none";
	}else{
		document.getElementById("signinDiv").style.display="none";
		document.getElementById("signupDiv").style.display="block";
	}
	
}

function redirect(id){
	var elem=document.getElementById(id);
    elem.submit();
}

</script>
</body>
<jsp:include page="footer.jsp"/>
</html>

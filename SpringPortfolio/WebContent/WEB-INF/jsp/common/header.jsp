<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/1.10.18/css/jquery.dataTables.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<style>
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
	 }
   </style>
</head>
<script>

	function logout(){
		var elem=document.getElementById("logout");
	    elem.submit();
	}

</script>
<body>
	
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid" >
	    <div class="navbar-header" style="height:80px">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>                        
	      </button>
	      <a style="color: lightyellow;" class="active navbar-brand " href="#"><i class="fa fa-child" style="font-size:40px"></i> Student Portal</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	       <!-- <li class="active" style="font-size:18px"><a href="#">Home</a></li>-->
	        <li style="font-size:18px" id="profli"><a href="#" data-toggle="modal" data-target="#myModalprofile" onclick="renderUI()" style="padding-top: 32px;padding-left: 35px;">Profile</a></li>
	
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#" onclick="logout()" ><i class="fa fa-hand-o-right" style="font-size:35px" ></i>Logout</a></li>
	      </ul>
	    </div>
	  </div>
	</nav>

	<div id="messageAlertDiv" style="margin-bottom:0px;">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
	    <strong><s:property value='serverResponseMessage'/></strong>
	</div>

	<form id="logout" action="logout" method="post"></form>
	
	<script>
		var suc="<s:property value='serverStatus'/>";
		var elem=document.getElementById("messageAlertDiv");
		if(suc=="success" || suc=="error"){
			if(suc=="success"){
				elem.className="alert alert-success alert-dismissable";
			}else{
				elem.className="alert alert-danger alert-dismissable";
			}
			elem.style.display="block";
			setTimeout(function() {elem.style.display="none";},6000);
		}
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.semanticui.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.16/js/dataTables.semanticui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.2.13/semantic.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Confirm User</title>
<style>

.active{
	color:green;
}

.inactive{
	color:red;
}

.suspended{
	color:violet;
}

#confirmUser {border-collapse:collapse; table-layout:fixed;}
#confirmUser th{border:solid 1px antiquewhite;word-wrap:break-word;}
#confirmUser td{border:solid 1px antiquewhite;word-wrap:break-word;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../admin/adminDashboard.jsp"/>

<div id="noticeDash" class="container" style="margin-top:45px;border-style:double;padding-bottom: 25px;border-color: brown;border-radius: 10px;padding-left: 50px;"> 
<h3 style="padding-top:15px"><b>Confirm User</b><i class="fa fa-check-circle-o" style="font-size:35px" ></i></h3>
<hr>
	<div style="padding-bottom: 20px;">
		<button onclick="suspendAll()" type="button" style="width:150px;height:45px;border-radius: 5px;border: none;background-color: #23A6D4;color: white;">Suspend All</button>
	</div>
	
	<table id="confirmUser" class="display">
			<thead>
				<tr>
					<th width="5%">S No.</th>
					<th width="15%">User Name</th>
					<th width="10%">rollNo</th>
					<th width="5%">Semester</th>
					<th width="20%">Branch</th>
					<th width="5%">Programme</th>
					<th width="5%">Current Status</th>
					<th width="20%">Action</th>
				</tr>
			</thead>
			<tbody>
				<%int i=1; %>
		        <s:iterator value="userlist">
		            <tr>
		                <td><% out.print(i++) ;%>.</td>
		                <td> <s:property value="firstName"/> <s:property value="lastName"/></td>
		                <td> <s:property value="rollNo"/></td>
		                <td> <s:property value="sem"/></td>
		                <td> <s:property value="branch_name"/></td>
		                <td> <s:property value="prog_name"/></td>
		                <td class='<s:property value="status"/>'><s:property value="status"/></td>
		                <td>
		                	<div>
								<s:if test = "status=='active' || status=='admin'">
									<a href="javascript:updateStatus('<s:property value='rollNo'/>','suspended')" style="color:red">Suspend user</a>
								</s:if> 
								<s:else>
									<a href="javascript:updateStatus('<s:property value='rollNo'/>','active')" style="color:green">Make active</a>
								</s:else>
								|
								<s:if test = "status=='admin'">
									<a href="javascript:updateStatus('<s:property value='rollNo'/>','active')" style="color:red">Remove as Admin</a>
								</s:if> 
								<s:else>
									<a href="javascript:updateStatus('<s:property value='rollNo'/>','admin')" style="color:blue">Make Admin</a>
								</s:else>
									
							</div>
		                </td>
		            </tr>
		        </s:iterator>
			</tbody>
	</table>
</div>
<form id="statusForm" method="post" action="changeUserStatus">
	<input type="hidden" name="rollNo" id="rollNoId">
	<input type="hidden" name="status" id="statusId">
</form>

<form id="statusFormAll" method="post" action="suspendAll">
</form>

<script>
$(document).ready( function () {
	$('#confirmUser').dataTable({
	    "pageLength": 10,
	    "autoWidth": true
	})
});

function updateStatus(roll,status){
	var elem=document.getElementById("statusForm");
	document.getElementById("rollNoId").value=roll;
	document.getElementById("statusId").value=status;
	elem.submit();
}

function suspendAll(){
    var r = confirm("Are you sure want to suspend all users?");
    if (r == true) {
    	var elem=document.getElementById("statusFormAll");
    	elem.submit();
    }
}
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
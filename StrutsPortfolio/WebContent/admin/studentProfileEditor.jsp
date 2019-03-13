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
	<title>Student Profile Editor</title>
<style>

.active{
	color:green;
}

.inactive{
	color:red;
}

#studentTable{border-collapse:collapse; table-layout:fixed;}
#studentTable th {border:solid 1px antiquewhite;word-wrap:break-word;}
#studentTable td {border:solid 1px antiquewhite;word-wrap:break-word;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../admin/adminDashboard.jsp"/>

<div id="noticeDash" class="container" style="margin-top:45px;border-style:double;padding-bottom: 25px;border-color: brown;border-radius: 10px;padding-left: 50px;"> 
<h3 style="padding-top:15px"><b>Student Profile Editor</b><i class="fa fa-address-card-o" style="font-size:35px" ></i></h3>
<hr>
	<div style="padding-bottom:20px;">
		<button id="modelButton" onclick="changeAction()" data-toggle="modal" data-target="#myModalprofile" type="button" style="width:150px;height:45px;border-radius:5px;border:none;background-color:#23A6D4;color:white;">Add Student</button>
	</div>
	
	<table id="studentTable" class="display">
			<thead>
				<tr>
					<th width="2%">S No.</th>
					<th width="15%">Roll No</th>
					<th width="15%">Name</th>
					<th width="10%">Section</th>
					<th width="15%">Semester</th>
					<th width="25%">Branch</th>
					<th width="13%">Programme</th>
					<th width="20%">Action</th>
				</tr>
			</thead>
			<tbody>
				<%int i=1; %>
		        <s:iterator value="userList">
		            <tr>
		                <td><% out.print(i++) ;%>.</td>
		                <td id="roll<s:property value='rollNo'/>"><s:property value="rollNo"/></td>
		                <td id="name<s:property value='rollNo'/>"><s:property value="firstName"/> <s:property value="lastName"/></td>
		                <td id="section<s:property value='rollNo'/>"><s:property value="section"/></td>
		                <td id="sem<s:property value='rollNo'/>"><s:property value="sem"/></td>
						<td id="branch<s:property value='rollNo'/>" ><s:property value="branch_name"/></td>
						<td id="prog<s:property value='rollNo'/>" ><s:property value="prog_name"/></td>		
						<td>
							<div> 
								<a href="javascript:editUser('<s:property value='rollNo'/>',true)">edit/view</a> | 
								<a href="javascript:deleteUser('<s:property value='rollNo'/>')" style="color:red">remove user</a>
							</div>
						</td>
						<input type="hidden" id="fname<s:property value='rollNo'/>" value="<s:property value='firstName'/>" />
						<input type="hidden" id="lname<s:property value='rollNo'/>" value="<s:property value='lastName'/>" />
						<input type="hidden" id="dob<s:property value='rollNo'/>" value="<s:property value='dob'/>" />
						<input type="hidden" id="yoj<s:property value='rollNo'/>" value="<s:property value='yoj'/>" />
						<input type="hidden" id="email<s:property value='rollNo'/>" value="<s:property value='email'/>" />
						<input type="hidden" id="mobNum<s:property value='rollNo'/>" value="<s:property value='mobNum'/>" />
		            </tr>
		        </s:iterator>
			</tbody>
	</table>
</div>

<div class="container" >
  <!-- Modal -->  
  <div class="modal fade" id="myModalprofile" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand" href="#">Student Editor</a>
                </div>
                <ul class="nav navbar-nav">
                  <li id="list1" class="active"><a href="#" onclick="changeDiv('1')" >Add/Edit</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li><button type="button" class="close" data-dismiss="modal">&times;</button></li>
                </ul>
              </div>
            </nav>
        <div class="modal-body" style="margin-top:0">
          <div id="div1">
          	<h4>Add/Edit Details </h4>
              <form id="submitAddUser" class="form-horizontal" action="addUser">
              
                <div class="form-group">
                  <label class="control-label col-sm-3">Roll No<span style="color:red">*</span></label>
                  <div class="col-sm-8">
                    <input type="text" id="rollNoId" name="rollNo" class="form-control" placeholder="Enter Roll Number" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">First Name<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="fnameId" name="firstName" class="form-control" placeholder="Enter First name" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Last Name<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="lnameId" name="lastName" class="form-control" placeholder="Enter First name" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Year of joining<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="yojId" name="yoj" class="form-control" placeholder="Enter YOJ" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">DOB<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="dobId" name="dob" class="form-control" placeholder="Enter Dob" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Email<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="emailId" name="email" class="form-control" placeholder="Enter Email" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Mobile Number<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="mobNumId" name="mobNum" class="form-control" placeholder="Enter Mobile Number" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Semester<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="semId" name="sem" class="form-control" placeholder="Enter Semester" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Section<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="sectionId" name="section" class="form-control" placeholder="Enter Section" required/>
                  </div>
                </div>
                 
                <div class="form-group">
                  <label class="control-label col-sm-3">Branch<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <select name="branch" id="branchId" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<s:iterator value="branchD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Programme<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <select name="prog" id="progId" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<s:iterator value="programmeD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
                  </div>
                </div>
                                                             
                <div class="form-group">        
                  <div class="col-sm-offset-3 col-sm-10">
                    <button type="submit" id="psave" class="btn btn-info ">Save</button>
                  </div>
                </div>
  			</form>
          </div>
          

          </div>              
          <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	 </div>     
        </div>
      </div>
    </div>
  </div>

<script>
var triggerByAdd=true;
$(document).ready( function () {	
	$('#studentTable').dataTable({
	    "pageLength": 10,
	    "autoWidth": true
	})
});


function editUser(id){


	var branch_codeVal=document.getElementById("branch"+id).innerHTML;
	var programme_codeVal=document.getElementById("prog"+id).innerHTML;
		
	document.getElementById("rollNoId").value=document.getElementById("roll"+id).innerHTML;
	document.getElementById("fnameId").value=document.getElementById("fname"+id).value;
	document.getElementById("lnameId").value=document.getElementById("lname"+id).value;
	document.getElementById("dobId").value=document.getElementById("dob"+id).value;
	document.getElementById("yojId").value=document.getElementById("yoj"+id).value;
	document.getElementById("emailId").value=document.getElementById("email"+id).value;
	document.getElementById("mobNumId").value=document.getElementById("mobNum"+id).value;
	document.getElementById("semId").value=document.getElementById("sem"+id).innerHTML;
	document.getElementById("sectionId").value=document.getElementById("section"+id).innerHTML;
	
	var select=document.getElementById("branchId");
    var l=select.length;
    for(var i=0;i<l;i++){
    	if((select[i].text).trim()==branch_codeVal.trim())
        	select[i].selected=true;
    }    

    var select2=document.getElementById("progId");
    var l=select2.length;
    for(var i=0;i<l;i++){
    	if((select2[i].text).trim()==programme_codeVal.trim())
        	select2[i].selected=true;
    }  
    

	var elem=document.getElementById("submitAddUser");
    elem.setAttribute("action","updateUser");
    triggerByAdd=false;
   	document.getElementById("modelButton").click();
  
}

function changeAction(){
	if(triggerByAdd){
		var elem=document.getElementById("submitAddUser");
		document.getElementById("rollNoId").value="";
		document.getElementById("fnameId").value="";
		document.getElementById("lnameId").value="";
		document.getElementById("dobId").value="";
		document.getElementById("yojId").value="";
		document.getElementById("emailId").value="";
		document.getElementById("mobNumId").value="";
		document.getElementById("semId").value="";
		document.getElementById("sectionId").value="";
		document.getElementById("branchId")[0].selected=true;
		document.getElementById("progId")[0].selected=true;
	    elem.setAttribute("action","addUser");
	}
	triggerByAdd=true;
	return true;
}

function deleteUser(roll){
	var elem=document.getElementById("submitAddUser");
    var r = confirm("Do you want to remove the user ( "+roll+" ) ?");
    if (r == true) {
    	document.getElementById("rollNoId").value=document.getElementById("roll"+roll).innerHTML;
    	elem.setAttribute("action","deleteUser");
    	elem.submit();
    }
}
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>Student Portal</title>
</head>

<body>

<jsp:include page="header.jsp"/>
<div style="padding-bottom:10px;padding-top:10px;padding-left:50px;border: 3px solid #ccc !important;">
	<table style="width:100%" >
		<tr>
			<td>
				<div>
					<table>
						<tr>
							<td><i class="fa fa-mortar-board" style="font-size:20px"> Welcome, <b><s:property value="user.firstName"/> <s:property value="user.lastName"/></i></b></td>
						</tr>
						<tr>
							<td>
							<div style="padding-top:10px">Login Type :
										<b>Student.</b>
							</div>
							
							</td>
						</tr>
					</table>
				</div>
			</td>
			<td width="20%"><div>Contact Person: <b>Dr Piyush Shukla</b></div></td>
		</tr>
		
	</table>
</div>
<s:if test = "user.status=='suspended' || user.status=='resubmitted'">
	<div class="row">
		<div class="container " style="padding: 10px;font-size: 18px;">STATUS : <span style="color:red"><s:property value='user.status'/></span>
		<s:if test = "user.status=='resubmitted'">
			( Waiting for Confirmation )
		</s:if>
		</div>
		<div class="container " style="padding: 10px;color: red;font-size: 18px;">Your Account is suspended , Please update your details in profile section.</div>
	</div>
</s:if>	
<div class="jumbotron">
  <div class="container text-center" style="padding-top: 10px;width: 87%;margin: 0 auto;border-style: double;border-radius: 5px;">
    <h2 style="color:lightcoral">Notice Board <i class="fa fa-newspaper-o" style="font-size:36px"></i> </h2>
	<div style="border-bottom: 1px solid #ccc !important;"></div>
	<div style="padding-top: 25px;padding-bottom:25px;">
		<table id="noticeTable" class="display">
			<thead>
				<tr>
					<th width="10%">S No.</th>
					<th width="10%">Date</th>
					<th width="15%">Header</th>
					<th width="65%">Details</th>
				</tr>
			</thead>
			<tbody>
				 <%int i=1; %>
				 <s:iterator value="listOfAllNotification">
					<tr>
						<td><% out.print(i++) ;%>.</td>
						<td align="left" ><s:property value="date"/></td>
						<td align="left" ><s:property value="header"/></td>
						<td align="left" ><s:property value="description"/></td>
					</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>	
  </div>
</div>
  
<s:if test = "user.status=='active'">
<div class="container-fluid bg-3 text-center" >  
	<div class="container text-center" style="padding-top: 10px;width: 89%;margin: 0 auto;border-style: double;border-radius: 5px;">
		<h2 style="color:brown">Score Board <i class="fa fa-area-chart" style="font-size:36px"></i></h2>
		<div style="padding-bottom:25px;">
			
			<div style="padding-bottom: 20px;">
				<div style="border-bottom: 1px solid #ccc !important;">
				<div class="row" style="padding-bottom: 15px;">
					<div class="col-sm-3 ">
				   		<label for="sem"><b>Semester</b></label>
						<select id="semForMarks" onChange="getMarks();" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:10px;padding-bottom:10px;">
								<option value="0"></option>
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
					</div>
					<div class="col-sm-3 " style="float: right;">
						<label for="sem"><b>Showing Results For Semester : <s:property value="semFiter"/></b></label>
					</div>
					</div>
				</div>
			</div>
						
	  <div class="row">
          
          <div class="col-sm-4">
          	<div class="well">
          		<p>MID SEM 1</p>
          	</div>
          	 <s:iterator value="scores">
          	 	<s:if test = "MidSemCount==1">
          			<div class="alert alert-success fade in" style="font-size: 16px;"><div><s:property value="subject_name"/></div><div><strong><s:property value="marks"/></strong></div></div>
          	 	</s:if>
          	 </s:iterator>
          </div>
          
          <div class="col-sm-4">
          	<div class="well">
          		<p>MID SEM 2</p>
          	</div>
          	 <s:iterator value="scores">
          	 	<s:if test = "MidSemCount==2">
          			<div class="alert alert-success fade in" style="font-size: 16px;"><div><s:property value="subject_name"/></div><div><strong><s:property value="marks"/></strong></div></div>
          	 	</s:if>
          	 </s:iterator>
          </div>
          
          <div class="col-sm-4">
          	<div class="well">
          		<p>MID SEM 3</p>
          	</div>
          	 <s:iterator value="scores">
          	 	<s:if test = "MidSemCount==3">
          			<div class="alert alert-success fade in" style="font-size: 16px;"><div><s:property value="subject_name"/></div><div><strong><s:property value="marks"/></strong></div></div>
          	 	</s:if>
          	 </s:iterator>
          </div>
  
     </div>
      
      
		</div>
	</div>	
</div>
</s:if>

<div class="container" >
  <!-- Modal -->  
  <div class="modal fade" id="myModalprofile" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand" href="#">Profile</a>
                </div>
                <ul class="nav navbar-nav">
                  <li id="list1" class="active"><a href="#" onclick="changeDiv('1')" >Edit/View</a></li>
                  <li id="list2" ><a href="#" onclick="changeDiv('2')">Change Password</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li><button type="button" class="close" data-dismiss="modal">&times;</button></li>
                </ul>
              </div>
            </nav>
        <div class="modal-body" style="margin-top:0">
          <div id="div1">
          	<h4>Edit/View Details </h4>
              <form class="form-horizontal" action="updateUserProfile" method="post">
              
                <div class="form-group">
                  <label class="control-label col-sm-3">Roll No<span style="color:red">*</span></label>
                  <div class="col-sm-8">
                    <input type="text"  class="form-control" placeholder="Enter Roll Number" value="<s:property value='user.rollNo'/>" required readonly/>
                  	<input type="hidden" name="rollNo" value="<s:property value='user.rollNo'/>" />
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">First Name<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="fnameId" name="firstName" class="form-control" placeholder="Enter First name" value="<s:property value='user.firstName'/>" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Last Name<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="lnameId" name="lastName" class="form-control" placeholder="Enter First name" value="<s:property value='user.lastName'/>" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Year of joining<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="yojId" name="yoj" class="form-control" placeholder="Enter YOJ" value="<s:property value='user.yoj'/>" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">DOB<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="dobId" name="dob" class="form-control" placeholder="Enter Dob" value="<s:property value='user.dob'/>" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Email<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="emailId" name="email" class="form-control" placeholder="Enter Email" value="<s:property value='user.email'/>"required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Mobile Number<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="mobNumId" name="mobNum" class="form-control" placeholder="Enter Mobile Number" value="<s:property value='user.mobNum'/>" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Semester<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="semId" name="sem" class="form-control" placeholder="Enter Semester" value="<s:property value='user.sem'/>" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Section<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="sectionId" name="section" class="form-control" placeholder="Enter Section" value="<s:property value='user.section'/>" required/>
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
          
          <div id="div2" style="display:none;">
          	<h4>Change Password</h4>
              <form class="form-horizontal" action="modifypass" method="post" onsubmit="return submitRequest2()">
                         
                <div class="form-group">              
                  <label class="control-label col-sm-3" for="prevPass" >Last Password<span style="color:red">*</span></label>
                  <div class="col-sm-8">
                    <input type="password" class="form-control" id="prevPass"  placeholder="Enter Your last password" name="prevPass" required>
                  </div>
                </div>
                  
                <div class="form-group">              
                  <label class="control-label col-sm-3" for="nPass">New Password<span style="color:red">*</span></label>
                  <div class="col-sm-8">
                    <input type="password" class="form-control" pattern="[a-zA-Z0-9]{8,20}" title="Enter atleast 8 Characters" id="nPass1" name="newCPassword2" placeholder="Enter new password" required>
                  </div>
                </div>
                
                <div class="form-group">              
                  <label class="control-label col-sm-3" for="cPass">ReEnter New Password<span style="color:red">*</span></label>
                  <div class="col-sm-8">
                    <input type="password" class="form-control" pattern="[a-zA-Z0-9]{8,20}" title="Enter atleast 8 Characters" id="cPass2" name="newCPassword" placeholder="ReEnter new password" required>
					<div id="passErrorDiv2" style="color:red;display:none" >Both password must be same</div>                  
                  </div>
                </div>
                
                <div class="form-group">        
                  <div class="col-sm-offset-3 col-sm-10">
                    <button type="submit" class="btn btn-info" onclick="check()">Change password</button>
                  </div>
                </div>
  			</form>           
          <div class="form-group">              
             <pr> <span style="color:red">*</span>All Fields are Mandatory</pr><br>
             <pr> <span style="color:red">*</span>Password length minimum 8 characters</pr>
          </div>
          </div>              
          <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      	 </div>     
        </div>
      </div>
    </div>
  </div>
</div>

<form id="formId1" action="getUserDetails" method="get">
	<input type="hidden" name="semFiter" id="semMid">
</form>
<script>


$(document).ready( function () {
	$('#noticeTable').DataTable();
	$('#scoreTable').DataTable();
} );


function changeDiv(id){
	var liId="list"+id;
    var divId="div"+id;
    document.getElementById("list1").className="";
    document.getElementById("list2").className="";
    document.getElementById(liId).className="active";
    document.getElementById("div1").style.display="none";
	document.getElementById("div2").style.display="none";
    document.getElementById(divId).style.display="block";
}

function submitRequest2(){
	document.getElementById("passErrorDiv2").style.display="none";
	var pass1 = document.getElementById("nPass1").value;
	var pass2 = document.getElementById("cPass2").value;
	if(pass1!=pass2){
		document.getElementById("passErrorDiv2").style.display="block";
		return false;
	}	
	return true;
}

function renderUI(){
	var branch_codeVal="<s:property value='user.branch_name'/>";
	var programme_codeVal="<s:property value='user.prog_name'/>";
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
}

function getMarks(){
	var form = document.getElementById("formId1");
	document.getElementById("semMid").value=document.getElementById("semForMarks").value;
	form.submit();
}
</script>

	<br>
	<br>
	<jsp:include page="footer.jsp"/>
</body>
</html>

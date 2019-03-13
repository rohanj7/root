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
	<title>Subject Editor</title>
<style>

.active{
	color:green;
}

.inactive{
	color:red;
}

#noticeControlTable{border-collapse:collapse; table-layout:fixed;}
#noticeControlTable th {border:solid 1px antiquewhite;word-wrap:break-word;}
#noticeControlTable td {border:solid 1px antiquewhite;word-wrap:break-word;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<jsp:include page="../admin/adminDashboard.jsp"/>

<div id="noticeDash" class="container" style="margin-top:45px;border-style:double;padding-bottom: 25px;border-color: brown;border-radius: 10px;padding-left: 50px;"> 
<h3 style="padding-top:15px"><b>Subject Editor </b><i class="glyphicon glyphicon-book" style="font-size:35px" ></i></h3>
<hr>
	<div style="padding-bottom:20px;">
		<button id="modelButton" onclick="changeAction()" data-toggle="modal" data-target="#myModalprofile" type="button" style="width:150px;height:45px;border-radius:5px;border:none;background-color:#23A6D4;color:white;">Add Subject</button>
	</div>
	
	<table id="noticeControlTable" class="display">
			<thead>
				<tr>
					<th width="2%">S No.</th>
					<th width="10%">Code</th>
					<th width="15%">Name</th>
					<th width="15%">Course</th>
					<th width="20%">Branch</th>
					<th width="10%">Status</th>
					<th width="20%">Action</th>
				</tr>
			</thead>
			<tbody>
				<%int i=1; %>
		        <s:iterator value="subjectlist">
		            <tr>
		                <td><% out.print(i++) ;%>.</td>
		                <td id="code<s:property value='subject_code'/>"> <s:property value="subject_code"/></td>
		                <td id="name<s:property value='subject_code'/>"> <s:property value="subject_name"/></td>
		                <td id="prog<s:property value='subject_code'/>"> <s:property value="programme_name"/></td>
		                <td id="branch<s:property value='subject_code'/>"> <s:property value="branch_name"/></td>
						<td id="status<s:property value='subject_code'/>" class='<s:property value="status"/>'><s:property value="status"/></td>
						<td>
							<div> 
								<a href="javascript:updateNoticeForm('<s:property value='subject_code'/>',true)">edit</a> | 
								<s:if test = "status=='inactive'">
									<a href="javascript:updateNoticeForm('<s:property value='id'/>',false,true)" style="color:green">make active</a>
								</s:if> 
								<s:else>
									<a href="javascript:updateNoticeForm('<s:property value='id'/>',false,false)" style="color:red">make inactive</a>
								</s:else>
							</div>
						</td>
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
                  <a class="navbar-brand" href="#">Subject</a>
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
              <form id="submitAddSubject" class="form-horizontal" action="addSubject">
              
                <div class="form-group">
                  <label class="control-label col-sm-3">Subject Code<span style="color:red">*</span></label>
                  <div class="col-sm-8">
                    <input type="text" id="subject_codeid" name="subject_code" class="form-control" placeholder="Enter Subject Code" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Subject Name<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <input type="text" id="subject_nameid" name="subject_name" class="form-control" placeholder="Enter Subject's Name" required/>
                  </div>
                </div>
                 
                <div class="form-group">
                  <label class="control-label col-sm-3">Branch<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <select name="branch_code" id="branch_codeid" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<s:iterator value="branchD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Programme<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <select name="programme_code" id="programme_codeid" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:14px;padding-bottom:14px;">
						<s:iterator value="programmeD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
                  </div>
                </div>
                
                <input type="hidden" name="status" id="statusId">
                                                             
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
	$('#noticeControlTable').dataTable({
	    "pageLength": 10,
	    "autoWidth": true
	})
});


function updateNoticeForm(id){

	var subject_codeVal=document.getElementById("code"+id).innerHTML;
	var subject_nameVal=document.getElementById("name"+id).innerHTML;
	var branch_codeVal=document.getElementById("branch"+id).innerHTML;
	var programme_codeVal=document.getElementById("prog"+id).innerHTML;
	
	var statusVal=document.getElementById("status"+id).innerHTML;
	document.getElementById("subject_codeid").value=subject_codeVal;
	document.getElementById("subject_nameid").value=subject_nameVal;
	
	var select=document.getElementById("branch_codeid");
    var l=select.length;
    for(var i=0;i<l;i++){
    	if((select[i].text).trim()==branch_codeVal.trim())
        	select[i].selected=true;
    }    

    var select2=document.getElementById("programme_codeid");
    var l=select2.length;
    for(var i=0;i<l;i++){
    	if((select2[i].text).trim()==programme_codeVal.trim())
        	select2[i].selected=true;
    }  
    
	document.getElementById("statusId").value=statusVal;
	
	var elem=document.getElementById("submitAddSubject");
    elem.setAttribute("action","updateSubject");
    triggerByAdd=false;
   	document.getElementById("modelButton").click();
  
}

function changeAction(){
	if(triggerByAdd){
		var elem=document.getElementById("submitAddSubject");
		document.getElementById("subject_codeid").value="";
		document.getElementById("subject_nameid").value="";
		document.getElementById("branch_codeid")[0].selected=true;
		document.getElementById("programme_codeid")[0].selected=true;
	    elem.setAttribute("action","addSubject");
	}
	triggerByAdd=true;
	return true;
}
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
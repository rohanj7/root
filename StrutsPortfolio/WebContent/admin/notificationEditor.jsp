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
	<title>Notification Editor</title>
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
<h3 style="padding-top:15px"><b>Notification Editor </b><i class="fa fa-newspaper-o" style="font-size:35px" ></i></h3>
<hr>
	<div style="padding-bottom: 20px;">
		<button id="modelButton" onclick="changeAction()" data-toggle="modal" data-target="#myModalprofile" type="button" style="width:150px;height:45px;border-radius: 5px;border: none;background-color: #23A6D4;color: white;">Add Notice</button>
	</div>
	
	<table id="noticeControlTable" class="display">
			<thead>
				<tr>
					<th width="2%">S No.</th>
					<th width="10%">Header</th>
					<th width="35%">Description</th>
					<th width="15%">PublishArea</th>
					<th width="10%">Status</th>
					<th width="10%">Created Date</th>
					<th width="28%">Action</th>
				</tr>
			</thead>
			<tbody>
				<%int i=1; %>
		        <s:iterator value="listOfAllNotification">
		            <tr>
		                <td><% out.print(i++) ;%>.</td>
		                <td id="header<s:property value='id'/>"> <s:property value="header"/></td>
		                <td id="description<s:property value='id'/>"> <s:property value="description"/></td>
		                <td id="area<s:property value='id'/>"> <s:property value="publishArea"/></td>
		                <td id="status<s:property value='id'/>" class='<s:property value="status"/>'><s:property value="status"/></td>
		                <td id="date<s:property value='id'/>"> <s:property value="date"/></td>
						<td>
							<div> 
								<a href="javascript:updateNoticeForm(<s:property value='id'/>,true)">edit</a> | 
								<a href="javascript:removeNotice(<s:property value='id'/>)">remove</a> | 
								<s:if test = "status=='inactive'">
									<a href="javascript:updateNoticeForm(<s:property value='id'/>,false,true)" style="color:green">make active</a>
								</s:if> 
								<s:else>
									<a href="javascript:updateNoticeForm(<s:property value='id'/>,false,false)" style="color:red">make inactive</a>
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
                  <a class="navbar-brand" href="#">Notification</a>
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
              <form id="submitNoticeForm" class="form-horizontal" action="addNotification">
              
                <div class="form-group">
                  <label class="control-label col-sm-3">Header<span style="color:red">*</span></label>
                  <div class="col-sm-8">
                    <input type="text" id="headerEdit" name="header" class="form-control" id="pFirstName1" placeholder="Enter Header name" required/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Description<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <textarea cols="40" rows="5" id="descriptionEdit" name="description" class="form-control" title="Alphabets Only" placeholder="Enter Description" required></textarea>
                  </div>
                </div>
                 
                <div class="form-group">
                  <label class="control-label col-sm-3">Audience<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <select id="audienceEdit" name="publishArea" style="height: 35px;width: 160px;">
                   		<option id="ALL" value="ALL">ALL</option>
                   		<option id="BLOG" value="BLOG">BLOG</option>
                   		<option id="STUDENT PORTAL" value="STUDENT PORTAL">STUDENT PORTAL</option>
                    </select>
                  </div>
                </div>
                
                <input type="hidden" name="date"   id="dateStr" />
                <input type="hidden" name="id"     id="noticeID2">
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
  <form id="removeForm" action="removeNotice" method="post">
  	<input type="hidden" name="id" id="noticeID">
  </form>
<script>
var triggerByAdd=true;
$(document).ready( function () {
	//document.getElementById('noticeDash').scrollIntoView();
	var d = new Date();
	var dateStr=d.getDate()+"/"+(d.getMonth()+1)+"/"+d.getFullYear();
	document.getElementById("dateStr").value=dateStr;	
	$('#noticeControlTable').dataTable({
	    "pageLength": 10,
	    "autoWidth": true
	})
});

function removeNotice(id){
	var elem=document.getElementById("removeForm");
	document.getElementById("noticeID").value=id;
    elem.submit();
}

function updateNoticeForm(id,updateAll,active){

	var headerVal=document.getElementById("header"+id).innerHTML;
	var descriptionVal=document.getElementById("description"+id).innerHTML;
	var areaVal=document.getElementById("area"+id).innerHTML;
	var statusVal=document.getElementById("status"+id).innerHTML;
	
	document.getElementById("headerEdit").value=headerVal;
	document.getElementById("descriptionEdit").value=descriptionVal;
	var select=document.getElementById("audienceEdit");
    var l=select.length;
    for(var i=0;i<l;i++){
    	if(select[i].value==areaVal)
        	select[i].selected=true;
    }    
	document.getElementById("noticeID2").value=id;
	document.getElementById("statusId").value=statusVal;
	
	var elem=document.getElementById("submitNoticeForm");
    elem.setAttribute("action","updateNotice");
    triggerByAdd=false;
    if(updateAll)
    	document.getElementById("modelButton").click();
    else{
    	if(active)
    		document.getElementById("statusId").value="active";
    	else
    		document.getElementById("statusId").value="inactive";
    	elem.submit();
    	}   
}

function changeAction(){
	if(triggerByAdd){
		var elem=document.getElementById("submitNoticeForm");
		document.getElementById("headerEdit").value="";
		document.getElementById("descriptionEdit").value="";
		document.getElementById("audienceEdit")[0].selected=true;
	    elem.setAttribute("action","addNotification");
	}
	triggerByAdd=true;
	return true;
}
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
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
	<title>Mid-Sem Score Editor</title>
	<style>
		#studentScore {border-collapse:collapse; table-layout:fixed;}
		#studentScore th{border:solid 1px antiquewhite;word-wrap:break-word;}
		#studentScore td{border:solid 1px antiquewhite;word-wrap:break-word;}
	</style>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<jsp:include page="../admin/adminDashboard.jsp"/>
	
	<div id="noticeDash" class="container" style="margin-top:45px;border-style:double;padding-bottom: 25px;border-color: brown;border-radius: 10px;padding-left: 50px;"> 
	<h3 style="padding-top:15px"><b>Mid-Sem Score Editor</b><i class="fa fa-pie-chart" style="font-size:35px;padding-left:10px" ></i></h3>
	<hr>
	<button id="modelButton" data-toggle="modal" data-target="#myModalprofile" type="button" style="display:none">ADD</button>
	<div style="padding-left:15px;padding-right:20px;" >
	<h3>Filters</h3>
		<form id="userFormId" action="getUserForMidSem" method="post">
			<div class="row" style="padding-left:10px">
			
				<div class="col-sm-3 ">
					<label for="prog"><b>Course</b></label>
					<select id="progFilterId" name="progFilter" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:10px;padding-bottom:10px;">
						<option value="0"></option>
						<s:iterator value="programmeD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
					<span id="progFilterSpan" style="color:red;display:none">Please select some value</span>
				</div>
				
		   		<div class="col-sm-3 ">
		    		<label for="prog"><b>Branch</b></label>
					<select id="branchFilterId" name="branchFilter" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:10px;padding-bottom:10px;">
						<option value="0"></option>
						<s:iterator value="branchD">
							<option value="<s:property value='key'/>" ><s:property value='value'/></option>
						</s:iterator>
					</select>
					<span id="branchFilterSpan" style="color:red;display:none">Please select some value</span>
				</div>
					
		   		<div class="col-sm-3 ">
			   		<label for="sem"><b>Semester</b></label>
					<select id="semFilterId" name="semFilter" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:10px;padding-bottom:10px;">
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
					<span id="semFilterSpan" style="color:red;display:none">Please select some value</span>
				</div>
				
				<div class="col-sm-3 ">
			   		<label for="sem"><b>Section</b></label>
					<select id="sectionFilterId" name="sectionFilter" style="background-color:#f1f1f1;width:100%;border:0px;padding-top:10px;padding-bottom:10px;">
							<option value="0"></option>
							<option value="A">A</option>
							<option value="B">B</option>
					</select>
					<span id="sectionFilterSpan" style="color:red;display:none">Please select some value</span>
				</div>
				
			</div>
			<div class="row" style="padding-left:25px;padding-top: 20px;padding-bottom: 30px;">
				<button onclick="submitFilter()" type="button" style="width:145px;height:40px;border-radius: 8px;border: none;background-color: #23A6D4;color: white;">Submit Filter</button>
			</div>
		</form>
	</div>
		<table id="studentScore" class="display">
				<thead>
					<tr>
						<th width="5%">S No.</th>
						<th width="15%">User Name</th>
						<th width="10%">rollNo</th>
						<th width="5%">Semester</th>
						<th width="30%">Branch</th>
						<th width="5%">Programme</th>
						<th width="15%">Action</th>
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
			                <td>
			                	<div>
			                		<a href="javascript:getForm('<s:property value='rollNo'/>','<s:property value="firstName"/>','<s:property value="lastName"/>')" style="color:green">add/view</a>			
								</div>
			                </td>
			            </tr>
			        </s:iterator>
				</tbody>
		</table>
	</div>
	
  <!-- Modal -->  
  <div class="modal fade" id="myModalprofile" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
            <nav class="navbar navbar-default">
              <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand" >Mid Sem Score</a>
                </div>
                <ul class="nav navbar-nav">
                  <li id="list1" class="active"><a onclick="changeDiv('1')" >View Score</a></li>
                  <li id="list2" ><a onclick="changeDiv('2')">Add Score</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                	<li><button type="button" class="close" data-dismiss="modal">&times;</button></li>
                </ul>
              </div>
            </nav>
        <div class="modal-body" style="margin-top:0">
          <div id="div1">
          	<h4>View Score</h4>
              <div class="form-horizontal">
              
                <div class="form-group">
                  <label class="control-label col-sm-3">Roll No</label>
                  <div class="col-sm-8">
                    <input type="text" id="rollId" class="form-control" readonly/>
                  </div>
                </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Name</label>
                  <div class="col-sm-8">          
                    <input type="text" id="nameId" class="form-control" readonly/>
                  </div>
                </div>    
                     
                <div class="row">    
			          <div class="col-sm-4">
			          	<div class="well">
			          		<p>MID SEM 1</p>
			          	</div>
			          		<div id="midSem1" class="alert alert-success fade in" style="font-size: 16px;"></div>
			          </div>
			          
			          <div class="col-sm-4">
			          	<div class="well">
			          		<p>MID SEM 2</p>
			          	</div>
			          		<div id="midSem2" class="alert alert-success fade in" style="font-size: 16px;"></div>
			          </div>
			          
			          <div class="col-sm-4">
			          	<div class="well">
			          		<p>MID SEM 3</p>
			          	</div>
			          		<div id="midSem3" class="alert alert-success fade in" style="font-size: 16px;"></div>
			          </div>			  
			     </div>
                          
  			</div>
          </div>
          
          <div id="div2" style="display:none;">
          	<h4>Add Score</h4>
              <div class="form-horizontal" >
                 
	               <div class="form-group">
	                <label class="control-label col-sm-3">Roll No</label>
	                <div class="col-sm-8">
	                  <input type="text" id="rollId1" class="form-control" readonly/>
	                </div>
	              </div>
	              
	              <div class="form-group">
	                <label class="control-label col-sm-3">Name</label>
	                <div class="col-sm-8">          
	                  <input type="text" id="nameId1" class="form-control" readonly/>
	                </div>
	              </div>
                
                <div class="form-group">
                  <label class="control-label col-sm-3">Select Mid-Sem<span style="color:red">*</span></label>
                  <div class="col-sm-8">          
                    <select id="midSemNum" class="form-control">
                    	<option value="1">1</option>
                    	<option value="2">2</option>
                    	<option value="3">3</option>
                    </select>
                  </div>
                </div> 
                <hr>
                <s:set var="count" value="SubjectCountPerSem" />
                <jsp:useBean id="count" type="java.lang.Integer" />
                 <table id="addScoreTable" class="display dataTable" style="border-style: double;border-color: peru;" >
                 	<tr><td><strong>Select Subject</strong><span style="color:red">*</span></td><td><strong>Enter Marks</strong><span style="color:red">*</span></td></tr>
					<% for(i = 1; i<=count; i+=1) { %>
					<tr>
						<td>
						
							<select id="subcode<%=i%>">
								<s:iterator value="subject">
			                    	<option value="<s:property value='subject_code'/>"><s:property value="subject_name"/></option>
			                    </s:iterator>
	                    	</select>
	                    </td>
	                    <td><input id="score<%=i%>" type="number"/></td>
                    </tr>
                    <% } %>
                </table> 
                    
                <div class="form-group">        
                  <div class="col-sm-10" style="padding-top: 15px;float: right;">
                    <button style="float: right;" type="button" id="psave" class="btn btn-info " onclick="submitScore()">Submit</button>
                  </div>
                </div>
                
              </div>            
	          <div class="form-group">              
	             <pr> <span style="color:red">*</span>All Fields are Mandatory.</pr><br>
	             <pr> <span style="color:red">*</span>All subject score for one Mid Sem need to be submited togather.</pr>
	          </div>
          </div> 
                       
          <div class="modal-footer">
              <button type="button" id="closeBttnId" class="btn btn-default" data-dismiss="modal">Close</button>
      	 </div>     
        </div>
      </div>
    </div>
  </div>

<script>
var progValue;
var branchValue;
var semValue;
var sectionValue;
var subjectCount;

$(document).ready( function () {
	$('#studentScore').dataTable({
	    "pageLength": 10,
	    "autoWidth": true
	});
	
	subjectCount="<s:property value='SubjectCountPerSem'/>";
	progValue="<s:property value='progFilter'/>";
	select=document.getElementById("progFilterId");
    var l=select.length;
    for(var i=0;i<l;i++){
    	if((select[i].value).trim()==progValue.trim())
        	select[i].selected=true;
    }    

    branchValue="<s:property value='branchFilter'/>";
    select=document.getElementById("branchFilterId");
    var l=select.length;
    for(var i=0;i<l;i++){
    	if((select[i].value).trim()==branchValue.trim())
    		select[i].selected=true;
    }
    
    semValue="<s:property value='semFilter'/>";
    select=document.getElementById("semFilterId");
    var l=select.length;
    for(var i=0;i<l;i++){
    	if((select[i].value).trim()==semValue.trim())
    		select[i].selected=true;
    }
    
    sectionValue="<s:property value='sectionFilter'/>";
    select=document.getElementById("sectionFilterId");
    var l=select.length;
    for(var i=0;i<l;i++){
    	if((select[i].value).trim()==sectionValue.trim())
    		select[i].selected=true;
    }

});
	
function submitFilter(){
	
	document.getElementById("progFilterSpan").style.display="none";
	document.getElementById("branchFilterSpan").style.display="none";
	document.getElementById("semFilterSpan").style.display="none";
	document.getElementById("sectionFilterSpan").style.display="none";
	
	if(document.getElementById("progFilterId").value==0){
		document.getElementById("progFilterSpan").style.display="block";
		return false;
	}
	
	if(document.getElementById("branchFilterId").value==0){
		document.getElementById("branchFilterSpan").style.display="block";
		return false;
	}
	
	if(document.getElementById("semFilterId").value==0){
		document.getElementById("semFilterSpan").style.display="block";
		return false;
	}
	
	if(document.getElementById("sectionFilterId").value==0){
		document.getElementById("sectionFilterSpan").style.display="block";
		return false;
	}
	document.getElementById("userFormId").submit();
}


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
	
function getForm(id,firstname,lastname){
	getStudentScore(id,firstname,lastname);
	
}

function getStudentScore(rollnum,firstname,lastname){
	//semValue
	
	$.ajax({
		type : "GET",
		url : "getStudentScore",
		data : "studentRollNum="+rollnum+"&semFilter="+semValue,
		success : function(data) {
			renderUI(data,rollnum,firstname,lastname);
			
			document.getElementById('modelButton').click();
		},
		error : function(data) {
			alert("Some error occured.");
		}
	});
}

var mid1AllowAdding;
var mid2AllowAdding;
var mid3AllowAdding;

function renderUI(data,rollnum,firstname,lastname){
	clearUI();
	var fullName=firstname+" "+lastname;
	var score=data.scores;
	var midSem1=[];
	var midSem2=[];
	var midSem3=[];
	
	mid1AllowAdding=true;
	mid2AllowAdding=true;
	mid3AllowAdding=true;
	
	for(var i=0;i<score.length;i++){
		if(score[i].midSemCount==1){
			mid1AllowAdding=false;
			var obj = new Object();
			obj['subName']=score[i].subject_name;
			obj['marks']=score[i].marks;
			$( "#midSem1" ).append( "<p style='color:black'>"+obj['subName']+" :<span style='color:red'><strong> "+obj['marks']+"</strong></span></p>");
			midSem1.push(obj);		
		}else if(score[i].midSemCount==2){	
			mid2AllowAdding=false;
			var obj = new Object();
			obj['subName']=score[i].subject_name;
			obj['marks']=score[i].marks;
			$( "#midSem2" ).append( "<p style='color:black'>"+obj['subName']+" :<span style='color:red'><strong> "+obj['marks']+"</strong></span></p>");
			midSem2.push(obj);
		}else if(score[i].midSemCount==3){	
			mid3AllowAdding=false;
			var obj = new Object();
			obj['subName']=score[i].subject_name;
			obj['marks']=score[i].marks;
			$( "#midSem3" ).append( "<p style='color:black'>"+obj['subName']+" :<span style='color:red'><strong> "+obj['marks']+"</strong></span></p>");
			midSem3.push(obj);
		}
	}
	document.getElementById("rollId").value=rollnum;
	document.getElementById("nameId").value=fullName;
	document.getElementById("rollId1").value=rollnum;
	document.getElementById("nameId1").value=fullName;
}

function clearUI(){
	$("#midSem1").empty();
	$("#midSem2").empty();
	$("#midSem3").empty();
	document.getElementById("rollId").value="";
	document.getElementById("nameId").value="";
	document.getElementById("rollId1").value="";
	document.getElementById("nameId1").value="";
	for(var i=1;i<=subjectCount;i++){
		document.getElementById("score"+i).value="";
	}
	changeDiv('1');
}

function submitScore(){
	
	//semValue
	//subjectcode
	//midsem number
	//score
	//rollnumber
	if(!(mid1AllowAdding || mid2AllowAdding || mid3AllowAdding)){
		var midNum=document.getElementById("midSemNum").value;
		if(!mid1AllowAdding && midNum=="1"){
			alert("Mid Sem Score already submitted! Not allowed to add more!")
			return false;
		}else if(!mid2AllowAdding && midNum=="2"){
			alert("Mid Sem Score already submitted! Not allowed to add more!")
			return false;
		}else if(!mid3AllowAdding && midNum=="3"){
			alert("Mid Sem Score already submitted! Not allowed to add more!")
			return false;
		}
	}
	
	var rollNum=document.getElementById("rollId").value;	
	var userScore=[];
	for(var i=1;i<=subjectCount;i++){
		var obj = new Object();
		var subjectcode=document.getElementById("subcode"+i).value;
		var midsemNum=document.getElementById("midSemNum").value;
		var score=document.getElementById("score"+i).value;
		if(score==""){
			alert("Please enter score");
			return false;
		}
		obj["subjectcode"]=subjectcode;
		obj["midsemNum"]=midsemNum;
		obj["score"]=score;
		obj["semFilter"]=semValue;
		obj["studentRollNum"]=rollNum;
		userScore.push(obj);
	}	
		
	$.ajax({
		type : "POST",
		url : "submitScore",
		data : "scoreDetails="+JSON.stringify(userScore),
		success : function(data) {
			alert("Marks submitted successfully!");
			clearUI();
			document.getElementById("closeBttnId").click();

		},
		error : function(data) {
			alert("Some error occured.");
		}
	});
	
	

}
</script>
<jsp:include page="../footer.jsp"/>
</body>
</html>
<html>
<body>
<script>
document.getElementById("profli").style.display="none";
</script>
	<div style="padding-bottom:10px;padding-top:10px;padding-left:50px;border: 3px solid #ccc !important;">
		<table style="width:100%" >
			<tr>
				<td>
					<div>
						<table>
							<tr>
								<td><i class="fa fa-mortar-board" style="font-size:20px"> Welcome,<b> Admin</i></b></td>
							</tr>
							<tr>
								<td><div style="padding-top:10px">Login Type :<b>Admin.</b></div></td>
							</tr>
						</table>
					</div>
				</td>
				<td width="20%"><div>Contact Person: <b>Dr Piyush Shukla</b></div></td>
			</tr>	
		</table>
	</div>
<br>
<br>
<div><p align="right" style="padding-right: 40px;padding-bottom: 13px;"><b><span id="date"></span></b></p></div>
<div class="container" style="border-style: double;padding-bottom: 25px;border-color: brown;border-radius: 10px;padding-left: 50px;"> 
  <h3 style="padding-top:15px"><b>DASHBOARD </b><i class="glyphicon glyphicon-briefcase" style="font-size:35px" ></i></h3>
  <hr>
  <div class="row" >
    <div class="col-sm-2">
      <div class="panel panel-primary" style="height: 219px;width: 170px;">
        <div class="panel-heading" style="height: 52px;"><b>Student Profile Editor</b></div>
        <div class="panel-body"><a href="javascript:renderDashboard('getAllUser')" style="color: black;"><p align="center"><i class="fa fa-address-card-o" style="font-size:60px" ></i></p></a></div>
        <div class="panel-footer" style="height: 75px;">To view or modify students details.</div>
      </div>
    </div>
    <div class="col-sm-2"> 
      <div class="panel panel-danger" style="height: 219px;width: 170px;;">
        <div class="panel-heading" style="height: 52px;"><b>Confirm Users</b></div>
        <div class="panel-body"><a href="javascript:renderDashboard('getConfirmUserWindow')" style="color: black;"><p align="center"><i class="fa fa-check-circle-o" style="font-size:60px" ></i></p></a></div>
        <div class="panel-footer" style="height: 75px;">Enable access to users.</div>
      </div>
    </div>
    <div class="col-sm-2"> 
      <div class="panel panel-primary" style="height: 219px;width: 170px;">
        <div class="panel-heading" style="height: 52px;"><b>Notification Editor</b></div>
        <div class="panel-body"><a href="javascript:renderDashboard('getNotWindow')" style="color: black;"><p align="center"><i class="fa fa-newspaper-o" style="font-size:60px" ></i></p></a></div>
        <div class="panel-footer" style="height: 75px;">Control Notification on internal and external walls.</div>
      </div>
    </div>
    <div class="col-sm-2">
      <div class="panel panel-success" style="height: 219px;width: 170px;">
        <div class="panel-heading" style="height: 52px;"><b>Subjects Editor</b></div>
        <div class="panel-body"><a href="javascript:renderDashboard('getSubjectWindow')" style="color: black;"><p align="center"><i class="glyphicon glyphicon-book" style="font-size:60px" ></i></p></a></div>
        <div class="panel-footer" style="height: 75px;">To add/remove subject profile.</div>
      </div>
    </div>
    <div class="col-sm-2"> 
      <div class="panel panel-primary" style="height: 219px;width: 170px;">
        <div class="panel-heading" style="height: 52px;"><b>Score Editor</b></div>
        <div class="panel-body"><a href="javascript:renderDashboard('getUserForMidSem')" style="color: black;"><p align="center"><i class="fa fa-pie-chart" style="font-size:60px" ></i></p></a></div>
        <div class="panel-footer" style="height: 75px;">To add/view students midsem score.</div>
      </div>
    </div>
  </div>
  
</div>
<form id="openDashboard" method="post"></form>
<script>
	var date = (new Date())+"";
	var trimDate = date.substring(0,date.indexOf("GMT"));
	$('#date').html(trimDate);
	
	function renderDashboard(action){
		var elem=document.getElementById("openDashboard");
	    elem.setAttribute("action",action);
	    elem.submit();
	}

</script>
    
</body>
</html>
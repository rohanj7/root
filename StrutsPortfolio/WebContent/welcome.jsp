<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Dr Piyush Shukla</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<style>    
	  /* Set black background color, white text a nd some padding */
	  footer {
	    background-color: #555;
	    color: white;
	    padding: 15px;
	  }
	 
		table {
			border-collapse: collapse;
		}
	
		table, th, td {
			border: 1px solid black;
		}
	</style>
	<script>
		function redirect(id){
			var elem=document.getElementById(id);
		    elem.setAttribute("action","loginPage");
		    elem.submit();
		}
	</script>
</head>
<body>

<nav class="navbar navbar-inverse" style="border-radius:0px">
  <div class="container-fluid" >
    <div class="navbar-header" style="height:80px">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#" style="color:white"><i class="fa fa-black-tie" style="font-size:36px"></i><span style="font-size: 28px;"> Dr. Piyush Shukla </span></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="javascript:redirect('login')" style="font-size: 18px;padding-top: 27px;"><span class="glyphicon glyphicon-user" style="padding-right: 5px;"></span>Login/Register</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container text-center">    
  <div class="row">
    <div class="col-sm-3 well">
      <div class="well">
      	<img src="images/image_profile.jpg" class="img-circle" height="200" width="200" alt="Avatar">
        <p><br>
	        <b>Dr. Piyush Kumar Shukla </b><br>
			Assitant Professor & Lecturer, Computer Sc. & Engineering
			University Institute of Tecnology, RGPV, Bhopal, M.P, India.<br>
			Email - <span style="color: #337ab7;">pphdwss@gmail.com, piyush@rgtu.net<span><br>
			<span style="color:red">PhD(2013) - University Institute of Tecnology, RGPV, Bhopal , M.P, India.</span><br>
			<span style="color:green">M.Tech(2005)- Samrat Ashok Institute of Technology, Vidisha, M.P, India.</span><br>
			<span style="color:blue">BE(2001)- LNCT  Bhopal , M.P, India.</span><br>
		</p>
       
      </div>
      <div class="well">
        <p><a href="#">Research Interests</a></p>
        <p>
          <span class="label label-default">Image Cryptography</span>
          <span class="label label-primary">Image Processing</span>
          <span class="label label-success">Soft Computing</span>
          <span class="label label-info">Internet of Things</span>
          <span class="label label-warning">Cyber Security</span>
          <span class="label label-default">Cryptography & Network Security</span>
          <span class="label label-primary">Secure Social Networking</span>
          <span class="label label-success">Image security</span>
          <span class="label label-info">Optimization Techniques</span>
          <span class="label label-warning">Cloud Computing</span>
          <span class="label label-danger">Wireless Networks (MAN, VANET,</span>
          <span class="label label-danger">WSN other Advanced Networks i.e. DTN)</span>
        </p>
      </div>
      <div class="alert alert-success fade in">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">Ã</a>
        <p><strong>Ey!</strong></p>
        People are looking at your profile. Find out who.
      </div>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-7">
    
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-default text-left">
            <div class="panel-body">
            	<h3>About his PhD</h3>
              	<p>
					He did his PhD from the Department of Computer Science and Engineering, at IIT Kanpur, India. Dr Pankaj Jalote was his thesis supervisor. Click here for more information
					He joined the PhD program at CSE department, IITK in July 2003. He strongly believes that the CSE department at IIT Kanpur is a place that provides lots of facilities and research opportunities which are among the best in the country and are comparable to the best universities of the world. For more details, visit PhD Program at CSE, IIT Kanpur-India
					His PhD thesis is indexed in ACM SIGSOFT list of PhD Dissertations in the area of Software Engineering (2008)
				</p>
              	<button type="button" class="btn btn-default btn-sm">
                <span class="glyphicon glyphicon-thumbs-up"></span> Like
              </button>     
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-12"> 
          <div class="panel panel-default">
            <div class="panel-body">
            	<h3 align="left">Publications  	
            	<span style="float: right;">
	            	<button type="button" class="btn btn-default btn-sm" onclick="renderPublication('publication')">
			            <span class="glyphicon glyphicon-plus" id="publicationSpan"></span>
			        </button>
		        </span>   
		        </h3>
		        <div id="publication" style="overflow:scroll; height:1100px;display:none;text-align: left;">
		        <p align="left">
		        	<jsp:include page="admin/publication.html"/>
              	</p>
              	</div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-12">
          <div class="panel panel-default text-left">
            <div class="panel-body">
            	<h3>Expert Lectures Delivered</h3>
              	<p style="color: sienna;">
              		1. Delivered expert lecture in Faculty Development Program on “Machine Learning & its Application in IoT, Big Data & Cloud Security” at Bansal Institute of Technology,Bhopal , on 31st January 2018, under TEQUIP-3.<br><br>
					2. Delivered expert lecture in Faculty development program on “Necessity of Machine Intelligence to Protect From Cyber Threats & Implementing IoT in smart City for Promoting Digital India” at Vikrant College of Engineering,Gwalior, on 29th March 2018, under TEQUIP-3.<br><br>
				</p>  
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-12"> 
          <div class="panel panel-default">
            <div class="panel-body">
            	<h3 align="left">Workshops/Seminars/Expert Lecture Organized, Coordinated and attended  	
            	<span style="float: right;">
	            	<button type="button" class="btn btn-default btn-sm" onclick="renderPublication('workshops')">
			            <span class="glyphicon glyphicon-plus" id="workshopsSpan"></span>
			        </button>
		        </span>   
		        </h3>
		        <div id="workshops" style="overflow:scroll; height:1100px;display:none;text-align: left;">
		        <p align="left">
		        	01. Coordinaytd 02 Days FDP on IoT, 17-18 August, 2017 at RGPV, Bhopal<br><br>
					20. Coordinated one day STTP workshop on “MOZILLA ADD-ONS” at DoCSE,UIT,RGPV,Bhopal on 22nd March 2018.<br><br>
					03. Attended one day expert lecture on “Distributed Systems” at DoIT,UIT,RGPV,Bhopal.<br><br>
					04. Coordinated one day workshop on “ Cyber Security” at Technocrats Institute of Technology & Science,Bhopal on 15th November 2017.<br><br>
					05. Coordinated One Day FDP on “Cyber Security” at Patel College of Science & Technology, Bhopal on 6th February 2018.<br><br>
					06. Coordinated One Day FDP on “Cyber Security” at Oriental Institute of Science & Technology, Bhopal on 5th February 2018.<br><br>
					07. Delivered 02 Expert Lectures on “Internet Technology & Security” and “Data Structures & Algorithm Design” at RCVP, NORONHA, Academy for Administration and  Higher Education,Bhopal on 27th-28th February 2018.<br><br>
					08. Organized “cyber security” workshop on 17th February 2017<br><br>
					09. Conducted “Aircraft Modeling Workshop” on 7th February 2017 together Indian Air Force<br><br>
					10. Attended “ICSCIS-07”,JEC at Jabalpur<br><br>
					11. Participated in 3 days workshop at “Bhartiya Vigyaan Sammelan”,23-25 November  2007<br><br>
					12. Conducted workshop on “Security aspects in current scenario” at Oriental Institute of Science & Technology, Bhopal on 17th September 2017.<br><br>
					13. Participated in 5 days Workshop on  “Big Data and Hadoop” at UIT,RGPV, 31 January-4 February 2017<br><br>
					14. Participated in International Seminar on “Entrepreneurship and Innovation” at UIT,RGPV 19th October 2016<br><br>
					15. Participated at “COMPUTE – 2017” on 16-17 November 2017<br><br>
					16. Participated in “Cyber Security” workshop at LNCT,Bhopal, 25 October 2017<br><br>
					17. Participated in 4 days  faculty development program on “Techniques for Material Characterization” at RGPV, Bhopal on 20-24 November 2017<br><br>
					18. Contributed as Reviewer in “1st International Conference on Data, Engineering and Application”  at RGPV on 28-29 October 2017 <br><br>
					19. Contributed as Reviewer in “1st International Conference on Data, Engineering and Application”  at RGPV on 15 February 2008<br><br>
					20. Attended Workshop on “Effective Use of Social Media for Quality Enhancement in Technical Eductaion” on 19-20 December 2017<br><br>
					21. Participated in “International Conference on Make In India”on 16-17 February 2017 <br><br>
					22. Participated in Multidisciplinary National Conference on Recent Advancement in Developing India “ on 24-25 February 2018 <br><br>
					23. Participated in ”Staff Development Programme on Trends and Application in Data Science” 18-22 February 2014 <br><br>
					24. “Organized virtual classes on Data Structure and Algorithm” on 27 February 2018 at UIT-RGPV<br><br>
					25. “Organized virtual classes on Internet Technology” 28 February 2018 at UIT-RGPV<br><br>
					26. “Organized Career Counseling for First Year Students BE/MCA” at RGPV 13 November 2017<br><br>
					27. Attended the complimentary seminar on “Matlab Simulink for Engineering Education” on 15 June 2010<br><br>
					28. Attended “International Conferreence on  Advances in Computing (ICAC2008) on February 21-22, 200829. Attended “Recent Advancements in Web Technologies Semantic Web and Web 2.0” at NRI Institute of Information Science and Technology , Bhopal on 30-31 March 2011<br><br>
					30. Participated at RGPV CODEFORCE 1.0 at RGPV on 29th April 2011<br><br>
					31. Attended one day seminar on “Alternative of Clean Energy and Nuclear Safety” on 27 Februrary 2012 at RGPV, Bhopal<br><br>
					32. Attend short term training programme on “Cyber Crime and Cyber Forensics” at MANIT, Bhopal on 17, December 2007<br><br>
					33. Participated at “State Level Workshop on Advance Microwave Technology” on April 2006 at BU, Bhopal<br><br>
					34. Attended “Refresher Course on Communication Systems” at UIT,RGPV on 2nd MAY 2011<br><br>
					35. Attended “Workshop on Simulation and it’s Application in Electronics and Communication” under TEQUIP-II on 24th January 2014<br><br>
					36. Participated at two week ISTE-WORKSHOP on DBMS under MHRD, Govt. of Indiaon 21th MAY 2013<br><br>
					37. Participated at two week ISTE-WORKSHOP on Aakash For Education under MHRD, Govt. of Indiaon 21th MAY 2012<br><br>
					38. Participated in a MISSION10X workshop conducted at UIT, RGPV by Wipro Technologies <br><br>
					39. Participated in MHRDE-AICTE sponsored Faculty Development Program on “Advanves in Wireless Communication and Networking Technologies on 13th June 2011 at NIT,Calicut<br><br>
					40. Attended “Advanced Computer Architecture and Embedded Systems” under TEQUIP-II on 15th May 2013<br><br>
					41. Participated in “Orientation workshop on Mobility” in association with IBM 30th November 2013<br><br>
					42. Attended “Android Application Development” under TEQUIP-II on 2nd June 2014 at SIRT Bhopal<br><br>
					43. Attended 2 week ISTE workshop on “Computer Programming” under MHRD on 15th May 2013<br><br>
					44. Attended shor term training programme on “Cyber Security” on 19th January 2009.<br><br>
					45. Attended 2 week ISTE workshop on “Signals and System” under MHRD on 2nd  January 2013.<br><br>
              	</p>
              	</div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-12"> 
          <div class="panel panel-default">
            <div class="panel-body">
            	<h3 align="left">Subject Teaching Proficiency  	
            	<span style="float: right;">
	            	<button type="button" class="btn btn-default btn-sm" onclick="renderPublication('teaching')">
			            <span class="glyphicon glyphicon-plus" id="teachingSpan"></span>
			        </button>
		        </span>   
		        </h3>
		        <div id="teaching" style=" height:400px;display:none;text-align: left;">
		        <p align="left">
		        	<table>
						<tr>
							<td width="40%">
								Core & Other Subjects
							</td>
							<td>	
								1.	Internet of Things (IoT)<br>
								2.	Advance Computer Networking<br>
								3.	Network & Cyber Security<br>
								4.	Web Engineering<br>
								5.	Wireless Networks (MANET, VANET, WSN, DTN)<br>
								6.	Information Theory, Coding & Cryptography<br>
								7.	Analog & Digital Commpinications<br>
								8.	Data Communication<br>
								9.	Digital Circuits, Systems & Design<br>
							</td>
						</tr>	
						<tr>
							<td>	
								Programming Languages	
							</td>
							<td>
								C, C++, Core Java,  Pythan, R Language 
							</td>	
						</tr>	
						
						<tr>
							<td>	
								Web Technologies
							</td>
							<td>
								PHP
							</td>
						</tr>
						<tr>
							<td>
								Application Oriented Subjects	
							</td>
							<td>
								Management Information System<br>
								Geographical Information System (GIS)<br>
								Global Positioning System (GPS)<br>
								Remote Sensing<br>
								Biometric  Authentication<br>
								E-Governance<br>
								Knowledge Management<br>
							</td>
						</tr>
						</table>
              	</p>
              	</div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>John</p>
           <img src="bird.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Just Forgot that I had to mention something about someone to someone about how I forgot something, but now I forgot it. Ahh, forget it! Or wait. I remember.... no I don't.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Bo</p>
           <img src="bandmember.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Just Forgot that I had to mention something about someone to someone about how I forgot something, but now I forgot it. Ahh, forget it! Or wait. I remember.... no I don't.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Jane</p>
           <img src="bandmember.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Just Forgot that I had to mention something about someone to someone about how I forgot something, but now I forgot it. Ahh, forget it! Or wait. I remember.... no I don't.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
           <p>Anja</p>
           <img src="bird.jpg" class="img-circle" height="55" width="55" alt="Avatar">
          </div>
        </div>
        <div class="col-sm-9">
          <div class="well">
            <p>Just Forgot that I had to mention something about someone to someone about how I forgot something, but now I forgot it. Ahh, forget it! Or wait. I remember.... no I don't.</p>
          </div>
        </div>
      </div>     
    </div>
    <div class="col-sm-2 well" style="overflow:scroll; height:900px;">
      <h3> Events/Notice </h3>
       <s:iterator value="listOfAllNotification">
	      <div class="thumbnail">
	        <p style="word-break: break-all;"><s:property value="header"/></p>
	        <p style="word-break: break-all;"><s:property value="description"/></p><br>
	        <p style="word-break: break-all;"><s:property value="date"/></p>
	      </div>
       </s:iterator>

             
       <!-- <div class="well">
        <p>ADS</p>
      </div>-->
    </div>
    <div class="row">
    <div class="col-sm-9">
      <div class="panel panel-default text-left">
        <div class="panel-body">
        <h3>IMPORTANT INFORMATION FOR STUDENTS !!!</h3>
          <p contenteditable="true">
          	<ul>
				<li>1. Kindly get my approval (without fail) before naming me as a reference person for any purpose.</li>
				<li>2. I will highly appreciate for a timely act of avoiding difficulties/ problems. That would avoid it to be discussed in the 11th hour.</li>
				<li>3. Your feedback on any account will be highly appreciated.</li>
			</ul>
		  </p>
          <button type="button" class="btn btn-default btn-sm">
            <span class="glyphicon glyphicon-thumbs-up"></span> Like
          </button>     
        </div>
      </div>
    </div>
  </div>
  </div>
</div>

<form id="login" method="post" action=""></form>

<footer class="container-fluid text-center">
  <p>Powered by <b>Zkhemu <i class="fa fa-hand-spock-o" style="font-size:24px"></i></b></p>
</footer>

</body>

<script>

function renderPublication(id){
	
	var ele=document.getElementById(id);
	var span=document.getElementById(id+"Span");
	if(ele.style.display=="none"){
		ele.style.display="block";
		span.className="glyphicon glyphicon-minus"
	}else{
		ele.style.display="none";
		span.className="glyphicon glyphicon-plus"
	}
		
}
</script>
</html>

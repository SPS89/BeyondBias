<!DOCTYPE html>
<html lang="en">
   
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BV WOMEN JOB PORTAL SYSTEM</title>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
      body {
           
           
            margin: 0;
            font-family: Arial, sans-serif;
           
        }
       
        header {
            background-color: rgba(255, 255, 255, 0.8);
            color: black;
            text-align: center;
            padding: 10px;
        }
       
        h1 {
            color:#1e5783;
            margin-top: 0;
        }
        nav {
            background-color: #1e5783;
            overflow: hidden;
            display: block;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
        }
        nav a {
            color: white;
            text-decoration: none;
            padding: 14px 16px;
            display: inline-block;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        .dropdown {
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }
       

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            display:inline-block;
            text-decoration: none;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
         .blur-background {
            position:absolute;
            width: 100%;
            height: 45%;
            background-image: url('bg1.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            filter: blur(8px); 
            z-index: -1; 
        }
       
       .container.main-content {
           
            position: relative;
            z-index: 1; 
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 20px;
            box-shadow: 19px -19px 11px rgb(26 90 126 / 46%);
            margin: 50px auto;
            max-width: 500px;
            transition: transform 0.3s ease; 
           display: flex;
           flex-direction: column;
            align-items: center;
           justify-content: center; 
           text-align: center;
           
        }
        .tagline {
            font-size: 40px;
            font-weight: bold;
            color: #1e5783;
            margin-bottom: 20px;
        }
        .description {
            font-size: 20px;
            color: black;
            margin-top: 10px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .hidden-content {
      position: absolute;
    top: 50%;
    text-align:center;
    transform: translate(-50%, -50%);
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px;
    border-radius: 10px;
    display: none;
}
       .hidden-content.show {
         display: block;
         transform: translateY(0);
}
.discover-link {
    text-decoration: underline; 
}
.ad1{
            text-align:center;
            font-size: 20px;
            color: black;
            background-image: linear-gradient(#a0c7da, white);
            margin-top: 10px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
.arrow {
    margin-left: 5px; 
    transition: transform 0.3s;
}

.rotate {
    transform: rotateX(180deg); 
}
.discover-more {
    text-align: center;
}

.discover-link {
    text-decoration: underline;
    color: #1e5783;
    font-weight: bold;
}
.discover-link:hover {
    color:#0e3756; 
}
.advantages{
    text-align:center;
}
 .grid-container {
            display: flex;
            flex-wrap: nowrap;
            gap: 20px;
            overflow-x: auto;
        }
        .grid-item {
            flex: 0 0 auto; 
            width: calc(25% - 20px); 
            position: relative;
            overflow: hidden;
        }
         .grid-item img {
            width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }
        .grid-item .details {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            opacity: 0;
            transition: opacity 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
            box-sizing: border-box;
        }
        .grid-item:hover .details {
            opacity: 1;
        }
        .details h2 {
            margin: 0;
            font-size: 24px;
        }
        .details p {
            margin: 10px 0;
        }
        .benefits{
            text-align:center;
        }
        .grid-benefits {
            display: flex;
            justify-content: center;
            align-items: center;
            background-image: linear-gradient(#a0c7da, white);
            flex-wrap: wrap; 
            gap: 20px; 
            margin-top: 20px;
        }
        .grid {
             width: 200px; 
            text-align: center;
            padding: 10px; 
            box-sizing: border-box;
        }
         .grid img {
            width: 30%;
            height: 40%;
            transition: transform 0.3s ease;
        }
       .grid.para {
            position: absolute;
            top: 0;
            left: 0;
            width: 40%;
            height: 40%;
            background-color: rgba(0, 0, 0, 0.7);
            color: #fff;
            opacity: 0;
            transition: opacity 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
            box-sizing: border-box;
        }
        .grid:hover .para {
            opacity: 1;
        }
        .para p {
            margin: 0;
            font-size: 18px;
        }
        #profile {
    position: absolute;
    top: 10%;
    right: 10px;
    color:#1e5783 ;
    font-size: 18px;
    font-weight: bold; 
}
       
    </style>
</head>
<body>
   
    <form action="homejobporatl.jsp" method="GET">
    <div class="blur-background" align="left"></div>
     
    <header>
     
        <div id="google_translate_element" align="left"></div>
 
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement(
                {pageLanguage: 'en'},
                'google_translate_element'
            );
        }
    </script>
 
    <script type="text/javascript"
            src=
"https://translate.google.com/translate_a/element.js?
cb=googleTranslateElementInit">
    </script>
 
        <h1>BV WOMEN JOB PORTAL SYSTEM</h1>
        <img class="logo" src="Banasthali_Vidyapeeth_Logo.png" alt="Logo" width="70" height="70">
    </header>
     <main>
            <div id="profile">
                <p id="username">Welcome, <span id="loggedInUser"></span></p>
            </div>
           <script >
        document.addEventListener("DOMContentLoaded", function() {
   
    var loggedInUser = '<%= session.getAttribute("loggedInUser") %>';

  
    document.getElementById("loggedInUser").textContent = loggedInUser;
});
    </script>
        </main>
    </div>
     
    
   
    <nav>
        <div id="user-info"></div>
       
        
        <div class="dropdown">
            <a href="#" class="dropdown-btn"><span class="fa fa-user-o"></span> Banasthali Employee</a>
            <div class="dropdown-content">
                <a href="createprofile.html">Create Profile</a>
                <a href="manage.html">Manage Profile</a>
                <a href="add_jobs.html">Post Jobs</a>
                 <a href="createcommunity.html">Create Community</a>
                 <a href="employer_view_applications.jsp">View Application</a>
                 <a href="manage_shortlisted.jsp"> Manage Shortlist Candidate</a>
               
            </div>
        </div>
        
        

       <a href="viewjobseekerprofile.jsp">Jobseeker Profiles</a>
        
        <a href="view.jsp"> View Feedback</a>
        
       <script>
        function logout() {
            var confirmation = confirm("Are you sure you want to logout?");
            if (confirmation) {
                alert("Logged out successfully!");
                window.location.href = "homejobporatl.html";
            }
        }
    </script>


    <a href="#" onclick="logout()">Logout</a>
    </nav>

    <div class="container">
    
    </div>

    <script>
       
        document.addEventListener("DOMContentLoaded", function() {
            var dropdowns = document.querySelectorAll('.dropdown');
            dropdowns.forEach(function(dropdown) {
                dropdown.addEventListener('click', function() {
                    this.classList.toggle('active');
                });
            });

            window.onclick = function(event) {
                if (!event.target.matches('.dropdown-btn')) {
                    dropdowns.forEach(function(dropdown) {
                        dropdown.classList.remove('active');
                    });
                }
            };
        });
    </script>
     
    <div class="container main-content">
        <div class="tagline">CANDIDATES<br>ON<br>DEMAND</div>
        <p class="description">Highlight the dedication of candidates to secure meaningful employment opportunities, despite facing challenges or barriers.</p>
    <div class="discover-more">
    <a href="#" class="discover-link">Discover More <span class="arrow">&#9660;</span></a>
</div>
    </div>
   
<div class="hidden-content">
    <!-- Content to be revealed when the link is clicked -->
    <p>Banasthali Vidyapith aims at the synthesis of spiritual values and scientific achievements of both the East and the West. Its educational programme is based on the concept of "Panchmukhi Shiksha" and aims at all round harmonious development of personality.

Emphasis on Indian culture and thought characterized by simple living and khadi wearing are hallmarks of life at Banasthali</p>
</div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
    const discoverLink = document.querySelector('.discover-link');
    const hiddenContent = document.querySelector('.hidden-content');

    discoverLink.addEventListener('click', function(event) {
        event.preventDefault();

       
        hiddenContent.classList.toggle('show');

       
        discoverLink.querySelector('.arrow').classList.toggle('rotate');
    });
});
</script>
   
   
 
   
<h1 class="advantages"><u>ADVANTAGES OF WORKING WITH US</u></h1>
<p class="ad1" >According to NIRF Report 2022, during Banasthali Vidyapith Placements 2020?21, out of 1423 students,
    85 were placed from UG(3?year) programmes, and the median salary offered was INR 2.65 LPA; out of
    1016 eligible students, 791 were placed, and the median salary offered from UG(4?year) programmes
    was INR 4.5 LPA. 67 students from the UG(5year) Program were chosen from 210 graduating students
    and given a median pay of INR 2.87 LPA. Two students were chosen from the PG(1 year) programme,
    and the median pay provided was INR 2.73 LPA.</p>
<div class="grid-container">
        <div class="grid-item">
            <img src="job1.jpeg" alt="Image 1">
            <div class="details">
                <h2>Dedicated Service</h2>
                <p><br>In-house Customer Success and Digital Advertising Team assigned to you
                    <br> Campaign optimization and reporting<br>
Multilanguage Account Management</p>
            </div>
        </div>
        <div class="grid-item">
            <img src="bv60.jpeg" alt="Image 2">
            <div class="details">
                <h2>Flying</h2>
                <p>
                    Flying has been an inseparable part of Banasthali's broad based learning <br>
                    programme since early 1960's. The Flying Club (BVGFC) has got it's renewal <br>
                    of approval from DGCA in Dec'08 for imparting flying training upto CPL and <br>
                 Instructuer  level. </p>
            </div>
        </div>
        <div class="grid-item">
            <img src="bv50.jpg" alt="Image 3">
            <div class="details">
                <h2>Punchmukhi<br>Seeksha</h2>
                <p><br>Physical:<br>Shooting,swimming,yoga<br>
                    Practical:<br>tailoring,embroidery,<br>designing<br>
                    Moral:Vedh,<br>Geeta,Ramayana<br>
                Intellectual:Nature,Social Sciences,Maths<br>
                Aesthetic:Painting or Instrumental
                </p>
            </div>
        </div>
        <div class="grid-item">
            <img src="bv9.jpg" alt="Image 4">
            <div class="details">
                <h2>Faculty</h2>
                <p>Faculty of Education<br>
                    Faculty of Fine Arts<br>
                    Faculty of Home Science<br>
                    Faculty of Humanities<br>
                    Faculty of Earth Sciences<br>
Faculty of Mathematics and Computing</p>
            </div>
        </div>
    </div>
<h1 class="benefits"><u>BENEFITS OF BEYOND BIAS.</u></h1><br>
<div class="grid-benefits">
        <div class="grid">
            <img src="lesswork.jpeg" alt="Image 1">
            <div class="para">
                <p><br>+Less Work</p>
               
            </div>
        </div>
        <div class="grid">
            <img src="norisk.jpeg" alt="Image 2">
            <div class="para">
                <p><br>+No Risk</p>
               
               
            </div>
        </div>
        <div class="grid">
            <img src="relevant.jpeg" alt="Image 3">
            <div class="para">
                <p><br>+Relevant Applications</p>
               
            </div>
        </div>
        <div class="grid">
            <img src="lowcost.jpeg" alt="Image 4">
            <div class="para">
                <p><br>+Lower Cost</p>
               
            </div>
        </div>
    </div>
    </form>
</body>
</html>
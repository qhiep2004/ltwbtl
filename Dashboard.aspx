<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BTL.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>

     <div class="dashboard-container">
         <!-- Total Courses -->
         <div class="card">
             <h2>Total Courses</h2>
             <h3>12</h3>
             <p>+2 from last month</p>
         </div>

         <!-- Completed Courses -->
         <div class="card">
             <h2>Completed Courses</h2>
             <h3>5</h3>
             <p>+1 from last month</p>
         </div>

         <!-- Hours Spent -->
         <div class="card">
             <h2>Hours Spent</h2>
             <h3>68.5</h3>
             <p>+8.2 hours from last week</p>
         </div>

         <!-- Forum Participation -->
         <div class="card">
             <h2>Forum Participation</h2>
             <h3>573</h3>
             <p>+201 interactions this month</p>
         </div>

         <!-- Course Progress Section (Chiếm 50% chiều ngang) -->
         <div class="card half-width">
             <h2>Course Progress</h2>
             <canvas id="progressChart"></canvas>
         </div>

         <!-- Upcoming Deadlines Section (Chiếm 50% chiều ngang) -->
        <div class="card half-width">
    <h2>Upcoming Deadlines</h2>
    <ul>
        <li class="upcoming-deadline-react">React Basics - Final Project - 6/15/2023</li>
        <li class="upcoming-deadline-advanced-js">Advanced JS - Async Operations Quiz - 6/18/2023</li>
        <li class="upcoming-deadline-css">CSS Mastery - Responsive Design Challenge - 6/20/2023</li>
    </ul>
</div>
     </div>

     <!-- Active Courses and Recent Activity -->
     <div class="courses-activity-container">
         <!-- Active Courses -->
         <div class="active-courses">
             <h2>Active Courses</h2>
             <p>Your current course load and progress</p>

             <div class="progress-bar-container">
                 <div class="course-label">
                     <span>React Basics</span>
                     <span>75%</span>
                 </div>
                 <div class="progress-bar">
                     <div style="width: 75%;"></div>
                 </div>
             </div>

             <div class="progress-bar-container">
                 <div class="course-label">
                     <span>Advanced JS</span>
                     <span>40%</span>
                 </div>
                 <div class="progress-bar">
                     <div style="width: 40%;"></div>
                 </div>
             </div>

             <div class="progress-bar-container">
                 <div class="course-label">
                     <span>CSS Mastery</span>
                     <span>90%</span>
                 </div>
                 <div class="progress-bar">
                     <div style="width: 90%;"></div>
                 </div>
             </div>

             <div class="progress-bar-container">
                 <div class="course-label">
                     <span>Node.js</span>
                     <span>20%</span>
                 </div>
                 <div class="progress-bar">
                     <div style="width: 20%;"></div>
                 </div>
             </div>
         </div>

         <!-- Recent Activity -->
         <div class="recent-activity">
             <h2>Recent Activity</h2>
             <p>Your latest interactions and achievements</p>

             <div class="recent-activity-item">
                 <div>
                     <span class="icon">•</span> 
                     <span>Completed Quiz</span>
                 </div>
                 <div class="time">Just now</div>
             </div>

             <div class="recent-activity-item">
                 <div>
                     <span class="icon">•</span> 
                     <span>Watched Lecture</span>
                 </div>
                 <div class="time">2 hours ago</div>
             </div>

             <div class="recent-activity-item">
                 <div>
                     <span class="icon">•</span> 
                     <span>Forum Participation</span>
                 </div>
                 <div class="time">Yesterday</div>
             </div>
         </div>
     </div>

     <div class="footer">
         <p>For any inquiries, contact us at: <a href="mailto:support@yourwebsite.com">support@yourwebsite.com</a></p>
         <p>Course Information: Web Development Bootcamp 2024</p>
     </div>

     <!-- Chart.js -->
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
     <script>
         // Data for the chart
         var ctx = document.getElementById('progressChart').getContext('2d');
         var progressChart = new Chart(ctx, {
             type: 'bar',
             data: {
                 labels: ['React Basics', 'Advanced JS', 'CSS Mastery', 'Node.js'],
                 datasets: [{
                     label: 'Course Progress (%)',
                     data: [80, 30, 70, 20],
                     backgroundColor: ['limegreen', 'limegreen', 'limegreen', 'limegreen'],
                     borderRadius: 8
                 }]
             },
             options: {
                 scales: {
                     y: {
                         beginAtZero: true,
                         max: 100
                     }
                 }
             }
         });
     </script>

     <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .dashboard-container {
            width: 90%;
            margin: 40px auto;
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            flex-grow: 1;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            font-size: 18px;
            margin-bottom: 20px;
        }

        h3 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        ul {
            list-style-type: none;
            padding: 0;
        }

 /*color ul li {
 background-color: #f0f0f0 !important;*/ /* Light gray background */
            /*padding: 10px;
            border-radius: 8px;
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }*/
  
   
.upcoming-deadline-react {
    background-color: #e7f3ff; /* Light blue background */
    border: 1px solid #007bff; /* Blue border */
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.upcoming-deadline-advanced-js {
    background-color: #fff3cd; /* Light yellow background */
    border: 1px solid #ffc107; /* Yellow border */
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.upcoming-deadline-css {
    background-color: #d4edda; /* Light green background */
    border: 1px solid #28a745; /* Green border */
    padding: 10px;
    border-radius: 8px;
    margin-bottom: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}


        .footer {
            background-color: #f8f8f8;
            padding: 20px;
            text-align: center;
            width: 100%;
            box-shadow: 0px -2px 10px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
            position: relative;
            margin-top: 40px;
        }

        .footer p {
            margin: 0;
            color: #555;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        /* Full and Half Width Adjustments */
        .full-width {
            grid-column: span 4;
        }

        .half-width {
            grid-column: span 2;
        }

        canvas {
            width: 100%;
            height: 300px;
        }

        .active-courses, .recent-activity {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 48%;
        }

        .progress-bar-container {
            margin-bottom: 15px;
        }

        .progress-bar {
            width: 100%;
            background-color: #e0e0e0;
            border-radius: 5px;
            overflow: hidden;
        }

        .progress-bar div {
            height: 10px;
            background-color: black;
        }

        .course-label {
            display: flex;
            justify-content: space-between;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .recent-activity-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .recent-activity-item .time {
            color: gray;
        }

        .recent-activity-item span {
            font-weight: bold;
        }

        .recent-activity-item .icon {
            margin-right: 10px;
        }

        .courses-activity-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            margin-top: 40px;
        }
    </style>

    </main>
</asp:Content>

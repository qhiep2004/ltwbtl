<%@ Page Title="Courses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Courses.aspx.cs" Inherits="BTL.Courses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 20px auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        .filter-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-bottom: 30px;
        }
        .filter-container input, .filter-container select {
            padding: 10px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 250px;
        }
        .course-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }
        .course-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            background-color: #fff;
            text-align: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
            overflow: hidden;
        }
        .course-card:hover {
            transform: translateY(-5px);
        }
        .course-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }
        .level {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: #e0f7fa;
            padding: 4px 8px;
            border-radius: 5px;
            font-size: 12px;
            font-weight: bold;
            color: #007bff;
        }
        .course-card-content {
            padding: 15px;
        }
        .course-card h3 {
            font-size: 18px;
            color: #333;
            margin: 10px 0 5px;
        }
        .rating {
            display: flex;
            justify-content: center;
            margin: 5px 0;
        }
        .star {
            width: 20px;
            height: 20px;
            margin-right: 2px;
            font-size: 20px;
            position: relative;
        }
        .full::before {
            content: "★";
            color: #ff9800;
        }
        .half::before {
            content: "★";
            color: #ff9800;
            position: absolute;
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            width: 50%;
        }
        .empty::before {
            content: "☆";
            color: #ddd;
        }
        .details {
            font-size: 14px;
            color: #777;
        }
        .description {
            margin: 10px 0;
            font-size: 14px;
            color: #555;
        }
        .rating-value {
            font-weight: bold;
            margin-left: 8px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 10px 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-decoration: none;
            color: #007bff;
            cursor: pointer;
        }
        .pagination a.disabled {
            color: #ccc;
            cursor: not-allowed;
        }
        .pagination a.active {
            background-color: #007bff;
            color: #fff;
            border-color: #007bff;
        }
    </style>

    <div class="container">
        <h2>Courses</h2>
        
        <div class="filter-container">
            <input type="text" id="search" placeholder="Find your course..." onkeyup="filterCourses()" />
            <select id="categoryFilter" onchange="filterCourses()">
                <option value="">All Categories</option>
                <option value="Design">Design</option>
                <option value="Development">Development</option>
                <option value="Data Science">Data Science</option>
                <option value="Marketing">Marketing</option>
                <option value="Finance">Finance</option>
                <option value="Photography">Photography</option>
                <option value="Video Editing">Video Editing</option>
            </select>
        </div>

        <div class="course-grid" id="courseGrid" runat="server">
            <asp:Repeater ID="CourseRepeater" runat="server">
                <ItemTemplate>
                    <div class="course-card" data-category='<%# Eval("Category") %>'>
                        <div style="position: relative;">
                            <img src='<%# Eval("ImageURL") %>' alt="Course Image" />
                            <div class="level"><%# Eval("Level") %></div>
                        </div>
                        <div class="course-card-content">
                            <h3>
                                <asp:HyperLink ID="hlCourseTitle" runat="server" 
                                    NavigateUrl='<%# "CourseDetail.aspx?CourseID=" + Eval("CourseID") %>' 
                                    Text='<%# Eval("Title") %>' />
                            </h3>
                            <div class="description"><%# Eval("Description") %></div>
                            <div class="rating">
                                <%# RenderStars((double)Eval("Rating")) %>
                                <span class="rating-value"><%# Eval("Rating") %>/5</span>
                            </div>
                            <div class="details"><%# Eval("Duration") %> | <%# Eval("LecturesCount") %> lectures</div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="pagination">
            <asp:LinkButton ID="PreviousPage" runat="server" OnClick="PreviousPage_Click" Text="<<"
                Enabled="<%# CurrentPage > 1 %>" />
            <asp:Repeater ID="PageNumberRepeater" runat="server" OnItemCommand="PageNumberRepeater_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="PageNumberButton" runat="server"
                        CommandName="Page" 
                        CommandArgument='<%# Convert.ToInt32(Container.DataItem) %>'
                        Text='<%# Container.DataItem %>'
                        CssClass='<%# (Convert.ToInt32(Container.DataItem) == CurrentPage) ? "active" : "" %>' />
                </ItemTemplate>
            </asp:Repeater>
            <asp:LinkButton ID="NextPage" runat="server" OnClick="NextPage_Click" Text=">>"
                Enabled="<%# CurrentPage < TotalPages %>" />
        </div>

    </div>

    <script type="text/javascript">
        function filterCourses() {
            var search = document.getElementById("search").value.toLowerCase();
            var category = document.getElementById("categoryFilter").value;

            var courses = document.getElementsByClassName("course-card");

            for (var i = 0; i < courses.length; i++) {
                var title = courses[i].getElementsByTagName("h3")[0].textContent.toLowerCase();
                var courseCategory = courses[i].getAttribute("data-category");

                if ((title.includes(search) || search === "") &&
                    (category === "" || courseCategory === category)) {
                    courses[i].style.display = "block";
                } else {
                    courses[i].style.display = "none";
                }
            }
        }
    </script>
</asp:Content>

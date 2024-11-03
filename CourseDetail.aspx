<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseDetail.aspx.cs" Inherits="BTL.CourseDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Base styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        /* Main container styling */
        #courseDetailContainer {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 20px;
            max-width: 1000px;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Course image section */
        #courseImage {
            width: 250px;
            height: 200px;
            background-color: #ddd;
            border-radius: 4px;
            overflow: hidden;
            margin-right: 20px;
        }

        #courseImage img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Course details */
        #courseDetails {
            flex: 1;
        }

        #courseDetails h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 8px;
        }

        /* Lecture section styling */
        #lectureSection {
            margin-top: 20px;
            padding: 20px;
            background-color: #f8f8fb;
            border-radius: 8px;
        }

        #lectureSection h1 {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        /* GridView styling */
        .lecture-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .lecture-grid th {
            background-color: #e0e0e0;
            font-weight: bold;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .lecture-grid td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }

        .lecture-grid tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .lecture-title {
            font-weight: bold;
            color: #0073e6;
        }

        .watch-link {
            color: #0073e6;
            text-decoration: underline;
            cursor: pointer;
        }

        #lblLecturesHeader {
            font-size: 18px;
            font-weight: bold;
            color: #555;
            margin-bottom: 10px;
        }
    </style>

    <div id="courseDetailContainer">
        <div id="courseImage">
            <asp:Image ID="imgCourse" runat="server" Width="250px" Height="200px" />
        </div>
        
        <div id="courseDetails">
            <!-- Course Title and Description -->
            <asp:Label ID="lblCourseTitle" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
            <br />
            <asp:Label ID="lblCourseDescription" runat="server"></asp:Label>
            <br />
            <!-- Registration Button -->
            <asp:Button ID="btnRegister" runat="server" Text="Register for this Course" OnClick="btnRegister_Click" />
        </div>
    </div>

    <div id="lectureSection">
        <!-- Lecture Title -->
        <h1>Lecture</h1>
        
        <!-- GridView for displaying lectures -->
        <asp:Label ID="lblLecturesHeader" runat="server" Text="Lectures" Font-Bold="True" Font-Size="Medium" Visible="false"></asp:Label>
        
        <asp:GridView ID="gvLectures" runat="server" AutoGenerateColumns="False" CssClass="lecture-grid" Visible="false">
            <Columns>
                <asp:BoundField DataField="Title" HeaderText="Lecture Title" HeaderStyle-CssClass="lecture-title-header" ItemStyle-CssClass="lecture-title" />
                <asp:BoundField DataField="Duration" HeaderText="Duration" HeaderStyle-CssClass="lecture-duration-header" ItemStyle-CssClass="lecture-duration" />
                <asp:TemplateField HeaderText="URL">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkWatch" runat="server" NavigateUrl='<%# Eval("URL") %>' Text="Watch" CssClass="watch-link"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

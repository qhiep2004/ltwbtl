<%@ Page Title="Upload Assignments" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadAssignments.aspx.cs" Inherits="BTL.UploadAssignments" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style> 
        /* Styles for the upload page */
.file-upload-container {
    max-width: 500px;
    margin: 0 auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
}

h2 {
    color: #333;
    text-align: center;
    margin-bottom: 20px;
}

label {
    font-weight: bold;
    color: #555;
}

input[type="text"], input[type="date"] {
    display: block;
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

#UploadButton {
    background-color: #4CAF50;
    color: white;
    padding: 12px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
}

#UploadButton:hover {
    background-color: #45a049;
}

#StatusLabel {
    display: block;
    margin-top: 20px;
    text-align: center;
    font-weight: bold;
    color: #e74c3c;
}

    </style>
    <div class="file-upload-container">
        <h2>Tải Lên Bài Tập</h2>
        
        <asp:Label ID="CourseIdLabel" runat="server" Text="Nhập ID Khóa Học:"></asp:Label>
        <asp:TextBox ID="CourseIdTextBox" runat="server" MaxLength="10" />
        
        <asp:Label ID="AssignmentNameLabel" runat="server" Text="Tên Bài Tập:"></asp:Label>
        <asp:TextBox ID="AssignmentNameTextBox" runat="server" />
        
        <asp:Label ID="DueDateLabel" runat="server" Text="Hạn Nộp:"></asp:Label>
        <asp:TextBox ID="DueDateTextBox" runat="server" TextMode="Date" />
        
        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button ID="UploadButton" runat="server" Text="Tải Lên" OnClick="UploadButton_Click" />
        <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

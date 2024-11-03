<%@ Page Title="Upload Materials" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadMaterials.aspx.cs" Inherits="BTL.UploadMaterials" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style> 
        /* styles.css */

/* Body styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9; /* Light background for contrast */
    margin: 0;
    padding: 20px;
}

/* Main container for the upload form */
.file-upload-container {
    max-width: 500px; /* Limit the maximum width of the form */
    margin: 0 auto; /* Center the form */
    background-color: #fff; /* White background for form */
    padding: 20px;
    border-radius: 8px; /* Rounded corners */
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
}

/* Heading styles */
h2 {
    color: #333; /* Darker text color */
    text-align: center; /* Centered heading */
    margin-bottom: 20px; /* Space below heading */
}

/* Label styles */
label {
    font-weight: bold; /* Bold labels for better visibility */
    color: #555; /* Slightly lighter color */
}

/* Input field for Course ID */
#CourseIdTextBox {
    display: block; /* Block display for full-width */
    width: 100%; /* Full width of the container */
    padding: 10px; /* Padding for comfort */
    margin: 10px 0; /* Space above and below */
    border: 1px solid #ccc; /* Light border */
    border-radius: 5px; /* Rounded corners */
    font-size: 16px; /* Larger font size for readability */
}

/* File upload control */
#FileUploadControl {
    display: block; /* Block display for full-width */
    margin: 20px 0; /* Space above and below */
}

/* Button styles */
#UploadButton {
    background-color: #4CAF50; /* Green background */
    color: white; /* White text */
    padding: 12px 15px; /* Padding for the button */
    border: none; /* No border */
    border-radius: 5px; /* Rounded corners */
    cursor: pointer; /* Pointer cursor on hover */
    width: 100%; /* Full width of the container */
    font-size: 16px; /* Consistent font size */
    transition: background-color 0.3s ease; /* Smooth transition on hover */
}

/* Button hover effect */
#UploadButton:hover {
    background-color: #45a049; /* Darker green on hover */
}

/* Status label for upload feedback */
#StatusLabel {
    display: block; /* Block display for spacing */
    margin-top: 20px; /* Space above */
    text-align: center; /* Center text */
    font-weight: bold; /* Bold text for emphasis */
    color: #e74c3c; /* Red color for error messages */
}

/* Responsive design for smaller screens */
@media (max-width: 600px) {
    .file-upload-container {
        padding: 15px; /* Less padding on smaller screens */
    }

    #UploadButton {
        padding: 10px; /* Adjust button padding */
    }
}

    </style>
    <div class="file-upload-container">
        <h2>Tải Lên Tài Liệu Học Tập</h2>
        <asp:Label ID="CourseIdLabel" runat="server" Text="Nhập ID Khóa Học:"></asp:Label>
        <asp:TextBox ID="CourseIdTextBox" runat="server" MaxLength="10" />
        
        <asp:FileUpload ID="FileUploadControl" runat="server" />
        <asp:Button ID="UploadButton" runat="server" Text="Tải Lên" OnClick="UploadButton_Click" />
        <asp:Label ID="StatusLabel" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTL.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <div class="bg-body d-flex justify-content-center p-5">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Welcome Back</h5>
                    <h6 class="card-subtitle mb-2 text-body-secondary">Login to continue</h6>

                    <div class="m-3">
                        <div class="form-floating mx-2 mb-2">
                            <input type="email" class="form-control" id="emailInput" placeholder="name@example.com" runat="server">
                            <label for="emailInput">Email address</label>
                        </div>
                        <div class="form-floating mx-2 mb-2">
                            <input type="password" class="form-control" id="passInput" placeholder="Password" runat="server">
                            <label for="passInput">Password</label>
                        </div>
                        <asp:Button ID="LoginButton" CssClass="btn btn-primary w-100 py-2" runat="server" Text="Login" OnClick="Login_Click" />
                        <asp:Label ID="ErrorMessage" runat="server" ForeColor="Red" />
                    </div>

                    <p class="text-center">
                        Don't have an account? <a href="Signup.aspx">Sign up</a>
                    </p>
                </div>
            </div>
        </div>
    </main>
</asp:Content>

<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="WebApplication.Forms.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Details</h1>
    <div>
        <strong>First name: </strong>
        <span id="FirstName" runat="server"></span>
    </div>
    <div>
        <strong>Last name: </strong>
        <span id="LastName" runat="server"></span>
    </div>
    <div>
        <strong>Email:</strong>
        <span id="Email" runat="server"></span>
    </div>
    <div>
        <strong>Preferred pronouns:</strong>
        <span id="PreferredPronouns" runat="server"></span>
    </div>
    <div>
        <strong>Level of study:</strong>
        <span id="LevelOfStudy" runat="server"></span>
    </div>
    <div>
        <strong>International student:</strong>
        <span id="InternationalStudent" runat="server"></span>
    </div>
    <div>
        <strong>Disabilities:</strong>
        <asp:BulletedList ID="Disabilities" runat="server" />
    </div>
    <div>
        <strong>Additional accessibility requirements:</strong>
        <div id="AdditionalAccessibilityRequirements" runat="server"/>
    </div>
    <a href="~/Forms/List" class="btn btn-primary mt-4" runat="server">Back to Submissions</a>
</asp:Content>

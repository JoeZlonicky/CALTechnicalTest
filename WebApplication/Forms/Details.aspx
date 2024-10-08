<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="WebApplication.Forms.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Details</h1>
    <div>
        <strong>Full Name: </strong>
        <span id="FullName" runat="server"></span>
    </div>
    <div>
        <strong>Email:</strong>
        <span id="Email" runat="server"></span>
    </div>
    <div>
        <strong>Preferred Pronouns:</strong>
        <span id="PreferredPronouns" runat="server"></span>
    </div>
    <div>
        <strong>Level of Study:</strong>
        <span id="LevelOfStudy" runat="server"></span>
    </div>
    <div>
        <strong>International Student Status:</strong>
        <span id="InternationalStudentStatus" runat="server"></span>
    </div>
    <div>
        <strong>Disabilities:</strong>
        <asp:BulletedList ID="Disabilities" runat="server" CssClass="list-group" />
    </div>
    <div>
        <strong>Additional Accessibility Requirements:</strong>
        <div id="AdditionalAccessibilityRequirements" runat="server"/>
    </div>
    <a href="~/Forms/List" class="btn btn-primary mt-4" runat="server">Back to Submissions</a>
</asp:Content>

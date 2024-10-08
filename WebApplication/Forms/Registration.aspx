<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication.Forms.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Register with CAL</h1>
    <p>Please complete the form below and click the 'Submit' button when you are done. The 'Submit' button is located at the very bottom of this page.</p>
    <hr />
    <asp:ValidationSummary runat="server" CssClass="text-danger" />

    <!-- First name -->
    <div>
        <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-2 form-label">First Name</asp:Label>
        <asp:TextBox runat="server" ID="FirstName" CssClass="form-text" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" CssClass="text-danger" ErrorMessage="The first name field is required." />
    </div>

    <!-- Last name -->
    <div>
        <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-2 form-label">Last Name</asp:Label>
        <asp:TextBox runat="server" ID="LastName" CssClass="form-text" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Lastname" CssClass="text-danger" ErrorMessage="The last name field is required." />
    </div>

    <!-- Email -->
    <div>
        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 form-label">Email</asp:Label>
        <asp:TextBox runat="server" ID="Email" CssClass="form-text" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" CssClass="text-danger" ErrorMessage="The email field is required." />
    </div>

    <!-- Preferred Pronouns -->
    <div>
        <asp:Label runat="server" AssociatedControlID="PreferredPronouns" CssClass="col-md-2 form-label">Preferred Pronouns</asp:Label>
        <asp:DropDownList runat="server" ID="PreferredPronouns"/><!-- Populated by server -->
    </div>

    <!-- Level of Study -->
    <div>
        <asp:Label runat="server" AssociatedControlID="LevelOfStudy" CssClass="col-md-2 form-label">Level of Study</asp:Label>
        <asp:DropDownList runat="server" ID="LevelOfStudy"/><!-- Populated by server -->
        <asp:RequiredFieldValidator runat="server" ControlToValidate="LevelOfStudy" CssClass="text-danger" ErrorMessage="The level of study field is required." />
    </div>

    <!-- International Student Status -->
    <div>
        <asp:Label runat="server" AssociatedControlID="InternationalStudentStatus" CssClass="col-md-2 form-label">International Student Status</asp:Label>
        <asp:RadioButtonList runat="server" ID="InternationalStudentStatus" repeatDirection="Horizontal">
            <asp:ListItem Value="No">No</asp:ListItem>
            <asp:ListItem Value="Yes">Yes</asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator runat="server" ControlToValidate="InternationalStudentStatus" CssClass="text-danger" ErrorMessage="The international student status field is required." />
    </div>

    <!-- Disabilities -->
    <div>
        <asp:Label runat="server" AssociatedControlID="Disabilities" CssClass="col-md-2 form-label">Disabilities</asp:Label>
        <asp:CheckBoxList runat="server" ID="Disabilities" repeatDirection="Horizontal"/><!-- Populated by server -->
    </div>

    <!-- Submit -->
    <div>
        <div class="col-md-offset-2 col-md-10">
            <asp:Button runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>

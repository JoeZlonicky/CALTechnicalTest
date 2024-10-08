<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication.Forms.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Register with CAL</h1>
    <p>Please complete the form below and click the 'Submit' button when you are done. The 'Submit' button is located at the very bottom of this page.</p>
    <hr />

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

    <!-- Consent -->
    <div><strong>Consent</strong></div>
    <p>Your dealings with the UVic Centre for Accessible Learning (CAL), including your academic accommodations, are private and confidential. CAL cannot disclose your confidential information to anyone outside of UVic without your consent. This includes discussing academic accommodations with parents, case workers, and external agencies.</p>
    <p>Complete this registration form to give CAL permission to disclose your confidential information to other individuals or agencies. CAL will only disclose your confidential information in compliance with UVic's <a href="https://www.uvic.ca/universitysecretary/assets/docs/policies/GV0235.pdf">protection of privacy policy (PDF 328 KB)</a>.</p>
    <p>Your consent is valid for the duration of your studies at UVic. You may withdraw or change your consent at any time by notifying CAL at <a href="mailto:calfrontdesk@uvic.ca">calfrontdesk@uvic.ca</a> or 250-472-4947. If you have questions about your personal information, you can contact UVic's Chief Privacy Officer at <a href="mailto:privacyinfo@uvic.ca">privacyinfo@uvic.ca</a> or 250-472-4914.</p>

    <div>
        <asp:Label runat="server" AssociatedControlID="FullName" CssClass="col-md-2 form-label">Full Name</asp:Label>
        <asp:TextBox runat="server" ID="FullName" CssClass="form-text" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="FullName" CssClass="text-danger" ErrorMessage="The full name field is required." />
    </div>

    <div>
        <asp:Label runat="server" AssociatedControlID="ConfirmFullName" CssClass="col-md-2 form-label">Confirm Full Name</asp:Label>
        <asp:TextBox runat="server" ID="ConfirmFullName" CssClass="form-text" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmFullName" CssClass="text-danger" ErrorMessage="The confirm full name field is required." />
    </div>

    <!-- Submit -->
    <div>
        <div class="col-md-offset-2 col-md-10">
            <asp:Button runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>

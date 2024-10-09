<%@ Page Title="Registration" Language="C#" Async="true" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication.Forms.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        input[type="checkbox"] {
            margin-left: 8px;
            margin-right: 8px;
        }

        input[type="submit"] {
            width: 150px;
        }

        input[type="radio"] {
            margin-right: 2px;
        }

        #MainContent_InternationalStudentInput {
            margin-bottom: 4px;
            display: inline-block;
        }

        input[type="radio"]:not(:first-child) {
            margin-left: 20px;
        }

        abbr.text-danger {
            font-size: 125%;
        }
    </style>
    <h1>Register with CAL</h1>
    <p>Please complete the form below and click the 'Submit' button when you are done. The 'Submit' button is located at the very bottom of this page.</p>
    <hr />

    <p>Required fields are marked with an asterisk <abbr class="text-danger" title="required">*</abbr>.</p>
    <fieldset class="border p-4">
        <legend>Personal Information</legend>
        <!-- First name -->
        <div class="row align-items-center">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="FirstNameInput" CssClass="form-label">
                    <abbr class="text-danger" title="required">*</abbr> First name:
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:TextBox runat="server" ID="FirstNameInput" CssClass="form-control" AutoCompleteType="FirstName"/>
            </div>
            <div class="col-auto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstNameInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="First name is required." />
            </div>
        </div>

        <!-- Last name -->
        <div class="row align-items-center mt-2">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="LastNameInput" CssClass="form-label">
                    <abbr class="text-danger" title="required">*</abbr> Last name:
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:TextBox runat="server" ID="LastNameInput" CssClass="form-control" AutoCompleteType="LastName"/>
            </div>
            <div class="col-auto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LastNameInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="Last name is required." />
            </div>
        </div>

        <!-- Email -->
        <div class="row align-items-center mt-2">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="EmailInput" CssClass="form-label">
                    <abbr class="text-danger" title="required">*</abbr> Email:
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:TextBox runat="server" ID="EmailInput" CssClass="form-control" AutoCompleteType="Email"/>
            </div>
            <div class="col-auto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="Email is required." />
            </div>
            <div class="col-auto">
                <asp:RegularExpressionValidator ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$" runat="server" ControlToValidate="EmailInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="Invalid email format." />
            </div>
        </div>

        <!-- Preferred Pronouns (Populated by server) -->
        <div class="row align-items-center mt-2">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="PreferredPronounsInput" CssClass="form-label">
                    Preferred pronouns:
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:DropDownList runat="server" ID="PreferredPronounsInput" CssClass="form-select" AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Select an option --" Value="" />
                </asp:DropDownList>
            </div>
        </div>
    </fieldset>

    <fieldset class="border p-4 mt-4">
        <legend>Education</legend>

        <!-- Level of Study (Populated by server) -->
        <div class="row align-items-center">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="LevelOfStudyInput" CssClass="form-label">
                    <abbr class="text-danger" title="required">*</abbr> At what level are you studying?
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:DropDownList runat="server" ID="LevelOfStudyInput" CssClass="form-select" AppendDataBoundItems="true">
                    <asp:ListItem Text="-- Select an option --" Value="" />
                </asp:DropDownList>
            </div>
            <div class="col-auto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="LevelOfStudyInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="At what level are you studying? is required." />
            </div>
        </div>

        <!-- International Student Status -->
        <div class="row align-items-center mt-2">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="InternationalStudentInput" CssClass="form-label">
                    <abbr class="text-danger" title="required">*</abbr> Are you an international student?
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:RadioButtonList runat="server" ID="InternationalStudentInput" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <asp:ListItem Value="No"></asp:ListItem>
                    <asp:ListItem Value="Yes"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="col-auto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="InternationalStudentInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="Are you an international student? is required." />
            </div>
        </div>
    </fieldset>
    
    <fieldset class="border p-4 mt-4">
        <legend>Disability Information</legend>

        <!-- Disabilities (populated by server) -->
        <div>
            <asp:Label runat="server" AssociatedControlID="DisabilitiesInput" CssClass="form-label">
                <abbr class="text-danger" title="required">*</abbr> Why are you registering with CAL?
            </asp:Label>
            <asp:CheckBoxList runat="server" ID="DisabilitiesInput" repeatDirection="Vertical"/>
            <asp:CustomValidator runat="server" ClientValidationFunction="ClientValidateDisabilitySelected" OnServerValidate="ValidateDisabilitySelected" CssClass="text-danger" Display="Dynamic" ErrorMessage="Why are you registering with CAL? is required."/>
        </div>

        <!-- Additional Accessibility Requirements -->
        <div class="mt-4">
            <asp:Label runat="server" AssociatedControlID="AdditionalAccessibilityInput" CssClass="form-label">Additional accessibility requirements:</asp:Label>
            <asp:TextBox runat="server" ID="AdditionalAccessibilityInput" TextMode="MultiLine" CssClass="form-control"/>
        </div>
    </fieldset>

    <fieldset class="border p-4 mt-4">
        <legend>Consent</legend>

        <!-- Consent -->
        <p>By submitting this form, you consent to CAL storing this confidential information. If you have any questions or want to withdraw your consent, you can do so by contacting CAL at <a href="mailto:calfrontdesk@uvic.ca">calfrontdesk@uvic.ca</a> or 250-472-4947.</p>
        <p>To confirm, please enter your full name:</p>

        <div class="row align-items-center mt-2">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="FullNameInput" CssClass="form-label">
                    <abbr class="text-danger" title="required">*</abbr> Full name:
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:TextBox runat="server" ID="FullNameInput" CssClass="form-control"/>
            </div>
            <div class="col-auto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="FullNameInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="Full name is required." />
            </div>
        </div>

        <div class="row align-items-center mt-2">
            <div class="col-auto">
                <asp:Label runat="server" AssociatedControlID="ConfirmFullNameInput" CssClass="form-label">
                    <abbr class="text-danger" title="required">*</abbr> Confirm full name:
                </asp:Label>
            </div>
            <div class="col-auto">
                <asp:TextBox runat="server" ID="ConfirmFullNameInput" CssClass="form-control"/>
            </div>
            <div class="col-auto">
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmFullNameInput" CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm full name is required." />
            </div>
            <div class="col-auto">
                <asp:CustomValidator runat="server" ClientValidationFunction="ClientValidateFullNamesMatch" ControlToValidate="ConfirmFullNameInput" OnServerValidate="ValidateFullNamesMatch" CssClass="text-danger" Display="Dynamic" ErrorMessage="Confirm full name does not match."/>
            </div>
        </div>
    </fieldset>

    <!-- Submit -->
    <div class="mt-3 container-sm">
        <asp:Button runat="server" OnClick="Submit" Text="Submit" CssClass="btn btn-primary" />
    </div>

    <!-- Client-side JS -->
    <script type="text/javascript">
        function ClientValidateFullNamesMatch(source, arguments) {
            const fullName = $("#<%=FullNameInput.ClientID%>").val();
            const confirmFullName = $("#<%=ConfirmFullNameInput.ClientID%>").val();
            arguments.IsValid = fullName === confirmFullName;
        }

        function ClientValidateDisabilitySelected(source, arguments) {
            arguments.IsValid = $("#<%=DisabilitiesInput.ClientID%> input:checked").length > 0;
        }
    </script>
</asp:Content>

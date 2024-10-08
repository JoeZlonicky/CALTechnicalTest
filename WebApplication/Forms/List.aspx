<%@ Page Title="Submissions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebApplication.Forms.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Submissions</h1>
    <div class="table-responsive">
        <asp:GridView ID="SubmissionsTable" runat="server" AutoGenerateColumns="false" DataKeyNames="SubmissionId" CssClass="table table-bordered">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name"/>
                <asp:BoundField DataField="LastName" HeaderText="Last Name"/>
                <asp:BoundField DataField="Email" HeaderText="Email"/>
                <asp:BoundField DataField="LevelName" HeaderText="Level of Study"/>
                <asp:BoundField DataField="Disabilities" HeaderText="Disabilities"/>
                <asp:BoundField DataField="AdditionalRequirements" HeaderText="Additional Requirements"/>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="ViewDetails" runat="server" Text="View Details" CssClass="btn btn-primary btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>

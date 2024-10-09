<%@ Page Title="Submissions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="WebApplication.Forms.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Submissions</h1>
    <div class="table-responsive">
        <asp:GridView ID="SubmissionsTable" runat="server" AutoGenerateColumns="false" DataKeyNames="SubmissionId" CssClass="table table-striped table-bordered">
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First&nbsp;Name"/>
                <asp:BoundField DataField="LastName" HeaderText="Last&nbsp;Name"/>
                <asp:BoundField DataField="Email" HeaderText="Email"/>
                <asp:BoundField DataField="LevelName" HeaderText="Level&nbsp;of&nbsp;Study"/>
                <asp:BoundField DataField="Disabilities" HeaderText="Disabilities"/>
                <asp:BoundField DataField="AdditionalRequirements" HeaderText="Additional&nbsp;Requirements"/>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="ViewDetails" runat="server" Text="View Details" CssClass="btn btn-primary btn-sm" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
    <a href="/Forms/Registration" class="btn btn-primary">New Application</a>
</asp:Content>

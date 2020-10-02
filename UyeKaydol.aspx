<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UyeKaydol.aspx.cs" Inherits="UyeKaydol"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-12">

                    <asp:FormView ID="FormView1" runat="server" DataKeyNames="UyeID" DataSourceID="SqlDataSource1" DefaultMode="Insert" CssClass="table" OnItemInserted="FormView1_ItemInserted">
                        <EditItemTemplate>
                            UyeID:
                            <asp:Label ID="UyeIDLabel1" runat="server" Text='<%# Eval("UyeID") %>' />
                            <br />
                            UyeNameUsername:
                            <asp:TextBox ID="UyeNameUsernameTextBox" runat="server" Text='<%# Bind("UyeNameUsername") %>' />
                            <br />
                            UyeTel:
                            <asp:TextBox ID="UyeTelTextBox" runat="server" Text='<%# Bind("UyeTel") %>' />
                            <br />
                            UyeEmail:
                            <asp:TextBox ID="UyeEmailTextBox" runat="server" Text='<%# Bind("UyeEmail") %>' />
                            <br />
                            UyeUsername:
                            <asp:TextBox ID="UyeUsernameTextBox" runat="server" Text='<%# Bind("UyeUsername") %>' />
                            <br />
                            UyePassword:
                            <asp:TextBox ID="UyePasswordTextBox" runat="server" Text='<%# Bind("UyePassword") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            İsim Soyisim:
                            <asp:TextBox ID="UyeNameUsernameTextBox" runat="server" Text='<%# Bind("UyeNameUsername") %>' CssClass="form-control" />
                            <br />
                            Telefon:
                            <asp:TextBox ID="UyeTelTextBox" runat="server" Text='<%# Bind("UyeTel") %>' CssClass="form-control" />
                            <br />
                           Email:
                            <asp:TextBox ID="UyeEmailTextBox" runat="server" Text='<%# Bind("UyeEmail") %>' CssClass="form-control" />
                            <br />
                            Kullanıcı Adı:
                            <asp:TextBox ID="UyeUsernameTextBox" runat="server" Text='<%# Bind("UyeUsername") %>' CssClass="form-control" />
                            <br />
                            Şifre:
                            <asp:TextBox ID="UyePasswordTextBox" runat="server" Text='<%# Bind("UyePassword") %>' CssClass="form-control" />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Ekle" CssClass="btn btn-success" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" CssClass="btn btn-danger" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            UyeID:
                            <asp:Label ID="UyeIDLabel" runat="server" Text='<%# Eval("UyeID") %>' />
                            <br />
                            UyeNameUsername:
                            <asp:Label ID="UyeNameUsernameLabel" runat="server" Text='<%# Bind("UyeNameUsername") %>' />
                            <br />
                            UyeTel:
                            <asp:Label ID="UyeTelLabel" runat="server" Text='<%# Bind("UyeTel") %>' />
                            <br />
                            UyeEmail:
                            <asp:Label ID="UyeEmailLabel" runat="server" Text='<%# Bind("UyeEmail") %>' />
                            <br />
                            UyeUsername:
                            <asp:Label ID="UyeUsernameLabel" runat="server" Text='<%# Bind("UyeUsername") %>' />
                            <br />
                            UyePassword:
                            <asp:Label ID="UyePasswordLabel" runat="server" Text='<%# Bind("UyePassword") %>' />
                            <br />
                            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymYerelBaglanti %>" DeleteCommand="DELETE FROM [TblUyeler] WHERE [UyeID] = @UyeID" InsertCommand="INSERT INTO [TblUyeler] ([UyeNameUsername], [UyeTel], [UyeEmail], [UyeUsername], [UyePassword]) VALUES (@UyeNameUsername, @UyeTel, @UyeEmail, @UyeUsername, @UyePassword)" SelectCommand="SELECT * FROM [TblUyeler]" UpdateCommand="UPDATE [TblUyeler] SET [UyeNameUsername] = @UyeNameUsername, [UyeTel] = @UyeTel, [UyeEmail] = @UyeEmail, [UyeUsername] = @UyeUsername, [UyePassword] = @UyePassword WHERE [UyeID] = @UyeID">
                        <DeleteParameters>
                            <asp:Parameter Name="UyeID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="UyeNameUsername" Type="String" />
                            <asp:Parameter Name="UyeTel" Type="String" />
                            <asp:Parameter Name="UyeEmail" Type="String" />
                            <asp:Parameter Name="UyeUsername" Type="String" />
                            <asp:Parameter Name="UyePassword" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UyeNameUsername" Type="String" />
                            <asp:Parameter Name="UyeTel" Type="String" />
                            <asp:Parameter Name="UyeEmail" Type="String" />
                            <asp:Parameter Name="UyeUsername" Type="String" />
                            <asp:Parameter Name="UyePassword" Type="String" />
                            <asp:Parameter Name="UyeID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
            </div>
        </div>
    </div>
</asp:Content>


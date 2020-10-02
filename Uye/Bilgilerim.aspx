<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="Bilgilerim.aspx.cs" Inherits="Uye_Bilgilerim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:FormView ID="FormView1" runat="server" CssClass="table" DataKeyNames="UyeID" DataSourceID="SqlDataSource1" DefaultMode="Edit" OnItemUpdated="FormView1_ItemUpdated">
                        <EditItemTemplate>
                            ID:
                            <asp:Label ID="UyeIDLabel1" runat="server" Text='<%# Eval("UyeID") %>' />
                            <br />
                            İsim Soyisim:
                            <asp:TextBox ID="UyeNameUsernameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("UyeNameUsername") %>' />
                            <br />
                            Telefon:
                            <asp:TextBox ID="UyeTelTextBox" runat="server" CssClass="form-control" Text='<%# Bind("UyeTel") %>' />
                            <br />
                            Email:
                            <asp:TextBox ID="UyeEmailTextBox" runat="server" CssClass="form-control" Text='<%# Bind("UyeEmail") %>' />
                            <br />
                            Kullanıcı Adı:
                            <asp:TextBox ID="UyeUsernameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("UyeUsername") %>' />
                            <br />
                            Şifre:
                            <asp:TextBox ID="UyePasswordTextBox" runat="server" CssClass="form-control" Text='<%# Bind("UyePassword") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" CssClass="btn btn-success" Text="Güncelle" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" Text="İptal" OnClick="UpdateCancelButton_Click"/>
                        </EditItemTemplate>
                        <InsertItemTemplate>
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
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymYerelBaglanti %>" DeleteCommand="DELETE FROM [TblUyeler] WHERE [UyeID] = @UyeID" InsertCommand="INSERT INTO [TblUyeler] ([UyeNameUsername], [UyeTel], [UyeEmail], [UyeUsername], [UyePassword]) VALUES (@UyeNameUsername, @UyeTel, @UyeEmail, @UyeUsername, @UyePassword)" SelectCommand="SELECT * FROM [TblUyeler] WHERE ([UyeID] = @UyeID)" UpdateCommand="UPDATE [TblUyeler] SET [UyeNameUsername] = @UyeNameUsername, [UyeTel] = @UyeTel, [UyeEmail] = @UyeEmail, [UyeUsername] = @UyeUsername, [UyePassword] = @UyePassword WHERE [UyeID] = @UyeID">
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
                        <SelectParameters>
                            <asp:SessionParameter Name="UyeID" SessionField="OturumTc" Type="Int32" />
                        </SelectParameters>
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
                <div class="col-md-12 p-5">
                    SİPARİŞLERİM:<br />
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover">
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


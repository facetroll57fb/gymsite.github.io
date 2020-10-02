<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetici/YonetMaster.master" AutoEventWireup="true" CodeFile="YonetIndexForm.aspx.cs" Inherits="Yonetici_YonetIndexForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: 'Kanit', sans-serif;
            height: 100%;
            background-color: #2a2727;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 mt-5">
                        <div class="jumbotron shadow-lg text-center py-5 rounded-0">
                            <span class="h1 align-middle">ADMİN PANELİ</span>
                            <a href="OturumuKapat.aspx" class="btn btn-danger fa fa-sign-out"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <nav>
                            <div class="nav nav-tabs" id="nav-tab">
                                <a class="nav-item nav-link" data-toggle="tab" href="#nav-siparisler">Siparişler</a>
                                <a class="nav-item nav-link" data-toggle="tab" href="#nav-uyeler">Üyeler</a>
                                <a class="nav-item nav-link  active" data-toggle="tab" href="#nav-urunler">Ürünler</a>
                            </div>
                        </nav>
                        <div class="tab-content" id="nav-tabContent">
                            <div id="nav-siparisler" class="container tab-pane fade">
                                <br />
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-dark" DataSourceID="SqlDataSource1" Width="100%">
                                    <Columns>
                                        <asp:BoundField DataField="UyeID" HeaderText="UyeID" SortExpression="UyeID" />
                                        <asp:BoundField DataField="UrunName" HeaderText="UrunName" SortExpression="UrunName" />
                                        <asp:BoundField DataField="Kategori" HeaderText="Kategori" SortExpression="Kategori" />
                                        <asp:BoundField DataField="Miktar_GR_" HeaderText="Miktar_GR_" SortExpression="Miktar_GR_" />
                                        <asp:BoundField DataField="Miktar" HeaderText="Miktar" SortExpression="Miktar" />
                                        <asp:BoundField DataField="Tutar" HeaderText="Tutar" SortExpression="Tutar" />
                                        <asp:BoundField DataField="Toplam" HeaderText="Toplam" ReadOnly="True" SortExpression="Toplam" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GymYerelBaglanti %>" SelectCommand="SELECT TblSepet.UyeID, TblUrunler.UrunName, TblUrunler.UrunKategories AS Kategori, TblUrunler.UrunAmount AS Miktar_GR_, TblSepet.Miktar, TblSepet.Tutar, TblSepet.Miktar * TblSepet.Tutar AS Toplam FROM TblSepet INNER JOIN TblSiparisler ON TblSepet.SepetId = TblSiparisler.SepetID INNER JOIN TblUrunler ON TblSepet.UrunID = TblUrunler.UrunID"></asp:SqlDataSource>
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="Satıştan Elde Edilen Miktar: " CssClass="text-white" Font-Bold="True" Font-Names="Consolas"></asp:Label>
                            </div>
                            <div id="nav-uyeler" class="container tab-pane fade show active">
                                <br />
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-dark" DataKeyNames="UyeID" DataSourceID="SqlDataSource2" Width="100%">
                                    <Columns>
                                        <asp:CommandField CancelText="İptal" DeleteText="Sil" EditText="Düzenle" InsertText="Ekle" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Güncelle" />
                                        <asp:BoundField DataField="UyeID" HeaderText="UyeID" InsertVisible="False" ReadOnly="True" SortExpression="UyeID" />
                                        <asp:BoundField DataField="UyeNameUsername" HeaderText="UyeNameUsername" SortExpression="UyeNameUsername" />
                                        <asp:BoundField DataField="UyeTel" HeaderText="UyeTel" SortExpression="UyeTel" />
                                        <asp:BoundField DataField="UyeEmail" HeaderText="UyeEmail" SortExpression="UyeEmail" />
                                        <asp:BoundField DataField="UyeUsername" HeaderText="UyeUsername" SortExpression="UyeUsername" />
                                        <asp:BoundField DataField="UyePassword" HeaderText="UyePassword" SortExpression="UyePassword" />
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GymYerelBaglanti %>" DeleteCommand="DELETE FROM [TblUyeler] WHERE [UyeID] = @UyeID" InsertCommand="INSERT INTO [TblUyeler] ([UyeID], [UyeNameUsername], [UyeTel], [UyeEmail], [UyeUsername], [UyePassword]) VALUES (@UyeID, @UyeNameUsername, @UyeTel, @UyeEmail, @UyeUsername, @UyePassword)" SelectCommand="SELECT * FROM [TblUyeler]" UpdateCommand="UPDATE [TblUyeler] SET [UyeNameUsername] = @UyeNameUsername, [UyeTel] = @UyeTel, [UyeEmail] = @UyeEmail, [UyeUsername] = @UyeUsername, [UyePassword] = @UyePassword WHERE [UyeID] = @UyeID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="UyeID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="UyeID" Type="Int32" />
                                        <asp:Parameter Name="UyeNameUsername" Type="String" />
                                        <asp:Parameter Name="UyeTel" Type="String" />
                                        <asp:Parameter Name="UyeEmail" Type="String" />
                                        <asp:Parameter Name="UyeUsername" Type="String" />
                                        <asp:Parameter Name="UyePassword" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="UyeID" Type="Int32" />
                                        <asp:Parameter Name="UyeNameUsername" Type="String" />
                                        <asp:Parameter Name="UyeTel" Type="String" />
                                        <asp:Parameter Name="UyeEmail" Type="String" />
                                        <asp:Parameter Name="UyeUsername" Type="String" />
                                        <asp:Parameter Name="UyePassword" Type="String" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                            <div id="nav-urunler" class="container tab-pane fade ">
                                <br />
                                <asp:Table ID="Table1" runat="server" CssClass="table table-hover table-dark" GridLines="Horizontal" Width="100%">
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">ÜRÜN ADI: </asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">KATEGORİSİ: </asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                                <asp:ListItem>Protein Tozu</asp:ListItem>
                                                <asp:ListItem>Amino Asit</asp:ListItem>
                                                <asp:ListItem>Vitamin</asp:ListItem>
                                                <asp:ListItem>Kreatin</asp:ListItem>
                                                <asp:ListItem>Karbonhidrat Tozu</asp:ListItem>
                                                <asp:ListItem>Sağlıklı Atıştırmalıklar</asp:ListItem>
                                            </asp:DropDownList>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">MİKTARI: </asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">FİYATI: </asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">RESİM: </asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                    <asp:TableRow runat="server">
                                        <asp:TableCell runat="server">
                                            <asp:Button ID="Button1" runat="server" Text="EKLE" CssClass="btn btn-success" OnClick="Button1_Click" />
                                        </asp:TableCell>
                                        <asp:TableCell runat="server">
                                            <asp:Button ID="Button2" runat="server" Text="TEMİZLE" CssClass="btn btn-danger" OnClick="Button2_Click" />
                                        </asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <br />
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-dark" DataKeyNames="UrunID" DataSourceID="SqlDataSource3" Width="100%">
                                    <Columns>
                                        <asp:CommandField CancelText="İptal" DeleteText="Sil" EditText="Düzenle" InsertText="Ekle" NewText="Yeni" SelectText="Seç" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Güncelle" />
                                        <asp:BoundField DataField="UrunID" HeaderText="Urun Id" InsertVisible="False" ReadOnly="True" SortExpression="UrunID" />
                                        <asp:BoundField DataField="UrunName" HeaderText="ADI" SortExpression="UrunName" />
                                        <asp:BoundField DataField="UrunKategories" HeaderText="KATEGORİSİ" SortExpression="UrunKategories" />
                                        <asp:BoundField DataField="UrunAmount" HeaderText="MİKTAR" SortExpression="UrunAmount" />
                                        <asp:BoundField DataField="UrunCost" HeaderText="FİYAT" SortExpression="UrunCost" />
                                        <asp:ImageField DataImageUrlField="UrunId" HeaderText="RESİM" ControlStyle-Height="75" ControlStyle-Width="75" DataImageUrlFormatString="~/Resimler/pTozu/{0}.jpg">
                                            <ControlStyle Height="100px"></ControlStyle>
                                        </asp:ImageField>
                                    </Columns>
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GymYerelBaglanti %>" DeleteCommand="DELETE FROM [TblUrunler] WHERE [UrunID] = @UrunID" InsertCommand="INSERT INTO [TblUrunler] ([UrunName], [UrunKategories], [UrunAmount], [UrunCost], [ImageName]) VALUES (@UrunName, @UrunKategories, @UrunAmount, @UrunCost, @ImageName)" SelectCommand="SELECT * FROM [TblUrunler]" UpdateCommand="UPDATE [TblUrunler] SET [UrunName] = @UrunName, [UrunKategories] = @UrunKategories, [UrunAmount] = @UrunAmount, [UrunCost] = @UrunCost, [ImageName] = @ImageName WHERE [UrunID] = @UrunID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="UrunID" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="UrunName" Type="String" />
                                        <asp:Parameter Name="UrunKategories" Type="String" />
                                        <asp:Parameter Name="UrunAmount" Type="Int32" />
                                        <asp:Parameter Name="UrunCost" Type="Int32" />
                                        <asp:Parameter Name="ImageName" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="UrunName" Type="String" />
                                        <asp:Parameter Name="UrunKategories" Type="String" />
                                        <asp:Parameter Name="UrunAmount" Type="Int32" />
                                        <asp:Parameter Name="UrunCost" Type="Int32" />
                                        <asp:Parameter Name="ImageName" Type="String" />
                                        <asp:Parameter Name="UrunID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <br />
                            </div>
                            <div id="nav-tablolar" class="container tab-pane fade">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $('#nav-tab a[href="#nav-profile-tab"]').tab('show') // Select tab by name
            $('#nav-tab li:first-child a').tab('show') // Select first tab
            $('#nav-tab li:nth-child(3) a').tab('show') // Select third tab
        </script>
    </form>


</asp:Content>


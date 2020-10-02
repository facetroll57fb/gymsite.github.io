<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="Uye_LoginPage" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/jquery.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Kanit&display=swap&subset=latin-ext" rel="stylesheet" />
    <style>
        body {
            font-family: 'Kanit', sans-serif;
            background-color: #f5f6f7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="fixed-bottom text-right">
                    <a href="../Yonetici/YonetWebForm.aspx" class="btn btn-warning" style="font-weight: bold; font-family: Consolas; font-size: large;">Yöneticiye Git</a>
                </div>
                <div class="col-md-12 min-vh-100 d-flex flex-column justify-content-center">
                    <div class="row">
                        <div class="col-lg-6 col-md-8 mx-auto">
                            <!-- form card login -->
                            <div class="card rounded shadow shadow-sm">
                                <div class="card-header">
                                    <h3 class="mb-0">Giriş Sayfası</h3>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <div class="form-group">
                                            <label for="uname1">Kullanıcı Adı</label>
                                            <asp:TextBox ID="TextBox1" runat="server" required="" CssClass="form-control form-control-lg rounded-0" AutoCompleteType="Disabled"></asp:TextBox>
                                            <div class="invalid-feedback">Hata, Bilgilerini kontrol et!.</div>
                                        </div>
                                        <div class="form-group">
                                            <label>Şifre</label>
                                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control form-control-lg rounded-0" AutoCompleteType="Disabled"></asp:TextBox>
                                            <div class="invalid-feedback">Lütfen şifrenizi giriniz.</div>
                                        </div>
                                        <div>
                                            <label class="custom-control custom-checkbox">
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                                <span class="custom-control-indicator"></span>
                                                <span class="custom-control-description small text-dark">Bu bilgisayarda beni hatırla</span>
                                            </label>
                                        </div>
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                        <asp:Button ID="Button1" runat="server" Text="Giriş" CssClass="btn btn-success btn-lg float-right" OnClick="Button1_Click" />
                                    </div>
                                </div>
                                <!--/card-block-->
                            </div>
                            <!-- /form card login -->

                        </div>


                    </div>
                    <!--/row-->

                </div>
                <!--/col-->
            </div>
            <!--/row-->
        </div>
        <!--/container-->
    </form>
</body>
</html>

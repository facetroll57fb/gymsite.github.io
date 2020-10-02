<%@ Page Title="" Language="C#" MasterPageFile="~/Yonetici/YonetMaster.master" AutoEventWireup="true" CodeFile="YonetWebForm.aspx.cs" Inherits="Yonetici_YonetWebForm" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="fixed-bottom text-left">
                <a href="../Uye/Default.aspx" class="btn btn-warning" style="font-weight: bold; font-family: Consolas; font-size: large;">Anasayfaya Dön</a>
            </div>
            <div class="form">
                <ul class="tab-group">
                    <li class="tab active">
                        <a href="#signup">Giriş Yap</a>
                    </li>
                    <li class="tab">
                        <a href="#login">Kaydol</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="signup">
                        <h1>Tekrar Hoşgeldin!</h1>
                        <form>
                            <div class="field-wrap">
                                <label>
                                    Email Adresi<span class="req">*</span>
                                </label>
                                <asp:TextBox ID="email" runat="server" required CssClass="form-control" AutoCompleteType="Disabled" TextMode="Email"></asp:TextBox>
                            </div>
                            <div class="field-wrap text-left">
                                <label>
                                    Şifre<span class="req">*</span>
                                </label>
                                <input id="sifre" type="password" required class="form-control" autocomplete="off" name="sifre" />
                            </div>
                            <a class="showpass unselectable" id="showpass" style="color: #1ab188; margin-left: 10px; cursor: pointer;">Şifreyi Göster</a>
                            <p class="forgot"><a href="#" class="unselectable">Şifremi Unuttum</a></p>
                            <asp:Button ID="Button1" runat="server" Text="GİRİŞ" CssClass="button button-block" OnClick="Button1_Click" />
                            <asp:Label ID="lblDurum" runat="server" Visible="False"></asp:Label>


                        </form>
                    </div>

                    <div id="login">
                        <h1>Ücretsiz Kaydol</h1>
                        <form>
                            <div class="top-row">
                                <div class="field-wrap">
                                    <label>
                                        İsim<span class="req">*</span>
                                    </label>
                                    <asp:TextBox ID="TextBox3" runat="server" required CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="field-wrap">
                                    <label>
                                        Soyisim<span class="req">*</span>
                                    </label>
                                    <asp:TextBox ID="TextBox4" runat="server" required CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Email Adresi<span class="req">*</span>
                                </label>
                                <asp:TextBox ID="TextBox5" runat="server" required TextMode="Email" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Bir şifre gir<span class="req">*</span>
                                </label>
                                <asp:TextBox ID="TextBox6" runat="server" required TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="field-wrap">
                                <label>
                                    Şifreyi Tekrar Gir<span class="req">*</span>
                                </label>
                                <asp:TextBox ID="TextBox7" runat="server" required TextMode="Password" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:Button ID="Button2" runat="server" Text="Kaydol" CssClass="button button-block" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>



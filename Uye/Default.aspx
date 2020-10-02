<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Uye_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid bg-secondary ">
        <div class="row">
            <div class="col-md-12">
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Protein Tozu</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Kilo ve Hacim</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Amino Asit</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Karnitin ve CLA</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Güç ve Performans</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Vitaminler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Kreatin</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sağlıklı Atıştırmalıklar</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="6"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="7"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="d-block w-100" style="height: 350px;" src="../Resimler/slider/img1.jpg" alt="Slayt1" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="height: 350px;" src="../Resimler/slider/img2.jpg" alt="Slayt2" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="height: 350px;" src="../Resimler/slider/img3.jpg" alt="Slayt3" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="height: 350px;" src="../Resimler/slider/img4.jpg" alt="Slayt4" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="height: 350px;" src="../Resimler/slider/img5.jpg" alt="Slayt5" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="height: 350px;" src="../Resimler/slider/img6.jpg" alt="Slayt6" />
            </div>
            <div class="carousel-item">
                <img class="d-block w-100" style="height: 350px;" src="../Resimler/slider/img7.jpg" alt="Slay7" />
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">İleri</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Geri</span>
        </a>
    </div>
    <div class="container-fluid bg-secondary">
        <div class="row">
            <div class="col-md-12">
                <ul class="nav justify-content-center">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Çok Satanlar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Hazır Paketler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Yeni Ürünler</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Kampanyalar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Fırsatlarım</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Yeni Üürnler</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="container container-box">
            <div class="row justify-content-center">
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="col-md-3">
                            <figure class="card card-product-grid card-lg rounded-sm">
                                <a href="#" class="img-wrap" data-abc="true">
                                    <img src="../Resimler/pTozu/<%#Eval("UrunID")%>.jpg" />
                                </a>
                                <figcaption class="info-wrap">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a href="#" class="title urunName" data-abc="true"><%#Eval("UrunName") %></a>
                                        </div>
                                        <div class="col-md-12">
                                            <a href="#" class="title urunName" data-abc="true"><%#Eval("UrunAmount") %> GR</a>
                                            <small class="text-success float-right"><%#Eval("UrunKategories")%></small>
                                        </div>
                                    </div>
                                </figcaption>
                                <div class="bottom-wrap">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary float-right" CausesValidation="false" CommandName="SepeteEkle" CommandArgument='<%#Eval("UrunId")%>'>
                                        Sepete Ekle</asp:LinkButton>
                                    <div class="price-wrap">
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("UrunCost") + " TL"%>' CssClass="price h5 text-danger font-weight-bold"></asp:Label>
                                    </div>
                                </div>
                            </figure>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.carousel').carousel({
            interval: 3000
        })
    </script>
</asp:Content>


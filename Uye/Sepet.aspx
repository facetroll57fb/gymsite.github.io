<%@ Page Title="" Language="C#" MasterPageFile="~/Uye/MasterPage.master" AutoEventWireup="true" CodeFile="Sepet.aspx.cs" Inherits="Uye_Sepet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid p-5">
        <div class="container">
            <div class="row">
                <aside class="col-lg-9">
                    <div class="card">
                        <div class="table-responsive">
                            <table class="table table-borderless table-shopping-cart">
                                <thead class="text-muted">
                                    <tr class="small text-uppercase">
                                        <th scope="col">Sepetteki Ürünler</th>
                                        <th scope="col">Adet</th>
                                        <th scope="col">Fiyat</th>
                                        <th scope="col" class="text-right d-none d-md-block"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" EnableViewState="false" OnItemDataBound="Repeater1_ItemDataBound">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <figure class="itemside align-items-center">
                                                        <div class="aside">
                                                            <img src="../Resimler/pTozu/<%#Eval("UrunID")%>.jpg" class="img-sm" height="100" width="100" />
                                                            <asp:Label ID="Label4" runat="server" Text='<%#Eval("UrunID")%>'></asp:Label>
                                                        </div>
                                                        <figcaption class="info"><a href="#" class="title text-dark" data-abc="true"><%#Eval("UrunName")%></a>
                                                            <p class="text-muted small">
                                                                Miktar: <%#Eval("UrunAmount")%> gram
                                                    <br>
                                                                Kategori: <%#Eval("UrunKategories")%>
                                                            </p>
                                                        </figcaption>
                                                    </figure>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList1" runat="server" EnableViewState="false" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                        <asp:ListItem Text="1"></asp:ListItem>
                                                        <asp:ListItem Text="2"></asp:ListItem>
                                                        <asp:ListItem Text="3"></asp:ListItem>
                                                        <asp:ListItem Text="4"></asp:ListItem>
                                                        <asp:ListItem Text="5"></asp:ListItem>
                                                    </asp:DropDownList>

                                                </td>
                                                <td>
                                                    <div class="price-wrap">
                                                        <var class="price">
                                                            <asp:Label ID="Label7" runat="server" Text='<%#Eval("Brut")%>'></asp:Label>
                                                        </var>
                                                        <small class="text-muted">[indirim]</small>
                                                    </div>
                                                </td>
                                                <td class="text-right d-none d-md-block">
                                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-danger" CommandName="Sil" CommandArgument='<%#Eval("UrunID")%>'>Kaldır</asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </aside>
                <aside class="col-lg-3">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div>
                                <div class="form-group">
                                    <label>İndirim Kodu</label>
                                    <div class="input-group">
                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="SingleLine" CssClass="form-control coupon"></asp:TextBox>
                                        <span class="input-group-append">
                                            <asp:Button ID="Button1" runat="server" Text="Uygula" CssClass="btn btn-primary btn-apply coupon" OnClick="Button1_Click" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <dl class="dlist-align">
                                <dt>Brüt Tutar:</dt>
                                <dd class="text-right ml-3">
                                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                </dd>
                            </dl>
                            <dl class="dlist-align">
                                <dt>İndirim:</dt>
                                <dd class="text-right text-danger ml-3">
                                    <asp:Label ID="Label2" runat="server" Text="0"></asp:Label>
                                </dd>
                            </dl>
                            <dl class="dlist-align">
                                <dt>Net Tutar:</dt>
                                <dd class="text-right text-dark b ml-3">
                                    <strong>
                                        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                                    </strong>
                                </dd>
                            </dl>
                            <hr>
                            <a href="#myModal" id="myDownload" class="btn btn-out btn-primary btn-square btn-main" data-toggle="modal">Siparişi Onayla</a>
                            <a href="Default.aspx" class="btn btn-out btn-success btn-square btn-main mt-2" data-abc="true">Alışverişe Devam Et</a>
                            <div id="myModal" class="modal fade">
                                <div class="modal-dialog modal-confirm">
                                    <div class="modal-content">
                                        <div class="modal-header justify-content-center">
                                            <div class="icon-box">
                                                <span class="fa fa-check fa-3x mb-1"><i class="material-icons"></i></span>
                                            </div>
                                            <h4 class="modal-title">Harika!</h4>
                                        </div>
                                        <div class="modal-body">
                                            <p class="text-center">Siparişiniz onaylandı. Siparişlerinizi <strong>Bilgilerim</strong> sayfasından görüntüleyebilirsiniz.</p>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="Button2" runat="server" Text="Bilgilerim" CssClass="btn btn-success btn-block" OnClick="Button2_Click"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
            </div>
        </div>
    </div>
</asp:Content>


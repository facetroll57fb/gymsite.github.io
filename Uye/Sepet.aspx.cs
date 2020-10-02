using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uye_Sepet : System.Web.UI.Page
{
    int adet = 1;
    string CS = ConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["OturumTc"] != null)
        {
            SepetiDoldur();
            TextBox1.Attributes.Add("placeholder", "İndirim Kodu");
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }

    }

    public void SepetiDoldur()
    {
        DataSet ds = GetData();

        Repeater1.DataSource = ds;
        Repeater1.DataBind();

        Label icerik = (Label)this.Page.Master.FindControl("Label1");
        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand("Select UyeNameUsername from TblUyeler where UyeID = '" + Session["OturumTc"] + "'", con);
        con.Open();
        string deger = cmd.ExecuteScalar().ToString();
        icerik.Text = deger;
        con.Dispose();
        con.Close();
    }

    private DataSet GetData()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            object bfiyatToplam = new object();
            object adet = new object();
            Label toplamUrun = (Label)this.Page.Master.FindControl("Label2");
            SqlDataAdapter da = new SqlDataAdapter("Select TblUrunler.UrunName, TblUrunler.UrunKategories, TblUrunler.UrunAmount, TblSepet.UyeID, TblSepet.UrunID, TblSepet.Miktar, TblSepet.BirimFiyati,(TblSepet.Miktar * TblSepet.BirimFiyati) as Brut, TblSepet.Tutar from TblUrunler Inner Join TblSepet on TblUrunler.UrunID = TblSepet.UrunID AND TblSepet.UyeID = '" + Session["OturumTc"] + "' WHERE TblSepet.Durum = 1", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable table = ds.Tables[0];
            if (table.Rows.Count > 0)
            {
                bfiyatToplam = table.Compute("Sum(Brut)", string.Empty);
                Label1.Text = Convert.ToInt32(bfiyatToplam) + " TL";
                int indirim = Convert.ToInt32(Label2.Text);
                Label3.Text = (Convert.ToInt32(bfiyatToplam) - indirim) + " TL";
                toplamUrun.Text = ds.Tables[0].Rows.Count.ToString();

            }
            else
            {
                bfiyatToplam = 0;
                Label1.Text = "";
                Label2.Text = "";
                Label3.Text = "";
                toplamUrun.Text = "0";
            }
            return ds;
        }
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Sil")
        {
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("delete from TblSepet where UrunID='" + e.CommandArgument + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Dispose();
            con.Close();
            SepetiDoldur();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList ddl = sender as DropDownList;
        string id = ddl.ClientID;
        int baslangic = id.Length - 1;
        int bitis = id.Length - baslangic;
        int sid = Convert.ToInt32(id.Substring(baslangic, bitis));

        string la = ((Label)Repeater1.Items[sid].FindControl("Label4")).Text;

        adet = ddl.SelectedIndex;
        ddl.SelectedIndex = adet;
        if (ddl != null)
        {
            int secilen = Convert.ToInt32(ddl.SelectedValue);
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("Update TblSepet Set Miktar = '" + secilen + "' where UrunId = '" + la + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Dispose();
            con.Close();
        }
        SepetiDoldur();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string discount = TextBox1.Text.Trim();
        switch (discount)
        {
            case "INDIRIM20":
                Label2.Text = "20";
                SepetiDoldur();
                break;
            case "INDIRIM50":
                Label2.Text = "50";
                SepetiDoldur();
                break;
            case "INDIRIM100":
                Label2.Text = "100";
                SepetiDoldur();
                break;

            default:
                Label2.Text = "0";
                SepetiDoldur();
                break;
        }
    }
    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        DropDownList dropdown1 = (DropDownList)e.Item.FindControl("DropDownList1");

        SqlConnection con = new SqlConnection(CS);
        SqlCommand cmd = new SqlCommand("Select Miktar from TblSepet WHERE TblSepet.Durum = 1", con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();

        int sayac = 0;
        string cid = "ContentPlaceHolder1_Repeater1_DropDownList1_";
        while (dr.Read())
        {
            if (dropdown1.ClientID == cid + sayac)
            {
                dropdown1.SelectedIndex = Convert.ToInt32(dr["Miktar"].ToString()) - 1;
            }
            sayac++;
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(CS);
        con.Open();

        SqlCommand cmd = new SqlCommand("delete from TblSiparisler", con);
        cmd.ExecuteNonQuery();

        SqlCommand cmd3 = new SqlCommand("UPDATE TblSepet SET DURUM = 0 Where UyeID = '" + Session["OturumTc"] + "'", con);
        cmd3.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand("insert into TblSiparisler(SepetID) select SepetId from TblSepet where Durum = 0", con);
        cmd2.ExecuteNonQuery();

        con.Dispose();
        con.Close();

        Response.Redirect("Bilgilerim.aspx");
    }
}


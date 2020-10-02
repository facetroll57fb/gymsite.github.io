using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uye_Bilgilerim : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
        if (Session["OturumTc"] != null)
        {
            Label icerik = (Label)this.Page.Master.FindControl("Label1");
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("Select UyeNameUsername from TblUyeler where UyeID = '" + Session["OturumTc"] + "'", con);
            con.Open();
            string deger = cmd.ExecuteScalar().ToString();
            icerik.Text = deger;
            con.Dispose();
            con.Close();
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }

        Label toplamUrun = (Label)this.Page.Master.FindControl("Label2");
        SqlDataAdapter da = new SqlDataAdapter("Select TblUrunler.UrunName, TblUrunler.UrunKategories, TblUrunler.UrunAmount, TblSepet.UyeID, TblSepet.UrunID, TblSepet.Miktar, TblSepet.BirimFiyati, TblSepet.Tutar from TblUrunler Inner Join TblSepet on TblUrunler.UrunID = TblSepet.UrunID AND TblSepet.UyeID = '" + Session["OturumTc"] + "' Where Durum = 1", CS);
        DataSet ds = new DataSet();
        da.Fill(ds);
        toplamUrun.Text = ds.Tables[0].Rows.Count.ToString();

    }
    public void BindData()
    {
        SqlConnection baglanti = new SqlConnection(CS);

        baglanti.Open();
        SqlDataAdapter da2 = new SqlDataAdapter("SELECT TblUrunler.UrunName, TblSepet.Miktar, TblSepet.BirimFiyati, TblSepet.Miktar * TblSepet.BirimFiyati AS Toplam FROM TblSepet INNER JOIN TblSiparisler ON TblSepet.SepetId = TblSiparisler.SepetID INNER JOIN TblUrunler ON TblSepet.UrunID = TblUrunler.UrunID WHERE TblSepet.UyeId = '" + Session["OturumTc"] + "'", baglanti);
        DataTable ds2 = new DataTable();
        da2.Fill(ds2);


        DataTable ds = new DataTable();
        ds = null;
        GridView1.DataSource = ds;
        GridView1.DataBind();


        GridView1.DataSource = ds2;
        GridView1.DataBind();

        baglanti.Close();
    }
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    protected void UpdateCancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
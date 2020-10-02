using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;

public partial class Yonetici_YonetIndexForm : System.Web.UI.Page
{
    SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        object fiyatToplam = new object();
        SqlDataAdapter da = new SqlDataAdapter("SELECT TblSepet.Miktar * TblSepet.Tutar AS Toplam FROM TblSepet INNER JOIN TblSiparisler ON TblSepet.SepetId = TblSiparisler.SepetID INNER JOIN TblUrunler ON TblSepet.UrunID = TblUrunler.UrunID", baglanti);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataTable table = ds.Tables[0];
        if (table.Rows.Count > 0)
        {
            fiyatToplam = table.Compute("Sum(Toplam)", string.Empty);
        }
        Label1.Text = "Satıştan Elde Edilen Miktar: " + fiyatToplam.ToString() + " TL.";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "" && DropDownList1.SelectedItem.ToString() != "" && FileUpload1.HasFile)
        {
            SqlCommand cmd = new SqlCommand("Insert into TblUrunler(UrunName,UrunKategories,UrunAmount,UrunCost) Values('" + TextBox1.Text.Trim() + "','" + DropDownList1.SelectedItem.ToString().Trim() + "','" + TextBox2.Text.Trim() + "','" + TextBox3.Text.Trim() + "')", baglanti);
            baglanti.Open();
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            baglanti.Close();

            SqlCommand komut = new SqlCommand("select max(UrunID) from TblUrunler", baglanti);
            baglanti.Open();
            int UrunId = Convert.ToInt32(komut.ExecuteScalar().ToString());
            komut.Dispose();
            baglanti.Close();
            FileUpload1.SaveAs(Server.MapPath("~/Resimler/pTozu/") + UrunId + ".jpg");

            GridView3.DataBind();

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            DropDownList1.SelectedIndex = 0;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        DropDownList1.SelectedIndex = 0;
    }
}
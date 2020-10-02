using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uye_Default : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = GetData();

        Repeater1.DataSource = ds;
        Repeater1.DataBind();

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

    }
    private DataSet GetData()
    {
        SqlConnection con = new SqlConnection(CS);

        Label tUrun = (Label)this.Page.Master.FindControl("Label2");

        SqlDataAdapter da2 = new SqlDataAdapter("select * from TblSepet where UyeID='" + Session["OturumTc"] + "' and Durum = 1", con);
        DataSet ds2 = new DataSet();
        da2.Fill(ds2);
        tUrun.Text = ds2.Tables[0].Rows.Count.ToString();

        using (con)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from TblUrunler", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Label lb = e.Item.FindControl("Label2") as Label;

        decimal product = Convert.ToDecimal(lb.Text.Substring(0, (lb.Text.Length - 3)));

        if (e.CommandName == "SepeteEkle")
        {
            int UyeID = Convert.ToInt32(Session["OturumTc"]);
            int UrunID = Convert.ToInt32(e.CommandArgument);
            SqlConnection con = new SqlConnection(CS);
            SqlCommand cmd = new SqlCommand("insert into TblSepet(UyeID,UrunID,BirimFiyati,Tutar) values('" + UyeID + "','" + UrunID + "','" + product + "','" + product + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Dispose();
            con.Close();
        }
        GetData();
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UyeKaydol : System.Web.UI.Page
{
    string SonKayitID;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString);
        SqlCommand cmd = new SqlCommand("SELECT MAX(UyeID) FROM TblUyeler", con);
        con.Open();
        SonKayitID = cmd.ExecuteScalar().ToString();
        con.Dispose();
        con.Close();
        Session["OturumTc"] = SonKayitID;
        Response.Redirect("~/Uye/Default.aspx");
    }
}
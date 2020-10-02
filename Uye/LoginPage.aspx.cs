using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uye_LoginPage : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("Select * from TblUyeler where UyeUsername='" + TextBox1.Text.Trim() + "' and UyePassword='" + TextBox2.Text.Trim() + "'", con);
        con.Open();
        SqlDataReader satir = cmd.ExecuteReader();

        if (satir.Read())
        {
            Session["KullaniciTipi"] = "Uye";
            Session["OturumTc"] = satir["UyeId"].ToString();
            Response.Redirect("~/Uye/Default.aspx");
        }
        else
        {
            Label2.Font.Size = 15;
            Label2.Text = " !!! Giriş bilgileriniz yanlış veye üye değilsiniz.";
            Label2.ForeColor = System.Drawing.Color.Red;
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}
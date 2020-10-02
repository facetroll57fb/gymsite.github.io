using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Yonetici_YonetWebForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString);
    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
   {
       string value = Request.Form["sifre"];
       cmd = new SqlCommand("Select * from Administrator where AdminNick='" + email.Text + "' and AdminPassword='" + value + "'", con);
       con.Open();
       SqlDataReader satir = cmd.ExecuteReader();
       if (satir.Read())
       {
           Session["KullaniciTipi"] = "Admin";
           Session["OturumTc"] = satir["Id"].ToString();
           Response.Redirect("~/Yonetici/YonetIndexForm.aspx");
       }
       else
       {
           lblDurum.Visible = true;
           lblDurum.Font.Size = 15;
           lblDurum.Text = "";
           lblDurum.ForeColor = System.Drawing.Color.Red;
       }

    }
}
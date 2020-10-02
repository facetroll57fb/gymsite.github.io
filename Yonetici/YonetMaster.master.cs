using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class YonetMaster : System.Web.UI.MasterPage
{
    //SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString);
    //SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //cmd = new SqlCommand("Select * from Administrator where AdminNick='" + email.Text + "' and AdminPassword='" + sifre.Text + "'", con);
        //con.Open();
        //SqlDataReader dr = cmd.ExecuteReader();
        //if (dr.Read())
        //{
        //    lblDurum.Text = "Bağlantı çalıştı. Durum okey.";
        //}
        //else
        //{
        //    lblDurum.Text = "Bağlantı çalışmadı. Durum failed.";
        //}

        //email.Text = "";
        //sifre.Text = "";

    }
}

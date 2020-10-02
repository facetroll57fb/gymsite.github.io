using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.IO;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Uye_Default : System.Web.UI.Page
{
    string CS = ConfigurationManager.ConnectionStrings["GymYerelBaglanti"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataSet ds = GetData();

        Repeater1.DataSource = ds;
        Repeater1.DataBind();

    }

    private DataSet GetData()
    {
        using (SqlConnection con = new SqlConnection(CS))
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * from TblUrunler", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
    }
}
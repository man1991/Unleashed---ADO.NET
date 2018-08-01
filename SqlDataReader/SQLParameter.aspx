<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SQLParameter.aspx.cs" Inherits="SqlDataReader.SQLParameter" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, System.EventArgs e)
    {
        SqlConnection MyConnection;
        SqlCommand MyCommand;
        SqlDataReader MyReader;
        SqlParameter ProductNameParam;

        MyConnection = new SqlConnection();
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SqlDataReader"].ConnectionString;

        MyCommand = new SqlCommand();
        MyCommand.CommandText = "SELECT * FROM PRODUCT WHERE PRODUCTNAME = @ProductName";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        ProductNameParam = new SqlParameter();
        ProductNameParam.ParameterName = "@ProductName";
        ProductNameParam.SqlDbType = SqlDbType.VarChar;
        ProductNameParam.Size = 25;
        ProductNameParam.Direction = ParameterDirection.Input;
        ProductNameParam.Value = "CHAI";

        MyCommand.Parameters.Add(ProductNameParam);

        MyCommand.Connection.Open();
        MyReader = MyCommand.ExecuteReader(CommandBehavior.CloseConnection);


        GridView1.DataSource = MyReader;
        GridView1.DataBind();

        MyCommand.Dispose();
        MyConnection.Dispose();
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SQLParameter Example: How To Use SQLParameter in Asp.Net</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
    </form>
</body>
</html>

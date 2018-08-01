<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataReader.aspx.cs" Inherits="SqlDataReader.DataReader" %>
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

        MyConnection = new SqlConnection();
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SqlDataReader"].ConnectionString;

        MyCommand = new SqlCommand();
        MyCommand.CommandText = "SELECT TOP 10* FROM PRODUCT";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

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
    <title>DataReader Example: How To Use DataReader in Asp.Net</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
    </form>
</body>
</html>

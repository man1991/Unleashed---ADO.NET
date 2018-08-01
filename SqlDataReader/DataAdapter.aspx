<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataAdapter.aspx.cs" Inherits="SqlDataReader.DataAdapter" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Configuration" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, System.EventArgs e)
    {
        SqlConnection MyConnection;
        SqlCommand MyCommand;
        SqlDataAdapter MyAdapter;
        DataTable MyTable;

        MyConnection = new SqlConnection();
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings["SqlDataReader"].ConnectionString;

        MyCommand = new SqlCommand();
        MyCommand.CommandText = "SELECT TOP 10* FROM PRODUCT";
        MyCommand.CommandType = CommandType.Text;
        MyCommand.Connection = MyConnection;

        MyTable = new DataTable();
        MyAdapter = new SqlDataAdapter();
        MyAdapter.SelectCommand = MyCommand;
        MyAdapter.Fill(MyTable);

        GridView1.DataSource = MyTable.DefaultView;
        GridView1.DataBind();

        MyAdapter.Dispose();
        MyCommand.Dispose();
        MyConnection.Dispose();
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DataAdapter Example: How To Use DataAdapter in Asp.Net</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server"></asp:GridView>
    </div>
    </form>
</body>
</html>

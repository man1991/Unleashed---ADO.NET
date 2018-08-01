<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataTable.aspx.cs" Inherits="SqlDataReader.DataTable" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">
    protected void Page_Load(object sender, System.EventArgs e)
    {
        DataTable dt = new DataTable();

        DataColumn dc = new DataColumn();
        dc.ColumnName = "ProductId";
        dc.DataType = typeof(int);
        dt.Columns.Add(dc);

        DataColumn dc2 = new DataColumn();
        dc2.ColumnName = "ProductName";
        dc2.DataType = typeof(string);
        dt.Columns.Add(dc2);

        dt.Rows.Add(new object[ ] { "2","ASP.NET Example" });
        dt.Rows.Add(new object[ ] { "2","ASP.NET Example e-book" });

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DataTable - How to create DataTable programmatically in ADO.NET</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2 style="color:darkblue; font-style:italic;">
        ADO.NET DataTable - How to create
        <br /> DataTable and populate with data in ADO.NET
    </h2>
        <hr width="400" align="left" color="DarkBlue" />
        <asp:GridView ID="GridView1" runat="server" BorderColor="DodgerBlue" HeaderStyle-BackColor="AliceBlue"></asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create DataTable and Populate GridView" Height="45" Font-Bold="true" ForeColor="DodgerBlue" />
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMultipleColumnToDataTable.aspx.cs" Inherits="SqlDataReader.AddMultipleColumnToDataTable" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">
    protected void Button1_Click(object sender, System.EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.TableName = "Books";

        DataColumn dc = new DataColumn();
        dc.ColumnName = "BookID";
        dc.DataType = typeof(int);
        //this line will add single DataColumn to DataTable
        dt.Columns.Add(dc);

        DataColumn dc2 = new DataColumn();
        dc2.ColumnName = "BookName";
        dc2.DataType = typeof(string);

        DataColumn dc3 = new DataColumn();
        dc3.ColumnName = "BookPrice";
        dc3.DataType = typeof(decimal);

        //this line add two DataColumn to DataTable at a time
        dt.Columns.AddRange(new DataColumn[] { dc2,dc3 });

        dt.Rows.Add(new object[ ] { 1, "ASP.NET Example", 4 });
        dt.Rows.Add(new object[ ] { 2, "ASP.NET Example e-book", 5.05 });
        dt.Rows.Add(new object[ ] { 3, "Ajax Example e-book", 40.3 });

        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Using AddRange() method - How to add multiple DataColumn to a DataTable programmatically in ADO.NET</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2 style="color:darkblue; font-style:italic;">
        Using AddRange() method - How to add multiple
        <br /> DataColumn to a DataTable programmatically in ADO.NET
    </h2>
        <hr width="425" align="left" color="CornFlowerBlue" />
        <asp:GridView ID="GridView1" runat="server" BorderColor="LawnGreen" HeaderStyle-BackColor="SeaGreen" ForeColor="Snow" Width="400">
            <RowStyle BackColor="Snow" ForeColor="DarkSeaGreen" />
        </asp:GridView>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Populate GridView" Height="45" Font-Bold="true" ForeColor="DarkGreen" />
    </div>
    </form>
</body>
</html>

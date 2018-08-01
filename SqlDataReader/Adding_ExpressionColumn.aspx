<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adding_ExpressionColumn.aspx.cs" Inherits="SqlDataReader.Adding_ExpressionColumn" %>
<%@ Import Namespace="System.Data" %>

<!DOCTYPE html>

<script runat="server">
    protected void Button1_Click(object sender, System.EventArgs e)
    {
        DataTable dt = new DataTable();
        dt.TableName = "Products";

        DataColumn dc5 = new DataColumn();
        dc5.ColumnName = "ProductID";
        dc5.DataType = typeof(int);
        dc5.AllowDBNull = false;//won't allow null values to specified column
        dc5.Unique = true;// to set column value as unique, no repeat values are allowed
        dt.Columns.Add(dc5);

        DataColumn dc = new DataColumn();
        dc.ColumnName = "ProductName";
        dc.DataType = typeof(string);
        //this line makes DataColumn value maximum length 40 characters 
        dc.MaxLength = 40;
        dt.Columns.Add(dc);

        DataColumn dc2 = new DataColumn();
        dc2.ColumnName = "ProductPrice";
        dc2.DataType = typeof(int);
        dt.Columns.Add(dc2);

        DataColumn dc3 = new DataColumn();
        dc3.ColumnName = "ProductVat";
        dc3.DataType = typeof(int);
        dt.Columns.Add(dc3);

        DataColumn dc4 = new DataColumn();
        dc4.ColumnName = "ProductProvider";
        dc4.DataType = typeof(string);
        //this line make DataColumn default value 'Product Provider Not Found.'
        dc4.DefaultValue = "Product Provider Not Found.";
        dc4.AllowDBNull = false;
        dt.Columns.Add(dc4);

        dt.Columns.Add(new DataColumn("TotalPrice", typeof(int), "ProductPrice + ProductVat"));
        //TotalPrice is Expression Column as it is formed by ProductPrice,ProductVat columns.

        dt.Rows.Add(new object[ ] { 1, "ASP.NET Example", 30, 1, "Amazon" });
        dt.Rows.Add(new object[ ] { 2, "Ajax Example hardcover", 140, 130, null });
        dt.Rows.Add(new object[ ] { 3, "ASP.NET Example e-book", 35, 2, "Flipkart" });
        dt.Rows.Add(new object[ ] { 4, "Ajax Example e-book", 40, 3, null });
        //dt.Rows.Add(new object[ ] { 1, "Ajax Example e-book", 40, 3, null });//Error: As ProductId is Unique
        //dt.Rows.Add(new object[ ] { null, "Ajax Example e-book", 40, 3, null });//Error: As ProductId does not allow null values

        //dt.Rows.Add(new object[] {5, "Hadoop: The Definitive Guide, Second Edition", 30, 5, "Ajio" });//throws error because of ProductName length
        GridView1.DataSource = dt;
        GridView1.DataBind();

        //this line check the 'ProductName' DataColumn exists in DataTable or not
        Boolean columnExists = dt.Columns.Contains("ProductName");
        Label1.Text = "'ProductName' DataColumn exists in DataTable? = " + columnExists;

        //this line count the total DataColumns in DataTable
        int totalColumns = dt.Columns.Count;
        Label2.Text = "Number of DataColumns which exists in DataTable? = " + totalColumns;

        //this line displays DataColumns name of DataTable
        Label3.Text = "<b> Columns in DataTable:</b><br />";
        foreach (DataColumn dc1 in dt.Columns)
            Label3.Text += dc1.ColumnName + "<br />";
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>DataColumn - How to add a calculated column (expression column) to a DataTable in ADO.NET</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h2 style="color:darkblue; font-style:italic;">
        ADO.NET DataColumn - How to add a calculated column
        <br /> (expression column) to a DataTable in ADO.NET
    </h2>
        <hr width="420" align="left" color="CornFlowerBlue" />
        <asp:GridView ID="GridView1" runat="server" BorderColor="CornFlowerBlue" HeaderStyle-BackColor="darkBlue" ForeColor="Snow" Width="500">
            <RowStyle BackColor="AliceBlue" ForeColor="DodgerBlue" />
        </asp:GridView>
        <br /><br />
        <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="DarkSeaGreen"></asp:Label>
        <br /><br />
        <asp:Label ID="Label2" runat="server" Font-Size="Large" ForeColor="DarkBlue"></asp:Label>
        <br /><br />
        <asp:Label ID="Label3" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
        <br /><br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Populate GridView with expression column" Height="45" Font-Bold="true" ForeColor="DarkBlue" />
    </div>
    </form>
</body>
</html>

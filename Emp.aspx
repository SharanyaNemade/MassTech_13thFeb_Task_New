<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emp.aspx.cs" Inherits="Task13Feb.Emp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADD EMPLOYEE</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
    rel="stylesheet"/>

</head>
<body>
    <form id="form1" runat="server">




        <!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  ADD EMPLOYEE
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        

              <!-- Basic Structure -->

                  <div>
            Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            Contact&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Address&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />
            Department&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>IT</asp:ListItem>
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>Support</asp:ListItem>
                <asp:ListItem>Trainee</asp:ListItem>
                <asp:ListItem>Management</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Designation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Team Lead</asp:ListItem>
                <asp:ListItem>Project Lead</asp:ListItem>
                <asp:ListItem>Intern</asp:ListItem>
                <asp:ListItem>Product Delivery</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Role&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>Manager</asp:ListItem>
                <asp:ListItem>Employee</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Manager&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="DropDownList5" runat="server">
                <asp:ListItem>Sanjay</asp:ListItem>
                <asp:ListItem>Ram Singh</asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList4" runat="server">
                <asp:ListItem>Active</asp:ListItem>
                <asp:ListItem>Inactive</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Profile Photo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:FileUpload ID="FileUpload1" runat="server" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Save" />
        </div>

      </div>


      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


<br />
<br />


<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="265px" Width="462px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
    <AlternatingRowStyle BackColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>


        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TaskConnectionString %>" ProviderName="<%$ ConnectionStrings:TaskConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [AddEmployees]"></asp:SqlDataSource>


        
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>

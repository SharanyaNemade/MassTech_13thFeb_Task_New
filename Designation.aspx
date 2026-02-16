<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" Inherits="Task13Feb.Designation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Button to open modal -->
        <button type="button" class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#designationModal">
            Add Designation
        </button>

        <!-- Bootstrap 5 Modal -->
        <div class="modal fade" id="designationModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- Header -->
                    <div class="modal-header">
                        <h5 class="modal-title">Add Designation</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>

                    <!-- Body -->
                    <div class="modal-body">

                        <div>
                  Department Name:
                            <asp:DropDownList ID="DropDownList1" runat="server"
                                DataSourceID="SqlDataSource1"
                                DataTextField="DeptName"
                                DataValueField="DeptName">
                            </asp:DropDownList>

                            

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                ConnectionString="<%$ ConnectionStrings:dbconn %>"
                                SelectCommand="SELECT [DeptName] FROM [Department]">
                            </asp:SqlDataSource>

                            <br />
                            <br />

                            Designation Name:
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                            <br />
                            <br />

                            Status:
                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                            </asp:DropDownList>

                           


                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:dbconn %>"
                                SelectCommand="SELECT [Status] FROM [Department]">
                            </asp:SqlDataSource>


                            <br />
                            <br />

                            <asp:Button ID="Button1" runat="server"
                                Text="SUBMIT"
                                OnClick="Button1_Click" />
                        </div>

                    </div>

                    <!-- Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">
                            Close
                        </button>
                    </div>

                </div>
            </div>
        </div>

        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Height="265px" Width="462px">
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

    </form>
</body>
</html>






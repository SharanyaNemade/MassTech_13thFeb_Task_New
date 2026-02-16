<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Holiday.aspx.cs" Inherits="Task13Feb.Holiday" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Holiday Management</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />
    <style>
        body {
            background: #f4f7f6;
            padding: 20px;
        }

        .card {
            border: none;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .modal-header {
            background: #007bff;
            color: white;
        }

        .table thead {
            background: #343a40;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container card p-4">
            <h3 class="mb-4">Holiday Management</h3>

            <button type="button" class="btn btn-primary mb-4" data-toggle="modal" data-target="#exampleModal">
                + Add Holiday
           
            </button>

            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5>Add Holiday</h5>
                        </div>
                        <div class="modal-body">
                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                            

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                            <label>Event</label>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control mb-2"></asp:DropDownList>
                            <label>
                            <br />
                            <br />


                            Name</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control mb-2"></asp:TextBox>
                            
                            
                            <br />
                            <br />


                            <label>Date</label>
                            <asp:Calendar ID="Calendar1" runat="server" CssClass="mb-2"></asp:Calendar>
                            
                            
                            <br />
                            <br />

                            <label>Status</label>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Inactive</asp:ListItem>
                            </asp:DropDownList>
                          </ContentTemplate>
                        </asp:UpdatePanel>

                            <br />
                            <br />

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-success" OnClick="Button1_Click" />
                        </div>


                    </div>
                </div>
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-hover table-bordered">
                <Columns>
                    <asp:BoundField DataField="HolidayId" HeaderText="ID" />
                    <asp:BoundField DataField="EventName" HeaderText="Event" />
                    <asp:BoundField DataField="HolidayName" HeaderText="Holiday" />
                    <asp:BoundField DataField="HolidayDate" HeaderText="Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
        
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>


</body>
</html>

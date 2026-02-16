<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="Task13Feb.Events" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
        rel="stylesheet">
</head>
<body>

<form id="form1" runat="server">

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-primary"
        data-bs-toggle="modal"
        data-bs-target="#exampleModal">
        Add Event
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Add Event</h5>
                    <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                    </button>
                </div>

                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">Event Name</label>
                        <asp:TextBox ID="TextBox1"
                            runat="server"
                            CssClass="form-control">
                        </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Status</label>
                        <asp:DropDownList ID="DropDownList1"
                            runat="server"
                            CssClass="form-select">
                            <asp:ListItem>Active</asp:ListItem>
                            <asp:ListItem>Inactive</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Color</label>
                        <asp:TextBox ID="TextBox2"
                            runat="server"
                            TextMode="Color"
                            CssClass="form-control">
                        </asp:TextBox>
                    </div>

                    <asp:Button ID="Button1"
                        runat="server"
                        Text="Save Event"
                        CssClass="btn btn-success"
                        OnClick="Button1_Click" />

                </div>

                
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>


            </div>
        </div>
    </div>

    <br /><br />

    <!-- Grid View -->
    <asp:GridView ID="GridView1"
        runat="server"
        AutoGenerateColumns="false"
        CssClass="table table-bordered table-striped">

        <Columns>
            <asp:BoundField DataField="EventId" HeaderText="ID" />
            <asp:BoundField DataField="EventName" HeaderText="Event Name" />
            <asp:BoundField DataField="Status" HeaderText="Status" />

            <asp:TemplateField HeaderText="Color">
                <ItemTemplate>
                    <span style='display:inline-block;
                                 width:30px;
                                 height:20px;
                                 background-color:<%# Eval("Color") %>;
                                 border:1px solid #000;'>
                    </span>
                    <%# Eval("Color") %>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="CreatedDate"
                HeaderText="Created On"
                DataFormatString="{0:dd-MM-yyyy}" />
        </Columns>

    </asp:GridView>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
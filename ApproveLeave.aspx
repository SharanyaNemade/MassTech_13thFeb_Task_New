<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApproveLeave.aspx.cs" Inherits="Task13Feb.ApproveLeave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approve Leave</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" />

</head>
<body>
    <form id="form1" runat="server">

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#approveModal">
        Approve Leave
    </button>

    <div class="modal fade" id="approveModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title">Approve Leave (Manager)</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">

                    <asp:DropDownList ID="ddlNames" runat="server"
                    CssClass="form-control"
                    AutoPostBack="true"
                    OnSelectedIndexChanged="ddlNames_SelectedIndexChanged">
                    </asp:DropDownList>

                    Leave Type :
                    <asp:TextBox ID="txtLeaveType" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    From :
                    <asp:TextBox ID="txtFrom" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    To :
                    <asp:TextBox ID="txtTo" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    Reason :
                    <asp:TextBox ID="txtReason" runat="server" CssClass="form-control"></asp:TextBox>
                    <br />

                    Action :
                    <asp:TextBox ID="txtAction" runat="server" CssClass="form-control"></asp:TextBox>

                </div>

                <div class="modal-footer">
                    <asp:Button ID="btnApprove" runat="server"
                        Text="Approve"
                        CssClass="btn btn-success"
                        OnClick="btnApprove_Click" />

                    <asp:Button ID="btnReject" runat="server"
                        Text="Reject"
                        CssClass="btn btn-danger"
                        OnClick="btnReject_Click" />

                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

</form>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>


</body>
</html>

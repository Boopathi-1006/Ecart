<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Placeorder.aspx.cs" Inherits="ECart_shopping.Placeorder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image:url(Images/gabrielle-ribeiro-EDztlsQAEIY-unsplash.jpg)">
    <form id="form1" runat="server">
        <div>
            <table><tr><td>
                <h1>Place Your Order</h1>
                       </td>
                <td></td><td><asp:button id="Btnhome" runat="server" text="Home" OnClick="btnHome_Click1" CausesValidation="false"/></td>
                   </tr>
                <tr><td></td></tr>
                    <tr><td>User Name : </td><td>
                 <asp:textbox id="txtuser" runat="server" />
              <asp:RequiredFieldValidator ID="requser" ErrorMessage="Please enter User Name" ControlToValidate="txtuser"
                  runat="server" />
                                   </td></tr>
				<tr><td>Address : </td><td><asp:textbox id="txtAdd" runat="server" Width="800px" MaxLength="100"/>
                     <asp:RequiredFieldValidator ID="reqadd" ErrorMessage="Please enter Addesss" ControlToValidate="txtAdd"
                  runat="server" />
				                     </td></tr>

      <tr><td></td></tr>
				<tr><td><asp:button id="btnPlaceorder" runat="server" text="Place Order" OnClick="btnPlaceorder_Click1"/></td>

                </tr>
            </table>
        </div>
    </form>
</body>
</html>

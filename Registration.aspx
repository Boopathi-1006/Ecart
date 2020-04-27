<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ECart_shopping.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image:url(Images/buy-3692440_1920.jpg)">
    <form id="form1" runat="server">
        <%-- <div style="background-image:url(Images/gettyimages-183035432-170667a.jpg)">--%>

       <table>
      <tr>
          <td>       
			<span>E Buy Shopping Registration form</span>

		<br/>
              </td>
<td></td>
          <td></td>
          </tr>
      <tr>
          <td></td>
          <td></td>
          <td></td>
      </tr>

      
          <tr><td>User Name : </td><td>
                 <asp:textbox id="txtusername" runat="server" />
              <asp:RequiredFieldValidator ID="requser" ErrorMessage="Please enter User Name" ControlToValidate="txtusername"
                  runat="server" />
                                   </td></tr>
				<tr><td>Password : </td><td><asp:textbox id="txtpwd" runat="server" />
                    <asp:RequiredFieldValidator ID="reqpwd" ErrorMessage="Please enter password" ControlToValidate="txtpwd"
                  runat="server" />
				                        </td></tr>
				<tr><td>Re-Enter Password : </td><td><asp:textbox id="txtrepwd" runat="server" />
                    <asp:RequiredFieldValidator ID="reqrepwd" ErrorMessage="Please enter re-enter password" ControlToValidate="txtrepwd"
                  runat="server" />
                    <asp:CompareValidator ID="cmppwd" ErrorMessage="Password Mismatch" ControlToValidate="txtrepwd" 
                        ControlToCompare="txtpwd" runat="server" />
				                                 </td></tr>
				<tr><td>City : </td><td><asp:textbox id="txtcity" runat="server" />
                    <asp:RequiredFieldValidator ID="reqcity" ErrorMessage="Please enter city" ControlToValidate="txtcity"
                  runat="server" />
				                         </td></tr>
				<tr><td>Mobile Number</td><td><asp:textbox id="txtmobileno" runat="server" MaxLength="10" />
                    <asp:RequiredFieldValidator ID="reqmobno" ErrorMessage="Please enter mobile no" ControlToValidate="txtmobileno"
                  runat="server" />
                    <asp:RegularExpressionValidator ID="regmob" ErrorMessage="Please enter a valid mobile no" ControlToValidate="txtmobileno"
                  ValidationExpression="\d+" runat="server" />
				                          </td></tr>
				<tr><td><asp:button id="btnsignup" runat="server" text="Register" OnClick="btnsignup_Click"/></td>
                    <td><asp:button id="btnlogin" runat="server" text="Login" OnClick="btnlogin_Click1" CausesValidation="false"/></td>
				</tr>
</table>
            <%--</div>--%>
    </form>
</body>
</html>

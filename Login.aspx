<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECart_shopping.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
  <title>E Buy Login Form</title>


  
</head>

<body style="background-image:url(Images/buy-3692440_1920.jpg)">
    <center>
       
    <form id="form1" runat="server" >
       <%-- <div style="background-image:url(Images/gettyimages-183035432-170667a.jpg)">--%>
  <table >
      <tr>
          <td>       
			<div><h1>E Buy Shopping</h1></div>

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
                 <asp:textbox id="txtuser" runat="server" />
              <asp:RequiredFieldValidator ID="requser" ErrorMessage="Please enter User Name" ControlToValidate="txtuser"
                  runat="server" />
                                   </td></tr>
				<tr><td>Password : </td><td><asp:textbox id="txtpwd" runat="server" />
                     <asp:RequiredFieldValidator ID="reqpwd" ErrorMessage="Please enter password" ControlToValidate="txtpwd"
                  runat="server" />
				                     </td></tr>
      <tr><td></td></tr>
				<tr><td><asp:button id="btnlogin" runat="server" text="Login" OnClick="btnlogin_Click1"/></td>
				<td><asp:button id="btnsignup" runat="server" text="Signup" OnClick="btnsignup_Click" CausesValidation="false"/></td></tr>

		<%--<div class="login">
				<tr><td>
                 <input type="text" placeholder="username" name="user" id="txtuser" required="required"/></td></tr>
				<tr><td><input type="password" placeholder="password" name="password" required="required" id="txtpwd"/></td></tr>
				<tr><td><input type="button" value="Login"/></td></tr>
				<tr><td><input type="button" value="SignUp"/></td></tr>

		</div>--%>
 
        <%--<script src='http://codepen.io/assets/libs/fullpage/jquery.js'></script>--%>
   
  </table>

        <%--</div>--%>
      </form>
        </center>
</body>

</html>

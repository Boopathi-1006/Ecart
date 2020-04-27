<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ECart_shopping.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-image:url(Images/gabrielle-ribeiro-EDztlsQAEIY-unsplash.jpg)">
    <form id="form1" runat="server">
        <div >
            <table>
                <tr>
                    <td>                    
            <h1>
                <asp:Label ID="lblname" runat="server"></asp:Label>
            </h1>
                        </td>
                    <td></td>
                    <td></td>
                    <td></td>

                    <td>
                        <asp:button id="btnlogout" runat="server" text="Log Out" OnClick="btnlogout_Click1"/>
                    </td>
                    </tr>
                </table>
        </div>
        <div>
<h2>Product Details</h2>
            <br />
<asp:GridView id="Grdproduct"  runat="server" OnRowCommand="Grdproduct_Adding"  DataKeyField="ProductID" DataMember="Products" 
    AutoGenerateColumns="False" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
    BackColor="#DEBA84" CellPadding="3" CellSpacing="2" Font-Size="X-Small" >
				<%--<SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#738A9C"></SelectedItemStyle>--%>
				<%--<ItemStyle ForeColor="#8C4510" BackColor="#FFF7E7"></ItemStyle>--%>
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#A55129"></HeaderStyle>
				<FooterStyle ForeColor="#8C4510" BackColor="#F7DFB5"></FooterStyle>
				<Columns>
					<asp:BoundField DataField="ProductId" SortExpression="ProductId" HeaderText="ProductId"></asp:BoundField>
					<asp:BoundField DataField="ProductName" SortExpression="ProductName" HeaderText="ProductName"></asp:BoundField>
					<asp:TemplateField HeaderText="Qunatity"  SortExpression="Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtgrdqunty" runat="server"></asp:TextBox>
                        </ItemTemplate>
					</asp:TemplateField>
                    <asp:BoundField DataField="Price" SortExpression="Price" HeaderText="Price"></asp:BoundField>

					<asp:ButtonField Text="Add" CommandName="Select" ButtonType="Button"></asp:ButtonField>
				</Columns>
				<PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" ></PagerStyle>
			</asp:GridView>
            </div>
        <div>
            <br />
            <table>
                <tr><td><h2>My Cart Details</h2></td>
                    <td></td>
                    <td>
                        <asp:button id="btnorder" runat="server" text="Place Your order click here" OnClick="btnorder_Click1"/>

                        </td>
                </tr>
            </table>

<br />
<asp:GridView id="GridCart"  runat="server" OnRowCommand="Grdcart_delete"  DataKeyField="ProductID" DataMember="Products" 
    AutoGenerateColumns="False" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
    BackColor="#DEBA84" CellPadding="3" CellSpacing="2" Font-Size="X-Small" >
				<HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#A55129"></HeaderStyle>
				<FooterStyle ForeColor="#8C4510" BackColor="#F7DFB5"></FooterStyle>
				<Columns>
					<asp:BoundField DataField="ProductId" SortExpression="ProductId" HeaderText="ProductId"></asp:BoundField>
					<asp:BoundField DataField="ProductName" SortExpression="ProductName" HeaderText="ProductName"></asp:BoundField>
                    <asp:BoundField DataField="Quantity" SortExpression="Price" HeaderText="Price"></asp:BoundField>			        
                    <asp:BoundField DataField="TotalPrice" SortExpression="Price" HeaderText="Price"></asp:BoundField>
					<asp:ButtonField Text="Remove" CommandName="Remove" ButtonType="Button"></asp:ButtonField>

					</Columns>
				<PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" ></PagerStyle>
			</asp:GridView>

        </div>
    </form>
</body>
</html>

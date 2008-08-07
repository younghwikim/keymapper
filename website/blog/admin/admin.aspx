﻿<%@ Page Language="C#" MasterPageFile="~/KMBlogAdmin.Master" AutoEventWireup="true" CodeBehind="admin.aspx.cs"
    EnableEventValidation="false" Inherits="KMBlog.admin" Title="Key Mapper Blog Admin" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div id="maindiv">
        <div>
            <asp:Label ID="lblUserLevel" Text="" runat="server" /></div>
        <asp:Repeater ID="postsRepeater" runat="server">
            <HeaderTemplate>
                <table border="0" cellpadding="0" cellspacing="0" width="60%" id="adminposts">
                    <tr>
                        <th>
                            Post
                        </th>
                        <th>
                            Date
                        </th>
                        <th>
                            Status
                        </th>
                        <th>
                            Delete
                        </th>
                        <th>
                            Comments
                        </th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <a href="post-edit.aspx?p=<%# DataBinder.Eval(Container.DataItem, "ID")%>">
                            <%# DataBinder.Eval(Container.DataItem, "Title") %></a> </td>
                    <td>
                        <%# ((DateTime)DataBinder.Eval(Container.DataItem, "Postdate")).ToLongDateString() %>
                    </td>
                    <td>
                        <%# (((bool)DataBinder.Eval(Container.DataItem, "Published")) ? "Published" : "Draft") %>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="DeletePost" Text="Delete" Enabled="<%# AppController.IsUserAdmin(Page.User) %>"
                            OnCommand="DeletePost" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "ID")%>' 
                            OnClientClick="return __doConfirm();"/>
                    </td>
                    <td>
                        <%# GetCommentLinkText((int)DataBinder.Eval(Container.DataItem, "ID"), (int)DataBinder.Eval(Container.DataItem, "commentCount")) %>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </table></FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
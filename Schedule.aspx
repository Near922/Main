<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true"
    CodeFile="Schedule.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManagerProxy runat="server" ID="scriptmanagerproxy1">
    </asp:ScriptManagerProxy>
    <div style="text-align: center; width: 100%;">
        <div style="margin: 0 auto; padding-bottom: 20px; padding-top: 20px; width:100%; text-align:center; display: table;">
            <asp:UpdatePanel runat="server" ID="Update">
                <ContentTemplate>
                  <div id="messageDiv" style="display: none; text-align: left;" runat="server" class="alert alert-success">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong>
                        <asp:Label ID="lblMessage" runat="server" Text="" />
                    </div>
                    <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
                        <strong>Error!</strong> An error has occurred.  Please contact the administrator.
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel runat="server" ID="UpdateCalander">
                <ContentTemplate>
                    <br />
                    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"
                        Style="margin-bottom: 0px; margin: 0 auto;" SelectedDate="04/14/2014 22:47:07" FirstDayOfWeek="Monday" BorderColor="Silver"></asp:Calendar>
                    <div>
                        <asp:Label ID="lblCalendarEdit" runat="server" Text="" />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Calendar1" EventName="SelectionChanged" />
                </Triggers>
            </asp:UpdatePanel>
            <br />
            <br />
            <asp:Button runat="server" ID="btnAddShift" CssClass="special_button_dark"
                Text="Add Shift" />
        </div>
        <div>
            <asp:Label ID="lblMain" runat="server" Text="" />
        </div>

        <asp:UpdatePanel runat="server" ID="UpdateGrid">
            <ContentTemplate>
        <div style="width: 100%; margin: 0 auto; display: table;">
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkServer" runat="server" AutoPostBack="True" Checked="True" OnCheckedChanged="chkServer_CheckedChanged"
                        Text="Serv" />
                    </div>
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkBar" runat="server" Checked="True" Text="Bar"
                        AutoPostBack="True" OnCheckedChanged="chkBar_CheckedChanged" />
                    </div>
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkBackwait" runat="server" Checked="True" Text="BWait"
                        AutoPostBack="True" OnCheckedChanged="chkBackwait_CheckedChanged" />
                    </div>
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkHost" runat="server" Checked="True" Text="Host"
                        AutoPostBack="True" OnCheckedChanged="chkHost_CheckedChanged" />
                    </div>
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkToGo" runat="server" Checked="True" Text="ToGo" 
                        AutoPostBack="True" OnCheckedChanged="chkToGo_CheckedChanged" />
                    </div>
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkManagement" runat="server" Checked="True" Text="Mgr" 
                        AutoPostBack="True" OnCheckedChanged="chkManagement_CheckedChanged" />
                    </div>
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkDish" runat="server" Checked="True" Text="Dish"
                        AutoPostBack="True" OnCheckedChanged="chkDish_CheckedChanged" />
                    </div>
                <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkPrep" runat="server" Checked="True" Text="Prep"
                        AutoPostBack="True" OnCheckedChanged="chkPrep_CheckedChanged" />
                    </div>
                          <div style="float: left; width: 11%;">
                    <asp:CheckBox ID="chkCook" runat="server" Checked="True" Text="Cook"
                        AutoPostBack="True" OnCheckedChanged="chkCook_CheckedChanged" />
                              </div>
            </div>
        <br />

                <div class="table-responsive">
                    <table style="border: thin solid #C0C0C0; width: 100%;; margin-right: auto; margin-left: auto;"
                        cellspacing="0" id="customers">
                        <tr>
                            <th style="border: thin solid #C0C0C0" class="style33"></th>
                            <th style="border: thin solid #C0C0C0" class="style33"></th>
                            <th style="border: thin solid #C0C0C0" class="style33"></th>
                            <th style="border: thin solid #C0C0C0; font-size: small;" class="style33">
                                <asp:Label ID="lblMonday" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            </th>
                            <th style="border: thin solid #C0C0C0; font-size: small;" class="style33">
                                <asp:Label ID="lblTuesday" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            </th>
                            <th style="border: thin solid #C0C0C0; font-size: small;" class="style33">
                                <asp:Label ID="lblWednesday" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            </th>
                            <th style="border: thin solid #C0C0C0; font-size: small;" class="style33">
                                <asp:Label ID="lblThursday" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            </th>
                            <th style="border: thin solid #C0C0C0; font-size: small;" class="style33">
                                <asp:Label ID="lblFriday" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            </th>
                            <th style="border: thin solid #C0C0C0; font-size: small;" class="style33">
                                <asp:Label ID="lblSaturday" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            </th>
                            <th style="border: thin solid #C0C0C0; font-size: small;" class="style33">
                                <asp:Label ID="lblSunday" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            </th>
                        </tr>
                        <asp:Repeater ID="Repeater3" runat="server" >
                            <ItemTemplate>
                                <tr>
                                    <td rowspan="2" style="border: thin solid #C0C0C0">
                                        <asp:Label ID="lblTestName" runat="server" Text='<%# Eval("NAME") %>' Font-Bold="True"
                                            Font-Size="Small">
           
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="lblJob" runat="server" Text='<%# GetJobs((string)Eval("NAME")) %>'  />
                                        <br />
                                        <asp:Label ID="lblTotalHours" runat="server" ForeColor='<%# TotalHoursColor((Schedule)Eval("Schedule")) %>'  Text='<%# Eval("Schedule.TotalHours" )%>'></asp:Label>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small; font-weight: bold;">AM
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small; font-weight: bold;">
                                        <asp:Label ID="lblLunchCount" runat="server" Text='<%# Eval("Schedule.LunchShifts" )%>'></asp:Label>
                                        <br />
                                        <asp:Label ID="lblLunchHours" runat="server" ForeColor='<%# LunchHoursColor((Schedule)Eval("Schedule")) %>'  Text='<%# Eval("Schedule.LunchHours" )%>'></asp:Label>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small;">
                                        <asp:LinkButton ID="lblMondayLunch" runat="server" Text='<%# Eval("Schedule.MondayLunch.ShiftString" )%>' CustomParameter='<%# Eval("Schedule.MondayLunch.ID") %>'  Enabled='<%# GetState((Shift)Eval("Schedule.MondayLunch")) %>'  ForeColor='<%# GetColor((Shift)Eval("Schedule.MondayLunch")) %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small;">
                                        <asp:LinkButton ID="lblTuesdayLunch" runat="server" Text='<%# Eval("Schedule.TuesdayLunch.ShiftString") %>' CustomParameter='<%# Eval("Schedule.TuesdayLunch.ID") %>'  Enabled='<%# GetState((Shift)Eval("Schedule.TuesdayLunch")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.TuesdayLunch")) %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small;">
                                        <asp:LinkButton ID="lblWednesdayLunch" runat="server" Text='<%# Eval("Schedule.WednesdayLunch.ShiftString") %>' CustomParameter='<%# Eval("Schedule.WednesdayLunch.ID") %>' Enabled='<%# GetState((Shift)Eval("Schedule.WednesdayLunch")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.WednesdayLunch")) %>'  OnClick="LinkButtonPopUp"></asp:LinkButton>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small;">
                                        <asp:LinkButton ID="lblThursdayLunch" runat="server" Text='<%# Eval("Schedule.ThursdayLunch.ShiftString") %>' CustomParameter='<%# Eval("Schedule.ThursdayLunch.ID") %>'  Enabled='<%# GetState((Shift)Eval("Schedule.ThursdayLunch")) %>' ForeColor='<%#GetColor((Shift) Eval("Schedule.ThursdayLunch")) %>'  OnClick="LinkButtonPopUp"></asp:LinkButton>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small;">
                                        <asp:LinkButton ID="lblFridayLunch" runat="server" Text='<%# Eval("Schedule.FridayLunch.ShiftString") %>' CustomParameter='<%# Eval("Schedule.FridayLunch.ID") %>'  Enabled='<%# GetState((Shift)Eval("Schedule.FridayLunch")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.FridayLunch")) %>'  OnClick="LinkButtonPopUp"></asp:LinkButton>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small;">
                                        <asp:LinkButton ID="lblSaturdayLunch" runat="server" Text='<%# Eval("Schedule.SaturdayLunch.ShiftString") %>' CustomParameter='<%# Eval("Schedule.SaturdayLunch.ID") %>' Enabled='<%# GetState((Shift)Eval("Schedule.SaturdayLunch")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.SaturdayLunch") )%>'  OnClick="LinkButtonPopUp"></asp:LinkButton>
                                    </td>
                                    <td style="border: thin solid #C0C0C0; font-size: small;">
                                        <asp:LinkButton ID="lblSundayLunch" runat="server" Text='<%# Eval("Schedule.SundayLunch.ShiftString") %>' CustomParameter='<%# Eval("Schedule.SundayLunch.ID") %>'  Enabled='<%#GetState((Shift) Eval("Schedule.SundayLunch")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.SundayLunch")) %>'  OnClick="LinkButtonPopUp"></asp:LinkButton>
                                    </td>
                                    <tr class="alt">
                                        <td style="border: thin solid #C0C0C0; font-size: small; font-weight: bold;">PM
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small; font-weight: bold;">
                                            <asp:Label ID="lblDinnerCount" runat="server" Text='<%# Eval("Schedule.DinnerShifts" )%>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lblDinnerHours" runat="server"  ForeColor='<%# DinnerHoursColor((Schedule)Eval("Schedule")) %>'  Text='<%# Eval("Schedule.DinnerHours" )%>'></asp:Label>
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small;">
                                            <asp:LinkButton ID="lblMondayDinner" runat="server" Text='<%# Eval("Schedule.MondayDinner.ShiftString" )%>' Enabled='<%#GetState((Shift) Eval("Schedule.MondayDinner")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.MondayDinner")) %>'  CustomParameter='<%# Eval("Schedule.MondayDinner.ID") %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small;">
                                            <asp:LinkButton ID="lblTuesdayDinner" runat="server" Text='<%# Eval("Schedule.TuesdayDinner.ShiftString" )%>' Enabled='<%# GetState((Shift)Eval("Schedule.TuesdayDinner")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.TuesdayDinner")) %>'  CustomParameter='<%#  Eval("Schedule.TuesdayDinner.ID") %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small;">
                                            <asp:LinkButton ID="lblWednesdayDinner" runat="server" Text='<%# Eval("Schedule.WednesdayDinner.ShiftString" )%>' Enabled='<%# GetState((Shift)Eval("Schedule.WednesdayDinner")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.WednesdayDinner")) %>' CustomParameter='<%# Eval("Schedule.WednesdayDinner.ID") %>'  OnClick="LinkButtonPopUp"></asp:LinkButton>
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small;">
                                            <asp:LinkButton ID="lblThursdayDinner" runat="server" Text='<%# Eval("Schedule.ThursdayDinner.ShiftString" )%>' Enabled='<%# GetState((Shift)Eval("Schedule.ThursdayDinner")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.ThursdayDinner")) %>'  CustomParameter='<%# Eval("Schedule.ThursdayDinner.ID") %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small;">
                                            <asp:LinkButton ID="lblFridayDinner" runat="server" Text='<%# Eval("Schedule.FridayDinner.ShiftString" )%>' Enabled='<%# GetState((Shift)Eval("Schedule.FridayDinner")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.FridayDinner")) %>'  CustomParameter='<%# Eval("Schedule.FridayDinner.ID") %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small;">
                                            <asp:LinkButton ID="lblSaturdayDinner" runat="server" Text='<%# Eval("Schedule.SaturdayDinner.ShiftString" )%>' Enabled='<%# GetState((Shift)Eval("Schedule.SaturdayDinner")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.SaturdayDinner")) %>'  CustomParameter='<%# Eval("Schedule.SaturdayDinner.ID") %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                        </td>
                                        <td style="border: thin solid #C0C0C0; font-size: small;">
                                            <asp:LinkButton ID="lblSundayDinner" runat="server" Text='<%# Eval("Schedule.SundayDinner.ShiftString" )%>' Enabled='<%# GetState((Shift)Eval("Schedule.SundayDinner")) %>' ForeColor='<%# GetColor((Shift)Eval("Schedule.SundayDinner")) %>'  CustomParameter='<%# Eval("Schedule.SundayDinner.ID") %>' OnClick="LinkButtonPopUp"></asp:LinkButton>
                                        </td>
                                    </tr>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" Style="display: none;" />
    <!-- ModalPopupExtender -->
    <asp:ModalPopupExtender ID="scheduleDetails" runat="server" PopupControlID="deletePanel"
        TargetControlID="btnShow" CancelControlID="btnClose" BackgroundCssClass="modalBackground grid">
    </asp:ModalPopupExtender>
    <asp:Panel ID="deletePanel" runat="server" Style="display: none;">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div style="background-color: White;">
            <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                <asp:Label ID="Label8" runat="server" Text="Shift Details" ForeColor="White" Font-Size="50px"> </asp:Label>
            </div>
            <div style="padding: 20px 20px 20px 20px;">
                <div style="padding-bottom: 20px;">
                    <asp:Label ID="Label10" runat="server" Text="Shift Date:"></asp:Label>
                    <asp:Label ID="shftDate" runat="server" Text=""></asp:Label>
                </div>
                <div style="padding-bottom: 20px;">
                    <asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label>
                    <asp:Label ID="lblShftDetailsName" runat="server" Text=""></asp:Label>
                </div>
                <div style="padding-bottom: 20px;">
                    <asp:Label ID="Label3" runat="server" Text="Job:"></asp:Label>
                    <asp:Label ID="lblShiftDetailsJob" runat="server" Text=""></asp:Label>
                </div>
                <div style="padding-bottom: 20px;">
                    <asp:Label ID="Label5" runat="server" Text="Shift Hours:"></asp:Label>
                    <asp:Label ID="lblShiftDetailsShift" runat="server" Text=""></asp:Label>
                </div>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="special_button_dark" OnClick="btnDelete_Click" />
                <asp:Button ID="btnClose" runat="server" CssClass="special_button_red" Text="Close" />
            </div>
        </div>
        </ContentTemplate>
      </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender -->
    <asp:ModalPopupExtender ID="mpeScheduleInput" runat="server" PopupControlID="schedulePanel"
        BackgroundCssClass="modalBackground grid" TargetControlID="btnAddShift">
    </asp:ModalPopupExtender>
    <asp:Panel ID="schedulePanel" runat="server" Style="display: none;">
        <asp:UpdatePanel ID="updateSchedule" runat="server">
            <ContentTemplate>
                <div style="background-color: White;">
                    <div style="background-color: #3498db; padding: 20px 20px 20px 20px;">
                        <asp:Label ID="Label9" runat="server" Text="Schedule Form" ForeColor="White" Font-Size="50px"> </asp:Label>
                    </div>
                    <div style="padding: 20px 20px 20px 20px;">
                        <div>
                            <asp:Label ID="Label40" runat="server" ForeColor="Black" Text="Staff:"></asp:Label>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <asp:DropDownList ID="lstStaffType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lstStaffType_SelectedIndexChanged"
                                CssClass="textbox">
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label ID="lblStaffTypeEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label2" runat="server" ForeColor="Black" Text="Employee:"></asp:Label>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <asp:DropDownList ID="lstStaff" runat="server" AutoPostBack="false" CssClass="textbox">
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label ID="lblStaffEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label7" runat="server" ForeColor="Black" Text="Shift:"></asp:Label>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <asp:DropDownList ID="lstShift" runat="server" AutoPostBack="true" CssClass="textbox"
                                OnSelectedIndexChanged="lstShift_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label ID="lblShiftEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label4" runat="server" ForeColor="Black" Text="Start:"></asp:Label>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <asp:DropDownList ID="lstStartHours" runat="server" Height="35px" Width="300px">
                            </asp:DropDownList>
                            <asp:DropDownList ID="lstStartMinutes" runat="server" Height="35px" Width="300px">
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label ID="lblStrtTimeEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <div>
                            <asp:Label ID="Label6" runat="server" ForeColor="Black" Text="End:"></asp:Label>
                        </div>
                        <div style="padding-bottom: 20px;">
                            <asp:DropDownList ID="lstEndHours" runat="server" Height="35px" Width="300px">
                            </asp:DropDownList>
                            <asp:DropDownList ID="lstEndMinutes" runat="server" Height="35px" Width="300px">
                            </asp:DropDownList>
                        </div>
                        <div>
                            <asp:Label ID="lblEndTimeEdit" runat="server" Style="text-align: center"></asp:Label>
                        </div>
                        <asp:Button ID="btnSave" runat="server" CssClass="special_button_dark" OnClick="btnSave_Click" Text="Send" 
                            ToolTip="Send results to the grid." />
                        <asp:Button ID="btnReset" runat="server" CssClass="special_button_red" Text="Close" 
                          OnClick="btnReset_Click" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>

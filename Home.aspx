<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>James Bergen Portfolio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div id="divHeader" runat="server" style="background-color: rgba(0, 0, 0, 0.8); background-image: url(/images/pexels-photo.jpg); height: 700px; width: 100%;">
        <div class="transparent">
        </div>
        <div class="container">
            <br />
            <div style="position: absolute; min-width: 400px; width: 30%; max-height: 200px; left: 0; right: 0; margin: 0 auto; top: 25%; z-index: 1000;">
                <div id="containHeader" class="jumbotron">
                    <h1 id="header">James Bergen
                    </h1>

                    <p style="color: white;">
                        Software Developer | QA Engineer
                    </p>


                    <p style="color: rgba(255,255,255,0.6);">
                        My passion is writing code.
                    </p>

                    <!--<p style="color: rgba(255,255,255,0.6); max-width: 600px; font-size: 20px;">
                            I have experience building user friendly web applications using C# and ASP.NET as well as test automation frameworks.
                        </p>-->
                    <div>
                        <asp:HyperLink ID="btnResume" runat="server" Text="Download Resume" NavigateUrl="~/Scripts/James Bergen Resume.docx" CssClass="special_button_red opac" Style="width: 300px;" />
                    </div>
                </div>
                <!--<div style="text-align: center;">

                        <img alt="profile pic" src="images/my_profile_pic.png" class="img-circle" height="200" width="200" />

                    </div>-->
            </div>
        </div>

    </div>
    <div id="divAbout" runat="server" class="contentDiv" clientidmode="static" style="background-color: #E74C3C; color: white; min-height: 500px;"
        text-align="left">
        <div class="container">
            <p class="section_header" style="color: white;">
                About
            </p>
            <div class="row">
                <div class="col-sm-6">
                    <p>
                        Hi, my name is James Bergen.  I'm a Software Developer living in Tampa, Florida.  I'm passionate about writing code and coming up with solutions to help people work more efficiently.
                    </p>
                    <p>
                        I studied Management Information System at University of South Florida and I've spent the last few years working in test automation.  Most of my programming experience is with C# and Ruby but
                        I'm always interested in learning something new and always looking for ways to improve myself.
                    </p>
                    <p>In my free time when I'm not writing code I like to practice my guitar, play video games, spend time with my dogs, and watch movies / tv shows (Game of Thrones!).</p>

                </div>
                <div class="col-sm-6" style="text-align: center;">
                    <img src="images/my_profile_pic.png" height="250" width="250" style="vertical-align: middle;" />
                </div>
            </div>

        </div>
    </div>
    <div id="divSkills" runat="server" class="contentDiv" clientidmode="static" style="background-color: #F4F4F4; min-height: 350px;"
        text-align="left">
        <div class="container">
            <p class="section_header">
                Technical Skills
            </p>
            <div style="padding-top: 20px; float: left; height: 100%; text-align: center;">
                <div style="text-align: center; margin: 0 auto;">
                    <div style="width: 200px; height: 200px; float: left;">
                        <!--<img alt="ruby" src="images/icons/1444682091_ruby.png" style="height: 100px; width: 100px;" />-->
                        <div style="width: 160px;">
                            <div>
                                <input type="text" value="75" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                            </div>
                            <div style="text-align: center;">
                                <span style="font-size: 25px; color: gray;">Ruby</span>
                            </div>
                        </div>
                    </div>
                    <div style="width: 200px; height: 200px; float: left;">
                        <!-- <img src="images/icons/c-img.png" style="height: 100px; width: 100px;" />-->
                        <div style="width: 160px;">
                            <div>
                                <input type="text" value="75" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                            </div>
                            <div style="text-align: center;">
                                <span style="font-size: 25px; color: gray;">C#</span>
                            </div>
                        </div>
                    </div>
                    <div style="width: 200px; height: 200px; float: left;">
                        <!--<img alt="javascript" src="images/icons/1444682687_javascript.png" style="height: 100px; width: 100px;" />-->
                        <div style="width: 160px;">
                            <div>
                                <input type="text" value="60" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                            </div>
                            <div style="text-align: center;">
                                <span style="font-size: 25px; color: gray;">Javascript</span>
                            </div>
                        </div>
                    </div>
                    <!-- <div style="width: 200px; height: 150px; float: left;">
                        <img alt="visual studio" src="images/icons/1444682242_visualstudio-microsoft-webdesign-html-css-javascript-develop.png" />
                    </div>-->
                    <div style="width: 200px; height: 200px; float: left;">
                        <!--<img alt="asp.net" src="images/icons/1444682634_ASP.Net.png" style="height: 100px; width: 100px;" />-->
                        <div style="width: 160px;">
                            <div>
                                <input type="text" value="70" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                            </div>
                            <div style="text-align: center;">
                                <span style="font-size: 25px; color: gray;">SQL</span>
                            </div>
                        </div>
                    </div>
                    <div style="width: 200px; height: 200px; float: left;">
                        <!--<img alt="sql" src="images/icons/1458458079_icon-89-document-file-sql.png" style="height: 100px; width: 100px;" />-->
                        <div style="width: 160px;">
                            <div>
                                <input type="text" value="70" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                            </div>
                            <div style="text-align: center;">
                                <span style="font-size: 25px; color: gray;">ASP.NET</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="divExperience" clientidmode="static" runat="server" class="contentDiv" style="background-color: White;"
        text-align="left">
        <div class="container">
            <p class="section_header">
                Experience
            </p>
            <div class="experience">
                <div style="overflow: hidden;">
                    <div style="width: 50%; float: left;">
                        <span class="sub_header">Bisk Education
                        </span>

                        <br />
                        <span class="sub_header">QA Engineer
                        </span>
                    </div>
                    <div style="float: right;">
                        <span>2016 - Present
                        </span>
                        <br />
                        <span>Tampa, FL
                        </span>
                    </div>
                </div>
                <br />
                <br />
                <div>
                    <p>Part of a four member team responsible for building and maintaining a test automation framework, including build verification tests, and regression tests.  The framework is built using C#, NUnit, and Selenium WebDriver.  I report any defects that are discovered in TFS for Development team to address and assist the manual QA team with regression testing when needed.</p>
                    <br />
                    <br />
                    <span class="skill">C#</span><span class="skill">Selenium WebDriver</span><span class="skill">SQL</span><span class="skill">Visual Studio</span><span class="skill">NUnit</span>
                </div>
            </div>
            <div class="experience">
                <div style="overflow: hidden;">
                    <div style="width: 50%; float: left;">
                        <span class="sub_header">West Point Underwriters
                        </span>

                        <br />
                        <span class="sub_header">Software Development Engineer in Test
                        </span>

                    </div>
                    <div style="float: right;">
                        <span>2012 - 2016
                        </span>
                        <br />
                        <span>Tampa, FL</span>
                    </div>
                </div>
                <br />
                <br />
                <div>
                    <p>
                        Part of a two member team responsible for building and maintaining a test automation framework.  The framework was built using Ruby, WATIR, and Cucumber.  Also created and maintained utilities to automate QA Testing tasks and dashboards to track test results and metrics. These utilities were
                                built using Ruby and Sinatra although there were some projects that required the work be done in VB.NET and ASP.NET.
                    </p>
                    <br />
                    <p>
                        Trained all new hires for the IT department in the QA Automation process and the available tools.  I was often responsible production clean up incidents which involved automating a UI process for hundreds to thousands of policies.  Created documention for tools and led IT department "Lunch n' Learns" with team mate to review QA Automation process and tools.  Provided support and training to the manual QA Team when necessary.
                    </p>
                    <br />
                    <br />
                    <span class="skill">Ruby</span><span class="skill">WATIR</span><span class="skill">Cucumber</span><span class="skill">Sinatra</span><span class="skill">SQL</span><span class="skill">JQuery</span><span class="skill">VB.NET</span><span class="skill">Visual Studio</span>
                </div>
            </div>
            <div class="experience">
                <div style="overflow: hidden;">
                    <div style="width: 50%; float: left;">
                        <span class="sub_header">University of South Florida
                        </span>
                        <br />
                        <span class="sub_header">Management Information Systems, B.S.
                        </span>
                    </div>
                    <div style="float: right;">
                        <span>2008 - 2012
                        </span>
                        <br />
                        <span>Tampa, FL
                        </span>
                    </div>
                </div>
                <br />
                <br />
                <div>
                    <p>Relevant course work:</p>
                    <ul style="line-height: 1.4em;">
                        <li>Systems Analysis and Design</li>
                        <li>Database Design</li>
                        <li>Business Application Development</li>
                        <li>Global Information Systems</li>
                        <li>E-Commerce</li>
                    </ul>
                    <br />
                    <br />
                    <span class="skill">C#</span><span class="skill">SQL</span><span class="skill">Visual Studio</span>
                </div>
            </div>
        </div>
    </div>
    <div id="divPortfolio" runat="server" clientidmode="static" class="contentDiv" style="background-color: #3498db; color: white;"
        text-align="center">
        <div class="container">
            <p class="section_header" style="color: white;">
                Projects
            </p>
            <!--<div class="row">
                <div class="col-sm-6">
                    <div style="width: 90%;">
                        <div>
                            <asp:Label ID="Label8" runat="server" Text="Point of Sale" Font-Bold="True"
                                Font-Size="X-Large"></asp:Label>
                        </div>
                        <div class="opac" style="width: 100%; background-color: #61BD6D; text-align: center;">
                            <a href="/login.aspx" style="height: 100%; width: 100%; display: block;">
                                <asp:Image runat="server" alt="sales" src="images/icons/Sales-Order-128.png" />
                            </a>
                        </div>
                        <div>
                            <p style="padding-top: 15px;">
                                Efficient and easy to use system to allow restaurant employees to manage their tables.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div style="width: 90%;">
                        <div>
                            <asp:Label ID="Label1" runat="server" Text="Scheduler" Font-Bold="True"
                                Font-Size="X-Large"></asp:Label>
                        </div>
                        <div class="opac" style="width: 100%; background-color: #2C82C9; text-align: center;">
                            <a href="/schedule.aspx" style="height: 100%; width: 100%; display: block;">
                                <asp:Image runat="server" alt="sales" src="images/icons/Calendar-Date-128.png" />
                            </a>
                        </div>
                        <div>
                            <p style="padding-top: 15px;">
                                Web based scheduling system for hospitality staff.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div style="width: 90%;">
                        <div>
                            <asp:Label ID="Label2" runat="server" Text="Cash Out" Font-Bold="True"
                                Font-Size="X-Large"></asp:Label>
                        </div>
                        <div class="opac" style="width: 100%; background-color: #FAC51C; text-align: center;">
                            <a href="/Checkout.aspx" style="height: 100%; width: 100%; display: block;">
                                <asp:Image runat="server" alt="sales" src="images/icons/Payment-02-128.png" />
                            </a>
                        </div>
                        <div>
                            <p style="padding-top: 15px;">
                                Program to document cash collected from wait staff and cash distributed to support
                                team.
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6">
                    <div style="width: 90%;">
                        <div>
                            <asp:Label ID="Label3" runat="server" Text="Game of Thrones Sigil Quiz" Font-Bold="True"
                                Font-Size="X-Large"></asp:Label>
                        </div>
                        <div class="opac" style="width: 100%; background-color: #95a5a6; text-align: center;">
                            <a href="/SigilQuiz.aspx" style="height: 100%; width: 100%; display: block;">
                                <asp:Image runat="server" alt="quiz" src="images/icons/Game-128.png" />
                            </a>
                        </div>
                        <div>
                            <p style="padding-top: 15px; max-width: 580px;">
                                Choose the correct sigil for the given house from the HBO series Game of Thrones and the Song of Ice and Fire novels.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
            <div class="row" style="padding-bottom: 200px;">
                <div class="col-sm-12">
                    <div>
                        <asp:Label ID="lblCashout" runat="server" Text="Cash Out" Font-Bold="True"
                            Font-Size="X-Large"></asp:Label>
                        <div style="max-height:900px; max-width: 800px;">
                            <img src="images/cashout.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                        <p>Utility that allows restaurant management to document cash collected from front of house employees at the end of each shift, storing information in a SQL Server database.</p>
                        <p>Also calculates the wages of support staff based on support staff hours and front of house sales.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnCashout" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/Checkout.aspx" />
                    </div>
                </div>
            </div>
            <div class="row" style="padding-bottom: 200px;">
                <div class="col-sm-12">
                    <div>
                        <asp:Label ID="lblScheduler" runat="server" Text="Scheduler" Font-Bold="True"
                            Font-Size="X-Large"></asp:Label>
                        <div style="max-height:900px; max-width: 800px;">
                            <img src="images/scheduler.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                        <p>Allows restaurant managers to easily add and delete shifts for staff.  Features filtering by role and easily allows management to track the number of shifts and hours per week an employee is scheduled.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnSchedule" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/Schedule.aspx" />
                    </div>
                </div>
            </div>
            <div class="row" style="padding-bottom: 200px;">
                <div class="col-sm-12">
                    <div>
                        <asp:Label ID="lblPointOfSale" runat="server" Text="Point Of Sale" Font-Bold="True"
                            Font-Size="X-Large"></asp:Label>
                        <div style="max-height:900px; max-width: 800px;">
                            <img src="images/pos.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                        <p>Point of sale system that allows restaurant front of house staff to order menu items for their patrons.  Features login system, sales report, adding and removing items, placing items on hold, splitting checks, and appying payment.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnPointSale" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/login.aspx" />
                    </div>
                </div>
            </div>
            <div class="row" style="padding-bottom: 200px;">
                <div class="col-sm-12">
                    <div>
                        <asp:Label ID="lblSigilQuiz" runat="server" Text="Game Of Thrones Sigil Quiz" Font-Bold="True"
                            Font-Size="X-Large"></asp:Label>
                        <div style="max-height:900px; max-width: 800px;">
                            <img src="images/sigil.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                        <p>A simple 20 question quiz inspired by the HBO series Game Of Thrones.  Choose the correct sigil for the given house.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnQuiz" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/SigilQuiz.aspx" />
                    </div>

                </div>

            </div>
        </div>
    </div>
    <div id="divContact" runat="server" clientidmode="static" class="contentDiv" style="background-color: white;"
        text-align="Left">
        <div class="container">
            <asp:UpdatePanel ID="upPanel1" runat="server">
                <ContentTemplate>
                    <div id="messageDiv" style="display: none; text-align: left;" runat="server" class="alert alert-success">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Success!</strong>
                        <asp:Label ID="lblMessage" runat="server" Text="" />
                    </div>
                    <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong>Error!</strong> An error has occurred.  Please contact the administrator.
                    </div>
                    <p class="section_header">
                        Contact
                    </p>
                    <div class="email">

                        <div class="form-group">
                            <asp:TextBox ID="txtName" runat="server" BackColor="white" ForeColor="black" placeholder="Name"
                                CssClass="textbox"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <div>
                                <asp:Label ID="lblEmail" runat="server" Text="" ForeColor="red" />
                            </div>
                            <asp:TextBox ID="txtEmail" runat="server" BackColor="white" ForeColor="black"
                                placeholder="E-mail" CssClass="textbox"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" BackColor="white"
                                ForeColor="black" Style="margin-left: 0px; height: 200px !important;" placeholder="Message" CssClass="textbox"></asp:TextBox>
                        </div>
                        <div>
                            <asp:LinkButton ID="btnSubmit" CssClass="highlighted special_link_button" Style="width: 100%; max-width: 600px;" runat="server"
                                Text="Submit" OnClick="btnSubmit_Click"></asp:LinkButton>
                        </div>
                    </div>
                </ContentTemplate>

            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>


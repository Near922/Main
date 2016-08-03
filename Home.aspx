<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>James Bergen Portfolio</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div id="divHeader" runat="server" style="background-color: #4baad3; height: 500px; width: 100%;">
        <div class="container">
            <br />

            <div id="containHeader" class="jumbotron" style="border: none; color: white; text-align: center;">
                <h1 id="header">James Bergen
                </h1>
                <h2>Software Developer and QA Engineer
                </h2>
                <div>
                    <img src="images/icons/1467098942_Html.png" />
                </div>
                <p style="color: rgba(255,255,255,0.6);">
                    I'm passionate about writing code.
                </p>

                <!--<p style="color: rgba(255,255,255,0.6); max-width: 600px; font-size: 20px;">
                            I have experience building user friendly web applications using C# and ASP.NET as well as test automation frameworks.
                        </p>-->
                <div>
                    <asp:HyperLink ID="btnResume" runat="server" Text="View Resume" NavigateUrl="~/Files/James Bergen Resume.pdf" CssClass="special_button_blue_reverse" Style="width: 300px;" />
                </div>
            </div>
            <!--<div style="text-align: center;">

                        <img alt="profile pic" src="images/my_profile_pic.png" class="img-circle" height="200" width="200" />

                    </div>-->

        </div>

    </div>
    <div id="divAbout" runat="server" class="contentDiv" clientidmode="static" style="background-color: #F4F4F4; color: #808080; min-height: 500px;"
        text-align="left">
        <div class="container">
            <p class="section_header" style="color: #FF675B;">
                About
            </p>
            <div class="row">
                <div class="col-sm-6">
                    <p>
                        Hi, my name is James Bergen.  I'm a Software Developer living in Tampa, Florida.  I'm passionate about writing code and coming up with solutions to help people work more efficiently.
                    </p>
                    <p>
                        I studied Management Information Systems at University of South Florida and I've spent the last few years working in test automation.  Most of my programming experience is with C# and Ruby but
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

            <div class="row">
                <div class="col-sm-3" style=" padding-bottom: 30px;">
                    <!--<img alt="ruby" src="images/icons/1444682091_ruby.png" style="height: 100px; width: 100px;" />-->
                    <div style="text-align: center;">
                        <div>
                            <input type="text" value="65" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                        </div>
                        <div style="text-align: center;">
                            <span style="font-size: 25px; color: #808080;">Ruby</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style=" padding-bottom: 30px;">
                    <!-- <img src="images/icons/c-img.png" style="height: 100px; width: 100px;" />-->
                    <div style="text-align: center;">
                        <div>
                            <input type="text" value="60" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                        </div>
                        <div style="text-align: center;">
                            <span style="font-size: 25px; color: #808080;">C#</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3" style=" padding-bottom: 30px;">
                    <!--<img alt="javascript" src="images/icons/1444682687_javascript.png" style="height: 100px; width: 100px;" />-->
                    <div style="text-align: center;">
                        <div>
                            <input type="text" value="40" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                        </div>
                        <div style="text-align: center;">
                            <span style="font-size: 25px; color: #808080;">Javascript</span>
                        </div>
                    </div>
                </div>
                <!-- <div style="width: 200px; height: 150px; float: left;">
                        <img alt="visual studio" src="images/icons/1444682242_visualstudio-microsoft-webdesign-html-css-javascript-develop.png" />
                    </div>-->
                <div class="col-sm-3" style=" padding-bottom: 30px;">
                    <!--<img alt="asp.net" src="images/icons/1444682634_ASP.Net.png" style="height: 100px; width: 100px;" />-->
                    <div style="text-align: center;">
                        <div>
                            <input type="text" value="55" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                        </div>
                        <div style="text-align: center;">
                            <span style="font-size: 25px; color: #808080;">SQL</span>
                        </div>
                    </div>
                </div>
                <!--<div style="width: 20%; min-width: 200px; height: 200px; float: left;">

                        <div style="width: 160px;">
                            <div>
                                <input type="text" value="50" class="dial" data-width="150" data-height="150" data-fgcolor="#1ABC9C" data-inputcolor="gray" data-readonly="true" />
                            </div>
                            <div style="text-align: center;">
                                <span style="font-size: 25px; color: #808080;">ASP.NET</span>
                            </div>
                        </div>
                    </div>-->
            </div>

        </div>
    </div>
    <div id="skillSummary" runat="server" class="contentDiv" clientidmode="static" style="background-color: #F4F4F4; min-height: 200px;"
        text-align="left">
        <div class="container">
            <div style="width: 100%; padding-top: 20px; text-align: left; color: #808080;">
                <div>
                    <span style="font-weight: bold; font-size: 19px;">Programming/Web: </span>
                    <p style="margin-bottom: 0 !important;">Ruby, C#, JavaScript, VB.NET, ASP.NET, Sinatra, HTML, CSS, Slim</p>
                </div>
                <br />
                <div>
                    <span style="font-weight: bold; font-size: 19px;">Database/DBMS: </span>
                    <p style="margin-bottom: 0 !important;">SQL, MS SQL Server 2012</p>
                </div>
                <br />
                <div>
                    <span style="font-weight: bold; font-size: 19px;">Tools: </span>
                    <p style="margin-bottom: 0 !important;">Selenium WebDriver, Cucumber, WATIR, Visual Studio 2012, TFS, SVN</p>
                </div>
                <br />
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
                    <p>Part of a team responsible for building and maintaining a test automation framework.  I am responsible for designing and implementing build verification tests and regression tests.  The framework and tests are built using C#, NUnit, and Selenium WebDriver.  I report any defects that are discovered in TFS for the Development team to address and assist the manual QA team with regression testing when needed.</p>
                    <br />
                    <br />
                    <span class="skillTag">C#</span><span class="skillTag">Selenium WebDriver</span><span class="skillTag">SQL</span><span class="skillTag">Visual Studio</span><span class="skillTag">NUnit</span>
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
                        Trained all new hires for the IT department in the QA Automation process and the available tools.  I was often responsible production clean up incidents which involved automating a UI process for hundreds to thousands of policies.  Created documentation for tools and led IT department "Lunch n' Learns" with team mate to review QA Automation process and tools.  Provided support and training to the manual QA Team when necessary.
                    </p>
                    <br />
                    <br />
                    <span class="skillTag">Ruby</span><span class="skillTag">WATIR</span><span class="skillTag">Cucumber</span><span class="skillTag">Sinatra</span><span class="skillTag">SQL</span><span class="skillTag">JQuery</span><span class="skillTag">VB.NET</span><span class="skillTag">Visual Studio</span>
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
                    <span class="skillTag">C#</span><span class="skillTag">SQL</span><span class="skillTag">Visual Studio</span>
                </div>
            </div>
        </div>
    </div>
    <div id="divPortfolio" runat="server" clientidmode="static" class="contentDiv" style="background-color: #F4F4F4; color: #808080;"
        text-align="center">
        <div class="container">
            <p class="section_header">
                Projects
            </p>
            <br />
            <p>Below you can find projects that I worked on to help strengthen and develop my programming skills.  Each project includes a live demo.  More projects are on the way!</p>
            <br />
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
            <div class="row" style="padding-bottom: 100px;">
                <div class="col-sm-6">
                    <div>
                        <asp:Label ID="lblCashout" runat="server" Text="Cash Out Utility"
                            Font-Size="X-Large" ForeColor="#4baad3"></asp:Label>
                        <p>Utility that allows restaurant management to document cash collected from front of house employees at the end of each shift, storing information in a SQL Server database.</p>
                        <p>Also calculates the wages of support staff based on support staff hours and front of house sales.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnCashout" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/Checkout.aspx" />
                        <br />
                        <br />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div>
                        <img src="images/cashout_50.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <div class="row" style="padding-bottom: 100px;">
                <div class="col-sm-6">
                    <div>
                        <img src="images/schedule_50.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                        <br />
                        <br />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div>
                        <asp:Label ID="lblScheduler" runat="server" Text="Employee Schedule Management System" ForeColor="#4baad3"
                            Font-Size="X-Large"></asp:Label>
                        <p>Allows restaurant managers to easily add and delete shifts for staff.  Features filtering by role and easily allows management to track the number of shifts and hours per week an employee is scheduled.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnSchedule" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/Schedule.aspx" />
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <div class="row" style="padding-bottom: 100px;">
                <div class="col-sm-6">
                    <div>
                        <asp:Label ID="lblPointOfSale" runat="server" Text="Point Of Sale" ForeColor="#4baad3"
                            Font-Size="X-Large"></asp:Label>
                        <p>Point of sale system that allows restaurant front of house staff to order menu items for their patrons.  Features login system, sales report, adding and removing items, placing items on hold, splitting checks, and appying payment.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnPointSale" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/login.aspx" />
                        <br />
                        <br />
                    </div>
                </div>
                <div class="col-sm-6">
                    <img src="images/pos_50.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                    <br />
                    <br />
                </div>
            </div>
            <div class="row" style="padding-bottom: 100px;">
                <div class="col-sm-6">
                    <div>
                        <img src="images/sigil_50.PNG" class="img-responsive" style="padding-bottom: 50px;" />
                        <br />
                        <br />
                    </div>
                </div>
                <div class="col-sm-6">
                    <div>
                        <asp:Label ID="lblSigilQuiz" runat="server" Text="Game Of Thrones Sigil Quiz" ForeColor="#4baad3"
                            Font-Size="X-Large"></asp:Label>

                        <p>A simple 20 question quiz inspired by the HBO series Game Of Thrones.  Choose the correct sigil for the given house.</p>
                        <br />
                        <br />
                        <asp:LinkButton ID="btnQuiz" runat="server" CssClass="special_button_blue" Text="Demo" PostBackUrl="~/SigilQuiz.aspx" />
                        <br />
                        <br />
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
                        <span class="close" data-dismiss="alert" aria-label="close">&times;</span>
                        <strong>Success!</strong>
                        <asp:Label ID="lblMessage" runat="server" Text="" />
                    </div>
                    <div id="errorDiv" style="display: none; text-align: left;" runat="server" class="alert alert-danger">
                        <span class="close" data-dismiss="alert" aria-label="close">&times;</span>
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
                            <asp:LinkButton ID="btnSubmit" CssClass="opac special_link_button" Style="width: 100%; max-width: 600px;" runat="server"
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


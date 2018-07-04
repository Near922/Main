<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage3.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        a:hover {
            text-decoration: underline;
        }
       #btnResume {
            color: white !important;
        }
        #btnResume:visited {
            color: white !important;
        }
        #btnResume:active {
            color: white !important;
        }
        #btnResume:focus {
            color: white !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="container-fluid">
        <div id="divHeader" class="row justify-content-center hero-image" runat="server">
            <br />
            <div class="col-xs-12">
                <div id="containHeader" class="jumbotron" style="display: none; border: none; color: white; text-align: center;">
                    <h1 id="header">James Bergen
                    </h1>
                    <h1>Software Developer
                    </h1>
                    <div>
                        <img src="images/icons/1467098942_Html.png" />
                    </div>
                    <p style="color: rgba(255,255,255,0.6);">
                        I'm passionate about writing code.
                    </p>
                    <div>
                        <asp:HyperLink ID="btnResume" runat="server" Text="View Resume" NavigateUrl="~/Files/james-bergen-resume.pdf" style="color: white !important;" CssClass="special_button_blue_reverse" Target="_blank" />
                    </div>
                </div>
            </div>
        </div>
        <div id="divAbout" class="row" runat="server" clientidmode="static" style="color: #808080; background-color: #F4F4F4;"
            text-align="left">
            <div class="col-lg-3 col-sm-1">
            </div>
            <div id="aboutContent" class="col-lg-6 col-sm-10">
                <p class="section_header" style="color: #FF675B;">
                    About
                </p>
                <p>
                    Hi, my name is James Bergen.  I'm a software developer living in Tampa, Florida.  I'm passionate about writing code and coming up with solutions to help people work more efficiently.
                </p>
                <p>
                    I studied Management Information Systems at University of South Florida and I've spent the last few years working in test automation.  Most of my programming experience is with C# and Ruby but
                            I'm always interested in learning something new and always looking for ways to improve myself.
                </p>
                <p>In my free time when I'm not writing code I like to practice my guitar, play video games, spend time with my dogs, and watch movies / tv shows (Game of Thrones!).</p>
            </div>
            <div class="col-lg-3 col-sm-1">
            </div>
        </div>

        <div id="divSkills" runat="server" class="row" clientidmode="static" style="background-color: #F4F4F4;"
            text-align="left">
            <div class="col-lg-3 col-sm-1">
            </div>
            <div id="skillsContent" class="col-lg-6 col-sm-10" style="color: #808080;">
                <p class="section_header">
                    Technical Skills
                </p>
                <div style="padding-bottom: 50px;">
                    <div>
                        <span style="font-weight: bold; font-size: 19px;">Programming/Web: </span>
                        <p style="margin-bottom: 0 !important;">C#, Ruby, JavaScript, JQuery, ASP.NET, Sinatra, HTML, CSS</p>
                    </div>
                    <br />
                    <div>
                        <span style="font-weight: bold; font-size: 19px;">Database/DBMS: </span>
                        <p style="margin-bottom: 0 !important;">SQL, MS SQL Server</p>
                    </div>
                    <br />
                    <div>
                        <span style="font-weight: bold; font-size: 19px;">Tools: </span>
                        <p style="margin-bottom: 0 !important;">Selenium WebDriver, Cucumber, WATIR, Visual Studio, TFS, GitHub</p>
                    </div>
                    <br />
                </div>
            </div>
            <div class="col-lg-3 col-sm-1">
            </div>
        </div>
        <div id="divExperience" clientidmode="static" runat="server" class="row"
            text-align="left" style="color: #808080;">
            <div class="col-lg-3 col-sm-1">
            </div>
            <div id="experienceContent" class="col-lg-6 col-sm-10">
                <p class="section_header">
                    Experience
                </p>
                <div style="padding-bottom: 50px;">
                    <div>
                        <div>
                            <span class="sub_header">Bisk
                            </span>
                            <br />
                            <span class="sub_header">Software Quality Assurance Test Engineer
                            </span>
                        </div>
                    </div>

                    <div>
                        <div style="font-size: 16px;">
                            <span>2016 - Present
                            </span>
                            <br />
                            <span>Tampa, FL
                            </span>
                        </div>
                    </div>
                    <br />
                    <div>
                        <div>
                            <p>I'm responsible for building and maintaining a test automation framework.  I write regression tests for the Learning Management System and the university marketing sites.  The framework and tests are built using C#, NUnit, and Selenium WebDriver.  I report any defects that are discovered in TFS for the development team to address and assist the manual QA team with regression testing when needed.</p>
                            <p>Within a year I was promoted from Associate SQA Test Engineer to SQA Test Engineer.</p>
                            <br />
                            <span class="skillTag">C#</span><span class="skillTag">Selenium WebDriver</span><span class="skillTag">SQL</span><span class="skillTag">Visual Studio</span><span class="skillTag">NUnit</span>
                        </div>
                    </div>
                </div>
                <div style="padding-bottom: 50px;">
                    <div>
                        <div>
                            <span class="sub_header">West Point Underwriters
                            </span>
                            <br />
                            <span class="sub_header">Software Development Engineer in Test
                            </span>
                        </div>
                    </div>
                    <div>
                        <div style="font-size: 16px;">
                            <span>2013 - 2016
                            </span>
                            <br />
                            <span>Pinellas Park, FL</span>
                        </div>
                    </div>
                    <br />
                    <div>
                        <div>
                            <p>
                                I was responsible for building and maintaining a test automation framework.  The framework was built using Ruby, WATIR, and Cucumber.  I also created and maintained utilities to automate QA testing tasks and dashboards to track test results and metrics. These utilities were
                                built using Ruby and Sinatra although there were some projects that required the work be done in VB.NET and ASP.NET.
                            </p>
                            <p>
                                I trained all new hires for the IT department in the QA Automation process and the available tools.  I was often responsible for production clean up incidents which involved automating a UI process for hundreds to thousands of policies.  I created documentation and led IT department "Lunch and Learns" to review QA Automation process and tools.  I provided support and training to the manual QA Team when necessary.
                            </p>
                            <br />
                            <span class="skillTag">Ruby</span><span class="skillTag">WATIR</span><span class="skillTag">Cucumber</span><span class="skillTag">Sinatra</span><span class="skillTag">SQL</span><span class="skillTag">JQuery</span><span class="skillTag">VB.NET</span><span class="skillTag">Visual Studio</span>
                        </div>
                    </div>
                </div>
                <div style="padding-bottom: 50px;">
                    <div>
                        <div>
                            <span class="sub_header">West Point Underwriters
                            </span>
                            <br />
                            <span class="sub_header">Software Quality Assurance Analyst
                            </span>
                        </div>
                    </div>
                    <div>
                        <div style="font-size: 16px;">
                            <span>2012 - 2013
                            </span>
                            <br />
                            <span>Pinellas Park, FL</span>
                        </div>
                    </div>
                    <br />
                    <div>
                        <div>
                            <p>
                                As QA Analyst I interpreted requirements and applied business logic to create test cases.  I executed the test cases and identified defects.  I provided detailed documentation 
                            with steps to recreate for any defects found.
                            </p>
                            <p>
                                I also worked with the SDET to maintain automation scripts utilizing Ruby, WATIR and Cucumber.
                            </p>
                            <br />
                            <span class="skillTag">Ruby</span><span class="skillTag">WATIR</span><span class="skillTag">Cucumber</span>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-lg-3 col-sm-1">
            </div>
        </div>
        <div id="divEducation" runat="server" class="row" clientidmode="static" style="color: #808080;"
            text-align="left">
            <div class="col-lg-3 col-sm-1">
            </div>
            <div id="educationContent" class="col-lg-6 col-sm-10">
                <p class="section_header">
                    Education
                </p>
                <div style="padding-bottom: 50px;">
                    <div>
                        <div>
                            <span class="sub_header">University of South Florida
                            </span>
                            <br />
                            <span class="sub_header">Bachelor of Science in Management Information Systems
                            </span>
                        </div>
                        <div>
                            <div style="font-size: 16px;">
                                <span>May 2011
                                </span>
                                <br />
                                <span>Tampa, FL
                                </span>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div>
                        <div style="font-size: 16px;">
                            <p>Relevant course work:</p>
                            <ul style="line-height: 1.4em;">
                                <li>Systems Analysis and Design</li>
                                <li>Database Design</li>
                                <li>Business Application Development</li>
                                <li>Global Information Systems</li>
                                <li>E-Commerce</li>
                                <li>Business Data Communications</li>
                                <li>Managing Information Resourses</li>
                            </ul>
                            <br />
                            <span class="skillTag">C#</span><span class="skillTag">SQL</span><span class="skillTag">Visual Studio</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-10">
            </div>
        </div>
   <!--     <div id="divTreeHouse" runat="server" class="row" clientidmode="static" style="color: #808080;"
            text-align="left">
            <div class="col-lg-3 col-sm-1">
            </div>
            <div id="treeHouse" style="display: none;" class="col-lg-6 col-sm-10">
                <p class="section_header">
                    Treehouse
                </p>
                <p>Treehouse is an online technology school that offers web development courses at an affordable price.  Badges are earned by completing courses and workshops.</p>
                <asp:HyperLink ID="treeHouseLink" runat="server" NavigateUrl="https://teamtreehouse.com/" Target="_blank" Font-Size="16px" ForeColor="#337ab7" Text="More about Treehouse"></asp:HyperLink>
                <br />
                <br />
                <p class="sub_header">Badges Earned:</p>
                <br />
                <br />
                <div id="badges">
                </div>
                <button type="button" id="showBadge" class="btn btn-info button_flat_blue" data-toggle="collapse" data-target="#moreBadges">Show More</button>
                <div id="moreBadges" class="collapse">
                </div>
                <button type="button" id="hideBadge" class="btn btn-info button_flat_blue" data-toggle="collapse" style="display: none;" data-target="#moreBadges">Show Less</button>
                <br />
                <br />
            </div>
            <div class="col-lg-3 col-sm-1">
            </div>
        </div>-->
        <div id="divPortfolio" runat="server" clientidmode="static" class="row"
            text-align="center" style="background-color: #e74c3c; color: white;">
            <div class="col-sm-1">
            </div>
            <div id="projectsContent"  class="col-sm-10">
                <p class="section_header" style="color: white;">
                    Projects
                </p>
                <br />
                <div id="divCashout" class="row">
                    <div class="col-md-6">
                        <div>
                            <asp:Label ID="lblCashout" runat="server" Text="Cash Out Utility"
                                Font-Size="X-Large" ForeColor="white"></asp:Label>
                            <p>Utility that allows restaurant management to document cash collected from front of house employees at the end of each shift, storing information in a SQL Server database.</p>
                            <p>Also calculates the wages of support staff based on support staff hours and front of house sales.</p>
                            <br />
                            <br />
                            <asp:LinkButton ID="btnCashout" runat="server" CssClass="special_button_project" Text="Demo" PostBackUrl="~/Checkout.aspx" />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <img src="images/cashout.jpg" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>


                <div id="divScheduler" class="row swap">
                    <div class="col-md-6  first">
                        <div>
                            <img src="images/scheduler.jpg" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="col-md-6">

                        <div>
                            <asp:Label ID="lblScheduler" runat="server" Text="Employee Schedule Management System" ForeColor="white"
                                Font-Size="X-Large"></asp:Label>
                            <p>Allows restaurant managers to easily add and delete shifts for staff.  Features filtering by role and easily allows management to track the number of shifts and hours per week an employee is scheduled.</p>
                            <br />
                            <br />
                            <asp:LinkButton ID="btnSchedule" runat="server" CssClass="special_button_project" Text="Demo" PostBackUrl="~/Schedule.aspx" />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>

                <div id="divSale" class="row">
                    <div class="col-md-6">
                        <div>
                            <asp:Label ID="lblPointOfSale" runat="server" Text="Point Of Sale" ForeColor="white"
                                Font-Size="X-Large"></asp:Label>
                            <p>Point of sale system that allows restaurant front of house staff to order menu items for their patrons.  Features login system, sales report, adding and removing items, placing items on hold, splitting checks, and appying payment.</p>
                            <br />
                            <br />
                            <asp:LinkButton ID="btnPointSale" runat="server" CssClass="special_button_project" Text="Demo" PostBackUrl="~/login.aspx" />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div>
                            <img src="images/pos.jpg" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>


                <div id="divGot" class="row swap">
                    <div class="col-md-6 second">
                        <div>
                            <img src="images/sigil.jpg" class="img-responsive" style="padding-bottom: 50px;" />
                            <br />
                            <br />
                        </div>
                    </div>
                    <div class="col-md-6 first">
                        <div>
                            <asp:Label ID="lblSigilQuiz" runat="server" Text="Game Of Thrones Sigil Quiz" ForeColor="white"
                                Font-Size="X-Large"></asp:Label>

                            <p>A simple 20 question quiz inspired by the HBO series Game Of Thrones.  Choose the correct sigil for the given house.</p>
                            <br />
                            <br />
                            <asp:LinkButton ID="btnQuiz" runat="server" CssClass="special_button_project" Text="Demo" PostBackUrl="~/SigilQuiz.aspx" />
                            <br />
                            <br />
                        </div>

                    </div>

                </div>

            </div>
            <div class="col-sm-1">
            </div>
        </div>
        <div id="divContact" runat="server" clientidmode="static" class="row"
            text-align="Left">
            <div class="col-lg-3 col-sm-1">
            </div>
            <div class="col-lg-6 col-sm-10">
                <asp:UpdatePanel ID="upPanel1" runat="server">
                    <ContentTemplate>
                        <div id="messageDiv" style="display: none; text-align: left;" runat="server" role="alert" class="alert alert-success alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Success!</strong>
                            <asp:Label ID="lblMessage" runat="server" Text="" />
                        </div>
                        <div id="errorDiv" style="display: none; text-align: left;" runat="server" role="alert" class="alert alert-danger alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <strong>Error!</strong> An error has occurred.  Please contact the administrator.
                        </div>
                        <p class="section_header">
                            Contact
                        </p>
                        <div>
                            <div style="padding-bottom: 50px; color: #808080; font-size: 16px;">
                                <span>If you would like to get in touch you can email me at </span>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="mailto:jmbergen922@gmail.com" Font-Size="16px" ForeColor="#337ab7" Text="jmbergen922@gmail.com"></asp:HyperLink>
                                <span>or complete the below form:</span>
                            </div>
                        </div>
                        <div style="text-align: center; width: 100%;">
                            <div style="max-width: 600px; padding: 20px; margin: 0 auto;">

                                <div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtName" runat="server" BackColor="white" ForeColor="black" placeholder="Name"
                                            CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <div>
                                            <asp:Label ID="lblEmail" runat="server" Text="" ForeColor="red" />
                                        </div>
                                        <asp:TextBox ID="txtEmail" runat="server" BackColor="white" ForeColor="black"
                                            placeholder="E-mail" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" BackColor="white"
                                            ForeColor="black" Style="margin-left: 0px; height: 200px !important;" placeholder="Message" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:LinkButton ID="btnSubmit" CssClass="btn btn-block btn-lg btn-primary button_flat_blue" Style="background-color: #4baad3" runat="server"
                                            Text="Submit" OnClick="btnSubmit_Click"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="col-lg-3 col-sm-1">
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>


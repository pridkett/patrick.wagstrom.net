---
title: "Resume Data"
name: "resume_data"
draft: true
stylesheets:
  - href: resume.css
  - href: print.css
    media: print
---

<div class="row">
    <!-- sidebar -->
    <div class="col-md-3 sidebar">
        <div class="row no-print">
            <div class="col-md-12 mugshot">
                <img src="Headshot%20-%20Patrick%20Wagstrom%20-%2020221114%20-%20204x204.jpg" height="204" width="204" alt="A dazzling and beautiful professional headshot photograph of Patrick Wagstrom" id="profilepic">
            </div>
        </div>
        <div class="row name-header">
            <div class="col-md-12">
                <h3>Patrick Wagstrom</h3>
                <h4>Data Engineering and Artificial Intelligence Leader</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <ul class="info-links">
                    {{< infolink href="mailto:patrick@wagstrom.net" icon="fa-envelope" >}}patrick@wagstrom.net{{< /infolink >}}
                    <!-- {{< infolink href="http://patrick.wagstrom.net/" icon="fa-globe" >}}https://patrick.wagstrom.net/{{< /infolink >}} -->
                    {{< infolink icon="fa-globe">}}Coventry, CT{{< /infolink >}}
                    {{< phonelink >}}
                </ul>
            </div>
        </div>
        <div class="row no-print">
            <div class="col-md-12">
                <ul class="social-links">
                    <li><a href="https://github.com/pridkett" title="GitHub Profile"><i class="fa fa-github"></i></a></li>
                    <li><a href="http://stackoverflow.com/users/57626/pridkett" title="StackOverflow Profile"><i class="fa fa-stack-overflow"></i></a></li>
                    <li><a href="http://stackexchange.com/users/23095/pridkett" title="StackExchange Profile"><i class="fa fa-stack-exchange"></i></a></li>
                    <li><a href="https://www.facebook.com/patrick.wagstrom" title="Facebook Profile"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="http://www.youtube.com/user/pridkett/videos" title="YouTube Profile"><i class="fa fa-youtube"></i></a></li>
                    <li><a href="http://www.linkedin.com/in/pwagstrom" title="LinkedIn Profile"><i class="fa fa-linkedin"></i></a></li>
                </ul>
            </div>
        </div>
        <div class="row download-buttons no-print">
            <div class="col-md-12">
                <button type="button" class="btn btn-primary btn-large" onclick="window.location.href='wagstrom-resume-20210308.pdf';"><i class="fa fa-download"></i> Download</button>
                <button type="button" class="btn btn-primary btn-large" onclick="window.print();"><i class="fa fa-print"></i> Print</button>
            </div>
        </div>
    </div>
    <!-- /sidebar -->
    <!-- main body -->
    <div class="col-md-9 main-body">
        <!-- general purpose -->
        <div class="row">
            <div class="col-md-12">
                <p>
                Strategic and hands-on executive leader in data engineering, machine learning, and software development with extensive experience in organizations across finance, telecom, and video streaming. Proven track record in building high-performing teams, modernizing data pipelines, and driving AI/ML initiatives that deliver significant business impact.
				<!-- I am a hands-on executive leader of data, machine learning, and software engineering organizations with broad experience in foundational research, finance, telecom, and video streaming. I build organizations that transform companies and markets with data driven insights and best of breed emerging technologies. -->
				</p>
            </div>
        </div>
        <!-- /general purpose -->
        <!-- critical skills -->
        <!-- <div class="row">
            <div class="col-md-12">
            <h3 class="heading">Critical Skills</h3>
                <ul>
                    <li></li>
                    <li>B</li>
                    <li>C</li>
                </ul>
            </div>
        </div> -->
        <!-- /critical skills -->
        <!-- employment -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="heading">Professional Experience</h3>
				<ul class="job-listing">
					<li class="job">
						<ul>
							<li class="job-info">
								<span class="job-employer"><a href="https://www.grainger.com/">Grainger</a></span>
								<span class="job-location">Chicago, IL and Hartford, CT</span>
								<span class="job-title">Senior Director Applied ML</span>
								<span class="job-dates">July 2023 - Present</span>
							</li>
							<li title="achievements">
								<ul>
									<li>Lead team of 43 FTE ML scientists, software engineers, and product managers on product search and discovery, LLM agents, ML in mobile applications, data pipelines, and governance.</li>
									<li>Designed initial version overall data architecture - integrating an S3 data lake with data products, Kafka event streaming, Databricks for ML and data processing workflows, Snowflake for analytical workflows, and Atlan for data governance.</li>
									<li>Developed an LLM-based customer service agent using search and unstructured product data combined with OpenAI on Azure to provide human-in-the-middle assistance to Grainger employees.</li>
									<li>Led the effort to define the ML Scientist job family across the company and integrate it into overall talent strategy including recruiting and talent development.</li>
									<li>Worked with legal partners to define and implement generative AI governance process.</li>
								</ul>
							</li>
						</ul>
					</li>
					<li class="job">
						<ul>
							<li class="job-info">
								<span class="job-employer"><a href="https://www.brightcove.com/">Brightcove</a></span>
								<span class="job-location">Boston, MA and Hartford, CT</span>
								<span class="job-title">Chief Data Officer</span>
								<span class="job-dates">May 2021 - December 2022</span>
							</li>
							<li title="achievements">
								<ul>
									<li>Responsible for all analytics, data, and machine learning at Brightcove - including engineering, governance, policy, and vendor relations.</li>
								    <li>Owned end-to-end analytics collection and processing systems handling trillions of rows of data and billions of monthly video views on both AWS and GCP.</li>
									<li>Managed an organization of 34 FTEs and 12 contractors, overseeing data platforms, analytics and insights, data and model governance, and customer-facing data products.</li>
									<li>Executed the $12.3 million acquisition of Wicket Labs, expanding Brightcove's viewer analytics capabilities and growing the product customer base by over 50x in under a year.</li>
									<li>Collaborated closely with Brightcove and customer C-level executives, driving corporate strategies and fostering strong business relationships.</li>
									<!-- <li>Championed initiatives to enhance engineering performance and implement effective performance management across the organization.</li> -->
									<li>Negotiated and owned a multi-million dollar partnership with Google Cloud Platform.</li>
									<li>Maintained and expanded multi-cloud data infrastructure using tools such as Trino, Glue, Lambda, SageMaker, and Redshift on AWS and BigQuery, Cloud Composer, Dataflow, and Pub/Sub on GCP.</li>
									<!-- <li>Developed multi-modal video classification models using text transcripts, audio, and video processing.</li> -->
									<!-- <li>Directly conducted research on the impact of super-resolution algorithms on streaming, from holistic bandwidth, encoding cost, and device playback cost perspectives.</li> -->
								</ul>
							</li>
						</ul>
					</li>
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.verizon.com/">Verizon</a></span>
                                <span class="job-location">Basking Ridge, NJ and Hartford, CT</span>
                                <span class="job-title">Director of Emerging Technology</span>
                                <span class="job-dates">September 2019 - April 2021</span>
                            </li>
                            <li title="achievements">
                                <ul>
								    <li>Built and managed a team of 9 FTEs and 51 vendor contractors with a $15 million annual budget, collaborating closely with CIO, CTO, and CDAO to influence corporate strategies.</li>
									<li>Designed a new data architecture to migrate from ad-hoc on-prem Teradata and Hadoop solutions to a managed streaming data architecture with Google BigQuery.</li>
									<li>Architected an enterprise strategy for reproducible machine learning and MLOps, encompassing data management, model training, model serving, model refit, and model risk management.</li>
									<li>Developed cell site energy efficiency machine learning models, resulting in $5 million annual savings and the creation of a digital twin for future simulation.</li>
									<li>Led the software engineering dojos - intensive collaboration environments to improve engineering efficiency - until the onset of COVID-19 halted face-to-face interactions.</li>
									<!-- <li>Led the development of a holistic model connecting online brand discussions to customer profiles, supporting customer service operations and building patent-pending bot detection models.</li> -->
									<li>Worked alongside legal and policy experts to create several Verizon policies, including facial recognition, energy efficiency, model risk management, and data privacy.</li>
									<!-- <li>Developed systems for blockchain based identity management and sim swap protection across mobile carriers.</li> -->
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.capitalone.com/">Capital One</a></span>
                                <span class="job-location">New York, NY and McLean, VA</span>
                                <span class="job-title">Senior Director of Data Science for Machine Learning Platforms</span>
                                <span class="job-dates">January 2019 - September 2019</span>
                                <span class="job-title">Director of Data Science for Machine Intelligence</span>
                                <span class="job-dates">November 2016 - January 2019</span>
                            </li>
                            <li title="achievements">
                                <ul>
                                    <li>Architect and overall lead of the Capital One Card Machine Learning Platform  - a platform for scalable and personalized real-time reinforcement learning-based machine learning models using tools such as Kubernetes, gRPC, and AWS in a heavily regulated environment.</li>
									<li>Led a team that deployed and managed multi-modal customer intelligence models working on both structured and unstructured text and voice data, resulting in $27 million annual savings.</li>
                                    <li>Hired, managed, and developed a distributed team of 18 data scientists and data analysts.</li>
                                    <li>Built out a $1.2mm academic research partnership with universities to explore responsibility and fairness in artificial intelligence.</li>
                                    <li>Conducted more than 300 hiring interviews to help grow Card Machine Learning from 33 to 168 people and Capital One's New York Card team from 8 to nearly 200.</li>
									<li>Championed reproducible machine learning and MLOps across the organization, ensuring best practices in data management, model training, model serving, model refit, and model risk management.</li>
									<li class="no-resume">Collaborated with cross-functional teams to develop and implement the company's data privacy and AI ethics policies.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.ibm.com/watson/">IBM Watson</a></span>
                                <span class="job-location">Littleton, MA</span>
                                <span class="job-title">Research Staff Member/Technical Lead</span>
                                <span class="job-dates">January 2014 - November 2016</span>
                            </li>
                            <li title="achievements">
                                <ul>
                                    <li>Led a globally distributed team that built the IBM Watson Conversation service - an innovative service to create rich conversational interfaces with natural language processing.</li>
                                    <li>Global team lead for Watson Developer Cloud Tooling. Created cutting edge applications for creating, training, and maintaining cognitive and machine learning solutions including Watson Engagement Advisor and IBM Watson Natural Language Classifier.</li>
									<li>Technical lead for Chef Watson and the IBM Food Truck - an innovative generative AI solution demonstrated in 2014 garnering more than 1 billion media impressions.</li>
                                    <!-- <li>Engineering and on-site lead for the Chef Watson and the IBM Food Truck at SXSW, which demonstrated generative AI based cognitive computing to more than 4,000 people and resulted in more than 1 billion media impressions.</li> -->
                                    <li>Researched, designed, and built tools to customize AI/ML models and systems at scale - supporting hundreds of thousands of users and use cases.</li>
									<li>Traveled around the world to conduct research with and work side-by-side with our customers to better understand the potential for AI/ML.</li>
                                    <li>Led evolution of internal development standards and tools from a legacy Java stack to a modern stack based on Node.js and embracing tools such a GitHub.</li>
                                    <!-- <li>Founding member of the IBM Watson business group within IBM</li> -->
								</ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.watson.ibm.com/">IBM TJ Watson Research Center</a></span>
                                <span class="job-location">Yorktown Heights, NY</span>
                                <span class="job-title">Research Staff Member</span>
                                <span class="job-dates">August 2009 - January 2014</span>
                            </li>
                            <li title="achievements">
                                <ul>
									<li>Team lead for the "Millennial Enterprise" aspect of IBM's 2013 Global Technology Outlook, which described the need for user data in building out AI/ML to IBM and customer C-Level executives.</li>
                                    <li>Analytics lead for JazzHub, IBM's cloud software development strategy. Designed analytics strategy, introduced A/B testing, and developed analytics dashboards.</li>
                                    <li class="no-print">Developed and designed <a href="https://github.com/pridkett/gitminer">GitMiner</a> - an open source project used by 15 universities to perform graph analysis on large scale software engineering repositories such as GitHub and BitBucket.</li>
                                    <li class="no-resume">Led a research team to evaluate productivity of new users and small teams using IBM's enterprise software engineering and product development environments.</li>
                                    <li>Published papers on topics around distributed collaboration, technical debt in software, and flow of ideas in software engineering communities.</li>
                                    <li class="no-resume">Developed WhatsMyBrand, a framework for assessing an individual's personal brand by analyzing connections and contents of their actions through public social networks and relating those actions to the actions of others in their network.</li>
                                    <li class="no-resume">Worked with IBM clients to teach about uncertainty and value elicitation in software development.</li>
                                    <li class="no-resume">Mapped extended stakeholders in enterprise software development and analyzed their relation to technical debt.</li>
                                    <li class="no-resume">Developed novel methods and metrics for understanding extended enterprise software development stakeholder collaboration and coordination.</li>
                                    <li class="no-resume">Managed research on collaboration in software development with three different universities through an Open Collaborative Research grant.</li>
                                    <li class="no-resume">Mentored three Ph.D. students on projects related to collaboration in software engineering.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job no-resume">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.cmu.edu/">Carnegie Mellon University</a></span>
                                <span class="job-location">Pittsburgh, PA</span>
                                <span class="job-title">Graduate Research Assistant</span>
                                <span class="job-dates">August 2003 - July 2009</span>
                            </li>
                            <li class="job-achievements">
                                <ul>
									<li>Conducted research on the interactions between people and firms in the development of open source software in a dual Ph.D. degree program between the School of Computer Science and College of Engineering.</li>
                                    <li>Designed and developed <a href="https://github.com/pridkett/cvsminer">CVSMiner</a> an open source tool to perform social network and technical analysis of software engineering ecosystems such as GNOME and Eclipse.</li>
                                    <li>Worked with members of the GNOME Foundation and Eclipse Foundation to evaluate and improve the relationships between non-profit foundations that manage open source ecosystems and commercial firms.</li>
                                    <li class="no-resume">Delivered lectures in classes on software engineering and technology policy.</li>
                                    <li>Utilized a variety of qualitative and quantitative research methods: stakeholder interviews, message analysis, natural language processing, data mining, machine learning, and social network analysis to generate insight into largely ad hoc software development processes.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job no-resume">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="http://www.watson.ibm.com/">IBM TJ Watson Research Center</a></span>
                                <span class="job-location">Hawthorne, NY</span>
                                <span class="job-title">Summer Research Intern</span>
                                <span class="job-dates">June 2007 - August 2007</span>
                            </li>
                            <li class="job-achievements">
                                <ul>
                                    <li>Expanded the Socio-Technical Congruence metric, which relates communication between individuals and technical dependencies inferred from archived data.</li>
                                    <li>Developed a model of successful projects that transitioned from IBM proprietary technologies to strong open source communities.</li>
                                    <li>Developed novel visualizations of communication and congruence in software development teams.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job no-resume">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="http://www.iit.edu/csl/cs/">Computer Science Department, Illinois Institute of Technology</a></span>
                                <span class="job-location">Chicago, IL</span>
                                <span class="job-title">Teaching/Research Assistant</span>
                                <span class="job-dates">September 2000 - August 2003</span>
                            </li>
                            <li class="job-achievements">
                                <ul>
                                    <li>Managed a group of twelve undergraduates to develop an ambitious automated tour system utilizing Segways and mobile devices for wireless location sensing and data in an era years before the iPhone and Android.</li>
                                    <li>Hired and managed three undergraduates to develop a python based framework for pervasive computing based on web services technologies.</li>
                                    <li>Designed graduate level class on grid and pervasive computing.</li>
                                    <li>Delivered numerous lectures on a wide variety of related to distributed computer, operating systems, and computer architecture.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job no-resume">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="http://www.mcs.anl.gov/">Argonne National Laboratory - Math and Computer Science Division</a></span>
                                <span class="job-title">Summer Research Intern</span>
                                <span class="job-location">Argonne, IL</span>
                                <span class="job-dates">April 2002-September 2002</span>
                            </li>
                            <li class="job-achievements">
                                <ul>
                                    <li>Developed the Grid Services Flow Language for specifying dependencies and flow in the GLOBUS environment.</li>
                                    <li>Worked with the SciDAC Java CoG Kit Team and the Collaboratory for Multiscale Chemistry to develop a grid services based system for analysis of thermochemical tables.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job, no-resume">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="http://www.lecltd.com/">LEC, Ltd</a></span>
                                <span class="job-location">Chicago, IL</span>
                                <span class="job-title">Senior Developer</span>
                                <span class="job-dates">April 1999-September 2000</span>
                            </li>
                            <li class="job-achievements">
                                <ul>
                                    <li>Designed, ordered, installed, and managed a commercial grade data center for advertising agency clients.</li>
                                    <li>Architected and developed E-Stakes, a multi-million user capable system for tying offline purchases to online activities.</li>
                                    <li>Designed and managed the technical components of the Chicago Transit Authority's "Take it and Win" promotion that utilized CTA transit cards to tie together offline and online behavior of transit riders.</li>
                                    <li>Worked directly with designers and clients to sell and develop usable, novel, and cutting edge web experiences.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job, no-resume">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="http://www.mypoints.com/">MyPoints</a></span>
                                <span class="job-location">Schaumburg, IL</span>
                                <span class="job-title">Developer</span>
                                <span class="job-dates">April 1998-September 1998</span>
                            </li>
                            <li class="job-achievements">
                                <ul>
                                    <li>Designed and implemented a complete customer relationship management system in PL/SQL and Java.</li>
                                    <li>Integrated customer service system to work with multiple advertising campaigns and custom co-branded sites.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
			<!-- /employment history -->
        <!-- education -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="heading extra-padding">Education</h3>
                <ul class="degree-listing">
                    <li class="degree">
                        <span class="degree-name">Ph.D. in <a href="http://www.epp.cmu.edu/">Engineering and Public Policy</a> and <a href="http://www.isri.cmu.edu/education/cos-phd/index.html">Computation, Organizations, and Society</a></span>
                        <span class="degree-date">May 2009</span>
                        <span class="degree-institution"><a href="http://www.cmu.edu/">Carnegie Mellon University</a></span>
                        <span class="degree-location">Pittsburgh, PA</span>
                        <span class="degree-description no-print">Thesis: "<a href="../thesis/">Vertical Interaction in Open Software Engineering Communities</a>". Advisors: <a href="http://herbsleb.org/">Dr. James Herbsleb</a> and <a href="http://www.casos.cs.cmu.edu/bios/carley/carley.html">Dr. Kathleen Carley</a>.</span>
                    </li>
                    <li class="degree">
                        <span class="degree-name">MS in <a href="http://www.isri.cmu.edu/education/cos-phd/index.html">Computation, Organizations, and Society</a></span>
                        <span class="degree-date">May 2007</span>
                        <span class="degree-institution"><a href="http://www.cmu.edu/">Carnegie Mellon University</a></span>
                        <span class="degree-location">Pittsburgh, PA</span>
                        <!-- <span class="degree-description">Intermediate degree awarded en route to my Ph.D.</span> -->
                    </li>
                    <li class="degree">
                        <span class="degree-name">MS in <a href="http://www.iit.edu/csl/cs/">Computer Science</a></span>
                        <span class="degree-date">August 2003</span>
                        <span class="degree-institution"><a href="http://www.iit.edu/">Illinois Institute of Technology</a></span>
                        <span class="degree-location">Chicago, IL</span>
                        <span class="degree-description no-print">Thesis: "<a href="../thesis/#msthesis">Scarlet: A Framework for Context Aware Computing</a>". Advisor: Dr. Xian-He Sun.</span>
                    </li>
                    <li class="degree">
                        <span class="degree-name">BS in <a href="http://www.iit.edu/csl/cs/">Computer Science</a> / BS in <a href="http://www.iit.edu/engineering/ece/">Computer Engineering</a> / BS in <a href="http://www.iit.edu/engineering/ece/">Electrical Engineering</a></span>
                        <span class="degree-date">May 2002</span>
                        <span class="degree-institution"><a href="http://www.iit.edu/">Illinois Institute of Technology</a></span>
                        <span class="degree-location">Chicago, IL</span>
                        <!-- <span class="degree-description">I was on scholarship and it seemed like a good idea to keep tacking on degrees.</span> -->
                    </li>
                </ul>
            </div>
        </div>
        <!-- /education -->
                <!-- skills -->
        <!--
        <div class="row" class="no-print">
            <div class="col-md-12" class="no-print">
                <h3 class="heading">Select Technical Skills</h3>
                <ul class="skill-listing">
                    <li><span class="skill-header">Programming Languages</span>
                        <ul class="skill-components">
                            <li>Python</li>
                            <li>SQL</li>
                            <li>Java</li>
                            <li>JavaScript</li>
                            <li>Shell</li>
                        </ul>
                    </li>
                    <li><span class="skill-header">Systems and Technologies</span>
                        <ul class="skill-components">
                            <li>Kubernetes</li>
                            <li>AWS</li>
                            <li>Docker</li>
                            <li>Linux</li>
                            <li>distributed systems architecture</li>
                            <li>relational databases</li>
                            <li>document databases</li>
                            <li>graph databases</li>
                            <li>data warehousing</li>
                        </ul>
                    </li>
                    <li><span class="skill-header">Machine Learning Frameworks and Libraries</span>
                        <ul class="skill-components">
                            <li>scikit-learn</li>
                            <li>TensorFlow</li>
                            <li>XGBoost</li>
                            <li>LIME</li>
                            <li>Shap</li>
                        </ul>
                    </li>
                    <li><span class="skill-header">Research Methods</span>
                        <ul class="skill-components">
                            <li>data mining</li>
                            <li>machine learning</li>
                            <li>uncertainty analysis</li>
                            <li>qualitative interviews</li>
                            <li>social network analysis</li>
                            <li>sentiment analysis</li>
                            <li>multi-attribute utility analysis</li>
                        </ul>
                    </li>
                    <li><span class="skill-header">Programming Languages</span>
                        <ul class="skill-components">
                            <li>Python</li>
                            <li>JavaScript</li>
                            <li>Java</li>
                            <li>SQL</li>
                            <li>R</li>
                            <li>C</li>
                        </ul>
                    </li>
                    <li><span class="skill-header">Other Assorted Skills</span>
                        <ul class="skill-components">
                            <li>DevOps architecture and deployment</li>
                            <li>CloudFoundry</li>
                            <li>Kubernetes</li>
                            <li>AWS</li>
                            <li>Agile methodologies and transformation</li>
                            <li>Linux system administration</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div> -->
        <!-- /skills -->
    </div>
</div>

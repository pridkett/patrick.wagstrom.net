---
title: "Resume"
name: "resume"
menu: "main"
draft: false
stylesheets:
  - href: /resume/resume.css
  - href: /resume/print.css
    media: print
---

<div class="resume-layout">
    <!-- sidebar -->
    <aside class="resume-sidebar">
        <div class="resume-portrait no-print">
            <img src="/resume/Headshot%20-%20Patrick%20Wagstrom%20-%2020221114%20-%20204x204.jpg" height="204" width="204" alt="A dazzling and beautiful professional headshot photograph of Patrick Wagstrom" id="profilepic">
        </div>
        <div class="resume-identity">
            <h1>Patrick Wagstrom</h1>
            <p class="resume-role">Data Engineering and Artificial Intelligence Leader</p>
        </div>
        <ul class="info-links">
            {{< infolink href="mailto:patrick@wagstrom.net" icon="fa-envelope" >}}patrick@wagstrom.net{{< /infolink >}}
            <!-- {{< infolink href="http://patrick.wagstrom.net/" icon="fa-globe" >}}https://patrick.wagstrom.net/{{< /infolink >}} -->
            {{< infolink icon="fa-globe">}}Coventry, CT{{< /infolink >}}
            {{< phonelink >}}
        </ul>
        <div class="resume-actions no-print">
            <a class="resume-action" href="wagstrom-resume-20210308.pdf"><i class="fa fa-download" aria-hidden="true"></i> Download</a>
            <button type="button" class="resume-action" onclick="window.print();"><i class="fa fa-print" aria-hidden="true"></i> Print</button>
        </div>
    </aside>
    <!-- /sidebar -->
    <!-- main body -->
    <div class="resume-body">
        <!-- general purpose -->
                <p>
                Strategic and hands-on executive leader in artificial intelligence, machine learning, data engineering, and software development, with experience across legal, finance, telecom, and video streaming. I drive cutting-edge AI/ML initiatives, build high-performing teams, modernize data pipelines, and deliver significant business value.
				<!-- I am a hands-on executive leader of data, machine learning, and software engineering organizations with broad experience in foundational research, finance, telecom, and video streaming. I build organizations that transform companies and markets with data driven insights and best of breed emerging technologies. -->
				</p>
        <!-- /general purpose -->
        <!-- critical skills -->
        <!-- <div class="resume-group">
            <div class="resume-group">
            <h2 class="resume-heading">Critical Skills</h2>
                <ul>
                    <li></li>
                    <li>B</li>
                    <li>C</li>
                </ul>
            </div>
        </div> -->
        <!-- /critical skills -->
        <!-- employment -->
        <section class="resume-section">
                <h2 class="resume-heading">Professional Experience</h2>
				<ul class="job-listing">
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://thomsonreuters.com/">Thomson Reuters</a></span>
                                <span class="job-location">Hartford, CT (Remote)</span>
                                <span class="job-title">Distinguished Engineer</span>
                                <span class="job-dates">January 2025 - Present</span>
                            </li>
                            <li title="achievements">
                                <ul>
                                    <li>Led engineering for development of Westlaw Advantage - our legal Deep Research solution and most successful product launch ever.</li>
                                    <li>Led overall work on initial CoCounsel Legal MCP server and our integration with Anthropic and Claude Legal as their first external plugin.</li>
                                    <li>Led engineering for Westlaw Brief Builder - our agentic solution that tackles some of the hardest legal challenges - drafting litigation briefs.</li>
                                    <li>Rationalized complex authorization, authentication, and integration with legacy systems and updating for an autonomous agentic driven world.</li>
                                    <li>Bring together engineers and scientists weekly to lead culture around agentic development with Agentic Coffeehouse series.</li>
                                    <li>Work directly with scientists and frontier AI labs on design, implementation, and evaluation of future model and agentic solutions.</li>
                                </ul>
                            </li>
                        </ul>
                    </li>
					<li class="job">
						<ul>
							<li class="job-info">
								<span class="job-employer"><a href="https://www.grainger.com/">Grainger</a></span>
								<span class="job-location">Chicago, IL and Hartford, CT (Hybrid)</span>
								<span class="job-title">Senior Director Applied ML</span>
								<span class="job-dates">July 2023 - August 2024</span>
								<span class="job-hours">Full Time (40 hours/week)</span>
							</li>
							<li title="achievements">
								<ul>
									<li>Led team of 43 FTE ML scientists, software engineers, and product managers on product search and discovery, LLM agents, computer vision, ML in mobile applications, data pipelines, and governance.</li>
									<li>Developed an LLM-based customer service agent using search and unstructured data with OpenAI on Azure to provide human-in-the-middle assistance to Grainger employees.</li>
									<li>Enhanced the search capabilities of Grainger.com, the 11th largest ecommerce site in the US, through introduction of vector and hybrid search.</li>
									<li>Led team that built out innovative synthetic data generation product identification using 3D CAD models, Stable Diffusion, and Unity.</li>
									<li>Designed the overall data architecture and MLOps integration - an S3 data lake with data products, Kafka event streaming, Databricks, Snowflake, and Atlan for data governance.</li>
									<li>Defined the ML Scientist job family across the company, integrated it into overall talent strategy, and partnered with legal to implement generative AI governance.</li>
								</ul>
							</li>
						</ul>
					</li>
					<li class="job">
						<ul>
							<li class="job-info">
								<span class="job-employer"><a href="https://www.brightcove.com/">Brightcove</a></span>
								<span class="job-location">Boston, MA and Hartford, CT (Hybrid)</span>
								<span class="job-title">Chief Data Officer</span>
								<span class="job-dates">May 2021 - December 2022</span>
							</li>
							<li title="achievements">
								<ul>
									<li>Responsible for all analytics, data, and machine learning at Brightcove - including engineering, governance, policy, and vendor relations.</li>
								    <li>Owned end-to-end analytics collection and processing systems handling trillions of rows of data and billions of monthly video views on both AWS and GCP.</li>
									<li>Managed an organization of 34 FTEs and 12 contractors, overseeing data platforms, analytics and insights, data and model governance, and customer-facing data products.</li>
									<li>Executed the $12.3 million acquisition of Wicket Labs, expanding Brightcove's viewer analytics capabilities and growing the product customer base by over 50x in under a year.</li>
									<li class="no-print">Collaborated closely with C-level executives at Brightcove and customers, driving corporate strategies and fostering strong business relationships.</li>
									<!-- <li>Championed initiatives to enhance engineering performance and implement effective performance management across the organization.</li> -->
									<li>Negotiated and owned a multi-million dollar partnership with Google Cloud Platform - securing a 7-figure discount.</li>
									<li>Maintained and expanded multi-cloud data infrastructure - Trino, Glue, Lambda, SageMaker, and Redshift on AWS; BigQuery, Composer, Dataflow, and Pub/Sub on GCP.</li>
									<!-- <li>Developed multi-modal video classification models using text transcripts, audio, and video processing.</li> -->
									<!-- <li>Directly conducted research on the impact of super-resolution algorithms on streaming, from holistic bandwidth, encoding cost, and device playback cost perspectives.</li> -->
									<!-- As Chief Data Officer I led all things data, analytics, and machine learning related at Brightcove. We break this up into three pillars - data and model governance, data platforms, and analytics/machine learning. -->
									<!-- On the governance front, we operate in a global environment and need to ensure that the data we collect and use is in compliance with local laws. Furthermore, we passionate about making sure that our models are built and deployed responsibly. -->
									<!-- For data platforms, Brightcove operates on AWS for our operational environment and GCP for our analytical environment. We make use of some of the best of breed technologies like Google BigQuery for large scale data analysis. We also maintain our environment for building and training models on AWS. -->
									<!-- Finally, for analytics and machine learning, we help the business solve relevant problems at massive scale. A single customer can often generate terabytes of data and getting insight out of this is non-trivial. We build the systems needed to generate those insights. But, we need to do more than look back, we also build models to look forward. Whether they're trying to classify types of users for churn or our ambitious Video Intelligence work, Brightcove is doing machine learning at scale. -->
								</ul>
							</li>
						</ul>
					</li>
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.verizon.com/">Verizon</a></span>
                                <span class="job-location">Basking Ridge, NJ and Hartford, CT (Hybrid)</span>
                                <span class="job-title">Director of Emerging Technology</span>
                                <span class="job-dates">September 2019 - April 2021</span>
								<!-- <span class="job-hours">Full Time (40 hours/week)</span> -->
                            </li>
                            <li title="achievements">
                                <ul>
								    <li>Built and managed a team of 9 FTEs and 51 vendor contractors with a $15 million annual budget, collaborating closely with CIO, CTO, and CDAO to influence corporate strategies.</li>
									<li>Worked alongside legal and policy experts to create several Verizon policies, including facial recognition, energy efficiency, model risk management, and data privacy.</li>
									<li>Developed cell site energy efficiency machine learning models, resulting in $5 million annual savings and the creation of a digital twin for future simulation.</li>
									<li>Led development of a model connecting online brand discussions to customer profiles, supporting customer service and patent-pending bot detection.</li>
									<li>Designed a new data architecture to migrate from ad-hoc on-prem Teradata and Hadoop solutions to a managed streaming data architecture with Google BigQuery.</li>
									<li class="no-print">Architected an enterprise strategy for reproducible machine learning and MLOps.</li>
									<li class="no-print">Led the software engineering dojos - intensive collaboration environments to improve engineering efficiency - until the onset of COVID-19 halted face-to-face interactions.</li>
									<!-- <li>Developed systems for blockchain based identity management and sim swap protection across mobile carriers.</li> -->
									<!-- I'm building a cutting edge team to chart the future for more than 100MM Verizon customers. We use machine learning, blockchain, augmented reality, and more to conduct experiments and build solutions that transform Verizon's ability to deliver amazing customer experiences across all of our product. -->
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.capitalone.com/">Capital One</a></span>
                                <span class="job-location">New York, NY and McLean, VA</span>
                                <!-- <span class="job-title">Senior Director of Data Science for Machine Learning Platforms</span> -->
                                <span class="job-title">Senior Director of Data Science</span>
                                <span class="job-dates">January 2019 - September 2019</span>
								<!-- <span class="job-hours">Full Time (40 hours/week)</span> -->
                                <!-- <span class="job-title">Director of Data Science for Machine Intelligence</span> -->
                                <span class="job-title">Director of Data Science</span>
                                <span class="job-dates">November 2016 - January 2019</span>
								<!-- <span class="job-hours">Full Time (40 hours/week)</span> -->
                            </li>
                            <li title="achievements">
                                <ul>
                                    <li>Architect and overall lead of the Capital One Card Machine Learning Platform - scalable, personalized, real-time reinforcement learning models on Kubernetes, gRPC, and AWS in a heavily regulated environment.</li>
									<li>Led a team that deployed and managed multi-modal customer intelligence models working on both structured and unstructured text and voice data, resulting in $27 million annual savings.</li>
                                    <li>Hired, managed, and developed a distributed team of 18 data scientists and data analysts.</li>
                                    <li class="no-print">Built out a $1.2mm academic research partnership with universities to explore responsibility and fairness in artificial intelligence.</li>
                                    <li class="no-print">Conducted more than 300 hiring interviews to help grow Card Machine Learning from 33 to 168 people and Capital One's New York Card team from 8 to nearly 200.</li>
									<li>Championed reproducible machine learning and MLOps across the organization, ensuring best practices in data management, model training and refit, model serving, and risk management.</li>
									<li class="no-resume">Collaborated with cross-functional teams to develop and implement the company's data privacy and AI ethics policies.</li>
                                </ul>
								<!-- 
I'm responsible for the Machine Learning Automation and Platform work within Capital One's US Credit Card business. We build scalable platforms to let data scientists use the tools they love (Dask, Spark, H20, SciKit-Learn, Tensorflow, Pytorch) to analyze terabytes of data in minutes and then deploy those real-time models to a Kubernetes cluster that scales to match load. All while continuing to be well-managed and well-monitored. We're hiring! If this sounds interesting, please reach out to me. -->
                            </li>
                        </ul>
                    </li>
                    <li class="job">
                        <ul>
                            <li class="job-info">
                                <span class="job-employer"><a href="https://www.ibm.com/watson/">IBM Research</a></span>
                                <span class="job-location">Littleton, MA and Yorktown Heights, NY</span>
                                <span class="job-title">Research Staff Member/Technical Lead</span>
                                <span class="job-dates">January 2014 - November 2016</span>
                                <span class="job-title">Research Staff Member</span>
                                <span class="job-dates">August 2009 - January 2014</span>
								<!-- <span class="job-hours">Full Time (40 hours/week)</span> -->
                            </li>
                            <li title="achievements">
                                <ul>
                                    <li>Led a globally distributed team that built the IBM Watson Conversation service - creating rich conversational interfaces with natural language processing.</li>
                                    <li>Global team lead for Watson Developer Cloud Tooling - applications to create, train, and maintain cognitive and ML solutions including Watson Engagement Advisor and Natural Language Classifier.</li>
									<li>Technical lead for Chef Watson and the IBM Food Truck - one of the first consumer facing generative AI solutions - garnering more than 1 billion media impressions in 2014.</li>
                                    <!-- <li>Engineering and on-site lead for the Chef Watson and the IBM Food Truck at SXSW, which demonstrated generative AI based cognitive computing to more than 4,000 people and resulted in more than 1 billion media impressions.</li> -->
                                    <li>Researched, designed, and built tools to customize AI/ML models at scale for hundreds of thousands of users.</li>
									<li>Team lead for the "Millennial Enterprise" chapter of IBM's 2013 Global Technology Outlook, presented to IBM and customer C-Level executives.</li>
									<li class="no-print">Traveled around the world to conduct research with and work side-by-side with our customers to better understand the potential for AI/ML.</li>
                                    <li class="no-print">Led evolution of internal development standards and tools from a legacy Java stack to a modern stack based on Node.js and embracing tools such a GitHub.</li>
                                    <!-- <li>Founding member of the IBM Watson business group within IBM</li> -->
                                    <li class="no-print">Analytics lead for JazzHub, IBM's cloud software development strategy. Designed analytics strategy, introduced A/B testing, and developed analytics dashboards.</li>
                                    <li class="no-print">Developed and designed <a href="https://github.com/pridkett/gitminer">GitMiner</a> - an open source project used by 15 universities to perform graph analysis on large scale software engineering repositories such as GitHub and BitBucket.</li>
                                    <li class="no-resume">Led a research team to evaluate productivity of new users and small teams using IBM's enterprise software engineering and product development environments.</li>
                                    <li class="no-print">Published papers on topics around distributed collaboration, technical debt in software, and flow of ideas in software engineering communities.</li>
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
        </section>
			<!-- /employment history -->
        <!-- education -->
        <section class="resume-section">
                <h2 class="resume-heading extra-padding">Education</h2>
                <ul class="degree-listing">
                    <li class="degree">
                        <span class="degree-name">Ph.D. in <a href="http://www.epp.cmu.edu/">Engineering and Public Policy</a> and <a href="http://www.isri.cmu.edu/education/cos-phd/index.html">Computation, Organizations, and Society</a></span>
                        <span class="degree-date">May 2009</span>
                        <span class="degree-institution"><a href="http://www.cmu.edu/">Carnegie Mellon University</a></span>
                        <span class="degree-location">Pittsburgh, PA</span>
                        <span class="degree-description">Thesis: "<a href="https://patrick.wagstrom.net/thesis/">Vertical Interaction in Open Software Engineering Communities</a>". Advisors: <a href="http://herbsleb.org/">Dr. James Herbsleb</a> and <a href="http://www.casos.cs.cmu.edu/bios/carley/carley.html">Dr. Kathleen Carley</a>.</span>
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
        </section>
        <!-- /education -->
                <!-- skills -->
        <!--
        <div class="resume-group" class="no-print">
            <div class="resume-group" class="no-print">
                <h2 class="resume-heading">Select Technical Skills</h2>
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

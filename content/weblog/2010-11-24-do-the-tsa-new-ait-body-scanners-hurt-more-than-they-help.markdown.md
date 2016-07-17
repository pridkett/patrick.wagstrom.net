---
date: '2010-11-24T13:57:00-05:00'
old:
  layout: post
  oldcategories:
  - freedom
  status: published
  timestamp: 01:57 PM Wednesday, November 24, 2010 EST
  wordpress_id: '872'
oldtags:
- ait
- backscatter
- mmwd
- risk analysis
- security
- tsa
- uncertainty
slug: do-the-tsa-new-ait-body-scanners-hurt-more-than-they-help
tags:
- risk analysis
- mmwd
- freedom
- ait
- security
- uncertainty
- backscatter
- tsa
title: Do the new TSA AIT body scanners hurt more than they help?
url: /weblog/2010/11/24/do-the-tsa-new-ait-body-scanners-hurt-more-than-they-help/
---

## Important
This report and analysis is still in the draft stage.  I'm open to new data, criticisms about my model, grammatical/writing fixes, and suggestions about how to make it better. There are three ways to leave me feedback.  You can leave a comment at the end of this post, post a comment on this [thread on Reddit](http://www.reddit.com/r/OperationGrabAss/comments/eb8s3/hi_reddit_i_did_the_math_and_found_that_tsa/), or [email me directly](http://www.google.com/recaptcha/mailhide/d?k=01d_KRRG_6LhPRiTD9fC4Tjw==&c=MyGA9SW3_9oN5pJPqJPrpR55FWn40q7KpXUM4MUHXoY=).

## Pending Improvements
Thanks to everyone on Reddit, Facebook, and folks in the comments who provided useful feedback.  Here's a preliminary list of items that I'll address in a revision:

  * Better display of graphs: On the cumulative probability graphs, draw some light lines to show the 10/90 window and the median so individuals are better able to see where these values actually lie.  Also, present an additional graph that shows the distribution of all events to make it obvious what the most likely outcome is.
  * Non-Normality of Terrorist Attacks: Using the expected value for terrorist attacks is somewhat misleading.  A single successful attack can kill hundreds of people.  Instead, I'll write some code to do event based modeling with four different scenarios: 1) Destruction of a cargo airliner (minimal fatalities), 2) Partial destruction of an aircraft (along the lines of a minor/major explosive decompression, like [Aloha Airlines flight 243](http://en.wikipedia.org/wiki/Aloha_Airlines_Flight_243), 3) Complete destruction of a medium - large jet with total loss of life, 4) Major event with multiple cascading destruction and significant ground fatalities.
  * Driving vs Flying: I probably over-estimated the number of people opting to drive -- it's clear that the general public doesn't see these things as a major issue (at least that's the TSA said, of course, many AIT scanners were off on the day before Thanksgiving).  More likely this should be between 0.25% and 1.0%.  The length of trips should also be better modeled to something like a triangular distribution between with low, most common, and high values of 200, 400, and 700 miles respectively. Even with these numbers, the story will most likely remain the same, the scanners are scaring people away from a safer form of transit in favor of a riskier one.
  * Subtraction of Other Risks for Drivers: Drivers have slightly lower risk in some areas than flyers, largely because of no radiation exposure at altitude and no risk of non-violent passenger incidents. It's going to make a small difference, but should be included for intellectual honesty.

# Executive Summary
The deployment by the [TSA](http://www.tsa.gov/) of advanced imaging technology (AIT) consisting of backscatter x-ray and millimeter wave detection devices when combined with the new enhanced pat-down procedures has the potential to reduce violent passenger incidents (aka, terrorist attacks on airplanes).  Given the current deployment levels of AIT scanners, these scanners will over a long time horizon only save approximately 2.4 lives a year, while inducing 3.4 incidents of fatal cancer per year over the same period.  Even more troubling is the increase in fatalities as people choose to drive when faced with the possible option of an intrusive enhanced pat-down, which can result in a median of 189 additional roadway fatalities a year.  All together this means that while the AIT program reduces the incidence of a low likelihood,  high risk and high profile terrorist attack, it induces a median of 190.7 deaths across other parts of American society.  Based on this data alone, the AIT will never be able to save more lives than it costs and the program should be considered a failure and stopped immediately.

# Introduction and Background
The last few weeks has seen absolute uproar over the new TSA advanced imaging technology (AIT) body scanners. In a nutshell, these devices, which utilize two different technologies allow TSA screeners to see underneath a persons clothing without the need for them to actually remove their clothing.  In fact, as we've seen, trying to be helpful to the TSA and [removing your clothing is grounds for arrest](http://www.signonsandiego.com/news/2010/nov/21/gun-crusader-strips-down-shorts-hauled-out-san-die/) (or being told to [put on a jacket if you're a porn star](http://www.boingboing.net/2010/11/21/my-tsa-stripdown-vid.html)). Concern over these devices comes in multiple different forms: privacy over the use of the images, radiation exposure from backscatter x-ray scanners, and concern over the invasiveness of the new enhanced pat-down procedures for individuals who chose to opt out of the AIT technology or who set off the traditional metal detector too many times.  I believe that all of these are legitimate concerns, however they are far beyond the scope of my expertise.

While there are many questions surrounding AIT, including which airports will be getting them next and what will happen in congress, one thing that I haven't seen is a robust analysis of the costs and risks involved in deploying the scanners across the country.  In this post, I'm going to put the [non-computer science part of my Ph.D.](http://www.epp.cmu.edu/) to work and walk through a pretty simple model that allows us to get a first order estimate of the number of lives saved or lost as a result of the AIT body scanners.  In a future post I'll go through some of the math on the dollar costs of the body scanners.

Firstly, there is a ton of uncertainty in the science of these scanners and the knowledge of how the public will react.  The fact is that the backscatter x-ray machines do emit radiation, although at very low levels.  The other type of machine, millimeter wave, does not emit radiation. Also, we're uncertain about how effective these machines are. They're only deployed at a fraction of airports and not all passengers need to go through them.  Even those that go through the scanners cannot be considered 100% effective at stopping a terrorist attack.  Mainly because of well known deficiencies in the scanners, such as their inability to scan body cavities and the fact that [PETN sewn into the waistband of underwear will not show up on a scanner](http://www.consumertraveler.com/columns/tsa-myths-and-facts). Furthermore, the public's reaction to these devices is unknown -- will people actually fly less because of the risk of going through a scanner or enhanced pat-down? What all this means is that we can't just create a simple set of equations for the model and get a single answer. Instead we need to think in terms of uncertainty and distributions.

There are a variety of great tools that can help us creates models with uncertainty.  Notable is [Analytica](http://www.lumina.com/ana/whatisanalytica.htm) from [Lumina Decision Systems](http://www.lumina.com/). Other systems exist, such as Crystal Ball, and a component developed by my team at work, Financier.  As a [CMU](http://www.cmu.edu/) student I had access to [Analytica](http://www.lumina.com/ana/whatisanalytica.htm), which would have been perfect for this, but my license expired after I received my doctorate. Financier might have worked, but I wanted to make sure that I'm 100% clear this analysis was done on my personal time and the opinions of this document do not reflect those of my employer.  No company software or hardware was used.

Instead, I took the basic premises that I needed to know and wrote a very simple simulation engine that handles uncertainty in [Python](http://www.python.org/).  You can [check all of the code from GitHub](https://github.com/pridkett/TSASimulation).  The code documents all of the input variables along with their sources and shows the complete set of equations for the output.  If you've got Python and the [pyparsing library](http://pyparsing.wikispaces.com/) installed on your system, you should be good to download and run the simulation.  Stats and graphs were created in [R](http://www.r-project.org/); the script for their generation is included in the archive.


# Model Inputs
For each of the model inputs, the best information possible was collected.  I should note, that I'm not an expert on radiation exposure or terrorism, but I do have quite a bit of psychology background and know how to dig at and critically evaluate numbers.

  * **Value of a Human Life:** $6.9M
**Source:** EPA 2008

  * **Risk of Dying from a Violent Passenger Incident:** 22 in 1 Billion (per flight)
**Source:** [Bruce Schneier's Analysis of Nate Silver's Numbers](http://www.schneier.com/blog/archives/2010/01/nate_silver_on.html)
I added uncertainty to make this a normal distribution with mean of 22 in 1 billion and standard deviation of 3 in 1 billion.

  * **Passenger Enplanements:** 621,000,000
**Source:** [http://www.transtats.bts.gov/](http://www.transtats.bts.gov/)
This number includes only domestic passengers.  I added uncertainty to create a normal distribution of 10 million passengers a year.  I acknowledge that international traffic increases this, but I haven't thought about how to deal with it yet.

  * **AIT Success Rate:** Uniformly distributed between 0.50 and 0.80
**Source: **My own estimate.
I'm trying to be optimistic about the success of these devices.  We know there are multiple things they can't pick up, like PETN sewn into clothing, so they'll never be 100%.

  * **Percentage of Passengers with AIT Screening:** Uniformly distributed 17% and 40%
**Source: ** [Steve Frischling contacted the TSA to get the full counts of checkpoints with AIT scanners.](http://boardingarea.com/blogs/flyingwithfish/2010/11/23/will-you-encounter-a-tsa-whole-body-scanner-statistically-no/)
I added uncertainty to this model.  Frischling's estimate of 17% is based on uniform passenger distribution across checkpoints.  I assume that passengers are larger airports are more likely to experience them. Therefore, it may be up to 40% of all passengers who have AIT screening as an option.

  * **Percentage of AIT Devices that are Backscatter:** Uniformly distributed between 30 and 75%
**Source:** [This thread on FlyerTalk tracks the distribution of the devices and their classification.](http://www.flyertalk.com/forum/travel-safety-security/1138014-complete-list-airports-whole-body-imaging-advanced-imaging-technology-scanner.html)
However, there have been numerous instances when individuals were mistaken about the type of device and had to update the document.  Therefore, while the page looks about 50/50, I added uncertainty.

  * **Passenger Exposure per Backscatter Screening:** Uniformly distributed between 0.20µSv and 0.80µSv
**Source:** The [TSA claims](http://blog.tsa.gov/2009/11/response-to-oops-backscatter-x-ray.html) backscatter machines max out at below the 0.25µSv limit set by the government.  This claim is countered by the work of[ Peter Rez at Arizona State University who found they may have a dose of as much as 0.80µSv]( http://www.public.asu.edu/~atppr/RPD-Final-Form.pdf).  This also does not address recent comments by [David Brenner of Columbia who believes that the approximately 1:20 people with a specific genetic mutation may be particularly sensitive](http://www.dailymail.co.uk/health/article-1290527/Airport-body-scanners-deliver-radiation-dose-20-times-higher-thought.html).

  * **Risk of Fatal Cancer per µSv of Exposure**: 1/12.5 Million
**Source:** [Slide 76 of this presentation]( http://www.slideshare.net/fovak/health-effects-of-radiation-exposure-presentation)
The presentation indicates that even a small dose of radiation may cause fatal cancer and that the response is roughly linear.  I extrapolated from the lowest level of radiation exposure on chart 76.  If someone has a better set of data for this, I'll gladly take it. I added uncertainty to make this a normal distribution with a mean of 1/12.5 million and standard deviation of 1/125 million.

  * **Fight Distance:** 500 miles
**Source**: My own estimate
The average distance for which an individual would be willing to drive over taking a flight. I based this on my cutoff line.  Admittedly, I've driven from Pittsburgh to Austin, TX in one shot and have routinely driven 18 hours in a day before.

  * **Percentage of Passengers Driving:** Uniformly distributed between 0.5% and 5%
**Source:** My own estimate, based loosely off various non-scientific polls.
I actually believe that this number skews more toward the lower end.  If anyone can come up with a better value, let me know.

  * **Fatalities per Mile of Driving:** 1.13/100 Million Miles
**Source:** [http://www-fars.nhtsa.dot.gov/Main/index.aspx](http://www-fars.nhtsa.dot.gov/Main/index.aspx)
Because this number is likely to fluctuate some each year, although it has generally been going down, I've modeled this as a normal with a mean of 1.13/100 Million and standard deviation of 0.1/100 Million Miles.

# Model
In brief, the model estimates the number of additional lives saved or lost because of AIT screening technology.  Lives can be saved by a reduction in the number of fatalities from violent passenger incidents. Lives can be lost by an increase in the number of people driving and an increase in fatal cancers because of backscatter radiation.

  * **Number of Passengers Driving:** Passenger Enplanements * Percentage of Passengers Driving
This is how man additional people will be on the road because of opting out of flying altogether.

  * **Number New Driving Fatalities:** Number of Passengers Driving * Flight Distance * 2 * Fatalities per Mile
The distance is multiplied by two here because passengers will need to drive both directions to their destination.

  * **Expected VPI Fatalities:** Risk of Dying from a Violent Passenger Incident * Passenger Enplanements
This is the current baseline number of fatalities expected in a given year.

  * **Expected AIT VPI Fatalities:** Risk of Dying from a Violent Passenger Incident * (1 - AIT Success Rate) * Passenger Enplanements * Percentage of Passengers with AIT Screening + Risk of Dying from a Violent Passenger Incident * Passenger Enplanements * (1 - Percentage of Passengers with AIT Screening)
AIT scanners are only effective where they are used.  This model assumes that the risk of a passenger initiating a VPI has not changed for those passengers not going through AIT.

  * **Expected Cancer Fatalities:** Passenger Enplanements * Percentage of Passengers with AIT Screening * Percentage of AIT Devices that are Backscatter * Passenger Exposure per Backscatter Screening * Risk of Cancer per &microSv of Exposure
As there is no safe level of radiation exposure, even a small amount can cause cancer.  Here we assume that only those passengers who are exposed to AIT backscatter screening are subject to an increase in their cancer risk.  We do not take into account the inherent increase in radiation from flying as that doesn't change. For purposes of simplicity, we also ignore the number of individuals who choose to drive.

  * **Increase in Fatalities due to AIT:** Number New Driving Fatalities + Expected Cancer Fatalities - (Expected VPI Fatalities - Expected AIT VPI Fatalities)
The total number of new deaths represented in the model minus the expected benefit from AIT.

# Model Outcomes
The model was run through 10000 iterations to produce a range of outcomes.  First, we'll start with the expected current number of fatalities from violent passenger incidents.  The skies over the United States have been safe from these incidents since 9/11, so this may be overstating the effect. According to my model the median number of passenger fatalities from VPIs on domestic flights is about 13.7 a year, with a 10/90 confidence window of 11.3-16.1 fatalities a year.  [A Boeing 737 seats around 162 passengers](http://en.wikipedia.org/wiki/Boeing_737), so this means one VPI resulting in total loss of all passengers on a Boeing 737 sized plane ever 12-13 years.

<div class="image caption center">
    <img src="/weblog/media/2010/11/expected_vpi_fatalities.png" alt="Expected Fatalities from Violent Passenger Incidents (VPIs)">
    <p>Expected Fatalities from Violent Passenger Incidents (VPIs)</p>
</div>

With the introduction of the AIT devices at their current deployment levels, the median expected number of fatalities from VPIs is down to 11.1 a year, with a 10/90 confidence window of 9.0-13.3 fatalities a year.

<div class="image caption center">
    <img src="/weblog/media/2010/11/expected_ait_vpi_fatalities.png" alt="Expected Fatalities from VPI with AIT in Place">
    <p>Expected Fatalities from VPI with AIT in Place</p>
</div>

It's quickly apparent there there is little difference between these values.  With AIT there is a median improvement of 2.44 fatalities a year, and even in the best case out of the 10,000 simulations only 6.2 additional lives were saved per year.  From a purely monetary perspective, using the EPA's value of $6.9M/life, the AIT project saves $16.84M a year.  I'm almost certain that the program will cost more than from a strict dollar perspective.

Next, lets examine the increased risk of cancer from these devices.  It's believed that any exposure to radiation, no matter how small the dose, increases the chance of cancer.  The TSA has pointed out that under their specifications, backscatter x-ray machines emit about the same amount of radiation as two minutes of flying time (about 0.2µSv).  However, as stated, physics professor Peter Rez has calculated that the likely exposure from a functioning machine is much greater. Using the data from Professor Rez along with known exposure guidelines and the uncertainty in the model, we see there is a median of 3.4 additional cancer fatalities per year, and a 10/90 confidence window of 1.5 to 6.3. The maximum number of new cancer fatalities 11.6/yr. This increase in cancer alone outweighs the median number of lives saved from AIT scanning.

<div class="image caption center">
    <img src="/weblog/media/2010/11/expected_cancer_ait_fatalities.png" alt="Expected Fatalities from Cancer as a Result of Radiation From Backscatter X-Rays">
    <p>Expected Fatalities from Cancer as a Result of Radiation From Backscatter X-Rays</p>
</div>

However, there is a slightly more insidious and much more dangerous factor in play.  The mere presence of AIT technology in airports and the possible consequences of an enhanced pat-down will lead some to choose to drive rather than fly.  While there have been some reports that show that as many as 20% [citation needed] of people will reconsider flying because of the enhanced pat-down, I considered the estimates to be far lower.  In my model, the median number of people driving was about 17,000,000 with a 10/90 confidence window of 5,800,000 to 28,500,000.  These numbers may seem a little high, but that's only about 2% of flights being exchanged for a drive of around 500 miles.  Roughly equivalent to a family deciding to drive from Chicago to Minneapolis for Christmas.

<div class="image caption center">
    <img src="/weblog/media/2010/11/expected_passengers_driving.png" alt="Expected Number of Passengers Choosing to Drive instead of Fly">
    <p>Expected Number of Passengers Choosing to Drive instead of Fly</p>
</div>

Unfortunately, driving is a much riskier endeavor than flying.  In fact, you're more likely to be killed driving to the airport than you are on a plane. Of these people making 1000 mile long round trips, it's likely that we'll see about 189 new fatalities with 10/90 confidence window of 65.6 to 321.3 fatalities.  This is a grim picture, indeed.

<div class="image caption center">
    <img src="/weblog/media/2010/11/expected_driving_fatalities.png" alt="Expected Fatalities from Passengers Choosing to Drive Instead of Flying">
    <p>Expected Fatalities from Passengers Choosing to Drive Instead of Flying</p>
</div>

Finally, we can take the complete picture; the benefit of the AIT machines versus the increased deaths from driving and cancer and see the total increase in fatalities.  In this case, it's not pretty at all.  The use of AIT machines and enhanced pat-downs, when combined with their associated stigma can be expected to cause an additional 190 deaths a year with 10/90 confidence window 67 to 323.  That's the equivalent of all the passengers on a 737 and then some EVERY YEAR as a result of the AIT scanning devices.

<div class="image caption center">
    <img src="/weblog/media/2010/11/expected_ait_fatality_increase.png" alt="Expected Increase in Fatalities as a Result of AIT Scanning">
    <p>Expected Increase in Fatalities as a Result of AIT Scanning</p>
</div>

# Shortcomings
One of the problems with pinpointing deaths is that massive deaths at the same time have a significantly greater impact on public perception than a large amount of distributed deaths that aren't always directly attributable.  For example, emissions from coal fired power plants kill significant numbers of people and yet most people are much more scared of nuclear plants because of their potential for an extremely high risk, yet low probability event.  When these events happen react in such a way that the impact is magnified.  More directly, the 9/11 terrorist attacks caused tens of thousands of Americans to cancel their travel plans and businesses to delay investment, which contributed to sending a shaky economy into recession.  This despite the fact that the number of people killed in the attacks was roughly the same number of people killed in a month in traffic accidents across the country or the number of people killed by cancer and heart disease on a DAILY basis. I have no doubt that even the bombing of a cargo flight, with minimal loss to human life, will have a significant and detrimental effect to the American economy, which this simulation cannot model.

This model also does little to address the costs of the screening.  There is not only the cost of the screening devices, but also training of employees, reconfiguration of checkpoints, loss of time for travelers, and treatment for cancer induced by backscatter x-ray.  A robust model would include these, but there is little doubt that the result will remain the same.

# Conclusion
The overall risk of deploying AIT scanners is significant given their potential benefit.  An median increase of 190 deaths per year can be expected as the result of increases in cancer from screening and increased road fatalities from people opting out of flying and driving to their destination.  From a pure human life perspective, the AIT proposition is a failure.  Even discounting the fatalities from driving, at current deployment levels AIT devices can be expected to induce 3.3 additional cases of cancer a year while only saving 2.4 additional lives per year. Elimination of the backscatter devices and replacement with millimeter wave detection devices may prove to be a suitable replacement given these substantial health risks.

# Next Steps
I still consider this analysis in a draft form.  As I can find better information I'll update the model.  If you have suggestions on ways to improve the analysis please leave them in the comments.  After I feel that this has been properly vetted, I'm going to send this to [my](http://klobuchar.senate.gov/) [senators](http://franken.senate.gov/) and [congressman](http://ellison.house.gov/) -- all of which are generally pretty awesome.
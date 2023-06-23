---
title: "Powerwalls and Eversource Battery Demand Response - How Much Did I Make in 2022?"
slug: powerwall-and-battery-demand-response
date: 2023-06-23T08:00:00-04:00
tags:
- tesla
- solar
- energy
- powerwall
- electricity
url: /weblog/2023/06/23/powerwall-and-battery-demand-response
comments: true
---

Over the last couple of weeks, Texas has faced a massive heatwave and their misregulated electric grid has once again began to strain. Thankfully, this has been less of an issue than the deep freeze in early 2021. It also has presented an opportunity to owners of home storage batteries who have been able to sell energy for [more than $5/kWh](https://www.reddit.com/r/TeslaSolar/comments/14enr1s/wow_glad_i_have_power_to_sell_right_now/), sometimes [netting themselves more than $100/day](https://www.reddit.com/r/TeslaSolar/comments/14feq6x/texas_tesla_electric_customers_owners_lets_see/).

Here in Connecticut, our grid is typically in slightly better shape than Texas. We don't have the same sort of [Tesla Electric option](https://www.tesla.com/electric), but we do have a [battery demand response program from Eversource](https://www.eversource.com/content/residential/save-money-energy/energy-efficiency-programs/demand-response/battery-storage-demand-response), our "friendly" local utility. In short, the program works as follows:

* You enroll your Powerwalls
* During the summer, between 30-60 times you'll send electricty back to the grid during a declared "event"
* Each event will last about two hours and take place between 2-7pm
* Your battery provider will send you a check sometime later in the winter for the amount of energy you provided

Annoyingly, there's no fine grained control of this. I remember as Hurricane Henri was coming toward us, the battery demand response kicked in and drained my batteries right before a hurricane. The _only_ way to prevent this is to go off grid once you've enrolled.

So, this got me wondering, how much money did I make from the program last year?

In early February, I received a check from Tesla from $1889.42.

I make use of the [powerwall_monitor project](https://github.com/mihailescu2m/powerwall_monitor) to give me fine grained information about my electricity usage. This information is stored in an InfluxDB database.

Here's the high level summary:

* In 2022 there were **41 events** during which my powerwall and solar setup sent energy back to the grid.
* On average, I sent 25.11kWh to the grid during each of these events.
* In total, I sent 1029kWh to the grid during these events.
* For an **average price of $1.84/kWh** and average of **$46.08/event**.

Not bad for not a days work.

If you're interested in the math, I've [published the script I used for the math on GitHub](https://github.com/pridkett/connected-solutions-math/) under an MIT license.

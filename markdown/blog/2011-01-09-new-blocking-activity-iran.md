---
layout: post
title: "New Blocking Activity from Iran"
permalink: new-blocking-activity-iran
date: 2011-01-09 22:58:30
author: phobos
category: blog
comments: disabled
tags: ["censorship", "deep packet inspection", "great persian firewall", "internet censorship", "iran"]
---

Over the past 48 hours it seems the Great Persian Firewall is updating to attempt to block a number of circumvention tools, including Tor. Iranians and their diaspora have been reporting to us that Tor, Hot Spot Shield, UltraSurf, and Freegate are all experiencing connectivity problems from inside Iran to the outside world.

Our research indicates that ssl-based communications are being throttled to 2 kilobit per second rates or simply blocked altogether. This is inclusive of basic ssh, ssl, vpns, and other proxy technologies. We're continuing to work on what's really happening and likely means to counter. The short answer is to [use bridges](https://www.torproject.org/docs/bridges.html.en) that are not on port 443.

Some graphs to show the results on Tor from our [Tor metrics portal](https://metrics.torproject.org).

Bridge users from Iran:

![](https://blog.torproject.org/files/bridge-users-2011-01-10-ir-2010-10-12.png)

<!-- more -->

Direct connections from Iran:

![](https://blog.torproject.org/files/direct-users-2011-01-10-ir-2010-10-12.png)

<table>
<thead>
<tr class="header">
<th align="left">Attachment</th>
<th align="left">Size</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><a href="https://blog.torproject.org/files/bridge-users-2011-01-10-ir-2010-10-12.png">bridge-users-2011-01-10-ir-2010-10-12.png</a></td>
<td align="left">11.25 KB</td>
</tr>
<tr class="even">
<td align="left"><a href="https://blog.torproject.org/files/direct-users-2011-01-10-ir-2010-10-12.png">direct-users-2011-01-10-ir-2010-10-12.png</a></td>
<td align="left">14.92 KB</td>
</tr>
</tbody>
</table>



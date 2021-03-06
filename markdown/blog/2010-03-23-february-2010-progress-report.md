---
layout: post
title: "February 2010 Progress Report"
permalink: february-2010-progress-report
date: 2010-03-23 20:26:36
author: phobos
category: blog
comments: closed
tags: ["advocacy", "performance enhancements", "progress report"]
---

**New releases**

<!-- more -->

-   On February 13, we released a new stable version of Tor, 0.2.1.23. Tor 0.2.1.23 fixes a huge client-side performance bug, makes Tor work again on the latest OS X, and updates the location of a directory authority.
-   On February 21st, we released an update Tor stable in 0.2.1.24. Tor 0.2.1.24 makes Tor work again on the latest OS X – this time for sure!
-   On February 22, we released the latest in the -alpha series, 0.2.2.9-alpha.
-   On February 15th, we released an updated Tor Browser Bundle; version 1.3.2.
-   On February 27th, we released an updated Tor Browser Bundle, version 1.3.3.
-   On February 18th, Tor for the Nokia Maemo mobile platform was announced. [https://blog.torproject.org/blog/tor-nokia-n900-maemo-gsm-telephone](https://blog.torproject.org/blog/tor-nokia-n900-maemo-gsm-telephone "https://blog.torproject.org/blog/tor-nokia-n900-maemo-gsm-telephone").
-   On February 7th, volunteers released a new beta of the Amnesia LiveCD, version 0.4.2. Amnesia is the merging of two projects, one of which is the Incognito LiveCD.

**Design, develop, and implement enhancements that make  
 Tor a better tool for users in censored countries.**

Work continues to improve the Tor ports for Android, Maemo, and iPhone.

We worked with Ian Goldberg at University of Waterloo to come up with a plan for one of his grad students to continue working on “Nymbler”, which is a framework they’re working on that will allow Tor users to remain anonymous yet prove to websites like Wikipedia and Slashdot that they are not jerks (or at least, not yet known to be jerks). This anonymous authentication approach will hopefully be a step toward letting Tor users post to Wikipedia again; but it is still in its very early stages.

Along these same lines, the Freenode IRC channel has been experimenting with a new way to allow Tor users to interact in their chat rooms while still being able to contain the abuse potential: [http://blog.freenode.net/2010/01/connecting-to-freenode-using-tor-sasl/](http://blog.freenode.net/2010/01/connecting-to-freenode-using-tor-sasl/ "http://blog.freenode.net/2010/01/connecting-to-freenode-using-tor-sasl/").

**Architecture and technical design docs for Tor enhancements related to blocking-resistance.**

Roger, Karsten, Steven met with Paul Syverson and Aaron Johnson at UT Austin to continue basic research on designs to let Tor users take advantage of local knowledge of how safe various Tor relays are in order to build safer paths through the network. The first goal is to answer questions like “If I believe that these relays are monitored by the Chinese government, then avoiding them will improve my security, but avoiding them could also stand out because I behave differently than other Tor users; what’s the right balance?” The second goal is to figure out how path selection should work when the user runs one of the relays herself, and thus knows it’s more trusted. The third goal is to come up with intuitive interfaces for letting users specify which parts of the network they trust more, while at the same time explaining the security implications of each choice.

Roger and Karsten also met with Vitaly Shmatikov to learn more about his recent work on “differential privacy”, which is an academic approach to making sure that numbers in databases do not leak too much identifying information. This question needs more attention because of the way Tor is computing and publishing “sanitized” user statistics on its metrics portal.

Roger also finished the first draft of his “Ten things to look for in tools that circumvent Internet censorship” document that we hope will eventually be a useful primer for policy people getting involved in this space: [https://svn.torproject.org/svn/projects/articles/circumvention-features....](https://svn.torproject.org/svn/projects/articles/circumvention-features.html "https://svn.torproject.org/svn/projects/articles/circumvention-features.html")

**Grow the Tor network and user base. Outreach.**

-   Roger spoke to the Philadelphia Linux Users’ Group about Tor and censorship. Several of the members are now looking at volunteering on Tor development. Roger also did a talk on Tor for undergraduates in Drexel University’s security class.
-   Andrew joined EDRI, [http://www.edri.org](http://www.edri.org "http://www.edri.org"), in a discussion with Members of European Parliament. and their staff along with senior staff from the European Commission Directorate-General - Justice, Freedom, Security about censorship, data retention, and online privacy.
-   Andrew gave a Tor talk to around 500 people at FOSDEM, [http://www.fosdem.org](http://www.fosdem.org "http://www.fosdem.org").
-   Andrew, Roger, and Karen met with Access, [http://accessnow.org](http://accessnow.org "http://accessnow.org"), to discuss a bridges4tor campaign to increase the number of Tor Bridges, [https://www.torproject.org/bridges](https://www.torproject.org/bridges "https://www.torproject.org/bridges"), for users in censored countries.
-   Steven spoke to around 80 people at Secure Application Development 2010, [http://secappdev.org/](http://secappdev.org/ "http://secappdev.org/"), in Groot Begijnhof, Leuven, Belgium.
-   We worked with Susan Landau to help her better understand Tor in the context of freedom, privacy, and circumvention tools, so that her upcoming book on the subject can be more accurate.
-   We worked with Dave Dittrich and other researchers in the botnet community to investigate a set of suspicious Tor relays that appeared to be associated with a bot network the researchers were tracking. We eventually decided to cut these suspicious relays out of the Tor network.
-   We talked a little bit with the fellow writing a circumvention tool called Puff. On the one hand, it looks like yet another centralized proxy where the operator could screw the users but promises not to. On the other hand, he seems technically savvy and he seems to really care about doing the right thing. We should talk with him more to help him improve the safety that his service can provide.

**Bridge relay and bridge authority work.**  
 We’re currently researching how to turn every tor client into a bridge by default, if the client finds itself reachable externally. This will dramatically increase the available bridges. There are some new attacks and challenges to overcome before this can be deployed as part of a -stable release, but we expect by Q3 2010 to have this into -alpha releases.

**Scalability, load balancing, directory overhead, efficiency.**  
 From the 0.2.2.9-alpha changelog:

> We were selecting our guards uniformly at random, and then weighting which of our guards we’d use uniformly at random. This imbalance meant that Tor clients were severely limited on throughput (and probably latency too) by the first hop in their circuit. Now we select guards weighted by currently advertised bandwidth. We also automatically discard guards picked using the old algorithm. Fixes bug 1217; bugfix on 0.2.1.3-alpha. Found by Mike Perry.

**More reliable (e.g. split) download mechanism.**  
 Enhanced the metrics portal with numbers from the get-tor email autoresponder, [http://metrics.torproject.org/gettor-graphs.html](http://metrics.torproject.org/gettor-graphs.html "http://metrics.torproject.org/gettor-graphs.html").

**Footprints from Tor Browser Bundle.**  
 We’ve picked up the work towards a Tor Browser Bundle for OS X and Linux, and hope to have experimental bundles for at least one of those platforms ready in March. Soon after they’re ready for testing, we’ll want to start looking at how footprints from running the bundle differ on each platform.

**Translation work, ultimately a browser-based approach.**  
 Translated content updates for Torbutton, Tor Browser, Website, General Documentation, Vidalia interface, and TorCheck in Chinese, German, French, Italian, Dutch, Norwegian, Polish, Russian, Arabic, Farsi, Burmese, Spanish, Swedish, and Turkish.

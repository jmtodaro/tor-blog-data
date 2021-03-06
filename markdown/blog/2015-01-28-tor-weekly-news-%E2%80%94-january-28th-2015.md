---
layout: post
title: "Tor Weekly News — January 28th, 2015"
permalink: tor-weekly-news-—-january-28th-2015
date: 2015-01-28 07:00:00
author: harmony
category: blog
comments: disabled
tags: ["tor weekly news"]
---

Welcome to the fourth issue in 2015 of Tor Weekly News, the [weekly newsletter](https://lists.torproject.org/cgi-bin/mailman/listinfo/tor-news) that covers what’s happening in the Tor community.

The future of Private Browsing Mode
===================================

Mozilla Firefox, on which Tor Browser is based, offers users a “Private Browsing Mode” that aims solely to prevent browsing information from being saved locally. As Georg Koppen [pointed out](https://lists.torproject.org/pipermail/tbb-dev/2015-January/000217.html), “The question is now how to treat the other privacy-relevant areas like cross-origin linkability or fingerprinting?”

Georg proposed a “Private Browsing Mode+”, which would integrate the disk-avoidance, anti-tracking, anti-fingerprinting, and location-concealing elements of a privacy-preserving browser in a more logical way.

Miscellaneous news
==================

After a “[pretty big overhaul](https://lists.torproject.org/pipermail/tor-dev/2015-January/008211.html)”, Damian Johnson announced that [Stem](https://stem.torproject.org/), the Tor controller library, now “lazy-loads” descriptors, resulting in a [considerable speed increase](https://gitweb.torproject.org/stem.git/commit/?id=3dac7c5) when reading network documents. “Note that descriptor validation is now opt-in rather than opt-out, so if you’d prefer validation over performance you’ll now need to include ‘validate = True’.”

The Tails team [set out](https://mailman.boum.org/pipermail/tails-dev/2015-January/007945.html) the release schedule for Tails 1.3, and also published its [Code of Conduct](https://tails.boum.org/contribute/working_together/code_of_conduct/).

Arturo Filastò [reported](https://lists.torproject.org/pipermail/ooni-dev/2015-January/000238.html) on OONI-related activities at the Nexa Center’s [NNTools2015](http://nexa.polito.it/nntools2015) event.

Patrick Schleizer [wondered](https://lists.torproject.org/pipermail/tor-talk/2015-January/036581.html) how Tor Browser could be made to act more like a “system tor”, and sketched out a [possible plan](https://bugs.torproject.org/14121): “What do you think about this proposal in general?”

* * * * *

This issue of Tor Weekly News has been assembled by Harmony.

Want to continue reading TWN? Please help us create this newsletter. We still need more volunteers to watch the Tor community and report important news. Please see the [project page](https://trac.torproject.org/projects/tor/wiki/TorWeeklyNews), write down your name and subscribe to the [team mailing list](https://lists.torproject.org/cgi-bin/mailman/listinfo/news-team) if you want to get involved!

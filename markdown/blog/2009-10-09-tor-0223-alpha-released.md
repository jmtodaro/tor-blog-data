---
layout: post
title: "Tor 0.2.2.3-alpha released"
permalink: tor-0223-alpha-released
date: 2009-10-09 22:52:34
author: phobos
category: blog
comments: disabled
tags: ["alpha release", "bug fixes"]
---

On September 23rd, we released Tor version 0.2.2.3-alpha.

**Major bugfixes:**

-   Fix an overzealous assert in our new circuit build timeout code.  
     Bugfix on 0.2.2.2-alpha; fixes bug 1103.

**Minor bugfixes:**

-   If the networkstatus consensus tells us that we should use a  
     negative circuit package window, ignore it. Otherwise we'll  
     believe it and then trigger an assert. Bugfix on 0.2.2.2-alpha.

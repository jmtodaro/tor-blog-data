---
layout: post
title: "Trip report: Tor trainings for the Dutch and Belgian police"
permalink: trip-report-tor-trainings-dutch-and-belgian-police
date: 2013-02-05 18:18:35
author: arma
category: blog
status: closed
tags: ["internet censorship", "law enforcement", "trip report"]
---

In January I did Tor talks for the Dutch regional police, the Dutch national police, and the Belgian national police. Jake and I also did a brief inspirational talk at [Bits of Freedom](https://www.bof.nl/home/english-bits-of-freedom/), as well as the closing keynote for the Dutch [National Cyber Security Centre](https://www.ncsc.nl/english)'s yearly [conference](https://www.ncsc.nl/english/conference).

You may recall that one of my side hobbies lately has been teaching law enforcement about Tor — see my previous entries about [teaching the FBI about Tor](https://blog.torproject.org/blog/trip-report-october-fbi-conference) in 2012 and visiting the [Stuttgart](https://blog.torproject.org/blog/talking-german-police-stuttgart) detectives in 2008 back when we were discussing data retention in Germany. Before this blog started I also did several Tor talks for the US DoJ, and even one for the Norwegian [Kripos](http://en.wikipedia.org/wiki/National_Criminal_Investigation_Service_%28Norway%29).

Now is a good time to talk to the Dutch police, first because they're still smarting from the [DigiNotar disaster](http://en.wikipedia.org/wiki/DigiNotar) in 2011, but second because of their 2012 ambitions to [legalize](https://www.bof.nl/2012/10/18/dutch-proposal-to-search-and-destroy-foreign-computers/) breaking into foreign computers when they aren't sure what country they're in. (I say legalize because [they already did it!](https://lists.torproject.org/pipermail/tor-talk/2011-September/021198.html))

Below are some discussion points that made an impression on me.

-   I started the trip with a [talk](http://freehaven.net/~arma/slides-dex13.pdf) to about 80 people from the Dutch regional police. Apparently each regional police group has basically one cybercrime person, and pretty much all of them came to learn about Tor. These are the people who advise their police groups about how to handle Tor cases, so they're exactly the ones who need to know about services like [ExoneraTor](https://metrics.torproject.org/exonerator.html). (Afterwards, one of the national police thanked me heartily for teaching the regional police about Tor, since it makes \*his\* job easier.)
-   One issue that came up repeatedly during the talks: what if a bad guy runs a Tor exit relay to provide plausible deniability when somebody shows up as his door? My first thought is that anybody who runs a Tor exit relay in order to attract \*less\* attention from the police is crazy: if you want to be ignored, you should use a botnet or whatever to do your bad things, nobody will learn that it's you, end of story. Until we educate every law enforcement person on the planet about Tor, there will always be people who raid every IP address on their suspect list without ever knowing what Tor is. The second point they found interesting was that Tor relays never write any traffic to disk; so if your suspect has bad stuff on his hard drive and says it was because of the Tor relay, he's lying. Of course, disk encryption complicates the situation (which is why, counterintuitively, [we recommend \*not\* using disk encryption](https://trac.torproject.org/projects/tor/wiki/doc/TorExitGuidelines) on your exit).
-   Did you know that the Dutch police have their own internal anonymity network? They started out using a secret subnet ("nobody knows that it's the Dutch police, until somebody figures out that it is"). Apparently now they do smarter things like grabbing addresses from Dutch ISPs so they can blend in better. But that's still not perfect: if they borrow an IP address for 36 hours, then that's a 36-hour window where if you can recognize any of the traffic as Dutch police, you can link the rest of the traffic to them too. I hear their new generation of client-side software has an option for using Tor; I wonder if that means the Tor Browser Bundle, or just tunnelling the traffic through Tor naked? More details [here](https://www.security.nl/artikel/41028/1/Politieprovider_laat_agenten_anoniem_rechercheren.html) and [here](http://www.nctv.nl/Images/security-infrastructure-for-irn_tcm126-444149.pdf). (Two points for transparency and open standards!)
-   When we met with the US DEA earlier in January, many people there said they use Tor for their job. Most people in the Dutch national police meeting said they used it often. On the other hand, most people in the Dutch regional police meeting said they certainly did not use it, "because that would be inappropriate." We have some more educating left to do.
-   One regional Dutch police woman told us that they know how to check if it's a Tor exit IP, but sometimes they do the raid anyway "to discourage people from helping Tor." I later told that statement to one of the national police, and he was shocked, said that was illegal, and said he'd look into it. Alas, I'm not optimistic that anything will come of it: giving investigators discretion about how to act can be both good and bad.
-   It took me a few hours to get the regional police comfortable enough to discuss, but by the end they were answering each other's questions — which is one of my main goals, since I won't be there later to answer them. The best example was one detective who stood up and explained that in his opinion they are focusing way too much on Tor ("because we can't break it"), while at the same time there are many other crimes they \*can\* fight, like criminals using file sharing networks, and they're ignoring those. Certainly Tor gets a lot of publicity (last year a [Dutch TV show](http://www.sbs6.nl/programmas/undercover-in-nederland/over) stirred up a media fear frenzy about Tor that resulted in a Dutch Parliament member calling to ban it), but according to this detective there's a lot more crime elsewhere. My response: "Did everybody hear that?" It works best when police hear statements like this from their peers rather than from me.
-   Here's an argument based on discussions with Karen Reilly for responding about child porn and banning Tor. A lot of people think that it's about trading off the good for the bad. On the one hand, you have a girl in Syria who is alive right now because of Tor. On the other hand, you have a girl in America who is harmed by some jerk and the jerk uses Tor. So, how do you balance these two? How do you decide which one is more important, or more 'valuable' to the world? The answer is that it's the wrong question to ask: you aren't actually going to save the girl in America by getting rid of Tor. Whereas getting rid of Tor \*would\* harm the girl in Syria (along with a wide variety of people and groups around the world).
-   The day after I did the talk to the regional police, I did a short talk at [Bits of Freedom](https://www.bof.nl/home/english-bits-of-freedom/), an EFF-like digital rights nonprofit in Amsterdam. They held a "Boffel" for many of their supporters to show up and socialize. It was a really great crowd — these are smart people who care. It was like a tiny [CCC](https://blog.torproject.org/blog/trip-report-29c3) congress. And now that I've been clearly complimentary to them, you'll be able to properly interpret my next statement: many of the Dutch police would have fit in just fine at the Boffel. People came up to me at the NCSC conference days later and said "I liked your talk!" and I genuinely couldn't tell if they meant my talk at the regional police or my talk at Bits of Freedom. There were some exceptions, sure, but most of the Dutch police I talked to have somehow managed to not get ground down by their job and lose track of the civil liberties angle. I wonder what their trick is.
-   Rejo Zenger (from BoF) and two others are working to create a Dutch organization to run fast Tor exit relays, to gather donations and centrally handle abuse complaints — like [Zwiebelfreunde](https://www.torservers.net/) in Germany, [Nos Oignons](http://nos-oignons.net/) in France, [DFRI](https://dfri.se/) in Sweden, and [NoiseTor](http://noisetor.net/) in the US. That's great! Please help them out however you can.
-   At the NCSC conference, Jake and I did an open Q&A session on the first day, and did the closing keynote ([slides](http://freehaven.net/~arma/slides-ncsc13.pdf)) on the second day. Both talks went very well (imagine what would happen if Jake and I practiced any of our talks together before giving them! :). We now have invites to come to all sorts of [CERTs](http://en.wikipedia.org/wiki/CERT_Coordination_Center) around the world; the woman managing the conference is moving to Europol shortly and wants us to come talk there; and one of the heads of NCSC wants us to come back and help the Netherlands with their general direction and strategy. We should try to connect them to local Dutch Tor advocates as much as we can, since after all we have software to write.
-   I'm afraid I missed most of the other talks at the conference (and I missed the [alternate conference](http://alt-s.nl/) entirely), but I did see [Peter Zinn](https://www.ncsc.nl/english/conference/conference-2013/speakers/peter-zinn.html)'s well-choreographed talk about what the Dutch national police should be focusing on. His conclusion was that the Netherlands should focus on being the "safest country in the world wrt cybercrime by 2017". I had to restrain myself from yelling out the word [externalities!](http://en.wikipedia.org/wiki/Externality) during his talk: if their plan is to convince cybercriminals to go elsewhere, and then the neighboring countries like Belgium become cyber-hives-of-scum-and-villainy, that's not going to end well for anybody.
-   One person in the Belgian FCCU (Federal Computer Crime Unit) suggested during a break in the discussion that maybe Belgium should block all connections from the Tor network \*to\* any Belgian IP space. By now there's almost no such thing as a new question for me during these talks, but I have to admit that this one took me by surprise. Eventually I produced the right answer: "The Internet community would destroy you. 'Great Firewall of Belgium'? 'Adopt a Belgian dissident'? Nobody would take you seriously again as an alleged democracy." In any case, my friend at RIPE tells me that technically, it's harder than it sounds for Belgium to do this scale of blocking.
-   I got into a discussion with the Belgian police about how they don't regard their Internet filtering as "censorship". In my experience, the way it starts is some legislators decide there's something so horrible on the Internet that it justifies filtering. From there, they delegate to some quasi-governmental organization which comes up with a list (in some totally non-transparent fashion) of verboten URLs. Inevitably, the list contains [more types of content](http://thepiratebay.se/blog/195) than the original reason for setting up the filtering; and inevitably, there's no redress mechanism to get off the list if you [shouldn't be on it](http://www.smh.com.au/national/dentists-website-on-leaked-blacklist-20090319-93cl.html). The Belgian police assured me that they only filter a small set of URLs, and that each of them is discussed and transparently decided about in a democratic fashion. And then they wouldn't tell me what's on their list.
-   I met a US FBI agent and a US Secret Service agent who are "permanently" stationed with the Dutch national police. They acted just like normal Dutch police, except I guess they're paid by the United States to be Dutch police. Weird world we live in.
-   In each of the three police meetings, somebody suggested an alternate model for Tor where a judge should get to decide whether a given Tor user should be [deanonymized](https://www.torproject.org/docs/faq#Backdoor). (While in America we don't trust our judges, in Europe they really do.) Putting aside for a moment the technical fact that building in a backdoor would mean that criminals can exploit it too (this argument doesn't work on them), I tried to press on the multi-jurisdictional aspect: we have governments, militaries, and law enforcement from around the world relying on Tor. When I asked the embedded Secret Service guy if he would be ok with the Dutch police having a backdoor to Tor, he said "We like our Dutch colleagues." When I rephrased it to whether he would be ok with the Dutch police knowing what the US police are using Tor for, he paused, smiled, and tactfully said "No comment."
-   Several people at the Dutch cybercrime unit quietly told me they regretted their "break into a Tor hidden service and zero it out" action: it got people upset at them, but more importantly, it \*didn't work\*. That is, it didn't stop any bad people from doing bad things. Apparently playing whack-a-mole like this doesn't make the criminals go away. And worse, it disrupts the police's other monitoring and infiltration operations.
-   If I wanted to run a hidden service website that had a nation-state adversary, I would a) run a good solid webserver like nginx; b) run it in a VM, in a way that the VM couldn't learn its location — "no looking up its IP", but also more subtle things like "no looking up nameservers", "no looking up reachable wireless access points", etc; and then c) put that VM in a VPS running in a country that hates my adversary. That way even if somebody breaks into the webserver and breaks out of the VM, they're still faced with a frustratingly long bureaucratic step.
-   I took Aaron Gibson and Pepijn Le Heux with me to the Brussels meeting, and took Pepijn again to the Dutch national police meeting. Pepijn is a great guy; I'm hoping to turn him into a Roger replica so he can act as a Dutch Tor resource and so he can help organizations like Bits of Freedom save their country.

---
layout: post
title: "Deterministic Builds Part One: Cyberwar and Global Compromise"
permalink: deterministic-builds-part-one-cyberwar-and-global-compromise
date: 2013-08-20 14:40:47
author: mikeperry
category: blog
comments: closed
tags: ["cyberpeace", "dangerous toys", "decentralization", "deterministic builds", "gitian", "lack of foresight", "National Insecurity Agency", "security"]
---

I've spent the past few months developing a new build system for the [3.0 series](https://blog.torproject.org/category/tags/tbb-30) of the Tor Browser Bundle that produces what are called "deterministic builds" -- packages which are byte-for-byte identical no matter who actually builds them, or what hardware they use. This effort was extraordinarily involved, consuming all of my development time for over two months (including several nights and weekends), babysitting builds and fixing differences and issues that arose.

When describing my recent efforts to others, by far the two most common questions I've heard are "Why did you do that?" and "How did you do that?". I've decided to answer each question at length in a separate blog post. This blog post attempts to answer the first question: "Why would anyone want a deterministic build process?"

The short answer is: to protect against targeted attacks. Current popular software development practices simply cannot survive targeted attacks of the scale and scope that we are seeing today. In fact, I believe we're just about to witness the first examples of large scale "watering hole" attacks. This would be malware that attacks the software development and build processes themselves to distribute copies of itself to tens or even hundreds of millions of machines in a single, officially signed, instantaneous update. Deterministic, distributed builds are perhaps the only way we can reliably prevent these types of targeted attacks in the face of the endless stockpiling of weaponized exploits and other "cyberweapons".

The Dangerous Pursuit of "Cyberweapons" and "Cyberwar"
======================================================

For the past several years, we've been seeing a [steady increase](http://www.reuters.com/article/2013/05/10/us-usa-cyberweapons-specialreport-idUSBRE9490EL20130510) in the weaponization, stockpiling, and the use of software exploits by multiple governments, and by multiple agencies of multiple governments. It would seem that no networked computer is safe from a discovered but undisclosed and already weaponized vulnerability against one or more of its software components -- with each vulnerability being resold an unknown number of times.

Worse still, with [Stuxnet and Flame](http://spectrum.ieee.org/telecom/security/the-real-story-of-stuxnet), this stockpile has grown to include weaponized exploits specifically designed to "bridge the air gap" against even non-networked computers. Examples include exploits against software/hardware USB stacks, filesystem drivers, hard drive firmware, and even disconnected Bluetooth and Wifi interfaces. Even if these exploits themselves don't leak, the fact that they are known to exist (and are known to be deliberately kept secret from manufacturers and developers) means that other parties can begin looking for (or simply re-purchasing) the underlying vulnerabilities themselves, without fear of their disclosure or mitigation.

Unfortunately, the use of such exploits isn't limited to attacks against questionable nuclear energy programs by hostile states. The clock is certainly ticking on how long it will be before multiple other intelligence agencies, along with elements of organized crime and "terrorist" groups, have replicated these weapons.

We are essentially risking all of computing (or at least major sectors of the world economy that are dependent on specific software systems) by stockpiling these weapons, as if there would be any possibility of retaliation after a serious cyberattack. Wakeup call: There is not. In fact, the more exploits exist, the higher the risk of the wrong one leaking -- and it really only takes a chain of just a few of the right exploits for this to happen.

Software Engineering Complexity: The Doomsday Scenario
======================================================

The core problem is this: With the number of dependencies present in large software projects, there is no way any amount of global surveillance, network censorship, machine isolation, or firewalling can sufficiently protect the software development process of widely deployed software projects in order to prevent scenarios where malware sneaks into a development dependency through an exploit in combination with code injection, and makes its way into the build process of software that is critical to the function of the world economy.

Such malware could be quite simple: One day, a timer goes off, and any computer running the infected software turns into a brick. In fact, it's not that hard to destroy a computer via software. Linux distributions have been accidentally tripping on bugs that do it for two decades now. If the right software vector is chosen (for example, a popular piece of software with a rapid release cycle and an auto-updater), a logic bomb that infects the build systems could continuously update the timestamps in the distributed versions of itself to ensure that the infected computers are only destroyed in the event that the attacker actually loses control of the software build infrastructure. If the right systems are chosen, this destruction could mean the disruption of all industrial control or supply chain systems simultaneously, disabling the ability to provide food, water, power, and aid to hundreds of millions of people in a very short amount of time.

The malware could also be more elaborate, especially if the motives are financial as opposed to purely destructive. The ability to universally deploy a backdoor that would allow modification of various aspects of financial transaction processing, stock markets, insurance records, and the supply chain records of various industries would prove tremendously profitable in the right circumstances. Just about all aspects of business are computerized now, and if the computer systems say an event did or didn't happen, that is the reality. Even short of modification, early access to information about certain events is also valuable -- unreleased earnings data from publicly traded companies being the immediate example.

In this brave new world, without the benefit of anonymity and decentralization to protect single points of failure in the software engineering process from such targeted attacks, I don't believe it is possible to keep software signing keys secure any more, nor do I believe it is possible to keep even an offline build machine secure from malware injection any more, especially against the types of adversaries that Tor has to contend with.

As someone who regularly discusses software engineering practices with the best and the brightest minds in the computer industry, I can tell you with certainty that even companies that exercise current best practices -- such as keeping their software build machines offline (and even these companies are few and far between) can still end up being infected, due to the existence and proliferation of the air gap bridging exploits mentioned above.

A true air gap is also difficult to achieve even if it could be used to ensure build machine integrity. For example, all of the major Windows web browser vendors employ a Microsoft run-time optimization technique called "Profile Guided Optimization". This technique requires running an initial compiled binary on a machine to produce a profile output that represents which code paths were executed and which were most expensive. This output is used to transform its code and optimize it further. In the case of browsers, this means that an untrusted, proprietary, and opaque input is derived from non-deterministic network sources (such as the Alexa Top 1000) and transferred to the build machines, to produce executable code that is manipulated and rewritten based on this network-derived, untrusted input, and upon the performance and other characteristics of the specific machine that was used to generate this profile output.

This means that software development has no choice but to evolve beyond the simple models of "Trust our RSA-signed update feed produced from our trusted build machines", or even companies like Google, Mozilla, Apple, and Microsoft are going to end up distributing state-sponsored malware in short order.

Deterministic Builds: Integrity through Decentralization
========================================================

This is where the "why" of deterministic builds finally comes in: in our case, any individual can use our anonymity network to privately download our source code, verify it against public signed, audited, and mirrored git repositories, and reproduce our builds exactly, without being subject to such targeted attacks. If they notice any differences, they can alert the public builders/signers, hopefully using a pseudonym or our anonymous trac account.

This also will eventually allow us to create a number of auxiliary authentication mechanisms for our packages, beyond just trusting a single offline build machine and a single cryptographic key's integrity. Interesting examples include providing multiple independent cryptographic signatures for packages, listing the package hashes in the Tor consensus, and encoding the package hashes in the Bitcoin blockchain.

I believe it is important for Tor to set an example on this point, and I hope that the Linux distributions will follow in making deterministic packaging the norm. Thankfully, due to our close relationship with Debian, after we whispered in a few of the right ears [they have started work](https://wiki.debian.org/ReproducibleBuilds) on this effort. Don't despair guys: it won't take two months for each Linux package. In our case, we had to cross-compile Firefox deterministically for four different target operating system and architecture combinations and fix a number of Firefox-specific build issues, all of which I will describe in the [second post on the technical details](https://blog.torproject.org/blog/deterministic-builds-part-two-technical-details).

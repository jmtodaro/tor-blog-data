---
layout: post
title: "Detecting Certificate Authority compromises and web browser collusion"
permalink: detecting-certificate-authority-compromises-and-web-browser-collusion
date: 2011-03-22 19:16:10
author: ioerror
category: blog
comments: closed
tags: ["ssl tls ca tor certificates torbrowser"]
---

*Thanks to Ian Gallagher, Seth Schoen, Jesse Burns, Chris Palmer, and other anonymous birds for their invaluable feedback on this writeup.*

The Tor Project has long understood that the [certification authority](https://secure.wikimedia.org/wikipedia/en/wiki/Certificate_authority) (CA) model of trust on the internet is susceptible to various methods of compromise. Without strong anonymity, the ability to perform targeted attacks with the blessing of a CA key is serious. In the past, I’ve worked on [attacks relating to SSL/TLS trust models](http://www.win.tue.nl/hashclash/rogue-ca/) and for quite some time, I’ve hunted for evidence of non-academic CA compromise in the wild.

I’ve also looked for special kinds of cooperation between CAs and browsers. Proof of collusion will give us facts. It will also give us a real understanding of the faith placed in the strength of the underlying systems.

Does certificate revocation really work? [**No, it does not**](http://www.imperialviolet.org/2011/03/18/revocation.html). How much faith does a vendor actually put into revocation, when verifiable evidence of malice is detected or known? Not much, and that’s the subject of this writing.

Last week, a smoking gun came into sight: A Certification Authority appeared to be compromised in some capacity, and the attacker issued themselves valid HTTPS certificates for high-value web sites. With these certificates, the attacker could impersonate the identities of the victim web sites or other related systems, probably undetectably for the majority of users on the internet.

I watch the Chromium and Mozilla Firefox projects carefully, because they are so important to the internet infrastructure. On the evening of 16 March, I noticed a very interesting code change to Chromium: [revision 78478, Thu Mar 17 00:48:21 2011 UTC](http://src.chromium.org/viewvc/chrome/trunk/src/net/base/x509_certificate.cc?view=markup&pathrev=78478).

In this revision, the developers added X509Certificate::IsBlacklisted, which returns true if a HTTPS certificate has one of these particular serial numbers:

-   047ecbe9fca55f7bd09eae36e10cae1e
-   d8f35f4eb7872b2dab0692e315382fb0
-   b0b7133ed096f9b56fae91c874bd3ac0
-   9239d5348f40d1695a745470e1f23f43
-   d7558fdaf5f1105bb213282b707729a3
-   f5c86af36162f13a64f54f6dc9587c06

A comment marks the first as "Not a real certificate. For testing only." but we don’t know if this means the other certificates are or are not also for testing.

With just these serial numbers, we are not able to learn much about the certificates that Chromium now blocks. To get more information, I started the [crlwatch](https://github.com/ioerror/crlwatch) project. Nearly every certificate contains a reference to a [Certificate Revocation List](https://secure.wikimedia.org/wikipedia/en/wiki/Revocation_list) (CRL). A CRL is a list of certificates that the CA has revoked for whatever reason. In theory, this means that an attacker is unable to tamper with the certificate to prevent revocation as the browser will check the CRL it finds in a certificate. In practice the attacker simply needs to tamper with the network - this is something they’re already able to do if they are performing a SSL/TLS Machine-In-The-Middle attack. Even if an attacker has a certificate, they generally are unable to modify the certificate without breaking the digital signature issued by the CA. That CA signature is what gives the certificate value to an attacker and tampering takes the attacker back to square zero. So while investigating these serials, we clearly lack the CRL distribution point in the Chrome source. However, the project that I announced on March 17th, crlwatch, was specifically written to assist in finding who issued, and potentially revoked the serial numbers in question. By matching the serial numbers found in the source for Chrome with the serial numbers of revoked certificates, we’re able to link specific serials to specific CA issuers. The more serial numbers we match in revocation lists, the higher our probability of having found the CA that issued the certificates.

About twelve hours (Thursday, March 17, 2011 | 13:00) after the above patch was pushed into source control - Google announced [an important Chrome Update that involved HTTPS certificate issues](http://googlechromereleases.blogspot.com/2011/03/stable-and-beta-channel-updates_17.html).

This also is mostly uninteresting until we notice that this is not isolated to Google. Mozilla pushed out two patches of interest:

-   [rev-f6215eef2276](http://hg.mozilla.org/mozilla-central/rev/f6215eef2276)
-   [rev-55f344578932](http://hg.mozilla.org/mozilla-central/rev/55f344578932)

The [complete changeset](http://hg.mozilla.org/mozilla-central/rev/f6215eef2276) is semi-informative. Mozilla references a private bug in that fix that Mozilla will hopefully disclose. Similar to Chromium, the Mozilla patches create a list of certificate serial numbers that will be treated as invalid. However, the serial numbers from the Mozilla patches are different:

-   009239d5348f40d1695a745470e1f23f43
-   00d8f35f4eb7872b2dab0692e315382fb0
-   72032105c50c08573d8ea5304efee8b0
-   00b0b7133ed096f9b56fae91c874bd3ac0
-   00e9028b9578e415dc1a710a2b88154447
-   00d7558fdaf5f1105bb213282b707729a3
-   047ecbe9fca55f7bd09eae36e10cae1e
-   00f5c86af36162f13a64f54f6dc9587c06
-   392a434f0e07df1f8aa305de34e0c229
-   3e75ced46b693021218830ae86a82a71

Thus, both Mozilla and Google shipped similar patches to their code at roughly the same time. The two browsers now have partially overlapping certificate blocklists. Here is the union of the two lists:

-   009239d5348f40d1695a745470e1f23f43
-   00b0b7133ed096f9b56fae91c874bd3ac0
-   00d7558fdaf5f1105bb213282b707729a3
-   00d8f35f4eb7872b2dab0692e315382fb0
-   00e9028b9578e415dc1a710a2b88154447
-   00f5c86af36162f13a64f54f6dc9587c06
-   047ecbe9fca55f7bd09eae36e10cae1e
-   392a434f0e07df1f8aa305de34e0c229
-   3e75ced46b693021218830ae86a82a71
-   72032105c50c08573d8ea5304efee8b0
-   9239d5348f40d1695a745470e1f23f43
-   b0b7133ed096f9b56fae91c874bd3ac0
-   d7558fdaf5f1105bb213282b707729a3
-   d8f35f4eb7872b2dab0692e315382fb0
-   f5c86af36162f13a64f54f6dc9587c06

Why do the browsers have these blocklists, and why don’t they have the same blocklists?

This returns me to the reason for creating crlwatch last week - I wanted to find the someones who knowingly revoked the above listed special certificates. Anyone looking from the same starting point as I did, obviously lacks the leaf certificates in question and as a result, I had to look in a rather round about manner. Thanks to the [EFF’s SSL Observatory](https://www.eff.org/observatory), I was able to populate the base list for crlwatch. Armed with a nearly canonical list of all CRLs, I fetched them over [Tor](https://www.torproject.org/) and parsed the CRL data into human readable text. The goal was to search for the above serial numbers and to find something linkable.

This is the result from searching the crlwatch data:

` Looking for 009239d5348f40d1695a745470e1f23f43 in parsed CRLs... Looking for 00b0b7133ed096f9b56fae91c874bd3ac0 in parsed CRLs... Looking for 00d7558fdaf5f1105bb213282b707729a3 in parsed CRLs... Looking for 00d8f35f4eb7872b2dab0692e315382fb0 in parsed CRLs... Looking for 00e9028b9578e415dc1a710a2b88154447 in parsed CRLs... Looking for 00f5c86af36162f13a64f54f6dc9587c06 in parsed CRLs... Looking for 047ecbe9fca55f7bd09eae36e10cae1e in parsed CRLs... Match! Serial Number: 047ECBE9FCA55F7BD09EAE36E10CAE1E Match! Serial Number: 047ECBE9FCA55F7BD09EAE36E10CAE1E Match! Serial Number: 047ECBE9FCA55F7BD09EAE36E10CAE1E Looking for 392a434f0e07df1f8aa305de34e0c229 in parsed CRLs... Match! Serial Number: 392A434F0E07DF1F8AA305DE34E0C229 Match! Serial Number: 392A434F0E07DF1F8AA305DE34E0C229 Match! Serial Number: 392A434F0E07DF1F8AA305DE34E0C229 Looking for 3e75ced46b693021218830ae86a82a71 in parsed CRLs... Match! Serial Number: 3E75CED46B693021218830AE86A82A71 Match! Serial Number: 3E75CED46B693021218830AE86A82A71 Match! Serial Number: 3E75CED46B693021218830AE86A82A71 Looking for 72032105c50c08573d8ea5304efee8b0 in parsed CRLs... Looking for 9239d5348f40d1695a745470e1f23f43 in parsed CRLs... Match! Serial Number: 9239D5348F40D1695A745470E1F23F43 Match! Serial Number: 9239D5348F40D1695A745470E1F23F43 Match! Serial Number: 9239D5348F40D1695A745470E1F23F43 Looking for b0b7133ed096f9b56fae91c874bd3ac0 in parsed CRLs... Match! Serial Number: B0B7133ED096F9B56FAE91C874BD3AC0 Match! Serial Number: B0B7133ED096F9B56FAE91C874BD3AC0 Match! Serial Number: B0B7133ED096F9B56FAE91C874BD3AC0 Looking for d7558fdaf5f1105bb213282b707729a3 in parsed CRLs... Match! Serial Number: D7558FDAF5F1105BB213282B707729A3 Match! Serial Number: D7558FDAF5F1105BB213282B707729A3 Match! Serial Number: D7558FDAF5F1105BB213282B707729A3 Looking for d8f35f4eb7872b2dab0692e315382fb0 in parsed CRLs... Match! Serial Number: D8F35F4EB7872B2DAB0692E315382FB0 Match! Serial Number: D8F35F4EB7872B2DAB0692E315382FB0 Match! Serial Number: D8F35F4EB7872B2DAB0692E315382FB0 Looking for f5c86af36162f13a64f54f6dc9587c06 in parsed CRLs... Match! Serial Number: F5C86AF36162F13A64F54F6DC9587C06 Match! Serial Number: F5C86AF36162F13A64F54F6DC9587C06 Match! Serial Number: F5C86AF36162F13A64F54F6DC9587C06`

Huzzah! It appears that we've found a few matches!

Here are the three matching files in human readable format:

-   [7825aa0.crl2txt](https://github.com/ioerror/crlwatch/blob/master/crl-parsed/2208d196b567691ff77bee6ed97ac6aea7825aa0.crl2txt)
-   [c0f5dd5.crl2txt](https://github.com/ioerror/crlwatch/blob/master/crl-parsed/2454652aa76e0dcf0c7531a2ed9dbeda5c0f5dd5.crl2txt)
-   [ae2ff50.crl2txt](https://github.com/ioerror/crlwatch/blob/master/crl-parsed/5a65d440090271759080e6d0eaae0b6ccae2ff50.crl2txt)

Matching entries in the list look like this:

`     Serial Number: 392A434F0E07DF1F8AA305DE34E0C229         Revocation Date: Mar 15 20:15:38 2011 GMT`

An interesting note is that this date is a bit earlier than the above patches. The CA knew to revoke it on March 15th and the above patches were worked into software a few days later. If the attacker was targeting specific users, the damage to those users may have already been inflicted.

All three of the CRLs in question belong to [the same CA](http://www.usertrust.com/about.html):

` issuer=/C=US/ST=UT/L=Salt Lake City/O=The USERTRUST Network/OU=http://www.usertrust.com/CN=UTN-USERFirst-Hardware`

This appears to be a reseller or something similar for the [Comodo CA company](http://www.comodo.com/) when the trust chain for USERTRUST is inspected:

` CN = COMODO High Assurance Secure Server CA`

We appear to have no initial matches for the following Mozilla specific serials from the data that I gathered during the initial crlwatch data population run:

-   009239d5348f40d1695a745470e1f23f43
-   00b0b7133ed096f9b56fae91c874bd3ac0
-   00d7558fdaf5f1105bb213282b707729a3
-   00d8f35f4eb7872b2dab0692e315382fb0
-   00e9028b9578e415dc1a710a2b88154447
-   00f5c86af36162f13a64f54f6dc9587c06

Those serial numbers appear to not match, right? Nope. Mozilla appears  
 to deal with certificate serial numbers in a slightly different manner - Chrome does the same internally but Mozilla exposes a weird quirk of certificate encoding directly in the source. The human readable data does not contain this quirk. Thus if you remove the prefix of ‘00’ from those serial numbers and search for the sixteen byte values, we find what we'd expect:

` Looking for 9239d5348f40d1695a745470e1f23f43 in parsed CRLs... Match! Serial Number: 9239D5348F40D1695A745470E1F23F43 Match! Serial Number: 9239D5348F40D1695A745470E1F23F43 Match! Serial Number: 9239D5348F40D1695A745470E1F23F43 Looking for b0b7133ed096f9b56fae91c874bd3ac0 in parsed CRLs... Match! Serial Number: B0B7133ED096F9B56FAE91C874BD3AC0 Match! Serial Number: B0B7133ED096F9B56FAE91C874BD3AC0 Match! Serial Number: B0B7133ED096F9B56FAE91C874BD3AC0 Looking for d7558fdaf5f1105bb213282b707729a3 in parsed CRLs... Match! Serial Number: D7558FDAF5F1105BB213282B707729A3 Match! Serial Number: D7558FDAF5F1105BB213282B707729A3 Match! Serial Number: D7558FDAF5F1105BB213282B707729A3 Looking for d8f35f4eb7872b2dab0692e315382fb0 in parsed CRLs... Match! Serial Number: D8F35F4EB7872B2DAB0692E315382FB0 Match! Serial Number: D8F35F4EB7872B2DAB0692E315382FB0 Match! Serial Number: D8F35F4EB7872B2DAB0692E315382FB0 Looking for e9028b9578e415dc1a710a2b88154447 in parsed CRLs... Match! Serial Number: E9028B9578E415DC1A710A2B88154447 Match! Serial Number: E9028B9578E415DC1A710A2B88154447 Match! Serial Number: E9028B9578E415DC1A710A2B88154447 Looking for f5c86af36162f13a64f54f6dc9587c06 in parsed CRLs... Match! Serial Number: F5C86AF36162F13A64F54F6DC9587C06 Match! Serial Number: F5C86AF36162F13A64F54F6DC9587C06 Match! Serial Number: F5C86AF36162F13A64F54F6DC9587C06`

Here's sample from one of those CRLs:

`     Serial Number: D7558FDAF5F1105BB213282B707729A3         Revocation Date: Mar 15 20:15:26 2011 GMT`

Ironically, after all of this work, the Mozilla [patch also leaks the CA name](http://hg.mozilla.org/mozilla-central/rev/f6215eef2276#l1.57) and confirmed my suspicions without question.

In the end, when the lists are merged, we find eleven certificates with two certificates probably acting as testing certificates for the two vendors involved:

-   077a59bcd53459601ca6907267a6dd1c
-   047ecbe9fca55f7bd09eae36e10cae1e
-   392a434f0e07df1f8aa305de34e0c229
-   3e75ced46b693021218830ae86a82a71
-   72032105c50c08573d8ea5304efee8b0
-   9239d5348f40d1695a745470e1f23f43
-   b0b7133ed096f9b56fae91c874bd3ac0
-   d7558fdaf5f1105bb213282b707729a3
-   d8f35f4eb7872b2dab0692e315382fb0
-   e9028b9578e415dc1a710a2b88154447
-   f5c86af36162f13a64f54f6dc9587c06

This is evidence of a rather serious event and one that cannot be ignored. If I had to make a bet, I'd wager that an attacker was able to issue high value certificates, probably by compromising USERTRUST in some manner, this was discovered sometime before the revocation date, each certificate was revoked, the vendors notified, the patches were written, and binary builds kicked off - end users are probably still updating and thus many people are vulnerable to the failure that is the CRL and OCSP method for revocation. Even after users update, I'm guessing they may be unequally protected. Mozilla and other browsers should force OCSP verification by default as part of their next release and remove CAs that are unable to handle this requirement. Users of Mozilla Firefox that are concerned about this issue should enable security.OCSP.require in the about:config dialog. The surveillance concerns of enabling OCSP are serious - a CA learns what sites you’re visiting. However, they are nullified by the fact that OCSP checking is enabled by default on Firefox at least; it simply doesn’t provide any security gains for the end user because when it fails, it fails open!

I contacted both Google and Mozilla ([bug \#643056](https://bugzilla.mozilla.org/show_bug.cgi?id=643056)) for comment after discovering the above data. Mozilla expressed some concern about disclosure and I offered to embargo this document until Tuesday March 22nd, the launch day for Firefox 4. They agreed and I kept this under my hat. After discussions between Comodo and Microsoft, passed on to me by Mozilla, the embargo was to be extended until Wednesday, March 23rd. This extension was ostensibly to ensure that Microsoft would be able to ship their Internet Explorer mitigation pack. After further discussion, Mozilla [pushed their blog post about the issue](https://blog.mozilla.com/security/2011/03/22/firefox-blocking-fraudulent-certificates/) and I now consider the embargo lifted. Google has already shipped a fix to users. Install the latest Firefox to get a patch, if you haven't already. A Tor Browser update is in the works and will be available soon.

Mozilla offered some additional information and disclosed that [addons.mozilla.org](https://addons.mozilla.org/) was one of the certificates acquired by the attacker. In total, nine certificates were acquired. Seven were uniquely named. Two of the certificates were re-issued for a previously issued host name. One certificate was issued for "global trustee" rather than a valid host name. With testing certificates in the list, we have a good accounting of the certificates found in the source code of each browser. Google clarified their discrepancy with the list, acknowledged the duplicate serial mistake and issued subsequent patches. Saving for test hosts, the lists are now identical.

If I had to guess at sites, I'd speculate that Facebook, Skype, Google, Microsoft, Mozilla, and others are worthy of targeting. Comodo should disclose this information and clear up this speculation with very clear information about who was targeted.

Both vendors expressed that the CA in question had done something quite remarkable by disclosing this compromise. The incentives may not be in the favor of the CA for disclosure. Many CAs may fall to similar attacks and simply refuse to disclose. Hopefully crlwatch will provide us with meaningful data regarding revocation events. The EFF and The Tor Project are [working on solutions for detecting anomalies in certificates](https://trac.torproject.org/projects/tor/wiki/HTTPSEverywhere/SSLObservatorySubmission) found in the wild. Still, some CAs may simply be unaware of compromises or unwilling to revoke for fear of detection.

Are all other browsers deploying similar countermeasures? Thanks to the free software nature of Firefox and Chrome, we have an answer for at least two projects. I wish that we could say the same for the rest of the browser world. One may assume that the CA in question did their best to contact all impacted vendors and targets.

Comodo has not yet revealed the extent of the compromise to the public - were their signing keys in a hardware security module? How many certificates in total were ever issued by this specific signing key? Wouldn't it be best to remove the specific signing keys from all trust roots to be extra careful given the stakes? Who exactly did they deem important enough for disclosure? The Tor Project, which ships the Tor Browser Bundle was not notified. Clearly some groups are being left out of the loop and this is where even a single attack really causes the entire CA trust model to fall apart.

Comodo should release the full certificates to the internet as well as all of the details relating to the attack. Mozilla and other browsers should open their bug reports, explain their process and lay out a path forward where we won't have to repeat this entire process again.

There is some suspicion that this action was taken by a state level adversary and there are some specific states that have been named. I’ll leave further speculation about which nation states may be involved to others. The mere fact that the web’s system of trust relies on an all or nothing property should be enough of a cause for alarm. It’s obvious that this has been and will continue to be exploited.

The impact on other cryptographic systems, such as S/MIME signatures and other cryptographic systems secured by CAs is entirely un-discussed. Quite seriously, when a CA is compromised, it will impact a great deal more than the web; users of email systems (SMTP, IMAP, POP,etc), Jabber servers, and any other SSL/TLS enabled systems are all at risk. Blocking specific serial numbers or relying on flawed, [provably broken methods of revocation](http://www.imperialviolet.org/2011/03/18/revocation.html) will simply not cut it anymore. When the actual protection mechanisms are not enforced, there is little hope of end users being protected.

This should serve as a wake up call to the internet. We need to research, build, and share new methods for ensuring trust, identity, authenticity, and confidentiality on the internet. Proposals such as [DANE](http://www.ietf.org/id/draft-ietf-dane-protocol-06.txt), [CAA](http://tools.ietf.org/html/draft-hallambaker-donotissue-03), [HASTLS](http://tools.ietf.org/html/draft-hoffman-server-has-tls-04), and [Monkeysphere](http://web.monkeysphere.info/) are steps in the right direction but they face an uphill battle from entrenched economic interests.

Certification Authorities may continue to provide a piece of the puzzle but it’s high time we ensure that they’re not the alpha and the omega, anymore.

**Update:**  
 Comodo has issued [a statement confirming everything](http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html) that I've said and more. They believe that this was a targeted attack by a state level actor and they have named Iran as the country they suspect. Mozilla has now opened the bug reports about the issue to the public. Microsoft has now [disclosed their report](http://www.microsoft.com/technet/security/advisory/2524375.mspx) as well.

In the details of their statement we have a confirmation that they have the ability to monitor and thus surveille people who wish to know if certificates are valid.

Comodo also clearly demonstrate a mis-understanding - they believe that checks for revocation are proof positive that certificates are being used. They need to **[read and understand why this is not true](http://www.imperialviolet.org/2011/03/18/revocation.html)**.

The browsers have dropped the ball and they have chosen to fail open in nearly every single case; an attacker who is able to MITM SSL/TLS will also MITM the OCSP/CRL requests. Moxie's [sslstrip](http://www.thoughtcrime.org/software/sslstrip/) demonstrated that an attacker would do this automatically and his software has done this for OCSP in public since 2009. Mozilla did not fix this issue at the time and they have once again punted on the issue. An even [lower tech attack is possible and it's why revocation does not work](http://www.imperialviolet.org/2011/03/18/revocation.html): **By returning a HTTP 500 error, the browser will the continue on as if revocation checks showed the certificate to be perfectly fine**.

The browsers chose a user privacy invasive stance without the user protecting security properties. They did this because they claim that CAs are unable to provide working OCSP/CRL systems for request handling. This is a fair claim if true but it must not stand any longer. If the CA cannot provide even a basic level of revocation, it's clearly **irresponsible** to ship that CA root in a browser. **Browsers should give insecure CA keys an Internet Death Sentence** rather than expose the users of the browsers to known problems.

It's probably the case that Mozilla and other browsers should write a secure, caching OCSP server for use when a CA has a failure. It should probably be run by a neutral third party such as the EFF with a strong user privacy stance. This would only serve as a temporary fix and until Browsers get their act together, users are doomed anyway.

OCSP stapling does not fix this issue. The browsers treat revocation errors as soft errors and a MITM is deadly for revocation. The browsers believe they have to treat them as soft errors because the CAs are failing to do their job properly and are almost entirely unaccountable. The browsers are failing users by refusing to hold CAs to account. If OCSP and CRL failures mean the internet doesn't work, we need to create alternatives and not simply sweep these issues under the rug for later analysis. **Browsers should hard fail on certificate revocation errors.**

Comodo has further failed by:

-   Failing to produce further information about those certificates
-   Selective disclosure to "*principal browsers and domain owners*"
-   Failing to disclose what sub-CA/intermediate root actually did the signing
-   Believing that the attacker must control DNS for these attacks to succeed
-   Waiting **eight days** to disclose evidence of a specific targeted attack

I believe that the browsers, such as Mozilla, are doing the best that they can in some ways but the lack of immediate full disclosure is a major failure.

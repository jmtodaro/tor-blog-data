---
layout: post
title: "A new alpha series begins: Tor 0.2.6.1-alpha is released"
permalink: new-alpha-series-begins-tor-0261-alpha-released
date: 2014-10-30 12:52:11
author: nickm
category: blog
comments: open
tags: ["026", "0261", "alpha", "release", "tor"]
---

Tor 0.2.6.1-alpha is the first release in the Tor 0.2.6.x series. It includes numerous code cleanups and new tests, and fixes a large number of annoying bugs. Out-of-memory conditions are handled better than in 0.2.5, pluggable transports have improved proxy support, and clients now use optimistic data for contacting hidden services. Also, we are now more robust to changes in what we consider a parseable directory object, so that tightening restrictions does not have a risk of introducing infinite download loops.

This is the first alpha release in a new series, so expect there to be bugs. Users who would rather test out a more stable branch should stay with 0.2.5.x for now.

This announcement is for the source release only; I'd expect that compiled packages for several platforms should be available over the next several days.

Changes in version 0.2.6.1-alpha - 2014-10-30

-   New compiler and system requirements:
    -   Tor 0.2.6.x requires that your compiler support more of the C99 language standard than before. The 'configure' script now detects whether your compiler supports C99 mid-block declarations and designated initializers. If it does not, Tor will not compile.

        We may revisit this requirement if it turns out that a significant number of people need to build Tor with compilers that don't bother implementing a 15-year-old standard. Closes ticket 13233.

    -   Tor no longer supports systems without threading support. When we began working on Tor, there were several systems that didn't have threads, or where the thread support wasn't able to run the threads of a single process on multiple CPUs. That no longer holds: every system where Tor needs to run well now has threading support. Resolves ticket 12439.

 

<!-- more -->

-   Removed platform support:
    -   We no longer include special code to build on Windows CE; as far as we know, nobody has used Tor on Windows CE in a very long time. Closes ticket 11446.
-   Major features (bridges):
    -   Expose the outgoing upstream HTTP/SOCKS proxy to pluggable transports if they are configured via the "TOR\_PT\_PROXY" environment variable. Implements proposal 232. Resolves ticket 8402.
-   Major features (client performance, hidden services):
    -   Allow clients to use optimistic data when connecting to a hidden service, which should remove a round-trip from hidden service initialization. See proposal 181 for details. Implements ticket 13211.
-   Major features (directory system):
    -   Upon receiving an unparseable directory object, if its digest matches what we expected, then don't try to download it again. Previously, when we got a descriptor we didn't like, we would keep trying to download it over and over. Closes ticket 11243.
-   Major features (sample torrc):
    -   Add a new, infrequently-changed "torrc.minimal". This file is similar to torrc.sample, but it will change as infrequently as possible, for the benefit of users whose systems prompt them for intervention whenever a default configuration file is changed. Making this change allows us to update torrc.sample to be a more generally useful "sample torrc".
-   Major bugfixes (directory authorities):
    -   Do not assign the HSDir flag to relays if they are not Valid, or currently hibernating. Fixes \#12573. Bugfix on tor-0.2.0.10-alpha
-   Major bugfixes (directory bandwidth performance):
    -   Don't flush the zlib buffer aggressively when compressing directory information for clients. This should save about 7% of the bandwidth currently used for compressed descriptors and microdescriptors. Fixes bug 11787; bugfix on 0.1.1.23.
-   Minor features (security, memory wiping):
    -   Ensure we securely wipe keys from memory after crypto\_digest\_get\_digest and init\_curve25519\_keypair\_from\_file have finished using them. Resolves ticket 13477.
-   Minor features (security, out-of-memory handling):
    -   When handling an out-of-memory condition, allocate less memory for temporary data structures. Fixes issue 10115.
    -   When handling an out-of-memory condition, consider more types of buffers, including those on directory connections, and zlib buffers. Resolves ticket 11792.
-   Minor features:
    -   When identity keypair is generated for first time, log a congratulatory message that links to the new relay lifecycle document. Implements feature 10427.
-   Minor features (client):
    -   Clients are now willing to send optimistic data (before they receive a 'connected' cell) to relays of any version. (Relays without support for optimistic data are no longer supported on the Tor network.) Resolves ticket 13153.
-   Minor features (directory authorities):
    -   Don't list relays with a bandwidth estimate of 0 in the consensus. Implements a feature proposed during discussion of bug 13000.
    -   In tor-gencert, report an error if the user provides the same argument more than once.
    -   If a directory authority can't find a best consensus method in the votes that it holds, it now falls back to its favorite consensus method. Previously, it fell back to method 1. Neither of these is likely to get enough signatures, but "fall back to favorite" doesn't require us to maintain support an obsolete consensus method. Implements part of proposal 215.
-   Minor features (logging):
    -   On Unix-like systems, you can now use named pipes as the target of the Log option, and other options that try to append to files. Closes ticket 12061. Patch from "carlo von lynX".
    -   When opening a log file at startup, send it every log message that we generated between startup and opening it. Previously, log messages that were generated before opening the log file were only logged to stdout. Closes ticket 6938.
    -   Add a TruncateLogFile option to overwrite logs instead of appending to them. Closes ticket \#5583.
-   Minor features (portability, Solaris):
    -   Threads are no longer disabled by default on Solaris; we believe that the versions of Solaris with broken threading support are all obsolete by now. Resolves ticket 9495.
-   Minor features (relay):
    -   Re-check our address after we detect a changed IP address from getsockname(). This ensures that the controller command "GETINFO address" will report the correct value. Resolves ticket 11582. Patch from "ra".
    -   A new AccountingRule option lets Relays set whether they'd like AccountingMax to be applied separately to inbound and outbound traffic, or applied to the sum of inbound and outbound traffic. Resolves ticket 961. Patch by "chobe".
-   Minor features (testing networks):
    -   Add the TestingDirAuthVoteExit option, which lists nodes to assign the "Exit" flag regardless of their uptime, bandwidth, or exit policy. TestingTorNetwork must be set for this option to have any effect. Previously, authorities would take up to 35 minutes to give nodes the Exit flag in a test network. Partially implements ticket 13161.
-   Minor features (validation):
    -   Check all date/time values passed to tor\_timegm and parse\_rfc1123\_time for validity, taking leap years into account. Improves HTTP header validation. Implemented with bug 13476.
    -   In correct\_tm(), limit the range of values returned by system localtime(\_r) and gmtime(\_r) to be between the years 1 and 8099. This means we don't have to deal with negative or too large dates, even if a clock is wrong. Otherwise we might fail to read a file written by us which includes such a date. Fixes bug 13476.
-   Minor bugfixes (bridge clients):
    -   When configured to use a bridge without an identity digest (not recommended), avoid launching an extra channel to it when bootstrapping. Fixes bug 7733; bugfix on 0.2.4.4-alpha.
-   Minor bugfixes (bridges):
    -   When DisableNetwork is set, do not launch pluggable transport plugins, and if any are running, terminate them. Fixes bug 13213; bugfix on 0.2.3.6-alpha.
-   Minor bugfixes (C correctness):
    -   Fix several instances of possible integer overflow/underflow/NaN. Fixes bug 13104; bugfix on 0.2.3.1-alpha and later. Patches from "teor".
    -   In circuit\_build\_times\_calculate\_timeout() in circuitstats.c, avoid dividing by zero in the pareto calculations. This traps under clang's "undefined-trap" sanitizer. Fixes bug 13290; bugfix on tor-0.2.2.2-alpha.
    -   Fix an integer overflow in format\_time\_interval(). Fixes bug 13393; bugfix on 0.2.0.10-alpha.
    -   Set the correct day of year value when the system's localtime(\_r) or gmtime(\_r) functions fail to set struct tm. Not externally visible. Fixes bug 13476; bugfix on 0.0.2pre14.
    -   Avoid unlikely signed integer overflow in tor\_timegm on systems with 32-bit time\_t. Fixes bug 13476; bugfix on 0.0.2pre14.
-   Minor bugfixes (client):
    -   Fix smartlist\_choose\_node\_by\_bandwidth() so that relays with the BadExit flag are not considered worthy candidates. Fixes bug 13066; bugfix on 0.1.2.3-alpha.
    -   Use the consensus schedule for downloading consensuses, and not the generic schedule. Fixes bug 11679; bugfix on 0.2.2.6-alpha.
    -   Handle unsupported or malformed SOCKS5 requests properly by responding with the appropriate error message before closing the connection. Fixes bugs 12971 and 13314; bugfix on 0.0.2pre13.
-   Minor bugfixes (client, torrc):
    -   Stop modifying the value of our DirReqStatistics torrc option just because we're not a bridge or relay. This bug was causing Tor Browser users to write "DirReqStatistics 0" in their torrc files as if they had chosen to change the config. Fixes bug 4244; bugfix on 0.2.3.1-alpha.
    -   When GeoIPExcludeUnkonwn is enabled, do not incorrectly decide that our options have changed every time we SIGHUP. Fixes bug 9801; bugfix on 0.2.4.10-alpha. Patch from "qwerty1".
-   Minor bugfixes (controller):
    -   Return an error when the second or later arguments of the "setevents" controller command are invalid events. Previously we would return success while silently skipping invalid events. Fixes bug 13205; bugfix on 0.2.3.2-alpha. Reported by "fpxnns".
-   Minor bugfixes (directory system):
    -   Always believe that v3 directory authorities serve extra-info documents, whether they advertise "caches-extra-info" or not. Fixes part of bug 11683; bugfix on 0.2.0.1-alpha.
    -   When running as a v3 directory authority, advertise that you serve extra-info documents so that clients who want them can find them from you too. Fixes part of bug 11683; bugfix on 0.2.0.1-alpha.
    -   Check the BRIDGE\_DIRINFO flag bitwise rather than using equality. Previously, directories offering BRIDGE\_DIRINFO and some other flag (i.e. microdescriptors or extrainfo) would be ignored when looking for bridges. Partially fixes bug 13163; bugfix on 0.2.0.7-alpha.
-   Minor bugfixes (networking):
    -   Check for orconns and use connection\_or\_close\_for\_error() rather than connection\_mark\_for\_close() directly in the getsockopt() failure case of connection\_handle\_write\_impl(). Fixes bug 11302; bugfix on 0.2.4.4-alpha.
-   Minor bugfixes (relay):
    -   When generating our family list, remove spaces from around the entries. Fixes bug 12728; bugfix on 0.2.1.7-alpha.
    -   If our previous bandwidth estimate was 0 bytes, allow publishing a new relay descriptor immediately. Fixes bug 13000; bugfix on 0.1.1.6-alpha.
-   Minor bugfixes (testing networks):
    -   Fix TestingDirAuthVoteGuard to properly give out Guard flags in a testing network. Fixes bug 13064; bugfix on 0.2.5.2-alpha.
    -   Stop using the default authorities in networks which provide both AlternateDirAuthority and AlternateBridgeAuthority. Partially fixes bug 13163; bugfix on 0.2.0.13-alpha.
-   Minor bugfixes (testing):
    -   Stop spawn test failures due to a race condition between the SIGCHLD handler updating the process status, and the test reading it. Fixes bug 13291; bugfix on 0.2.3.3-alpha.
-   Minor bugfixes (testing, Windows):
    -   Avoid passing an extra backslash when creating a temporary directory for running the unit tests on Windows. Fixes bug 12392; bugfix on 0.2.2.25-alpha. Patch from Gisle Vanem.
-   Minor bugfixes (windows):
    -   Remove code to special-case handling of NTE\_BAD\_KEYSET when acquiring windows CryptoAPI context. This error can't actually occur for the parameters we're providing. Fixes bug 10816; bugfix on 0.0.2pre26.
-   Minor bugfixes (zlib):
    -   Avoid truncating a zlib stream when trying to finalize it with an empty output buffer. Fixes bug 11824; bugfix on 0.1.1.23.
-   Build fixes:
    -   Allow our configure script to build correctly with autoconf 2.62 again. Fixes bug 12693; bugfix on 0.2.5.2-alpha.
    -   Improve the error message from ./configure to make it clear that when asciidoc has not been found, the user will have to either add --disable-asciidoc argument or install asciidoc. Resolves ticket 13228.
-   Code simplification and refactoring:
    -   Change the entry\_is\_live() function to take named bitfield elements instead of an unnamed list of booleans. Closes ticket 12202.
    -   Refactor and unit-test entry\_is\_time\_to\_retry() in entrynodes.c. Resolves ticket 12205.
    -   Use calloc and reallocarray functions in preference to multiply- then-malloc. This makes it less likely for us to fall victim to an integer overflow attack when allocating. Resolves ticket 12855.
    -   Use the standard macro name SIZE\_MAX, instead of our own SIZE\_T\_MAX.
    -   Document usage of the NO\_DIRINFO and ALL\_DIRINFO flags clearly in functions which take them as arguments. Replace 0 with NO\_DIRINFO in a function call for clarity. Seeks to prevent future issues like 13163.
    -   Avoid 4 null pointer errors under clang shallow analysis by using tor\_assert() to prove that the pointers aren't null. Fixes bug 13284.
    -   Rework the API of policies\_parse\_exit\_policy() to use a bitmask to represent parsing options, instead of a confusing mess of booleans. Resolves ticket 8197.
    -   Introduce a helper function to parse ExitPolicy in or\_options\_t structure.
-   Documentation:
    -   Add a doc/TUNING document with tips for handling large numbers of TCP connections when running busy Tor relay. Update the warning message to point to this file when running out of sockets operating system is allowing to use simultaneously. Resolves ticket 9708.
-   Removed code:
    -   We no longer remind the user about configuration options that have been obsolete since 0.2.3.x or earlier. Patch by Adrien Bak.
-   Removed features:
    -   Remove the --disable-curve25519 configure option. Relays and clients now are required to support curve25519 and the ntor handshake.
    -   The old "StrictEntryNodes" and "StrictExitNodes" options, which used to be deprecated synonyms for "StrictNodes", are now marked obsolete. Resolves ticket 12226.
    -   The "AuthDirRejectUnlisted" option no longer has any effect, as the fingerprints file (approved-routers) has been deprecated.
    -   Directory authorities do not support being Naming dirauths anymore. The "NamingAuthoritativeDir" config option is now obsolete.
    -   Directory authorities do not support giving out the BadDirectory flag anymore.
    -   Clients don't understand the BadDirectory flag in the consensus anymore, and ignore it.
-   Testing:
    -   Refactor the function that chooses guard nodes so that it can more easily be tested; write some tests for it.
    -   Fix and re-enable the fgets\_eagain unit test. Fixes bug 12503; bugfix on 0.2.3.1-alpha. Patch from "cypherpunks."
    -   Create unit tests for format\_time\_interval(). With bug 13393.
    -   Add unit tests for tor\_timegm signed overflow, tor\_timegm and parse\_rfc1123\_time validity checks, correct\_tm year clamping. Unit tests (visible) fixes in bug 13476.
    -   Add a "coverage-html" make target to generate HTML-visualized coverage results when building with --enable-coverage. (Requires lcov.) Patch from Kevin Murray.
    -   Enable the backtrace handler (where supported) when running the unit tests.
    -   Revise all unit tests that used the legacy test\_\* macros to instead use the recommended tt\_\* macros. This patch was generated with coccinelle, to avoid manual errors. Closes ticket 13119.
-   Distribution (systemd):
    -   systemd unit file: only allow tor to write to /var/lib/tor and /var/log/tor. The rest of the filesystem is accessible for reading only. Patch by intrigeri; resolves ticket 12751.
    -   systemd unit file: ensure that the process and all its children can never gain new privileges. Patch by intrigeri; resolves ticket 12939.
    -   systemd unit file: set up /var/run/tor as writable for the Tor service. Patch by intrigeri; resolves ticket 13196.
-   Removed features (directory authorities):
    -   Remove code that prevented authorities from listing Tor relays affected by CVE-2011-2769 as guards. These relays are already rejected altogether due to the minimum version requirement of 0.2.3.16-alpha. Closes ticket 13152.
    -   Directory authorities no longer advertise or support consensus methods 1 through 12 inclusive. These consensus methods were obsolete and/or insecure: maintaining the ability to support them served no good purpose. Implements part of proposal 215; closes ticket 10163.
-   Testing (test-network.sh):
    -   Stop using "echo -n", as some shells' built-in echo doesn't support "-n". Instead, use "/bin/echo -n". Partially fixes bug 13161.
    -   Stop an apparent test-network hang when used with make -j2. Fixes bug 13331.
    -   Add a --delay option to test-network.sh, which configures the delay before the chutney network tests for data transmission. Partially implements ticket 13161.


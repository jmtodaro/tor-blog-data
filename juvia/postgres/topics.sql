--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_ibfk_1;
DROP INDEX public.index_topics_on_site_id_and_key;
DROP INDEX public.index_topics_on_site_id;
ALTER TABLE ONLY public.topics DROP CONSTRAINT topics_pkey;
ALTER TABLE public.topics ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.topics_id_seq;
DROP TABLE public.topics;
SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: topics; Type: TABLE; Schema: public; Owner: jmt; Tablespace: 
--

CREATE TABLE topics (
    id integer NOT NULL,
    site_id integer NOT NULL,
    key character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    created_at timestamp without time zone NOT NULL,
    last_posted_at timestamp without time zone
);


ALTER TABLE public.topics OWNER TO jmt;

--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: jmt
--

CREATE SEQUENCE topics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.topics_id_seq OWNER TO jmt;

--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmt
--

ALTER SEQUENCE topics_id_seq OWNED BY topics.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: jmt
--

ALTER TABLE ONLY topics ALTER COLUMN id SET DEFAULT nextval('topics_id_seq'::regclass);


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: jmt
--

COPY topics (id, site_id, key, title, url, created_at, last_posted_at) FROM stdin;
1	1	/welcome	Welcome	http://tor.jmtodaro.com/welcome/	2007-12-05	2010-06-06
2	1	/vidalia-bundle,-osx-and-qt-bugs	Vidalia bundle, OSX and Qt bugs	http://tor.jmtodaro.com/vidalia-bundle,-osx-and-qt-bugs/	2008-01-20	2008-10-31
3	1	/media-coverage-"covert-channel-vulnerabilities-anonymity-systems"	Media coverage of \"Covert channel vulnerabilities in anonymity systems\"	http://tor.jmtodaro.com/media-coverage-"covert-channel-vulnerabilities-anonymity-systems"/	2008-02-03	2008-03-06
4	1	/january-2008-progress-report	January 2008 Progress Report	http://tor.jmtodaro.com/january-2008-progress-report/	2008-02-18	2008-09-05
5	1	/isaac-mao-elected-one-our-new-directors	Isaac Mao elected as one of our new directors	http://tor.jmtodaro.com/isaac-mao-elected-one-our-new-directors/	2008-02-21	2009-06-12
6	1	/february-2008-progress-report	February 2008 Progress Report	http://tor.jmtodaro.com/february-2008-progress-report/	2008-03-11	2008-04-11
7	1	/tor-project-google-summer-code-2008!	The Tor Project is in Google Summer of Code 2008!	http://tor.jmtodaro.com/tor-project-google-summer-code-2008!/	2008-03-18	2010-10-31
8	1	/talking-german-police-stuttgart	Talking to German police in Stuttgart	http://tor.jmtodaro.com/talking-german-police-stuttgart/	2008-03-26	2011-03-24
9	1	/torbrowser-1.0.1!	TorBrowser 1.0.1!	http://tor.jmtodaro.com/torbrowser-1.0.1!/	2008-04-11	2008-09-03
10	1	/torcheck-rewritten-and-relaunched!	TorCheck rewritten and relaunched!	http://tor.jmtodaro.com/torcheck-rewritten-and-relaunched!/	2008-05-01	2009-10-28
11	1	/security-critical-tor-0.2.0.26-rc-released	Security critical Tor-0.2.0.26-rc released	http://tor.jmtodaro.com/security-critical-tor-0.2.0.26-rc-released/	2008-05-13	2011-12-16
12	1	/debian-openssl-flaw:-what-does-it-mean-tor-clients?	The Debian OpenSSL flaw: what does it mean for Tor clients?	http://tor.jmtodaro.com/debian-openssl-flaw:-what-does-it-mean-tor-clients?/	2008-05-13	2009-03-20
13	1	/april-2008-progress-report	April 2008 Progress Report	http://tor.jmtodaro.com/april-2008-progress-report/	2008-05-14	2009-10-22
14	1	/anonymous-publishing-and-risking-execution	Anonymous Publishing and Risking Execution	http://tor.jmtodaro.com/anonymous-publishing-and-risking-execution/	2008-06-01	2008-09-09
15	1	/nlnet-foundation-funds-two-projects	The NLnet Foundation funds two projects	http://tor.jmtodaro.com/nlnet-foundation-funds-two-projects/	2008-06-06	2008-07-11
16	1	/google-funds-auto-update-vidalia	Google funds an auto-update for Vidalia	http://tor.jmtodaro.com/google-funds-auto-update-vidalia/	2008-06-06	2012-05-04
17	1	/torprojectorg-blocked-gfw-china-sooner-or-later	Torproject.org Blocked by GFW in China: Sooner or Later?	http://tor.jmtodaro.com/torprojectorg-blocked-gfw-china-sooner-or-later/	2008-06-21	2010-08-08
18	1	/may-2008-progress-report	May 2008 Progress Report	http://tor.jmtodaro.com/may-2008-progress-report/	2008-06-24	2009-08-26
19	1	/incognito-and-tor-project-sign-licensing-agreement	Incognito and The Tor Project sign a licensing agreement	http://tor.jmtodaro.com/incognito-and-tor-project-sign-licensing-agreement/	2008-06-27	2010-07-25
20	1	/stable-torbutton-release-approaches	Stable Torbutton Release Approaches	http://tor.jmtodaro.com/stable-torbutton-release-approaches/	2008-07-06	2009-01-04
21	1	/june-2008-progress-report	June 2008 Progress Report	http://tor.jmtodaro.com/june-2008-progress-report/	2008-07-22	2008-08-05
22	1	/fun-build-machines	Fun with build machines	http://tor.jmtodaro.com/fun-build-machines/	2008-08-05	2008-08-31
23	1	/false-positives-0.2.0.30:-rising-found-trojan.psw.win32.undef.adp	False Positives in 0.2.0.30:  RISING found Trojan.PSW.Win32.Undef.adp	http://tor.jmtodaro.com/false-positives-0.2.0.30:-rising-found-trojan.psw.win32.undef.adp/	2008-08-05	2011-02-16
24	1	/vidalia-logo-design-contest	Vidalia Logo Design Contest	http://tor.jmtodaro.com/vidalia-logo-design-contest/	2008-08-15	2009-12-18
25	1	/tor-02030-released-stable	Tor 0.2.0.30 is released as stable	http://tor.jmtodaro.com/tor-02030-released-stable/	2008-08-25	2010-04-25
26	1	/tor-0.2.0.31-released	Tor 0.2.0.31 Released	http://tor.jmtodaro.com/tor-0.2.0.31-released/	2008-09-08	2008-09-21
27	1	/august-2008-progress-report	August 2008 Progress Report	http://tor.jmtodaro.com/august-2008-progress-report/	2008-09-21	2011-11-14
28	1	/september-2008-progress-report	September 2008 Progress Report	http://tor.jmtodaro.com/september-2008-progress-report/	2008-10-14	2011-04-14
29	1	/tor-0.2.1.6-alpha-released	Tor 0.2.1.6-alpha Released	http://tor.jmtodaro.com/tor-0.2.1.6-alpha-released/	2008-10-14	2009-05-02
30	1	/tor,-germany,-and-data-retention	Tor, Germany, and Data Retention	http://tor.jmtodaro.com/tor,-germany,-and-data-retention/	2008-10-16	2010-04-30
31	1	/os-x-vidalia-bundle-thoughts	OS X Vidalia Bundle Thoughts	http://tor.jmtodaro.com/os-x-vidalia-bundle-thoughts/	2008-10-29	2010-06-17
32	1	/anonymity-internet-not-going-away.	Anonymity on the Internet is not going away.	http://tor.jmtodaro.com/anonymity-internet-not-going-away./	2008-11-07	2008-12-18
33	1	/carnival-data-retention-expands	The carnival of data retention expands	http://tor.jmtodaro.com/carnival-data-retention-expands/	2008-11-07	2008-12-15
34	1	/five-years-exit-node-operator	Five Years as an Exit Node Operator	http://tor.jmtodaro.com/five-years-exit-node-operator/	2008-11-11	2012-03-11
35	1	/tor-0.2.1.7-alpha-released	Tor 0.2.1.7-alpha released	http://tor.jmtodaro.com/tor-0.2.1.7-alpha-released/	2008-11-20	2008-12-21
36	1	/knight-pulse,-jillian,-and-tor	Knight Pulse, Jillian, and Tor	http://tor.jmtodaro.com/knight-pulse,-jillian,-and-tor/	2008-11-24	2011-06-13
37	1	/october-2008-progress-report	October 2008 Progress Report	http://tor.jmtodaro.com/october-2008-progress-report/	2008-12-01	2009-03-18
38	1	/tor-02032-released	Tor 0.2.0.32 Released	http://tor.jmtodaro.com/tor-02032-released/	2008-12-04	2010-03-05
39	1	/how-circumvent-internet-proxy-howcast	How to Circumvent an Internet Proxy - Howcast	http://tor.jmtodaro.com/how-circumvent-internet-proxy-howcast/	2008-12-06	2008-12-10
40	1	/tor-0.2.1.8-alpha-now-available	Tor 0.2.1.8-alpha is now available	http://tor.jmtodaro.com/tor-0.2.1.8-alpha-now-available/	2008-12-10	2008-12-12
41	1	/quick-thoughts-tor2web	Quick thoughts on tor2web	http://tor.jmtodaro.com/quick-thoughts-tor2web/	2008-12-15	2010-07-27
42	1	/sha-1-files-popular-request	SHA-1 files by popular request	http://tor.jmtodaro.com/sha-1-files-popular-request/	2008-12-19	2009-08-25
43	1	/our-three-year-development-roadmap-published	Our three-year development roadmap is published	http://tor.jmtodaro.com/our-three-year-development-roadmap-published/	2008-12-19	2009-01-03
44	1	/november-2008-progress-report	November 2008 Progress Report	http://tor.jmtodaro.com/november-2008-progress-report/	2008-12-24	2008-12-30
45	1	/md5-certificate-collision-attack,-and-what-it-means-tor	The MD5 certificate collision attack, and what it means for Tor	http://tor.jmtodaro.com/md5-certificate-collision-attack,-and-what-it-means-tor/	2008-12-30	2010-11-27
46	1	/tor-0.2.1.9-alpha-released	Tor 0.2.1.9-alpha released	http://tor.jmtodaro.com/tor-0.2.1.9-alpha-released/	2009-01-04	2009-07-30
47	1	/tor-0.2.1.10-alpha-released	Tor 0.2.1.10-alpha released	http://tor.jmtodaro.com/tor-0.2.1.10-alpha-released/	2009-01-10	2009-01-25
48	1	/down-0-issues-coverity-scan.	Down to 0 issues on Coverity Scan.	http://tor.jmtodaro.com/down-0-issues-coverity-scan./	2009-01-11	2009-02-04
49	1	/circumvention-and-anonymity	Circumvention and Anonymity	http://tor.jmtodaro.com/circumvention-and-anonymity/	2009-01-12	2010-10-08
50	1	/experimental-os-x-drag-and-drop-vidalia-bundle-installer	Experimental OS X Drag and Drop Vidalia Bundle Installer	http://tor.jmtodaro.com/experimental-os-x-drag-and-drop-vidalia-bundle-installer/	2009-01-13	2010-02-20
51	1	/improvements-hidden-service-performance-or-not?	Improvements on Hidden Service Performance -- or not?	http://tor.jmtodaro.com/improvements-hidden-service-performance-or-not?/	2009-01-15	2010-08-18
52	1	/two-incentive-designs-tor	Two incentive designs for Tor	http://tor.jmtodaro.com/two-incentive-designs-tor/	2009-01-17	2011-02-24
53	1	/tor-0.2.1.11-alpha-released	Tor 0.2.1.11-alpha released	http://tor.jmtodaro.com/tor-0.2.1.11-alpha-released/	2009-01-22	2009-02-10
54	1	/tor-02033-stable-released	Tor 0.2.0.33-stable released	http://tor.jmtodaro.com/tor-02033-stable-released/	2009-01-22	2010-05-30
55	1	/tor-0.2.0.34-stable-released	Tor 0.2.0.34-stable released	http://tor.jmtodaro.com/tor-0.2.0.34-stable-released/	2009-02-09	2009-04-26
56	1	/tor-0.2.1.12-alpha-released	Tor 0.2.1.12-alpha is released	http://tor.jmtodaro.com/tor-0.2.1.12-alpha-released/	2009-02-09	2009-03-13
57	1	/praise-multiple-options-circumvention	In praise of multiple options for circumvention	http://tor.jmtodaro.com/praise-multiple-options-circumvention/	2009-02-16	2009-02-19
58	1	/black-t-shirts-user-request	Black t-shirts by user request	http://tor.jmtodaro.com/black-t-shirts-user-request/	2009-02-17	2009-02-27
59	1	/tor-browser-bundle-1.1.9-released	Tor Browser Bundle 1.1.9 Released	http://tor.jmtodaro.com/tor-browser-bundle-1.1.9-released/	2009-02-19	2010-05-27
60	1	/one-cell-enough	\"One cell is enough to break Tor&#039;s anonymity\"	http://tor.jmtodaro.com/one-cell-enough/	2009-02-19	2012-06-15
61	1	/january-2009-progress-report	January 2009 Progress Report	http://tor.jmtodaro.com/january-2009-progress-report/	2009-02-22	2009-07-25
62	1	/some-notes-progress-iocp-and-libevent	Some notes on progress with IOCP and Libevent	http://tor.jmtodaro.com/some-notes-progress-iocp-and-libevent/	2009-03-01	2010-07-18
63	1	/berkman-2007-circumvention-landscape-and-progress	Berkman 2007 Circumvention Landscape and Progress	http://tor.jmtodaro.com/berkman-2007-circumvention-landscape-and-progress/	2009-03-05	2010-01-21
64	1	/google-summer-code-2008-review	Google Summer of Code 2008 review	http://tor.jmtodaro.com/google-summer-code-2008-review/	2009-03-09	2009-07-21
65	1	/february-2009-progress-report	February 2009 Progress Report	http://tor.jmtodaro.com/february-2009-progress-report/	2009-03-10	2009-03-12
66	1	/updated-guide-blogging-anonymously	Updated guide to blogging anonymously	http://tor.jmtodaro.com/updated-guide-blogging-anonymously/	2009-03-12	2010-11-28
67	1	/why-tor-is-slow	Why Tor is slow and what we&#039;re going to do about it	http://tor.jmtodaro.com/why-tor-is-slow/	2009-03-13	2010-07-02
68	1	/eff-and-tor-google-summer-code-2009	EFF and Tor in Google Summer of Code 2009	http://tor.jmtodaro.com/eff-and-tor-google-summer-code-2009/	2009-03-20	2009-03-21
69	1	/technology-preview-marble-and-vidalia020	Technology Preview:  Marble and Vidalia-0.2.0	http://tor.jmtodaro.com/technology-preview-marble-and-vidalia020/	2009-03-28	2009-07-06
70	1	/tor-browser-bundle-1111-released	Tor Browser Bundle 1.1.11 Released	http://tor.jmtodaro.com/tor-browser-bundle-1111-released/	2009-03-31	2009-09-15
71	1	/antivir-tor-browser-bundle-and-trojan-droppergen-false-positive	AntiVir, Tor Browser Bundle, and trojan Dropper.Gen false positive	http://tor.jmtodaro.com/antivir-tor-browser-bundle-and-trojan-droppergen-false-positive/	2009-04-07	2009-11-19
72	1	/march-2009-progress-report	March 2009 Progress Report	http://tor.jmtodaro.com/march-2009-progress-report/	2009-04-13	2009-11-27
73	1	/tor-02114rc-released	Tor 0.2.1.14-rc released	http://tor.jmtodaro.com/tor-02114rc-released/	2009-04-13	2011-01-20
74	1	/tor-browser-bundle-1112-released	Tor Browser Bundle 1.1.12 released	http://tor.jmtodaro.com/tor-browser-bundle-1112-released/	2009-04-13	2010-06-23
75	1	/april-2009-progress-report	April 2009 Progress Report	http://tor.jmtodaro.com/april-2009-progress-report/	2009-05-11	2009-07-27
76	1	/performance-measurements-and-blockingresistance-analysis-tor-network	Performance measurements and blocking-resistance analysis in the Tor network	http://tor.jmtodaro.com/performance-measurements-and-blockingresistance-analysis-tor-network/	2009-05-21	2011-10-28
77	1	/testing-tor-browser-bundle-120-dev	Testing Tor Browser Bundle 1.2.0-dev	http://tor.jmtodaro.com/testing-tor-browser-bundle-120-dev/	2009-05-22	2010-02-25
78	1	/tor-02115rc-released	Tor 0.2.1.15-rc released	http://tor.jmtodaro.com/tor-02115rc-released/	2009-05-31	2010-05-14
79	1	/testing-red-flag-linux-rpms	Testing Red Flag Linux rpms	http://tor.jmtodaro.com/testing-red-flag-linux-rpms/	2009-06-08	2009-06-08
80	1	/may-2009-progress-report	May 2009 Progress Report	http://tor.jmtodaro.com/may-2009-progress-report/	2009-06-10	2009-06-19
81	1	/measuring-tor-network-public-directory-information	Measuring the Tor Network from Public Directory Information	http://tor.jmtodaro.com/measuring-tor-network-public-directory-information/	2009-06-16	2009-06-17
82	1	/tor-browser-bundle-121-release-candidate	Tor Browser Bundle 1.2.1 release candidate	http://tor.jmtodaro.com/tor-browser-bundle-121-release-candidate/	2009-06-17	2009-06-18
83	1	/measuring-tor-and-iran	Measuring Tor and Iran	http://tor.jmtodaro.com/measuring-tor-and-iran/	2009-06-19	2011-01-29
84	1	/torflow-node-capacity-integrity-and-reliability-measurements-hotpets	TorFlow Node Capacity, Integrity and Reliability Measurements at HotPETS	http://tor.jmtodaro.com/torflow-node-capacity-integrity-and-reliability-measurements-hotpets/	2009-06-21	2010-01-15
85	1	/tor-browser-bundle-121-released	Tor Browser Bundle 1.2.1 Released	http://tor.jmtodaro.com/tor-browser-bundle-121-released/	2009-06-21	2009-07-09
86	1	/recent-growth-tor-network	On the Recent Growth of the Tor Network	http://tor.jmtodaro.com/recent-growth-tor-network/	2009-06-22	2009-09-28
87	1	/tor-browser-bundle-122-released	Tor Browser Bundle 1.2.2 Released	http://tor.jmtodaro.com/tor-browser-bundle-122-released/	2009-06-24	2010-11-20
88	1	/tor-02116rc-release-candidate-now-available	Tor 0.2.1.16-rc Release Candidate now available	http://tor.jmtodaro.com/tor-02116rc-release-candidate-now-available/	2009-06-24	2009-07-05
89	1	/tor-02035stable-released	Tor 0.2.0.35-stable released	http://tor.jmtodaro.com/tor-02035stable-released/	2009-06-25	2012-04-19
90	1	/measuring-tor-and-iran-part-two	Measuring Tor and Iran (Part two)	http://tor.jmtodaro.com/measuring-tor-and-iran-part-two/	2009-07-01	2009-11-13
91	1	/time-directory-authority-outside-useu	Time for a Directory Authority outside US/EU	http://tor.jmtodaro.com/time-directory-authority-outside-useu/	2009-07-10	2012-04-22
92	1	/june-2009-progress-report	June 2009 Progress Report	http://tor.jmtodaro.com/june-2009-progress-report/	2009-07-11	2009-07-21
93	1	/vidalia-0115-released	Vidalia 0.1.15 Released	http://tor.jmtodaro.com/vidalia-0115-released/	2009-07-12	2009-11-13
94	1	/tor-02035stable-bundles-updated	Tor 0.2.0.35-stable bundles updated	http://tor.jmtodaro.com/tor-02035stable-bundles-updated/	2009-07-12	2009-07-23
95	1	/tor-02117rc-released	Tor 0.2.1.17-rc released	http://tor.jmtodaro.com/tor-02117rc-released/	2009-07-12	2012-03-16
96	1	/tor-browser-bundle-123-and-124-released	Tor Browser Bundle 1.2.3 and 1.2.4 Released	http://tor.jmtodaro.com/tor-browser-bundle-123-and-124-released/	2009-07-12	2011-05-11
97	1	/cimaned-panel-iran-and-new-media	CIMA/NED Panel on Iran and New Media	http://tor.jmtodaro.com/cimaned-panel-iran-and-new-media/	2009-07-14	2009-08-09
98	1	/visit-ncfta	A visit to NCFTA	http://tor.jmtodaro.com/visit-ncfta/	2009-07-14	2009-11-25
99	1	/archivetorprojectorg-now-live	archive.torproject.org is now live	http://tor.jmtodaro.com/archivetorprojectorg-now-live/	2009-07-29	2012-04-03
100	1	/tor-02118-and-02119-released-stable	Tor 0.2.1.18 and 0.2.1.19 released as stable	http://tor.jmtodaro.com/tor-02118-and-02119-released-stable/	2009-08-06	2009-09-15
101	1	/tor-browser-bundle-125-and-126-released	Tor Browser Bundle 1.2.5 and 1.2.6 released	http://tor.jmtodaro.com/tor-browser-bundle-125-and-126-released/	2009-08-06	2010-06-19
102	1	/tor-browser-bundle-127-released	Tor Browser Bundle 1.2.7 Released	http://tor.jmtodaro.com/tor-browser-bundle-127-released/	2009-08-06	2009-10-05
103	1	/july-2009-progress-report	July 2009 Progress Report	http://tor.jmtodaro.com/july-2009-progress-report/	2009-08-10	2009-11-13
104	1	/vidalia-022-released	Vidalia 0.2.2 Released	http://tor.jmtodaro.com/vidalia-022-released/	2009-08-15	2009-09-02
105	1	/testing-tor-browser-bundle-127dev	Testing Tor Browser Bundle 1.2.7-dev	http://tor.jmtodaro.com/testing-tor-browser-bundle-127dev/	2009-08-15	2009-08-24
106	1	/har2009-video-tor-performance	Roger&#039;s HAR2009 talk on Tor performance	http://tor.jmtodaro.com/har2009-video-tor-performance/	2009-08-19	2010-05-16
107	1	/investigating-http-proxy-performance-tor	Investigating http proxy performance with Tor	http://tor.jmtodaro.com/investigating-http-proxy-performance-tor/	2009-08-19	2010-02-06
108	1	/tor-browser-bundle-128-released	Tor Browser Bundle 1.2.8 released	http://tor.jmtodaro.com/tor-browser-bundle-128-released/	2009-08-19	2011-10-27
109	1	/tor-0221alpha-released	Tor 0.2.2.1-alpha released	http://tor.jmtodaro.com/tor-0221alpha-released/	2009-09-02	2011-10-27
110	1	/vidalia-023-released	Vidalia 0.2.3 released	http://tor.jmtodaro.com/vidalia-023-released/	2009-09-03	2009-09-07
111	1	/summer-conclusion-arm-project	Summer Conclusion (ARM Project)	http://tor.jmtodaro.com/summer-conclusion-arm-project/	2009-09-07	2012-04-21
112	1	/vidalia-024-released	Vidalia 0.2.4 Released	http://tor.jmtodaro.com/vidalia-024-released/	2009-09-07	2009-09-21
113	1	/bridge-distribution-strategies	KAIST freshmen working on bridge distribution strategies	http://tor.jmtodaro.com/bridge-distribution-strategies/	2009-09-08	2011-09-12
114	1	/bittorrent-support-thandy	BitTorrent support for Thandy	http://tor.jmtodaro.com/bittorrent-support-thandy/	2009-09-10	2009-10-29
115	1	/tor-browser-bundle-129-released	Tor Browser Bundle 1.2.9 Released	http://tor.jmtodaro.com/tor-browser-bundle-129-released/	2009-09-11	2011-04-14
116	1	/summer-torbutton	Summer of Torbutton	http://tor.jmtodaro.com/summer-torbutton/	2009-09-15	2009-09-16
117	1	/anonymity-design-versus-policy	Anonymity by Design versus by Policy	http://tor.jmtodaro.com/anonymity-design-versus-policy/	2009-09-16	2011-03-29
118	1	/website-translation-support-translationtorprojectorg	Website translation support for translation.torproject.org	http://tor.jmtodaro.com/website-translation-support-translationtorprojectorg/	2009-09-20	2010-01-24
119	1	/august-2009-progress-report	August 2009 Progress Report	http://tor.jmtodaro.com/august-2009-progress-report/	2009-09-21	2009-11-01
120	1	/tor-partially-blocked-china	Tor partially blocked in China	http://tor.jmtodaro.com/tor-partially-blocked-china/	2009-09-27	2010-06-25
121	1	/tor-0222alpha-released	Tor 0.2.2.2-alpha released	http://tor.jmtodaro.com/tor-0222alpha-released/	2009-10-09	2009-10-19
122	1	/september-2009-progress-report	September 2009 Progress Report	http://tor.jmtodaro.com/september-2009-progress-report/	2009-10-10	2009-10-20
123	1	/thoughts-on-user-generated-t-shirts	Thoughts on user generated t-shirts?	http://tor.jmtodaro.com/thoughts-on-user-generated-t-shirts/	2009-10-11	2009-11-27
124	1	/tor-0225-alpha-released	Tor 0.2.2.5-alpha released	http://tor.jmtodaro.com/tor-0225-alpha-released/	2009-10-12	2009-10-28
125	1	/picturing-tor-censorship-china	Picturing Tor censorship in China	http://tor.jmtodaro.com/picturing-tor-censorship-china/	2009-10-13	2010-06-22
126	1	/vidalia-025-released	Vidalia 0.2.5 Released	http://tor.jmtodaro.com/vidalia-025-released/	2009-10-17	2010-06-21
127	1	/gsoc-wrapup-2009	Google Summer of Code 2009 Wrap-up	http://tor.jmtodaro.com/gsoc-wrapup-2009/	2009-10-26	2009-11-12
128	1	/vidalia-026-released	Vidalia 0.2.6 Released	http://tor.jmtodaro.com/vidalia-026-released/	2009-11-12	2011-04-27
129	1	/blogfest-asia-2009	Blogfest Asia 2009	http://tor.jmtodaro.com/blogfest-asia-2009/	2009-11-12	2009-12-31
130	1	/october-2009-progress-report	October 2009 Progress Report	http://tor.jmtodaro.com/october-2009-progress-report/	2009-11-12	2009-11-23
131	1	/tor-02120-released	Tor 0.2.1.20 Released	http://tor.jmtodaro.com/tor-02120-released/	2009-11-12	2010-10-08
132	1	/installing-and-using-tor	Installing and using Tor	http://tor.jmtodaro.com/installing-and-using-tor/	2009-11-19	2010-11-30
133	1	/tor-browser-bundle-1210-released	Tor Browser Bundle 1.2.10 Released	http://tor.jmtodaro.com/tor-browser-bundle-1210-released/	2009-11-20	2012-04-13
134	1	/thanks-shinjiru	Thanks to Shinjiru	http://tor.jmtodaro.com/thanks-shinjiru/	2009-11-29	2012-06-08
135	1	/tor-0226-alpha-released	Tor 0.2.2.6-alpha released	http://tor.jmtodaro.com/tor-0226-alpha-released/	2009-12-03	2010-05-04
136	1	/conversation-european-donor	Conversation with a European Donor	http://tor.jmtodaro.com/conversation-european-donor/	2009-12-03	2010-02-03
137	1	/polipo-changes-maintainer	Polipo changes maintainer	http://tor.jmtodaro.com/polipo-changes-maintainer/	2009-12-11	2010-12-03
138	1	/november-2009-progress-report	November 2009 Progress Report	http://tor.jmtodaro.com/november-2009-progress-report/	2009-12-14	2010-05-06
139	1	/risks-serving-whenever-you-surf	On the risks of serving whenever you surf	http://tor.jmtodaro.com/risks-serving-whenever-you-surf/	2009-12-23	2010-01-04
140	1	/new-stable-released-tor-02121	New Stable released, Tor 0.2.1.21	http://tor.jmtodaro.com/new-stable-released-tor-02121/	2009-12-30	2010-11-30
141	1	/tor-browser-bundle-130-released	Tor Browser Bundle 1.3.0 Released	http://tor.jmtodaro.com/tor-browser-bundle-130-released/	2010-01-03	2012-04-03
142	1	/tor-and-censorship-lessons-learned	Tor and Censorship:  lessons learned	http://tor.jmtodaro.com/tor-and-censorship-lessons-learned/	2010-01-07	2010-01-31
143	1	/poland-internet-censorship-and-tor	Poland, Internet Censorship, and Tor	http://tor.jmtodaro.com/poland-internet-censorship-and-tor/	2010-01-11	2010-01-14
144	1	/start-tor-legal-support-directory	Start of a Tor Legal Support Directory	http://tor.jmtodaro.com/start-tor-legal-support-directory/	2010-01-11	2011-12-04
145	1	/tor-project-infrastructure-updates	Tor Project infrastructure updates	http://tor.jmtodaro.com/tor-project-infrastructure-updates/	2010-01-22	2011-11-22
146	1	/updates-internet-censorship-poland	Updates on Internet Censorship in Poland	http://tor.jmtodaro.com/updates-internet-censorship-poland/	2010-01-22	2011-10-30
147	1	/net-freedom-secretary-clinton-and-tor	Net Freedom, Secretary Clinton, and Tor	http://tor.jmtodaro.com/net-freedom-secretary-clinton-and-tor/	2010-01-23	2010-02-12
148	1	/tor-02122-released	Tor 0.2.1.22 Released	http://tor.jmtodaro.com/tor-02122-released/	2010-01-23	2012-04-18
149	1	/tor-0227-alpha-released	Tor 0.2.2.7-alpha released	http://tor.jmtodaro.com/tor-0227-alpha-released/	2010-01-23	2010-02-19
150	1	/tor-browser-bundle-131-released	Tor Browser Bundle 1.3.1 Released	http://tor.jmtodaro.com/tor-browser-bundle-131-released/	2010-01-23	2012-02-29
151	1	/apple-broke-openssl-which-breaks-tor-os-x	Apple broke OpenSSL which breaks Tor on OS X	http://tor.jmtodaro.com/apple-broke-openssl-which-breaks-tor-os-x/	2010-01-27	2011-03-29
152	1	/effs-panopticlick-and-torbutton	EFF&#039;s Panopticlick and Torbutton	http://tor.jmtodaro.com/effs-panopticlick-and-torbutton/	2010-01-29	2010-02-06
153	1	/apple-workaround-openssl-issues-os-x-105-and-106	Apple workaround for openssl issues on OS X 10.5 and 10.6	http://tor.jmtodaro.com/apple-workaround-openssl-issues-os-x-105-and-106/	2010-01-31	2011-04-14
154	1	/january-2010-progress-report	January 2010 Progress Report	http://tor.jmtodaro.com/january-2010-progress-report/	2010-02-13	2010-02-25
155	1	/new-linux-packaging-tor-and-vidalia-now-available	New Linux packaging of Tor and Vidalia now available	http://tor.jmtodaro.com/new-linux-packaging-tor-and-vidalia-now-available/	2010-02-13	2012-05-15
156	1	/tor-nokia-n900-maemo-gsm-telephone	Tor on the Nokia N900 (Maemo) GSM telephone	http://tor.jmtodaro.com/tor-nokia-n900-maemo-gsm-telephone/	2010-02-18	2012-01-08
157	1	/new-stable-version-02124-released	New Stable Version 0.2.1.24 released	http://tor.jmtodaro.com/new-stable-version-02124-released/	2010-03-03	2010-06-19
158	1	/tor-android	Tor on Android	http://tor.jmtodaro.com/tor-android/	2010-03-04	2012-05-07
159	1	/china-blocking-tor-round-two	China blocking Tor:  Round Two	http://tor.jmtodaro.com/china-blocking-tor-round-two/	2010-03-11	2010-06-19
160	1	/february-2010-progress-report	February 2010 Progress Report	http://tor.jmtodaro.com/february-2010-progress-report/	2010-03-23	2010-06-14
161	1	/life-without-ca	Life without a CA	http://tor.jmtodaro.com/life-without-ca/	2010-03-26	2010-06-05
162	1	/tor-browser-bundle-gnulinux	Tor Browser Bundle for GNU/Linux	http://tor.jmtodaro.com/tor-browser-bundle-gnulinux/	2010-03-26	2010-05-03
163	1	/announcing-tor-store	Announcing the Tor Store	http://tor.jmtodaro.com/announcing-tor-store/	2010-03-29	2010-04-05
164	1	/end-life-tor-020x-branch	End of Life for Tor 0.2.0.x branch	http://tor.jmtodaro.com/end-life-tor-020x-branch/	2010-03-30	2010-05-25
165	1	/torbutton-release-125-google-captchas-and-addonsmozillaorg	Torbutton Release 1.2.5, Google Captchas, and addons.mozilla.org	http://tor.jmtodaro.com/torbutton-release-125-google-captchas-and-addonsmozillaorg/	2010-04-10	2010-04-14
166	1	/march-2010-progress-report	March 2010 Progress Report	http://tor.jmtodaro.com/march-2010-progress-report/	2010-04-17	2010-05-19
167	1	/tor-02211-alpha-and-02212-alpha-are-out	Tor 0.2.2.11-alpha and 0.2.2.12-alpha are out	http://tor.jmtodaro.com/tor-02211-alpha-and-02212-alpha-are-out/	2010-04-23	2010-05-01
168	1	/you-have-won-tor-sweepstakes-and-other-scams	You have won the Tor sweepstakes and other scams	http://tor.jmtodaro.com/you-have-won-tor-sweepstakes-and-other-scams/	2010-04-28	2010-06-11
169	1	/bittorrent-over-tor-isnt-good-idea	Bittorrent over Tor isn&#039;t a good idea	http://tor.jmtodaro.com/bittorrent-over-tor-isnt-good-idea/	2010-04-30	2010-06-14
170	1	/april-2010-progress-report	April 2010 Progress Report	http://tor.jmtodaro.com/april-2010-progress-report/	2010-05-10	2010-05-25
171	1	/tor-related-research-positions-university-waterloo	Tor-related research positions at the University of Waterloo	http://tor.jmtodaro.com/tor-related-research-positions-university-waterloo/	2010-05-13	2010-05-31
172	1	/vidalia-029-released	Vidalia 0.2.9 Released	http://tor.jmtodaro.com/vidalia-029-released/	2010-05-26	2010-06-09
173	1	/tor-browser-bundle-updates	Tor Browser Bundle Updates	http://tor.jmtodaro.com/tor-browser-bundle-updates/	2010-06-01	2011-04-30
174	1	/plaintext-over-tor-still-plaintext	Plaintext over Tor is still plaintext	http://tor.jmtodaro.com/plaintext-over-tor-still-plaintext/	2010-06-01	2011-10-10
175	1	/technology-preview-bridge-default-microsoft-windows-clients	Technology Preview:  Bridge by default for Microsoft Windows clients	http://tor.jmtodaro.com/technology-preview-bridge-default-microsoft-windows-clients/	2010-06-06	2010-07-03
176	1	/tor-02126-stable-released	Tor 0.2.1.26-stable released	http://tor.jmtodaro.com/tor-02126-stable-released/	2010-06-09	2011-11-10
177	1	/may-2010-progress-report	May 2010 Progress Report	http://tor.jmtodaro.com/may-2010-progress-report/	2010-06-16	2010-06-28
178	1	/https-everywhere-firefox-addon-helps-you-encrypt-web-traffic	HTTPS Everywhere Firefox addon helps you encrypt web traffic	http://tor.jmtodaro.com/https-everywhere-firefox-addon-helps-you-encrypt-web-traffic/	2010-06-17	2010-08-02
179	1	/dear-nigerians-help-us-help-you	Dear Nigerians, help us help you.	http://tor.jmtodaro.com/dear-nigerians-help-us-help-you/	2010-06-28	2010-09-02
180	1	/firefox-private-browsing-mode-torbutton-and-fingerprinting	Firefox Private Browsing Mode, Torbutton, and Fingerprinting	http://tor.jmtodaro.com/firefox-private-browsing-mode-torbutton-and-fingerprinting/	2010-06-30	2010-08-01
181	1	/tips-running-exit-node-minimal-harassment	Tips for Running an Exit Node with Minimal Harassment	http://tor.jmtodaro.com/tips-running-exit-node-minimal-harassment/	2010-06-30	2012-03-16
182	1	/tor-browser-bundle-windows-137-released	Tor Browser Bundle for Windows 1.3.7 Released	http://tor.jmtodaro.com/tor-browser-bundle-windows-137-released/	2010-07-04	2010-07-26
183	1	/june-2010-progress-report	June 2010 Progress Report	http://tor.jmtodaro.com/june-2010-progress-report/	2010-07-13	2010-08-17
184	1	/tor-02214-alpha-released	Tor 0.2.2.14-alpha released	http://tor.jmtodaro.com/tor-02214-alpha-released/	2010-07-19	2010-08-23
185	1	/tor-browser-bundle-windows-139-released	Tor Browser Bundle for Windows 1.3.9 Released	http://tor.jmtodaro.com/tor-browser-bundle-windows-139-released/	2010-07-30	2012-02-28
186	1	/july-2010-progress-report	July 2010 Progress Report	http://tor.jmtodaro.com/july-2010-progress-report/	2010-08-12	2011-05-11
187	1	/torbel-tor-bulk-exit-list-tools	TorBEL: The Tor Bulk Exit List Tools	http://tor.jmtodaro.com/torbel-tor-bulk-exit-list-tools/	2010-08-20	2010-08-26
188	1	/tor-browser-bundle-1010-gnulinux-released	Tor Browser Bundle 1.0.10 for GNU/Linux released	http://tor.jmtodaro.com/tor-browser-bundle-1010-gnulinux-released/	2010-08-23	2010-09-11
189	1	/trip-report-ucsd	Trip report, UCSD	http://tor.jmtodaro.com/trip-report-ucsd/	2010-08-28	2010-09-04
190	1	/trip-report-nsf-data-workshop	Trip report, NSF data workshop	http://tor.jmtodaro.com/trip-report-nsf-data-workshop/	2010-08-30	2010-09-10
191	1	/august-2010-progress-report	August 2010 Progress Report	http://tor.jmtodaro.com/august-2010-progress-report/	2010-09-13	2010-09-14
192	1	/google-chrome-incognito-mode-tor-and-fingerprinting	Google Chrome Incognito Mode, Tor, and Fingerprinting	http://tor.jmtodaro.com/google-chrome-incognito-mode-tor-and-fingerprinting/	2010-09-14	2012-03-14
193	1	/tor-browser-bundle-mac-os-x	Tor Browser Bundle for Mac OS X	http://tor.jmtodaro.com/tor-browser-bundle-mac-os-x/	2010-09-15	2012-05-15
194	1	/boston-tor-hackers-join-us-sunday-september-19th	Boston Tor Hackers:  Join us Sunday September 19th	http://tor.jmtodaro.com/boston-tor-hackers-join-us-sunday-september-19th/	2010-09-15	2010-10-08
195	1	/ten-things-look-circumvention-tool	Ten Things to Look for in a Circumvention Tool	http://tor.jmtodaro.com/ten-things-look-circumvention-tool/	2010-09-17	2010-09-23
196	1	/research-problem-adaptive-throttling-tor-clients-entry-guards	Research problem: adaptive throttling of Tor clients by entry guards	http://tor.jmtodaro.com/research-problem-adaptive-throttling-tor-clients-entry-guards/	2010-09-19	2012-03-27
197	1	/tor-02216-alpha-released	Tor 0.2.2.16-alpha released	http://tor.jmtodaro.com/tor-02216-alpha-released/	2010-09-21	2010-10-17
198	1	/vidalia-0210-released	Vidalia 0.2.10 Released	http://tor.jmtodaro.com/vidalia-0210-released/	2010-09-28	2011-10-13
199	1	/visitor-or-script-tell-you-how-many-your-users-are-probably-tor-users	VisiTor - or: a script to tell you how many of your users are probably Tor users	http://tor.jmtodaro.com/visitor-or-script-tell-you-how-many-your-users-are-probably-tor-users/	2010-10-04	2010-11-13
200	1	/tor-02217-alpha-out	Tor 0.2.2.17-alpha is out	http://tor.jmtodaro.com/tor-02217-alpha-out/	2010-10-04	2010-11-29
201	1	/september-2010-progress-report	September 2010 Progress Report	http://tor.jmtodaro.com/september-2010-progress-report/	2010-10-11	2011-03-21
202	1	/tor-metrics-google-summer-code-2010	Tor Metrics - Google Summer of Code 2010	http://tor.jmtodaro.com/tor-metrics-google-summer-code-2010/	2010-10-14	2010-11-09
203	1	/new-tor-browser-bundles-released	New Tor Browser Bundles released	http://tor.jmtodaro.com/new-tor-browser-bundles-released/	2010-10-28	2010-10-29
204	1	/mac-os-x-vidalia-bundle-02217-alpha-out	Mac OS X Vidalia Bundle with 0.2.2.17-alpha out	http://tor.jmtodaro.com/mac-os-x-vidalia-bundle-02217-alpha-out/	2010-10-28	2011-03-31
205	1	/new-tor-browser-bundles-released-take-two	New Tor Browser Bundles released (take two)	http://tor.jmtodaro.com/new-tor-browser-bundles-released-take-two/	2010-10-29	2012-05-17
206	1	/tor-02218-alpha-available	Tor 0.2.2.18-alpha available	http://tor.jmtodaro.com/tor-02218-alpha-available/	2010-11-17	2010-11-27
207	1	/arm-release-140	Arm Release 1.4.0	http://tor.jmtodaro.com/arm-release-140/	2010-12-01	2011-03-04
208	1	/new-tor-browser-bundle-packages-1	New Tor Browser Bundle packages	http://tor.jmtodaro.com/new-tor-browser-bundle-packages-1/	2011-01-10	2012-06-09
209	1	/update-internet-censorship-iran	Update on Internet censorship in Iran	http://tor.jmtodaro.com/update-internet-censorship-iran/	2011-01-21	2011-11-25
210	1	/weather-change	Weather Change	http://tor.jmtodaro.com/weather-change/	2011-01-29	2011-05-18
211	1	/recent-events-egypt	Recent events in Egypt	http://tor.jmtodaro.com/recent-events-egypt/	2011-01-29	2012-02-11
212	1	/protecting-your-internet-traffic-volatile-times	Protecting your Internet traffic in volatile times	http://tor.jmtodaro.com/protecting-your-internet-traffic-volatile-times/	2011-02-02	2011-02-04
213	1	/research-problem-measuring-safety-tor-network	Research problem: measuring the safety of the Tor network	http://tor.jmtodaro.com/research-problem-measuring-safety-tor-network/	2011-02-06	2011-11-26
214	1	/january-2011-progress-report	January 2011 Progress Report	http://tor.jmtodaro.com/january-2011-progress-report/	2011-02-08	2011-02-20
215	1	/five-minutes-speak	five minutes to speak	http://tor.jmtodaro.com/five-minutes-speak/	2011-02-13	2012-01-23
216	1	/hackfest-thanks	Hackfest Thanks	http://tor.jmtodaro.com/hackfest-thanks/	2011-02-20	2011-03-05
217	1	/london-internet-security-privacy-workshop	London Internet Security & Privacy Workshop	http://tor.jmtodaro.com/london-internet-security-privacy-workshop/	2011-03-05	2011-03-11
218	1	/february-2011-progress-report	February 2011 Progress Report	http://tor.jmtodaro.com/february-2011-progress-report/	2011-03-15	2011-03-22
219	1	/reading-links-21-march-2011-edition	Reading links, 21 March 2011 edition	http://tor.jmtodaro.com/reading-links-21-march-2011-edition/	2011-03-21	2011-03-24
220	1	/detecting-certificate-authority-compromises-and-web-browser-collusion	Detecting Certificate Authority compromises and web browser collusion	http://tor.jmtodaro.com/detecting-certificate-authority-compromises-and-web-browser-collusion/	2011-03-22	2012-03-16
221	1	/tor-project-receives-fsf-award	The Tor Project receives FSF Award	http://tor.jmtodaro.com/tor-project-receives-fsf-award/	2011-03-23	2011-12-16
222	1	/web-developers-and-firefox-hackers-help-us-firefox-4	Web Developers and Firefox Hackers: Help us with Firefox 4	http://tor.jmtodaro.com/web-developers-and-firefox-hackers-help-us-firefox-4/	2011-03-25	2011-04-28
223	1	/firefox-4-tor-browser-bundles-os-x	Firefox 4 Tor Browser Bundles for OS X	http://tor.jmtodaro.com/firefox-4-tor-browser-bundles-os-x/	2011-03-27	2012-04-30
224	1	/windows-bridge-default-bundle	Windows Bridge-by-Default Bundle	http://tor.jmtodaro.com/windows-bridge-default-bundle/	2011-03-31	2011-04-03
225	1	/firefox-4-tor-browser-bundles-gnulinux	Firefox 4 Tor Browser Bundles for GNU/Linux	http://tor.jmtodaro.com/firefox-4-tor-browser-bundles-gnulinux/	2011-04-01	2011-10-08
226	1	/arm-release-142	Arm Release 1.4.2	http://tor.jmtodaro.com/arm-release-142/	2011-04-04	2011-04-08
227	1	/tails-anonymous-operating-system-version-07-released	tails anonymous operating system, version 0.7 released	http://tor.jmtodaro.com/tails-anonymous-operating-system-version-07-released/	2011-04-08	2011-05-27
228	1	/vidalia-get-involved	Vidalia: get involved!	http://tor.jmtodaro.com/vidalia-get-involved/	2011-04-12	2011-05-01
229	1	/march-2011-progress-report	March 2011 Progress Report	http://tor.jmtodaro.com/march-2011-progress-report/	2011-04-12	2011-05-24
230	1	/stockholm-hackfest-may-14th	Stockholm Hackfest, May 14th	http://tor.jmtodaro.com/stockholm-hackfest-may-14th/	2011-04-15	2011-10-08
231	1	/reading-links-15-april	Reading links, 15 April	http://tor.jmtodaro.com/reading-links-15-april/	2011-04-15	2011-04-28
232	1	/firefox-4-tor-browser-bundle-windows	Firefox 4 Tor Browser Bundle for Windows	http://tor.jmtodaro.com/firefox-4-tor-browser-bundle-windows/	2011-04-24	2012-04-23
233	1	/ipv6-future-i-hear	IPv6 is the future, I hear	http://tor.jmtodaro.com/ipv6-future-i-hear/	2011-04-28	2012-02-14
234	1	/toggle-or-not-toggle-end-torbutton	To Toggle, or not to Toggle: The End of Torbutton	http://tor.jmtodaro.com/toggle-or-not-toggle-end-torbutton/	2011-05-02	2012-06-21
235	1	/new-tor-browser-bundles-and-other-packaging-updates	New Tor Browser Bundles (and other packaging updates)	http://tor.jmtodaro.com/new-tor-browser-bundles-and-other-packaging-updates/	2011-05-02	2011-10-26
236	1	/april-2011-progress-report	April 2011 Progress Report	http://tor.jmtodaro.com/april-2011-progress-report/	2011-05-07	2011-05-12
237	1	/code-commit-movie-our-website	Code Commit Movie of our Website	http://tor.jmtodaro.com/code-commit-movie-our-website/	2011-05-08	2011-05-29
238	1	/strategies-getting-more-bridge-addresses	Strategies for getting more bridge addresses	http://tor.jmtodaro.com/strategies-getting-more-bridge-addresses/	2011-05-13	2012-05-15
239	1	/visit-iceland	A visit to Iceland	http://tor.jmtodaro.com/visit-iceland/	2011-05-22	2011-05-25
240	1	/ipv6-and-tor-project-websites	IPv6 and Tor Project Websites	http://tor.jmtodaro.com/ipv6-and-tor-project-websites/	2011-06-08	2011-06-14
241	1	/may-2011-progress-report	May 2011 Progress Report	http://tor.jmtodaro.com/may-2011-progress-report/	2011-06-10	2011-06-13
242	1	/improving-private-browsing-modes-do-not-track-vs-real-privacy-design	Improving Private Browsing Modes: \"Do-Not-Track\" vs Real Privacy by Design	http://tor.jmtodaro.com/improving-private-browsing-modes-do-not-track-vs-real-privacy-design/	2011-06-13	2012-04-02
243	1	/tails-072-released	Tails 0.7.2 Released	http://tor.jmtodaro.com/tails-072-released/	2011-06-13	2011-06-14
244	1	/torbutton-140-released	Torbutton 1.4.0 Released	http://tor.jmtodaro.com/torbutton-140-released/	2011-07-09	2011-08-09
245	1	/june-2011-progress-report	June 2011 Progress Report	http://tor.jmtodaro.com/june-2011-progress-report/	2011-07-13	2011-08-18
246	1	/arm-release-143	Arm Release 1.4.3	http://tor.jmtodaro.com/arm-release-143/	2011-07-17	2011-08-21
247	1	/real-name-internet-versus-reality	Real Name Internet versus Reality	http://tor.jmtodaro.com/real-name-internet-versus-reality/	2011-07-31	2011-08-12
248	1	/july-2011-progress-report	July 2011 Progress Report	http://tor.jmtodaro.com/july-2011-progress-report/	2011-08-10	2011-08-18
249	1	/ending-domestic-violence-nnedv-and-tor	Ending domestic violence, NNEDV, and Tor	http://tor.jmtodaro.com/ending-domestic-violence-nnedv-and-tor/	2011-08-10	2011-11-10
250	1	/we-need-your-good-tor-stories	We need your good Tor stories	http://tor.jmtodaro.com/we-need-your-good-tor-stories/	2011-08-17	2012-06-02
251	1	/research-problem-better-guard-rotation-parameters	Research problem: better guard rotation parameters	http://tor.jmtodaro.com/research-problem-better-guard-rotation-parameters/	2011-08-20	2011-08-30
252	1	/vidalia-0214-out	Vidalia 0.2.14 is out!	http://tor.jmtodaro.com/vidalia-0214-out/	2011-08-28	2011-10-29
253	1	/torbutton-141-released	Torbutton 1.4.1 Released	http://tor.jmtodaro.com/torbutton-141-released/	2011-08-28	2012-06-08
254	1	/new-pythondjango-based-torstatus	New Python/Django-based TorStatus	http://tor.jmtodaro.com/new-pythondjango-based-torstatus/	2011-08-29	2011-08-30
255	1	/gsoc-2011-metadata-anonymisation-toolkit	GSoC 2011: Metadata Anonymisation Toolkit	http://tor.jmtodaro.com/gsoc-2011-metadata-anonymisation-toolkit/	2011-08-30	2011-08-30
256	1	/diginotar-debacle-and-what-you-should-do-about-it	The DigiNotar Debacle, and what you should do about it	http://tor.jmtodaro.com/diginotar-debacle-and-what-you-should-do-about-it/	2011-08-31	2012-06-22
257	1	/new-tor-browser-bundles-4	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-4/	2011-08-31	2012-02-03
258	1	/diginotar-damage-disclosure	DigiNotar Damage Disclosure	http://tor.jmtodaro.com/diginotar-damage-disclosure/	2011-09-04	2012-05-31
259	1	/new-tor-browser-bundles-5	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-5/	2011-09-04	2012-04-29
260	1	/experimental-defense-website-traffic-fingerprinting	Experimental Defense for Website Traffic Fingerprinting	http://tor.jmtodaro.com/experimental-defense-website-traffic-fingerprinting/	2011-09-04	2011-09-15
261	1	/new-tor-browser-bundles-6	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-6/	2011-09-10	2012-06-10
262	1	/iran-blocks-tor-tor-releases-same-day-fix	Iran blocks Tor; Tor releases same-day fix	http://tor.jmtodaro.com/iran-blocks-tor-tor-releases-same-day-fix/	2011-09-14	2012-03-12
263	1	/august-2011-progress-report	August 2011 Progress Report	http://tor.jmtodaro.com/august-2011-progress-report/	2011-09-15	2011-09-27
264	1	/gsoc-2011-tails-greeter-boot-menu-tails	GSoC 2011: tails-greeter - boot menu for TAILS	http://tor.jmtodaro.com/gsoc-2011-tails-greeter-boot-menu-tails/	2011-09-16	2011-09-23
265	1	/tor-and-beast-ssl-attack	Tor and the BEAST SSL attack	http://tor.jmtodaro.com/tor-and-beast-ssl-attack/	2011-09-23	2012-02-28
266	1	/academic-postdoc-phd-and-masters-positions-available-tor-related-research	Academic (Postdoc, PhD, and Master&#039;s) positions available for Tor-related research	http://tor.jmtodaro.com/academic-postdoc-phd-and-masters-positions-available-tor-related-research/	2011-09-24	2011-11-07
267	1	/arm-release-144	Arm Release 1.4.4	http://tor.jmtodaro.com/arm-release-144/	2011-09-25	2011-09-27
268	1	/whither-website-translations	Whither website translations	http://tor.jmtodaro.com/whither-website-translations/	2011-09-28	2011-12-31
269	1	/tor-0235-alpha-out	Tor 0.2.3.5-alpha is out	http://tor.jmtodaro.com/tor-0235-alpha-out/	2011-09-30	2011-10-07
270	1	/new-tor-browser-bundles-7	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-7/	2011-09-30	2012-06-08
271	1	/tails-live-system-version-08-released	Tails Live System version 0.8 released	http://tor.jmtodaro.com/tails-live-system-version-08-released/	2011-10-04	2011-10-24
272	1	/september-2011-progress-report	September 2011 Progress Report	http://tor.jmtodaro.com/september-2011-progress-report/	2011-10-09	2011-10-12
273	1	/support-tor-network-donate-exit-node-providers	Support the Tor Network: Donate to Exit Node Providers	http://tor.jmtodaro.com/support-tor-network-donate-exit-node-providers/	2011-10-10	2011-10-21
274	1	/vidalia-0215-out	Vidalia 0.2.15 is out!	http://tor.jmtodaro.com/vidalia-0215-out/	2011-10-11	2011-11-07
275	1	/new-tor-browser-bundles-8	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-8/	2011-10-12	2012-05-14
276	1	/trip-report-arab-bloggers-meeting-oct-3-7	Trip report, Arab Bloggers Meeting, Oct 3-7	http://tor.jmtodaro.com/trip-report-arab-bloggers-meeting-oct-3-7/	2011-10-16	2011-11-04
277	1	/plain-vidalia-bundles-be-discontinued-dont-panic	Plain Vidalia Bundles to be Discontinued (Don&#039;t Panic!)	http://tor.jmtodaro.com/plain-vidalia-bundles-be-discontinued-dont-panic/	2011-10-20	2012-03-21
278	1	/rumors-tors-compromise-are-greatly-exaggerated	Rumors of Tor&#039;s compromise are greatly exaggerated	http://tor.jmtodaro.com/rumors-tors-compromise-are-greatly-exaggerated/	2011-10-24	2011-12-26
279	1	/tor-02234-released-security-patches	Tor 0.2.2.34 is released (security patches)	http://tor.jmtodaro.com/tor-02234-released-security-patches/	2011-10-27	2011-11-11
280	1	/torsocks-12-released	Torsocks 1.2 Released	http://tor.jmtodaro.com/torsocks-12-released/	2011-10-29	2011-10-30
281	1	/tor-0237-alpha-out	Tor 0.2.3.7-alpha is out	http://tor.jmtodaro.com/tor-0237-alpha-out/	2011-10-30	2011-11-04
282	1	/research-problems-ten-ways-discover-tor-bridges	Research problems: Ten ways to discover Tor bridges	http://tor.jmtodaro.com/research-problems-ten-ways-discover-tor-bridges/	2011-10-31	2011-12-03
283	1	/moving-tor-datagram-transport	Moving Tor to a datagram transport	http://tor.jmtodaro.com/moving-tor-datagram-transport/	2011-11-07	2012-06-09
284	1	/october-2011-progress-report	October 2011 Progress Report	http://tor.jmtodaro.com/october-2011-progress-report/	2011-11-09	2011-11-16
285	1	/new-tor-browser-bundles-9	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-9/	2011-11-11	2012-04-17
286	1	/tails-09-released	Tails 0.9 Released	http://tor.jmtodaro.com/tails-09-released/	2011-11-15	2011-12-12
287	1	/run-tor-bridge-amazon-cloud	Run Tor as a bridge in the Amazon Cloud	http://tor.jmtodaro.com/run-tor-bridge-amazon-cloud/	2011-11-21	2012-05-14
288	1	/suggest-new-name-torouter-win-excito-b3	Suggest a new name for the Torouter, win an Excito B3	http://tor.jmtodaro.com/suggest-new-name-torouter-win-excito-b3/	2011-11-21	2012-02-01
289	1	/tor-0238-alpha-out	Tor 0.2.3.8-alpha is out	http://tor.jmtodaro.com/tor-0238-alpha-out/	2011-11-24	2011-11-25
290	1	/new-tor-browser-bundles-10	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-10/	2011-11-24	2012-01-08
291	1	/different-ways-use-bridge	Different Ways to Use a Bridge	http://tor.jmtodaro.com/different-ways-use-bridge/	2011-11-29	2011-12-08
292	1	/research-problem-five-ways-test-bridge-reachability	Research problem: Five ways to test bridge reachability	http://tor.jmtodaro.com/research-problem-five-ways-test-bridge-reachability/	2011-12-01	2012-01-28
293	1	/tor-0239-alpha-out	Tor 0.2.3.9-alpha is out	http://tor.jmtodaro.com/tor-0239-alpha-out/	2011-12-09	2011-12-12
294	1	/november-2011-progress-report	November 2011 Progress Report	http://tor.jmtodaro.com/november-2011-progress-report/	2011-12-13	2011-12-16
295	1	/tor-02310-alpha-out-security-fix	Tor 0.2.3.10-alpha is out (security fix)	http://tor.jmtodaro.com/tor-02310-alpha-out-security-fix/	2011-12-16	2011-12-22
296	1	/tor-02235-released-security-patches	Tor 0.2.2.35 is released (security patches)	http://tor.jmtodaro.com/tor-02235-released-security-patches/	2011-12-16	2012-01-11
297	1	/new-tor-browser-bundles-11	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-11/	2011-12-16	2012-06-01
298	1	/announcing-tor-farsi-blog	Announcing the Tor Farsi blog	http://tor.jmtodaro.com/announcing-tor-farsi-blog/	2011-12-20	2012-01-10
299	1	/temporary-website-outagesare-fixed	Temporary Website Outages....are fixed	http://tor.jmtodaro.com/temporary-website-outagesare-fixed/	2011-12-21	2012-01-09
300	1	/new-tor-browser-bundles-12	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-12/	2011-12-23	2012-05-29
301	1	/new-packages-openssl-updates	New packages with OpenSSL updates	http://tor.jmtodaro.com/new-packages-openssl-updates/	2012-01-05	2012-01-19
302	1	/knock-knock-knockin-bridges-doors	Knock Knock Knockin&#039; on Bridges&#039; Doors	http://tor.jmtodaro.com/knock-knock-knockin-bridges-doors/	2012-01-07	2012-06-11
303	1	/using-tor-good	Using Tor hidden services for good	http://tor.jmtodaro.com/using-tor-good/	2012-01-07	2012-06-20
304	1	/tails-010-out	Tails 0.10 is out	http://tor.jmtodaro.com/tails-010-out/	2012-01-11	2012-02-11
305	1	/december-2011-progress-report	December 2011 Progress Report	http://tor.jmtodaro.com/december-2011-progress-report/	2012-01-14	2012-03-12
306	1	/updated-tor-cloud-images-380	Updated Tor Cloud images	http://tor.jmtodaro.com/updated-tor-cloud-images-380/	2012-01-16	2012-01-20
307	1	/blackout-against-copyright-overreach-stop-sopa-and-pipa	Blackout Against Copyright Overreach: Stop SOPA and PIPA	http://tor.jmtodaro.com/blackout-against-copyright-overreach-stop-sopa-and-pipa/	2012-01-17	2012-06-02
308	1	/tale-new-censors-vodafone-uk-t-mobile-uk-o2-uk-and-t-mobile-usa	A tale of new censors - Vodafone UK, T-Mobile UK, O2 UK, and T-Mobile USA	http://tor.jmtodaro.com/tale-new-censors-vodafone-uk-t-mobile-uk-o2-uk-and-t-mobile-usa/	2012-01-17	2012-05-24
309	1	/new-tor-browser-bundles-13	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-13/	2012-02-03	2012-06-05
310	1	/iran-partially-blocks-encrypted-network-traffic	Iran partially blocks encrypted network traffic	http://tor.jmtodaro.com/iran-partially-blocks-encrypted-network-traffic/	2012-02-10	2012-05-29
311	1	/january-2012-progress-report	January 2012 Progress Report	http://tor.jmtodaro.com/january-2012-progress-report/	2012-02-12	2012-02-14
312	1	/vidalia-0217-out	Vidalia 0.2.17 is out!	http://tor.jmtodaro.com/vidalia-0217-out/	2012-02-13	2012-03-14
313	1	/new-tor-browser-bundles-14	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-14/	2012-02-13	2012-04-27
314	1	/obfsproxy-next-step-censorship-arms-race	Obfsproxy: the next step in the censorship arms race	http://tor.jmtodaro.com/obfsproxy-next-step-censorship-arms-race/	2012-02-16	2012-05-11
315	1	/kazakhstan-upgrades-censorship-deep-packet-inspection	Kazakhstan upgrades censorship to deep packet inspection	http://tor.jmtodaro.com/kazakhstan-upgrades-censorship-deep-packet-inspection/	2012-02-16	2012-04-26
316	1	/university-washington-open-hackfest	University of Washington Open Hackfest	http://tor.jmtodaro.com/university-washington-open-hackfest/	2012-02-18	2012-02-27
317	1	/new-tor-browser-bundles-15	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-15/	2012-02-19	2012-04-07
318	1	/new-tor-browser-bundles-linux	New Tor Browser Bundles for Linux	http://tor.jmtodaro.com/new-tor-browser-bundles-linux/	2012-02-20	2012-03-11
319	1	/refreshed-tor-cloud-images	Refreshed Tor Cloud Images	http://tor.jmtodaro.com/refreshed-tor-cloud-images/	2012-02-27	2012-02-28
320	1	/uw-hackfest-thanks	UW Hackfest Thanks!	http://tor.jmtodaro.com/uw-hackfest-thanks/	2012-02-27	2012-03-13
321	1	/updates-kazakhstan-internet-censorship	Updates on Kazakhstan Internet Censorship	http://tor.jmtodaro.com/updates-kazakhstan-internet-censorship/	2012-03-02	2012-03-21
322	1	/alpha-bundles-available-testing	Alpha Bundles Available for Testing	http://tor.jmtodaro.com/alpha-bundles-available-testing/	2012-03-06	2012-06-18
323	1	/set-bridge-or-relay-and-join-tor-network-today	Set up a bridge or a relay and join the Tor network today	http://tor.jmtodaro.com/set-bridge-or-relay-and-join-tor-network-today/	2012-03-12	2012-03-28
324	1	/avoid-risk-and-protect-online-identity	Avoid risk and protect online identity	http://tor.jmtodaro.com/avoid-risk-and-protect-online-identity/	2012-03-14	2012-04-05
325	1	/activists-iran-and-syria-targeted-malicious-computer-software	Activists in Iran and Syria targeted with malicious computer software	http://tor.jmtodaro.com/activists-iran-and-syria-targeted-malicious-computer-software/	2012-03-15	2012-04-10
326	1	/protecting-bridge-operators-probing-attacks	Protecting bridge operators from probing attacks	http://tor.jmtodaro.com/protecting-bridge-operators-probing-attacks/	2012-03-15	2012-03-16
327	1	/tor-google-summer-code-2012	Tor in Google Summer of Code 2012	http://tor.jmtodaro.com/tor-google-summer-code-2012/	2012-03-17	2012-04-12
328	1	/new-tor-browser-bundles-updated-linux-again	New Tor Browser Bundles (updated for Linux again)	http://tor.jmtodaro.com/new-tor-browser-bundles-updated-linux-again/	2012-03-17	2012-05-03
329	1	/call-papers-free-and-open-communications-internet-foci-workshop	Call for papers: Free and Open Communications on the Internet (FOCI) Workshop	http://tor.jmtodaro.com/call-papers-free-and-open-communications-internet-foci-workshop/	2012-03-22	2012-04-24
330	1	/february-2012-progress-report	February 2012 Progress Report	http://tor.jmtodaro.com/february-2012-progress-report/	2012-03-27	2012-04-09
331	1	/tor-browser-bundle-mac-osx-and-1058	Tor Browser Bundle, Mac OSX and 10.5.8	http://tor.jmtodaro.com/tor-browser-bundle-mac-osx-and-1058/	2012-04-01	2012-04-25
332	1	/march-2012-progress-report	March 2012 Progress Report	http://tor.jmtodaro.com/march-2012-progress-report/	2012-04-10	2012-04-29
333	1	/ultrasurf-definitive-review	Ultrasurf: the definitive review	http://tor.jmtodaro.com/ultrasurf-definitive-review/	2012-04-16	2012-06-18
334	1	/updated-tor-cloud-images-and-action-required	Updated Tor Cloud images, and action required	http://tor.jmtodaro.com/updated-tor-cloud-images-and-action-required/	2012-04-18	2012-04-26
335	1	/dedicated-core-tor-developer	We&#039;re looking for another dedicated core Tor developer	http://tor.jmtodaro.com/dedicated-core-tor-developer/	2012-04-19	2012-06-14
336	1	/stockholm-internet-forum-trip-report-and-clarifications	Stockholm Internet Forum Trip Report and Clarifications	http://tor.jmtodaro.com/stockholm-internet-forum-trip-report-and-clarifications/	2012-04-22	2012-06-23
337	1	/politically-motivated-censorship-bethlehem-palestine	Politically motivated censorship in Bethlehem, Palestine	http://tor.jmtodaro.com/politically-motivated-censorship-bethlehem-palestine/	2012-04-23	2012-05-04
338	1	/new-tor-browser-bundles-16	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-16/	2012-04-28	2012-06-21
339	1	/arm-release-145	Arm Release 1.4.5	http://tor.jmtodaro.com/arm-release-145/	2012-04-29	2012-05-02
340	1	/introducing-tor-translation-glossary	Introducing the Tor translation glossary	http://tor.jmtodaro.com/introducing-tor-translation-glossary/	2012-04-30	2012-04-30
341	1	/new-tor-browser-bundles-mac-os-x	New Tor Browser Bundles for Mac OS X	http://tor.jmtodaro.com/new-tor-browser-bundles-mac-os-x/	2012-04-30	2012-05-10
342	1	/firefox-security-bug-proxy-bypass-current-tbbs	Firefox security bug (proxy-bypass) in current TBBs	http://tor.jmtodaro.com/firefox-security-bug-proxy-bypass-current-tbbs/	2012-05-02	2012-06-03
343	1	/new-tor-browser-bundles-security-release	New Tor Browser Bundles (security release)	http://tor.jmtodaro.com/new-tor-browser-bundles-security-release/	2012-05-04	2012-06-22
344	1	/gsoc-2012-projects	GSoC 2012 Projects	http://tor.jmtodaro.com/gsoc-2012-projects/	2012-05-04	2012-05-20
345	1	/new-tor-browser-bundles-17	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-17/	2012-05-12	2012-06-01
346	1	/vidalia-0219-out	Vidalia 0.2.19 is out!	http://tor.jmtodaro.com/vidalia-0219-out/	2012-05-14	2012-06-13
347	1	/volunteer-qa-price-freedom-eternal-vigilance	Volunteer QA: The Price of Freedom is Eternal Vigilance	http://tor.jmtodaro.com/volunteer-qa-price-freedom-eternal-vigilance/	2012-05-23	2012-06-13
348	1	/new-tor-browser-bundles-windows	New Tor Browser Bundles for Windows	http://tor.jmtodaro.com/new-tor-browser-bundles-windows/	2012-05-25	2012-06-03
349	1	/ethiopia-introduces-deep-packet-inspection	Ethiopia Introduces Deep Packet Inspection	http://tor.jmtodaro.com/ethiopia-introduces-deep-packet-inspection/	2012-05-31	2012-06-18
350	1	/update-censorship-ethiopia	An update on the censorship in Ethiopia	http://tor.jmtodaro.com/update-censorship-ethiopia/	2012-06-03	2012-10-01
351	1	/new-tor-browser-bundles-18	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-18/	2012-06-05	2012-06-22
352	1	/new-tor-browser-bundles-19	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-19/	2012-06-12	2012-10-16
353	1	/security-vulnerability-found-cyberoam-dpi-devices-cve-2012-3372	Security vulnerability found in Cyberoam DPI devices (CVE-2012-3372)	http://tor.jmtodaro.com/security-vulnerability-found-cyberoam-dpi-devices-cve-2012-3372/	2012-07-03	2012-11-09
354	1	/florence-hackfest-thanks	Florence Hackfest Thanks	http://tor.jmtodaro.com/florence-hackfest-thanks/	2012-07-10	2012-08-21
355	1	/announcing-tor-reports	Announcing Tor Reports	http://tor.jmtodaro.com/announcing-tor-reports/	2012-07-15	2012-10-22
356	1	/turning-funding-more-exit-relays	Turning funding into more exit relays	http://tor.jmtodaro.com/turning-funding-more-exit-relays/	2012-07-24	2012-09-11
357	1	/new-tor-browser-bundles-20	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-20/	2012-07-29	2012-09-08
358	1	/tor-has-funding-another-browser-hacker	Tor has funding for another browser hacker	http://tor.jmtodaro.com/tor-has-funding-another-browser-hacker/	2012-08-01	2012-09-30
359	1	/updated-tor-cloud-images-fix-tor-upgrades	Updated Tor Cloud images with fix for Tor upgrades	http://tor.jmtodaro.com/updated-tor-cloud-images-fix-tor-upgrades/	2012-08-10	2012-09-18
360	1	/new-tor-browser-and-obfsproxy-bundles	New Tor Browser and Obfsproxy Bundles	http://tor.jmtodaro.com/new-tor-browser-and-obfsproxy-bundles/	2012-08-12	2012-09-08
361	1	/new-stable-tor-browser-bundles	New Stable Tor Browser Bundles	http://tor.jmtodaro.com/new-stable-tor-browser-bundles/	2012-08-17	2012-11-10
362	1	/wading-social-waters	Wading into social waters	http://tor.jmtodaro.com/wading-social-waters/	2012-08-23	2012-09-20
363	1	/new-tor-browser-bundles-21	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-21/	2012-08-29	2012-10-13
364	1	/www-archive-ns-and-rsync-1	www, archive, ns, and rsync +1	http://tor.jmtodaro.com/www-archive-ns-and-rsync-1/	2012-09-11	2012-10-11
365	1	/new-bundles-security-release	New bundles (security release)	http://tor.jmtodaro.com/new-bundles-security-release/	2012-09-12	2012-10-31
366	1	/some-thoughts-crime-attack	Some thoughts on the CRIME attack	http://tor.jmtodaro.com/some-thoughts-crime-attack/	2012-09-14	2012-10-20
367	1	/new-tor-cloud-images	New Tor Cloud images	http://tor.jmtodaro.com/new-tor-cloud-images/	2012-09-20	2012-09-30
368	1	/obfsproxy-bridges-amazon-cloud	Obfsproxy Bridges in the Amazon Cloud	http://tor.jmtodaro.com/obfsproxy-bridges-amazon-cloud/	2012-09-26	2012-10-18
369	1	/tor-has-funding-project-coordinator	Tor has funding for a project coordinator	http://tor.jmtodaro.com/tor-has-funding-project-coordinator/	2012-10-01	2012-10-07
370	1	/top-changes-tor-2004-design-paper-part-1	Top changes in Tor since the 2004 design paper (Part 1)	http://tor.jmtodaro.com/top-changes-tor-2004-design-paper-part-1/	2012-10-04	2012-10-29
371	1	/new-tor-browser-bundles-22	New Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-22/	2012-10-15	2012-11-06
372	1	/top-changes-tor-2004-design-paper-part-2	Top changes in Tor since the 2004 design paper (Part 2)	http://tor.jmtodaro.com/top-changes-tor-2004-design-paper-part-2/	2012-10-22	2012-10-31
373	1	/new-tor-browser-bundles-and-alpha-bundles-451	New Tor Browser Bundles and alpha bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-and-alpha-bundles-451/	2012-10-23	2012-10-28
374	1	/new-tor-browser-bundles-and-alpha-bundles-0	New Tor Browser Bundles and alpha bundles	http://tor.jmtodaro.com/new-tor-browser-bundles-and-alpha-bundles-0/	2012-10-29	2012-11-09
375	1	/top-changes-tor-2004-design-paper-part-3	Top changes in Tor since the 2004 design paper (Part 3)	http://tor.jmtodaro.com/top-changes-tor-2004-design-paper-part-3/	2012-11-01	2012-11-12
376	1	/updated-tor-cloud-images-0	Updated Tor Cloud images	http://tor.jmtodaro.com/updated-tor-cloud-images-0/	2012-11-11	2012-11-13
377	1	/scripps-j-school-ohio-university-trip-report	Scripps J School at Ohio University Trip Report	http://tor.jmtodaro.com/scripps-j-school-ohio-university-trip-report/	2012-11-13	2012-11-27
378	1	/employers-against-domestic-violence-and-technology-panel	Employers Against Domestic Violence and Technology Panel	http://tor.jmtodaro.com/employers-against-domestic-violence-and-technology-panel/	2012-11-19	2013-01-01
379	1	/transparency-openness-and-our-2011-financial-docs	Transparency, openness, and our 2011 financial docs	http://tor.jmtodaro.com/transparency-openness-and-our-2011-financial-docs/	2012-11-26	2012-11-28
380	1	/updated-tor-cloud-images-1	Updated Tor Cloud images	http://tor.jmtodaro.com/updated-tor-cloud-images-1/	2012-11-28	2013-02-10
381	1	/we-are-hiring-support-assistants-and-translators	We are hiring support assistants and translators!	http://tor.jmtodaro.com/we-are-hiring-support-assistants-and-translators/	2012-11-28	2012-12-13
382	1	/tor-projects-position-draft-communications-data-bill	The Tor Project&#039;s position on the draft Communications Data Bill	http://tor.jmtodaro.com/tor-projects-position-draft-communications-data-bill/	2012-11-29	2012-12-04
383	1	/new-tor-browser-packages-tor-023-upgrade	New Tor Browser Packages with Tor 0.2.3 upgrade	http://tor.jmtodaro.com/new-tor-browser-packages-tor-023-upgrade/	2012-12-03	2013-03-28
384	1	/tor-browser-bundle-alpha-testing-tor-024x-branch	Tor Browser Bundle alpha testing with Tor 0.2.4.x-branch	http://tor.jmtodaro.com/tor-browser-bundle-alpha-testing-tor-024x-branch/	2012-12-04	2013-01-05
385	1	/communications-data-bill-committee-publishes-report	Communications Data Bill Committee publishes report	http://tor.jmtodaro.com/communications-data-bill-committee-publishes-report/	2012-12-10	2012-12-13
386	1	/trip-report-october-fbi-conference	Trip report, October FBI conference	http://tor.jmtodaro.com/trip-report-october-fbi-conference/	2012-12-16	2013-04-30
387	1	/trip-report-acm-ccswpes	Trip report, ACM CCS/WPES	http://tor.jmtodaro.com/trip-report-acm-ccswpes/	2012-12-16	2012-12-26
388	1	/hacking-against-domestic-violence	Hacking Against Domestic Violence	http://tor.jmtodaro.com/hacking-against-domestic-violence/	2012-12-17	2013-01-13
389	1	/shadow-v161-released-adds-multi-threading-support	Shadow v1.6.1 released, adds multi-threading support	http://tor.jmtodaro.com/shadow-v161-released-adds-multi-threading-support/	2012-12-24	2012-12-29
390	1	/trip-report-german-foreign-office	Trip report, German Foreign Office	http://tor.jmtodaro.com/trip-report-german-foreign-office/	2013-01-02	2013-01-08
391	1	/new-tor-browser-bundles-and-tor-0247-alpha-packages-available	New Tor Browser Bundles and Tor 0.2.4.7-alpha packages available	http://tor.jmtodaro.com/new-tor-browser-bundles-and-tor-0247-alpha-packages-available/	2013-01-06	2013-06-22
392	1	/trip-report-29c3	Trip report, 29c3	http://tor.jmtodaro.com/trip-report-29c3/	2013-01-10	2013-03-26
393	1	/combined-flash-proxy-pyobfsproxy-browser-bundles	Combined flash proxy + pyobfsproxy browser bundles	http://tor.jmtodaro.com/combined-flash-proxy-pyobfsproxy-browser-bundles/	2013-01-14	2013-04-17
394	1	/visual-overview-tor-network	Visual overview of the Tor network	http://tor.jmtodaro.com/visual-overview-tor-network/	2013-01-28	2013-01-28
395	1	/new-firefox-17-and-tor-alpha-bundles	New Firefox 17 and Tor alpha bundles	http://tor.jmtodaro.com/new-firefox-17-and-tor-alpha-bundles/	2013-01-28	2013-03-05
396	1	/trip-report-world-bank-and-second-muse-domestic-violence-hackathon	Trip Report: World Bank and Second Muse Domestic Violence Hackathon	http://tor.jmtodaro.com/trip-report-world-bank-and-second-muse-domestic-violence-hackathon/	2013-01-29	2013-02-03
397	1	/meeting-soca-london	Meeting With SOCA in London	http://tor.jmtodaro.com/meeting-soca-london/	2013-02-04	2013-06-27
398	1	/training-journalists-istanbul	Training Journalists in Istanbul	http://tor.jmtodaro.com/training-journalists-istanbul/	2013-02-04	2013-06-29
399	1	/trip-report-tor-trainings-dutch-and-belgian-police	Trip report: Tor trainings for the Dutch and Belgian police	http://tor.jmtodaro.com/trip-report-tor-trainings-dutch-and-belgian-police/	2013-02-05	2013-05-24
400	1	/towards-tor-censorship-analysis-tool	Towards a Tor Censorship Analysis Tool	http://tor.jmtodaro.com/towards-tor-censorship-analysis-tool/	2013-02-06	2013-02-28
401	1	/new-bundles	New Bundles	http://tor.jmtodaro.com/new-bundles/	2013-02-08	2013-04-08
402	1	/torbirdy-our-first-beta-release	TorBirdy: our first beta release!	http://tor.jmtodaro.com/torbirdy-our-first-beta-release/	2013-02-11	2013-07-12
403	1	/new-tor-browser-bundles-firefox-1703esr	New Tor Browser Bundles with Firefox 17.0.3esr	http://tor.jmtodaro.com/new-tor-browser-bundles-firefox-1703esr/	2013-02-22	2013-07-10
404	1	/new-flash-proxy-talk	New flash proxy talk	http://tor.jmtodaro.com/new-flash-proxy-talk/	2013-02-26	2013-03-25
405	1	/cryptoparty-stockholm	CryptoParty Stockholm	http://tor.jmtodaro.com/cryptoparty-stockholm/	2013-03-05	2013-03-26
406	1	/join-us-tor-project-boston-hack-day-event-march-20-2013-hosted-boston-universitys-department-co	JOIN US - Tor Project Boston Hack Day Event - March 20, 2013 - Hosted by Boston University&#039;s Department of Computer Science	http://tor.jmtodaro.com/join-us-tor-project-boston-hack-day-event-march-20-2013-hosted-boston-universitys-department-co/	2013-03-06	2013-03-28
407	1	/new-firefox-1704esr-and-tor-02411-alpha-bundles	New Firefox 17.0.4esr and Tor 0.2.4.11-alpha bundles	http://tor.jmtodaro.com/new-firefox-1704esr-and-tor-02411-alpha-bundles/	2013-03-14	2013-04-02
408	1	/2012-annual-report	2012 Annual Report	http://tor.jmtodaro.com/2012-annual-report/	2013-03-19	2013-04-08
409	1	/new-pluggable-transports-bundles-02411-alpha-flashproxy-obfsproxy	New Pluggable Transports bundles 0.2.4.11-alpha (flashproxy + obfsproxy)	http://tor.jmtodaro.com/new-pluggable-transports-bundles-02411-alpha-flashproxy-obfsproxy/	2013-03-19	2013-07-11
410	1	/new-name-obfsproxy-tor-browser-bundles	New Name for Obfsproxy Tor Browser Bundles	http://tor.jmtodaro.com/new-name-obfsproxy-tor-browser-bundles/	2013-03-22	2013-04-15
411	1	/introduction-digital-security-cij	Introduction to Digital Security With the CIJ	http://tor.jmtodaro.com/introduction-digital-security-cij/	2013-03-29	2013-04-16
412	1	/stem-release-10	Stem Release 1.0	http://tor.jmtodaro.com/stem-release-10/	2013-03-30	2013-04-03
413	1	/new-tor-browser-bundles-firefox-1705esr	New Tor Browser Bundles with Firefox 17.0.5esr	http://tor.jmtodaro.com/new-tor-browser-bundles-firefox-1705esr/	2013-04-04	2013-06-24
414	1	/tor-google-summer-code-2013	Tor in Google Summer of Code 2013	http://tor.jmtodaro.com/tor-google-summer-code-2013/	2013-04-10	2013-04-11
415	1	/tor-help-desk-expands-four-more-languages	Tor help desk expands with four more languages	http://tor.jmtodaro.com/tor-help-desk-expands-four-more-languages/	2013-04-11	2013-06-02
416	1	/forensic-analysis-tor-linux	Forensic Analysis of Tor on Linux	http://tor.jmtodaro.com/forensic-analysis-tor-linux/	2013-04-12	2013-05-15
417	1	/new-tor-cloud-images-obfs3	New Tor Cloud images with obfs3	http://tor.jmtodaro.com/new-tor-cloud-images-obfs3/	2013-04-13	2013-05-07
418	1	/trip-report-white-house-forum-combat-human-trafficking	Trip Report: White House Forum to Combat Human Trafficking	http://tor.jmtodaro.com/trip-report-white-house-forum-combat-human-trafficking/	2013-04-18	2013-06-12
419	1	/hidden-services-need-some-love	Hidden Services need some love	http://tor.jmtodaro.com/hidden-services-need-some-love/	2013-04-22	2013-06-16
420	1	/new-tor-02412-alpha-packages-and-tor-browser-bundles	New Tor 0.2.4.12-alpha packages and Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-02412-alpha-packages-and-tor-browser-bundles/	2013-04-29	2013-05-14
421	1	/calea-2-and-tor	CALEA 2 and Tor	http://tor.jmtodaro.com/calea-2-and-tor/	2013-05-09	2013-06-10
422	1	/new-tor-browser-bundles-firefox-1706esr	New Tor Browser Bundles with Firefox 17.0.6esr	http://tor.jmtodaro.com/new-tor-browser-bundles-firefox-1706esr/	2013-05-14	2013-06-22
423	1	/pluggable-transports-bundles-2412-alpha-2-pt1-firefox-1706esr	Pluggable transports bundles 2.4.12-alpha-2-pt1 with Firefox 17.0.6esr	http://tor.jmtodaro.com/pluggable-transports-bundles-2412-alpha-2-pt1-firefox-1706esr/	2013-06-02	2013-07-08
424	1	/prism-vs-tor	PRISM vs Tor	http://tor.jmtodaro.com/prism-vs-tor/	2013-06-08	2013-08-07
425	1	/tors-response-prism-surveillance-program	Tor&#039;s Response to Prism Surveillance Program	http://tor.jmtodaro.com/tors-response-prism-surveillance-program/	2013-06-10	2013-08-04
426	1	/updated-64-bit-linux-tor-browser-bundles-crash-fix	Updated 64-bit Linux Tor Browser Bundles (crash fix)	http://tor.jmtodaro.com/updated-64-bit-linux-tor-browser-bundles-crash-fix/	2013-06-12	2013-06-27
427	1	/help-make-tor-qa-page-happen	Help make a Tor Q&A page happen	http://tor.jmtodaro.com/help-make-tor-qa-page-happen/	2013-06-13	2013-06-26
428	1	/announcing-tor-browser-bundle-30alpha1	Announcing Tor Browser Bundle 3.0alpha1	http://tor.jmtodaro.com/announcing-tor-browser-bundle-30alpha1/	2013-06-17	2013-07-23
429	1	/facebook-and-tor	Facebook and Tor	http://tor.jmtodaro.com/facebook-and-tor/	2013-06-18	2013-08-02
430	1	/new-tor-browser-bundles-and-tor-02414-alpha-packages	New Tor Browser Bundles and Tor 0.2.4.14-alpha packages	http://tor.jmtodaro.com/new-tor-browser-bundles-and-tor-02414-alpha-packages/	2013-06-26	2013-08-05
431	1	/tor-browser-bundle-30alpha2-released	Tor Browser Bundle 3.0alpha2 Released	http://tor.jmtodaro.com/tor-browser-bundle-30alpha2-released/	2013-06-30	2013-08-06
432	1	/tor-check-outage-03-and-04-july-2013	Tor Check Outage on 03 and 04 July 2013	http://tor.jmtodaro.com/tor-check-outage-03-and-04-july-2013/	2013-07-04	2013-07-04
433	1	/join-us-tor-hack-day-munich-germany	JOIN US - Tor Hack Day, Munich, Germany	http://tor.jmtodaro.com/join-us-tor-hack-day-munich-germany/	2013-07-08	2013-07-20
434	1	/tor-02415-rc-packages-available	Tor 0.2.4.15-rc packages available	http://tor.jmtodaro.com/tor-02415-rc-packages-available/	2013-07-08	2013-08-03
435	1	/lead-automation-engineer-job-posting	Lead Automation Engineer Job Posting	http://tor.jmtodaro.com/lead-automation-engineer-job-posting/	2013-07-12	2013-08-04
436	1	/hidden-services-current-events-and-freedom-hosting	Hidden Services, Current Events, and Freedom Hosting	http://tor.jmtodaro.com/hidden-services-current-events-and-freedom-hosting/	2013-08-04	2013-08-05
437	1	/tor-security-advisory-old-tor-browser-bundles-vulnerable	Tor security advisory: Old Tor Browser Bundles vulnerable	http://tor.jmtodaro.com/tor-security-advisory-old-tor-browser-bundles-vulnerable/	2013-08-05	2013-08-05
438	1	/nnedv-tech-summit-2013-report	NNEDV Tech Summit 2013 Report	http://tor.jmtodaro.com/nnedv-tech-summit-2013-report/	2013-08-08	2013-08-21
439	1	/new-tor-browser-bundles-firefox-1708esr	New Tor Browser Bundles with Firefox 17.0.8esr	http://tor.jmtodaro.com/new-tor-browser-bundles-firefox-1708esr/	2013-08-09	2013-09-05
440	1	/tor-browser-bundle-30alpha3-released	Tor Browser Bundle 3.0alpha3 Released	http://tor.jmtodaro.com/tor-browser-bundle-30alpha3-released/	2013-08-09	2013-10-11
441	1	/pluggable-transports-bundles-2415-beta-2-pt1-firefox-1708esr	Pluggable transports bundles 2.4.15-beta-2-pt1 with Firefox 17.0.8esr	http://tor.jmtodaro.com/pluggable-transports-bundles-2415-beta-2-pt1-firefox-1708esr/	2013-08-11	2013-10-20
442	1	/new-tor-02416-rc-packages-and-updated-stable-tor-browser-bundles	New Tor 0.2.4.16-rc packages and updated stable Tor Browser Bundles	http://tor.jmtodaro.com/new-tor-02416-rc-packages-and-updated-stable-tor-browser-bundles/	2013-08-13	2013-09-16
443	1	/deterministic-builds-part-one-cyberwar-and-global-compromise	Deterministic Builds Part One: Cyberwar and Global Compromise	http://tor.jmtodaro.com/deterministic-builds-part-one-cyberwar-and-global-compromise/	2013-08-20	2013-10-04
444	1	/how-to-handle-millions-new-tor-clients	How to handle millions of new Tor clients	http://tor.jmtodaro.com/how-to-handle-millions-new-tor-clients/	2013-09-05	2014-03-09
445	1	/new-tor-02417-rc-packages	New Tor 0.2.4.17-rc packages	http://tor.jmtodaro.com/new-tor-02417-rc-packages/	2013-09-06	2013-09-20
446	1	/lifecycle-of-a-new-relay	The lifecycle of a new relay	http://tor.jmtodaro.com/lifecycle-of-a-new-relay/	2013-09-11	2014-08-04
447	1	/tor-nsa-gchq-and-quick-ant-speculation	Tor, NSA, GCHQ, and QUICK ANT Speculation	http://tor.jmtodaro.com/tor-nsa-gchq-and-quick-ant-speculation/	2013-09-11	2013-12-31
448	1	/help-create-qa-site-tor	Help create a Q&A site for Tor!	http://tor.jmtodaro.com/help-create-qa-site-tor/	2013-09-16	2013-09-24
449	1	/new-tor-browser-bundles-firefox-1709esr	New Tor Browser Bundles with Firefox 17.0.9esr	http://tor.jmtodaro.com/new-tor-browser-bundles-firefox-1709esr/	2013-09-20	2013-10-30
450	1	/pluggable-transports-bundles-2417-beta-2-pt3-firefox-1709esr	Pluggable transports bundles 2.4.17-beta-2-pt3 with Firefox 17.0.9esr	http://tor.jmtodaro.com/pluggable-transports-bundles-2417-beta-2-pt3-firefox-1709esr/	2013-09-23	2013-10-23
451	1	/tor-browser-bundle-30alpha4-released	Tor Browser Bundle 3.0alpha4 Released	http://tor.jmtodaro.com/tor-browser-bundle-30alpha4-released/	2013-09-26	2013-11-04
452	1	/tor-and-silk-road-takedown	Tor and the Silk Road takedown	http://tor.jmtodaro.com/tor-and-silk-road-takedown/	2013-10-02	2013-12-19
453	1	/deterministic-builds-part-two-technical-details	Deterministic Builds Part Two: Technical Details	http://tor.jmtodaro.com/deterministic-builds-part-two-technical-details/	2013-10-04	2013-11-08
454	1	/yes-we-know-about-guardian-article	Yes, we know about the Guardian article	http://tor.jmtodaro.com/yes-we-know-about-guardian-article/	2013-10-04	2013-10-13
455	1	/thanks	Thanks!	http://tor.jmtodaro.com/thanks/	2013-10-08	2013-10-16
456	1	/stem-release-11	Stem Release 1.1	http://tor.jmtodaro.com/stem-release-11/	2013-10-14	2013-11-23
457	1	/improving-tors-anonymity-changing-guard-parameters	Improving Tor&#039;s anonymity by changing guard parameters	http://tor.jmtodaro.com/improving-tors-anonymity-changing-guard-parameters/	2013-10-16	2013-12-05
458	1	/new-tor-browser-bundles-firefox-17010esr	New Tor Browser Bundles with Firefox 17.0.10esr	http://tor.jmtodaro.com/new-tor-browser-bundles-firefox-17010esr/	2013-11-01	2014-01-26
459	1	/torbirdy-012-our-third-beta-release	TorBirdy: 0.1.2 - Our third beta release!	http://tor.jmtodaro.com/torbirdy-012-our-third-beta-release/	2013-11-04	2013-11-26
460	1	/pluggable-transports-bundles-2417-rc-1-pt1-firefox-17010esr	Pluggable transports bundles 2.4.17-rc-1-pt1 with Firefox 17.0.10esr	http://tor.jmtodaro.com/pluggable-transports-bundles-2417-rc-1-pt1-firefox-17010esr/	2013-11-04	2013-11-13
461	1	/tor-browser-bundle-30beta1-released	Tor Browser Bundle 3.0beta1 Released	http://tor.jmtodaro.com/tor-browser-bundle-30beta1-released/	2013-11-06	2013-12-22
462	1	/critique-website-traffic-fingerprinting-attacks	A Critique of Website Traffic Fingerprinting Attacks	http://tor.jmtodaro.com/critique-website-traffic-fingerprinting-attacks/	2013-11-07	2013-11-16
463	1	/pluggable-transports-bundles-2417-rc-1-pt2-firefox-17010esr	Pluggable transports bundles 2.4.17-rc-1-pt2 with Firefox 17.0.10esr	http://tor.jmtodaro.com/pluggable-transports-bundles-2417-rc-1-pt2-firefox-17010esr/	2013-11-12	2013-11-28
464	1	/new-tor-browser-bundles-firefox-17011esr-and-tor-02418-rc	New Tor Browser Bundles with Firefox 17.0.11esr and Tor 0.2.4.18-rc	http://tor.jmtodaro.com/new-tor-browser-bundles-firefox-17011esr-and-tor-02418-rc/	2013-11-19	2013-11-28
465	1	/64-bit-gnulinux-tor-browser-bundles-updated	64-bit GNU/Linux Tor Browser Bundles updated	http://tor.jmtodaro.com/64-bit-gnulinux-tor-browser-bundles-updated/	2013-11-20	2014-01-26
466	1	/tor-browser-bundle-30rc1-released	Tor Browser Bundle 3.0rc1 Released	http://tor.jmtodaro.com/tor-browser-bundle-30rc1-released/	2013-11-21	2013-12-07
467	1	/tor-looking-browser-hacker-and-extension-developer	Tor is looking for a Browser Hacker and an Extension Developer!	http://tor.jmtodaro.com/tor-looking-browser-hacker-and-extension-developer/	2013-11-22	2013-12-06
468	1	/pluggable-transports-bundles-2418-rc-1-pt1-and-2418-rc-2-pt1-firefox-17011esr	Pluggable transports bundles 2.4.18-rc-1-pt1 and 2.4.18-rc-2-pt1 with Firefox 17.0.11esr	http://tor.jmtodaro.com/pluggable-transports-bundles-2418-rc-1-pt1-and-2418-rc-2-pt1-firefox-17011esr/	2013-12-04	2014-02-04
469	1	/tor-browser-bundle-35rc1-released	Tor Browser Bundle 3.5rc1 Released	http://tor.jmtodaro.com/tor-browser-bundle-35rc1-released/	2013-12-12	2014-01-24
470	1	/announcement-tor-project-now-accepting-bitcoin-donations	Announcement: The Tor Project is now accepting Bitcoin Donations	http://tor.jmtodaro.com/announcement-tor-project-now-accepting-bitcoin-donations/	2013-12-17	2013-12-30
471	1	/tor-browser-bundle-35-released	Tor Browser Bundle 3.5 is released	http://tor.jmtodaro.com/tor-browser-bundle-35-released/	2013-12-18	2013-12-23
472	1	/tor-website-needs-your-help	Tor website needs your help!	http://tor.jmtodaro.com/tor-website-needs-your-help/	2014-01-05	2014-01-21
473	1	/what-spoiled-onions-paper-means-tor-users	What the \"Spoiled Onions\" paper means for Tor users	http://tor.jmtodaro.com/what-spoiled-onions-paper-means-tor-users/	2014-01-23	2014-03-10
474	1	/new-tor-denial-service-attacks-and-defenses	New Tor Denial of Service Attacks and Defenses	http://tor.jmtodaro.com/new-tor-denial-service-attacks-and-defenses/	2014-01-24	2014-02-15
475	1	/tor-browser-351-released	Tor Browser 3.5.1 is released	http://tor.jmtodaro.com/tor-browser-351-released/	2014-01-27	2014-02-25
476	1	/tor-browser-352-released	Tor Browser 3.5.2 is released	http://tor.jmtodaro.com/tor-browser-352-released/	2014-02-10	2014-03-07
477	1	/join-us-tor-project-developers-meeting-reykjavik-iceland-february-17-21-2014	Join us! The Tor Project Developer&#039;s Meeting - Reykjavik, Iceland - February 17 - 21, 2014	http://tor.jmtodaro.com/join-us-tor-project-developers-meeting-reykjavik-iceland-february-17-21-2014/	2014-02-12	2014-02-17
478	1	/tor-browser-3521-released	Tor Browser 3.5.2.1 is released	http://tor.jmtodaro.com/tor-browser-3521-released/	2014-02-15	2014-03-14
479	1	/tor-google-summer-code-2014	Tor in Google Summer of Code 2014	http://tor.jmtodaro.com/tor-google-summer-code-2014/	2014-02-26	2014-03-11
480	1	/how-to-read-our-china-usage-graphs	How to read our China usage graphs	http://tor.jmtodaro.com/how-to-read-our-china-usage-graphs/	2014-03-17	2014-08-08
481	1	/tor-browser-36-beta-1-released	Tor Browser 3.6-beta-1 is released	http://tor.jmtodaro.com/tor-browser-36-beta-1-released/	2014-03-18	2014-05-09
482	1	/tor-browser-353-released	Tor Browser 3.5.3 is released	http://tor.jmtodaro.com/tor-browser-353-released/	2014-03-19	2014-04-12
483	1	/ways-get-tor-browser-bundle	Ways to get the Tor Browser Bundle	http://tor.jmtodaro.com/ways-get-tor-browser-bundle/	2014-03-29	2014-04-23
484	1	/mission-impossible-hardening-android-security-and-privacy	Mission Impossible: Hardening Android for Security and Privacy	http://tor.jmtodaro.com/mission-impossible-hardening-android-security-and-privacy/	2014-04-02	2014-08-23
485	1	/openssl-bug-cve-2014-0160	OpenSSL bug CVE-2014-0160	http://tor.jmtodaro.com/openssl-bug-cve-2014-0160/	2014-04-07	2014-04-28
486	1	/tor-browser-354-released	Tor Browser 3.5.4 is Released	http://tor.jmtodaro.com/tor-browser-354-released/	2014-04-08	2014-05-01
487	1	/tor-browser-36-beta-2-released	Tor Browser 3.6-beta-2 is released	http://tor.jmtodaro.com/tor-browser-36-beta-2-released/	2014-04-11	2014-04-18
488	1	/call-papers-foci14-workshop	Call for papers: FOCI&#039;14 workshop	http://tor.jmtodaro.com/call-papers-foci14-workshop/	2014-04-17	2014-04-21
489	1	/tor-summer-2014-dev-meeting-hosted-mozilla	Tor Summer 2014 Dev Meeting Hosted by Mozilla	http://tor.jmtodaro.com/tor-summer-2014-dev-meeting-hosted-mozilla/	2014-04-29	2014-05-14
490	1	/tor-browser-36-released	Tor Browser 3.6 is released	http://tor.jmtodaro.com/tor-browser-36-released/	2014-04-29	2014-05-26
491	1	/paypal-account-limits-now-resolved	Paypal Account Limits now resolved	http://tor.jmtodaro.com/paypal-account-limits-now-resolved/	2014-04-30	2014-05-10
492	1	/tor-browser-361-released	Tor Browser 3.6.1 is released	http://tor.jmtodaro.com/tor-browser-361-released/	2014-05-07	2014-07-21
493	1	/10-years-collecting-tor-directory-data	10 years of collecting Tor directory data	http://tor.jmtodaro.com/10-years-collecting-tor-directory-data/	2014-05-15	2014-05-25
494	1	/new-feature-tor-interpreter	New Feature: Tor Interpreter	http://tor.jmtodaro.com/new-feature-tor-interpreter/	2014-05-25	2014-06-12
495	1	/stockholm-may-2014-trip-report	Stockholm May 2014 Trip Report	http://tor.jmtodaro.com/stockholm-may-2014-trip-report/	2014-05-30	2014-06-01
496	1	/stem-release-12	Stem Release 1.2	http://tor.jmtodaro.com/stem-release-12/	2014-06-01	2014-06-14
497	1	/tor-02422-released	tor 0.2.4.22 released	http://tor.jmtodaro.com/tor-02422-released/	2014-06-04	2014-06-14
498	1	/reset-net	Reset the Net!	http://tor.jmtodaro.com/reset-net/	2014-06-04	2014-07-05
499	1	/tor-challenge-2014	Tor Challenge 2014	http://tor.jmtodaro.com/tor-challenge-2014/	2014-06-05	2014-07-23
500	1	/tor-browser-362-released	Tor Browser 3.6.2 is released	http://tor.jmtodaro.com/tor-browser-362-released/	2014-06-09	2014-07-23
501	1	/recent-and-upcoming-developments-pluggable-transports	On recent and upcoming developments in Pluggable Transports	http://tor.jmtodaro.com/recent-and-upcoming-developments-pluggable-transports/	2014-06-15	2014-07-06
502	1	/being-targeted-nsa	On being targeted by the NSA	http://tor.jmtodaro.com/being-targeted-nsa/	2014-07-03	2014-08-02
503	1	/tor-incentives-research-roundup-goldstar-par-braids-lira-tears-and-torcoin	Tor incentives research roundup: GoldStar, PAR, BRAIDS, LIRA, TEARS, and TorCoin	http://tor.jmtodaro.com/tor-incentives-research-roundup-goldstar-par-braids-lira-tears-and-torcoin/	2014-07-14	2014-07-29
504	1	/looking-front-end-web-developers-network-status-websites-atlas-and-globe	Looking for front-end web developers for network status websites Atlas and Globe	http://tor.jmtodaro.com/looking-front-end-web-developers-network-status-websites-atlas-and-globe/	2014-07-17	2014-08-03
505	1	/recent-black-hat-2014-talk-cancellation	On the recent Black Hat 2014 Talk Cancellation	http://tor.jmtodaro.com/recent-black-hat-2014-talk-cancellation/	2014-07-21	2014-08-19
506	1	/tor-browser-363-released	Tor Browser 3.6.3 is released	http://tor.jmtodaro.com/tor-browser-363-released/	2014-07-24	2014-08-14
507	1	/transparency-openness-and-our-2013-financials	Transparency, Openness, and our 2013 Financials	http://tor.jmtodaro.com/transparency-openness-and-our-2013-financials/	2014-07-26	2014-08-11
508	1	/how-report-bad-relays	How to report bad relays	http://tor.jmtodaro.com/how-report-bad-relays/	2014-07-28	2014-08-17
509	1	/tor-security-advisory-relay-early-traffic-confirmation-attack	Tor security advisory: \"relay early\" traffic confirmation attack	http://tor.jmtodaro.com/tor-security-advisory-relay-early-traffic-confirmation-attack/	2014-07-30	2014-08-22
510	1	/tor-browser-364-and-40-alpha-1-are-released	Tor Browser 3.6.4 and 4.0-alpha-1 are released	http://tor.jmtodaro.com/tor-browser-364-and-40-alpha-1-are-released/	2014-08-12	2014-09-07
511	1	/how-use-“meek”-pluggable-transport	How to use the “meek” pluggable transport	http://tor.jmtodaro.com/how-use-“meek”-pluggable-transport/	2014-08-15	2014-08-29
512	1	/isec-partners-conducts-tor-browser-hardening-study	iSEC Partners Conducts Tor Browser Hardening Study	http://tor.jmtodaro.com/isec-partners-conducts-tor-browser-hardening-study/	2014-08-18	2014-08-23
513	1	/call-arms-helping-internet-services-accept-anonymous-users	A call to arms: Helping Internet services accept anonymous users	http://tor.jmtodaro.com/call-arms-helping-internet-services-accept-anonymous-users/	2014-08-29	2014-12-20
514	1	/tor-browser-365-and-40-alpha-2-are-released	Tor Browser 3.6.5 and 4.0-alpha-2 are released	http://tor.jmtodaro.com/tor-browser-365-and-40-alpha-2-are-released/	2014-09-03	2014-09-23
515	1	/ahmia-search-after-gsoc-development	Ahmia search after GSoC development	http://tor.jmtodaro.com/ahmia-search-after-gsoc-development/	2014-09-07	2014-10-24
516	1	/tor-0257-rc-out	Tor 0.2.5.7-rc is out	http://tor.jmtodaro.com/tor-0257-rc-out/	2014-09-11	2014-09-25
517	1	/tor-browser-366-released	Tor Browser 3.6.6 is released	http://tor.jmtodaro.com/tor-browser-366-released/	2014-09-25	2014-10-22
518	1	/tor-browser-40-alpha-3-released	Tor Browser 4.0-alpha-3 is released	http://tor.jmtodaro.com/tor-browser-40-alpha-3-released/	2014-09-26	2014-10-21
519	1	/closer-look-great-firewall-china	A closer look at the Great Firewall of China	http://tor.jmtodaro.com/closer-look-great-firewall-china/	2014-10-06	2014-12-24
520	1	/new-sslv3-attack-found-disable-sslv3-torbrowser	New SSLv3 attack found: Disable SSLv3 in TorBrowser	http://tor.jmtodaro.com/new-sslv3-attack-found-disable-sslv3-torbrowser/	2014-10-14	2014-10-20
521	1	/tor-browser-40-released	Tor Browser 4.0 is released	http://tor.jmtodaro.com/tor-browser-40-released/	2014-10-15	2014-10-20
522	1	/tor-misused-criminals	Tor misused by criminals	http://tor.jmtodaro.com/tor-misused-criminals/	2014-10-21	2014-11-09
523	1	/torbirdy-013-our-fourth-beta-release	TorBirdy 0.1.3 -- Our fourth beta release!	http://tor.jmtodaro.com/torbirdy-013-our-fourth-beta-release/	2014-10-23	2014-12-06
524	1	/tor-02510-released-and-tor-023x-deprecated	Tor 0.2.5.10 is released! (and Tor 0.2.3.x is deprecated)	http://tor.jmtodaro.com/tor-02510-released-and-tor-023x-deprecated/	2014-10-27	2014-11-13
525	1	/new-alpha-series-begins-tor-0261-alpha-released	A new alpha series begins: Tor 0.2.6.1-alpha is released	http://tor.jmtodaro.com/new-alpha-series-begins-tor-0261-alpha-released/	2014-10-30	2014-11-17
526	1	/facebook-hidden-services-and-https-certs	Facebook, hidden services, and https certs	http://tor.jmtodaro.com/facebook-hidden-services-and-https-certs/	2014-10-31	2014-12-23
527	1	/tor-browser-401-released	Tor Browser 4.0.1 is released	http://tor.jmtodaro.com/tor-browser-401-released/	2014-10-31	2014-12-01
528	1	/thoughts-and-concerns-about-operation-onymous	Thoughts and Concerns about Operation Onymous	http://tor.jmtodaro.com/thoughts-and-concerns-about-operation-onymous/	2014-11-09	2014-12-23
529	1	/ooni-bridge-reachability-study-and-hackfest	OONI Bridge reachability study and hackfest	http://tor.jmtodaro.com/ooni-bridge-reachability-study-and-hackfest/	2014-11-10	2014-11-13
530	1	/partnering-mozilla	Partnering with Mozilla	http://tor.jmtodaro.com/partnering-mozilla/	2014-11-11	2014-11-15
531	1	/traffic-correlation-using-netflows	Traffic correlation using netflows	http://tor.jmtodaro.com/traffic-correlation-using-netflows/	2014-11-14	2014-12-14
532	1	/end-life-plan-tor-browser-32-bit-macs	End of life plan for Tor Browser on 32 bit Macs	http://tor.jmtodaro.com/end-life-plan-tor-browser-32-bit-macs/	2014-11-17	2014-12-10
533	1	/tor-browser-45-alpha-1-released	Tor Browser 4.5-alpha-1 is released	http://tor.jmtodaro.com/tor-browser-45-alpha-1-released/	2014-11-17	2014-12-02
534	1	/quick-summary-recent-traffic-correlation-using-netflows	Quick Summary of recent traffic correlation using netflows	http://tor.jmtodaro.com/quick-summary-recent-traffic-correlation-using-netflows/	2014-11-24	2014-12-10
535	1	/say-hi-new-gettor	Say hi to the new GetTor	http://tor.jmtodaro.com/say-hi-new-gettor/	2014-11-26	2015-01-02
536	1	/tor-browser-402-released	Tor Browser 4.0.2 is released	http://tor.jmtodaro.com/tor-browser-402-released/	2014-12-03	2015-01-13
537	1	/tor-browser-45-alpha-2-released	Tor Browser 4.5-alpha-2 is released	http://tor.jmtodaro.com/tor-browser-45-alpha-2-released/	2014-12-05	2014-12-23
538	1	/solidarity-against-online-harassment	Solidarity against online harassment	http://tor.jmtodaro.com/solidarity-against-online-harassment/	2014-12-11	2015-02-13
539	1	/possible-upcoming-attempts-disable-tor-network	Possible upcoming attempts to disable the Tor network	http://tor.jmtodaro.com/possible-upcoming-attempts-disable-tor-network/	2014-12-19	2014-12-23
540	1	/stem-release-13	Stem Release 1.3	http://tor.jmtodaro.com/stem-release-13/	2014-12-22	2014-12-28
541	1	/tor-80-percent-percent-1-2-percent-abusive	Tor: 80 percent of ??? percent of 1-2 percent abusive.	http://tor.jmtodaro.com/tor-80-percent-percent-1-2-percent-abusive/	2014-12-30	2015-01-05
542	1	/some-thoughts-hidden-services	Some thoughts on Hidden Services	http://tor.jmtodaro.com/some-thoughts-hidden-services/	2014-12-30	2015-01-19
543	1	/tor-talk-31c3	The Tor talk at 31c3	http://tor.jmtodaro.com/tor-talk-31c3/	2014-12-30	2015-01-09
544	1	/tor-0262-alpha-released	Tor 0.2.6.2-alpha is released	http://tor.jmtodaro.com/tor-0262-alpha-released/	2014-12-31	2015-01-13
545	1	/tor-browser-403-released	Tor Browser 4.0.3 is released	http://tor.jmtodaro.com/tor-browser-403-released/	2015-01-13	2015-02-19
546	1	/tor-browser-45a3-released	Tor Browser 4.5a3 is released	http://tor.jmtodaro.com/tor-browser-45a3-released/	2015-01-16	2015-02-19
547	1	/tor-design-proposals-how-we-make-changes-our-protocol	Tor design proposals: how we make changes to our protocol	http://tor.jmtodaro.com/tor-design-proposals-how-we-make-changes-our-protocol/	2015-02-08	2015-02-18
548	1	/guest-post-library-freedom-project-bringing-privacy-and-anonymity-libraries	Guest Post: The Library Freedom Project: Bringing privacy and anonymity to libraries	http://tor.jmtodaro.com/guest-post-library-freedom-project-bringing-privacy-and-anonymity-libraries/	2015-02-08	2015-02-17
549	1	/ux-sprint-2015-wrapup	UX Sprint 2015 wrapup	http://tor.jmtodaro.com/ux-sprint-2015-wrapup/	2015-02-09	2015-02-16
550	1	/tor-0263-alpha-released	Tor 0.2.6.3-alpha is released	http://tor.jmtodaro.com/tor-0263-alpha-released/	2015-02-19	2015-02-20
\.


--
-- Name: topics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jmt
--

SELECT pg_catalog.setval('topics_id_seq', 550, true);


--
-- Name: topics_pkey; Type: CONSTRAINT; Schema: public; Owner: jmt; Tablespace: 
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: index_topics_on_site_id; Type: INDEX; Schema: public; Owner: jmt; Tablespace: 
--

CREATE INDEX index_topics_on_site_id ON topics USING btree (site_id);


--
-- Name: index_topics_on_site_id_and_key; Type: INDEX; Schema: public; Owner: jmt; Tablespace: 
--

CREATE UNIQUE INDEX index_topics_on_site_id_and_key ON topics USING btree (site_id, key);


--
-- Name: topics_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: jmt
--

ALTER TABLE ONLY topics
    ADD CONSTRAINT topics_ibfk_1 FOREIGN KEY (site_id) REFERENCES sites(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


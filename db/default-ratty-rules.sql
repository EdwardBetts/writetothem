--
-- default-ratty-rules.sql:
-- Default anti-abuse and rate limiting rules for the FYR website.
--
-- This was generated by pg_dump from an actual Ratty installation, so isn't in
-- a very convenient format.
--
-- Copyright (c) 2005 UK Citizens Online Democracy. All rights reserved.
-- Email: chris@mysociety.org; WWW: http://www.mysociety.org/
--
-- $Id: default-ratty-rules.sql,v 1.1 2005-01-14 17:56:23 chris Exp $
--

COPY "rule" (id, requests, "interval", "sequence", scope, note, message) FROM stdin;
2	0	0	2	fyr-abuse	A chilly reception for Googlable postcodes	freeze
7	0	0	3	fyr-abuse	Messages mentioning RSPCA are frozen	freeze
11	0	0	0	fyr-abuse	Debugging test rule ABUSETESTHOLD	freeze
12	0	0	0	fyr-abuse	Debugging test rule ABUSETESTREJECT	problem-generic
8	0	0	0	fyr-abuse	Prevent simple ballot stuffing	freeze
13	0	0	0	fyr-abuse	Freeze very short messages	freeze
10	3	1800	0	fyr-abuse	Stop any representative getting more than 3 messages in 30 minutes	freeze
1	0	0	1	fyr-abuse	Freeze copy-and-pasters to the bones	freeze
14	0	0	0	fyr-abuse	Freeze messages from non-UK IP addresses	freeze
\.

COPY condition (id, rule_id, field, value, condition, invert) FROM stdin;
4	2	postcode_google_hits	0	>	f
16	7	message	RSPCA	R	f
21	11	message	ABUSETESTHOLD	R	f
23	12	message	ABUSETESTREJECT	R	f
24	8	representative_emailing_self	YES	E	f
25	13	message_length_words	30	<	f
26	10	recipient_id		S	f
27	1	similarity_num_0.5	0	>	f
29	14	sender_ip_country	^[^G][^B]	R	f
\.

SELECT pg_catalog.setval ('rule_id_seq', 14, true);
SELECT pg_catalog.setval ('condition_id_seq', 29, true);
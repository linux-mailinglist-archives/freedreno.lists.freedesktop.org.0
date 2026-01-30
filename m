Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBNQKgLbfGlbOwIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 30 Jan 2026 17:23:30 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32052BC7DD
	for <lists+freedreno@lfdr.de>; Fri, 30 Jan 2026 17:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6F210EA10;
	Fri, 30 Jan 2026 16:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="Ix4wyv4M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E556D10EA10
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jan 2026 16:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769790206; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g4MzenbRjsu1VI01DFycTbC0vAIZVq1FjIZ6V7lmxIQYoaQJUymhkFnWf6RDB25DS/IaOgKixWXAOPFUqg7fDA7vV3RCRJ5wx4V9LtzbTpGaGvoT4P7clHbCmKNXN9p2Qj3+LNW6Hj8DL2b4Wdkf1U/NazgrYiA5seQmgZHVVBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769790206;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=SpZ2rbCho0PP5f0vYFU/KK/CmhrJKIU7U9ceMtFR0Mw=; 
 b=BZK+EMT/MNtARRZVstm3CsCKgn22AsEXhMatkl6DYdF6VuF+vM2GIynfJ0MHi+ydI18q2jjoHa9KIDenZAnXWOebkCJf82ftEM2hGU/3XhkqjleX92jCW8UdvICiP8ynCWrdkMJBbyVEwE1a7Exf501/71a+zfxeZizzMfTkojI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769790206; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=SpZ2rbCho0PP5f0vYFU/KK/CmhrJKIU7U9ceMtFR0Mw=;
 b=Ix4wyv4MloQsngrcIO5BI/ipCLC+fZnRl1f+txD+sGFIWyUycFwERKqw/G1MyP/Q
 P/MOdM+mcrkoPY5WkDyYCEN2ZS31OXtGiDUzYQZ7RcpiIQAJ2qCS9AxSfMxa+9IzwqX
 8j4mKuhhPuxox87hbviERkNXh7bL/yu9MVh3VHdY=
Received: by mx.zohomail.com with SMTPS id 1769790204446433.6821892184171;
 Fri, 30 Jan 2026 08:23:24 -0800 (PST)
Message-ID: <eedd9e390289bb9f11f92ec14beb1e09770ea797.camel@collabora.com>
Subject: Save the Date! XDC 2026 comes to Toronto
From: Mark Filion <mark.filion@collabora.com>
To: freedreno@lists.freedesktop.org
Date: Fri, 30 Jan 2026 11:23:22 -0500
Content-Type: multipart/alternative; boundary="=-8sWFPGpc3PBWlmlI/PvQ"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43app1) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.852];
	SUBJECT_HAS_EXCLAIM(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[mark.filion@collabora.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,floss.social:url];
	DKIM_TRACE(0.00)[collabora.com:+]
X-Rspamd-Queue-Id: 32052BC7DD
X-Rspamd-Action: no action

--=-8sWFPGpc3PBWlmlI/PvQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

We=E2=80=99re excited to announce that XDC 2026 will take place September 2=
8=E2=80=9330
in Toronto, Canada =E2=80=94 mark your calendars!

The conference will be held in person at Daniels Spectrum, a vibrant
community cultural hub in the heart of Toronto=E2=80=99s Regent Park
neighbourhood, just minutes from Yonge=E2=80=93Dundas Square.

We=E2=80=99d also like to extend a sincere thank you to Arm for organizing =
this
year=E2=80=99s conference and helping make XDC another great success.

Registration and the Call for Proposals will be opening soon, so stay
tuned!

Until then, be sure to follow us on Mastodon for the latest news and
updates:
https://floss.social/@XOrgDevConf

Best,

Mark

--=-8sWFPGpc3PBWlmlI/PvQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hello!</div><div><br></div><div>We=E2=80=99re exc=
ited to announce that XDC 2026 will take place September 28=E2=80=9330 in T=
oronto, Canada =E2=80=94 mark your calendars!</div><div><br></div><div>The =
conference will be held in person at Daniels Spectrum, a vibrant community =
cultural hub in the heart of Toronto=E2=80=99s Regent Park neighbourhood, j=
ust minutes from Yonge=E2=80=93Dundas Square.</div><div><br></div><div>We=
=E2=80=99d also like to extend a sincere thank you to Arm for organizing th=
is year=E2=80=99s conference and helping make XDC another great success.</d=
iv><div><br></div><div>Registration and the Call for Proposals will be open=
ing soon, so stay tuned!</div><div><br></div><div>Until then, be sure to fo=
llow us on Mastodon for the latest news and updates:</div><div><a href=3D"h=
ttps://floss.social/@XOrgDevConf">https://floss.social/@XOrgDevConf</a></di=
v><div><br></div><div>Best,</div><div><br></div><div>Mark</div><div><span><=
/span></div></body></html>

--=-8sWFPGpc3PBWlmlI/PvQ--

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A47F8ABA92F
	for <lists+freedreno@lfdr.de>; Sat, 17 May 2025 11:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B8610E161;
	Sat, 17 May 2025 09:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="f7O8m7ic";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C873710E165
 for <freedreno@lists.freedesktop.org>; Sat, 17 May 2025 09:44:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747475077; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TdKzh+tftjGgfv1eXeiW7xK0CgKf5zqihDKDqeASzTVS6UG1dNmXs0tqp0dOYqqViEydHtd99CHHp4Plym120QwPpIfyfHJl9mlXlZE8F9NcPLBCkMOvUkBFl2rd6XyPkNr//SzuuNfL0l4h7tPceIhGkOlXmJSLZ/44MdLgfw8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747475077;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=Ae2lbsmvDVeiUv44kgQ9lhg9pCyy2q+IM+BkOu2mqdA=; 
 b=S7HUSwZ+CoYnYrpihXeNjZJP25dvwBT6X84RPV9EiVlffD0uaiRKjkqedqXJHpRCiTInGSW6OLcf1Sd0J2Le9knTo5i8mZN82FcQMATEViJMld9Cueni1qgMXJUIXnClFvW76a9shA4c9M2Zy+wmcTYCmpwpIgkOc/Io7A1pa2E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747475077; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=Ae2lbsmvDVeiUv44kgQ9lhg9pCyy2q+IM+BkOu2mqdA=;
 b=f7O8m7icHvVYV9nEclRicSrsL3Jat20RW00U0NmGORmvV7wwCiEZ/Pw+xSTwwwDN
 878IhR9ws9udYaTpw80EzRteY43fqGCcdpThydstFl0qNtgQj2j0MI3ztRS0nQDrqmw
 gn3Ro3/2oWgkLRfPquQhq5KkRqlDLJbgQHf8wTrA=
Received: by mx.zohomail.com with SMTPS id 17474750747641015.9802988156472;
 Sat, 17 May 2025 02:44:34 -0700 (PDT)
Message-ID: <ba27b34d9d4c375e62e890fcba9f10238d29cb3e.camel@collabora.com>
Subject: 2025 X.Org Foundation Election results
From: Mark Filion <mark.filion@collabora.com>
To: Freedreno <freedreno@lists.freedesktop.org>
Date: Sat, 17 May 2025 11:44:32 +0200
Content-Type: multipart/alternative; boundary="=-DY8BNz8A2Un8uySmnicA"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
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

--=-DY8BNz8A2Un8uySmnicA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

The Board of Directors election concluded at 23:59 UTC on 14 May 2025.
For this election, we had 77 members who could cast a vote. 72 did, so
the turnout was 92.5%. This is the 3rd highest turnout in the last 10
elections, with only 2021 (93.8%) and 2016 (98.8%) being higher. It is
also a 147% increase from last year's turnout (62.9%). Thank you to
everyone who took the time to vote!

In the election of the Directors to the Board of the X.Org Foundation,
the results were that Lyude Paul, Andres Gomez, Arkadiusz Hiler and
Harry Wentland were elected for two year terms.

The old full board is: Erik Faye-Lund, Mark Filion, Neal Gompa,
Arkadiusz Hiler, Christopher Michael, Lyude Paul, and Simon Ser.

The new full board is: Erik Faye-Lund, Mark Filion, Andres Gomez, Neal
Gompa, Arkadiusz Hiler, Lyude Paul, Simon Ser, and Harry Wentland.

Mark Filion, on behalf of the X.Org elections committee

--=-DY8BNz8A2Un8uySmnicA
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
</style></head><body><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-str=
oke-width: 0px; text-decoration: none;">Hello all,</div><div style=3D"caret=
-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&=
quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; let=
ter-spacing: normal; text-align: start; text-indent: 0px; text-transform: n=
one; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: r=
gba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">=
<br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); fon=
t-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: =
0px; text-decoration: none;">The Board of Directors election concluded at 2=
3:59 UTC on 14 May 2025. For this election, we had 77 members who could cas=
t a vote. 72 did, so the turnout was 92.5%. This is the 3rd highest turnout=
 in the last 10 elections, with only 2021 (93.8%) and 2016 (98.8%) being hi=
gher. It is also a 147% increase from last year's turnout (62.9%). Thank yo=
u to everyone who took the time to vote!</div><div style=3D"caret-color: rg=
b(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; fon=
t-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, =
0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><br></div>=
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: =
&quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap=
-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-=
decoration: none;">In the election of the Directors to the Board of the X.O=
rg Foundation, the results were that Lyude Paul, Andres Gomez, Arkadiusz Hi=
ler and Harry Wentland were elected for two year terms.</div><div style=3D"=
caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita =
Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-col=
or: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: no=
ne;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
; font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wi=
dth: 0px; text-decoration: none;">The old full board is: Erik Faye-Lund, Ma=
rk Filion, Neal Gompa, Arkadiusz Hiler, Christopher Michael, Lyude Paul, an=
d Simon Ser.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke=
-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-color: r=
gb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; fo=
nt-style: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0,=
 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;">The new f=
ull board is: Erik Faye-Lund, Mark Filion, Andres Gomez, Neal Gompa, Arkadi=
usz Hiler, Lyude Paul, Simon Ser, and Harry Wentland.</div><div style=3D"ca=
ret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sa=
ns&quot;; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color=
: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none=
;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); =
font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-cap=
s: normal; font-weight: 400; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-widt=
h: 0px; text-decoration: none;">Mark Filion, on behalf of the X.Org electio=
ns committee</div><div><span></span></div></body></html>

--=-DY8BNz8A2Un8uySmnicA--

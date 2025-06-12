Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF94AD7358
	for <lists+freedreno@lfdr.de>; Thu, 12 Jun 2025 16:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B61C10E88A;
	Thu, 12 Jun 2025 14:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="beZ9LDKX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A4510E88A
 for <freedreno@lists.freedesktop.org>; Thu, 12 Jun 2025 14:15:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749737704; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=V6qt8JygC3zeNBEqwHeKi3Xrzt1VH+WRF8CIFmZeyGj/9yez0O4th5H0IdETn2Kg7917f0qTHAlwWzD1zpFoCm7GIk70UIr2kCTOSQlxkgWP3a2R2uuifUUkwNd2xkYL0ZLDMlGS9OjSA3rz0SSCzZeMumrks185kpm51QbNGqY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749737704;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=7P5DSvisn05Vdh+NVoCzsnDePQbdB45vyimJSJIfXZs=; 
 b=QVL01MoMHDD1oBLe8dmSwq1Jbuhx93DivGJ9yVOr7oO6azVYJ7rpeW2hj3kine03vNLhSBmJDX+P10tmuXHAPMvadCZdmzNxsryAqqTa2q/VaQs7An0qjZZwqqgUfYDuvF4scHmtkD0ruDQedWqJBQPks/xiUP4nxYwusnColJA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749737704; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=7P5DSvisn05Vdh+NVoCzsnDePQbdB45vyimJSJIfXZs=;
 b=beZ9LDKXfsDXu25Cc/h59xKe6d3EvXNBhQyVk6/xuB9l3J44YRGhWUTQ0a1o54it
 soYmqb9smmx69ktmj6x1I36iHMkqeOH5cnkYXo+DOyJh9L55n/uTaDBrhjhz9BOy2Nt
 ntrs+JNZCsoQp8uAUZUMqRd0tyqIvDUge5ipyttY=
Received: by mx.zohomail.com with SMTPS id 1749737702971126.51937090294473;
 Thu, 12 Jun 2025 07:15:02 -0700 (PDT)
Message-ID: <4d3b5b359413724a095f4a51107d105cf5b242f8.camel@collabora.com>
Subject: Reminder: Registration & Call for Proposals open for XDC 2025
From: Mark Filion <mark.filion@collabora.com>
To: freedreno@lists.freedesktop.org
Date: Thu, 12 Jun 2025 10:15:01 -0400
Content-Type: multipart/alternative; boundary="=-FXhaZJMJIxwcQPQQnwjM"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42app2) 
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

--=-FXhaZJMJIxwcQPQQnwjM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

Registration & Call for Proposals are open for XDC 2025, which will
take place at the=C2=A0 TU Wien Kuppelsaal in Vienna, Austria on 29
September to 1 October.

=C2=A0=C2=A0=C2=A0=C2=A0https://xdc2025.x.org
=C2=A0=C2=A0
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible:

=C2=A0=C2=A0=C2=A0=C2=A0https://indico.freedesktop.org/event/10/registratio=
ns/

In addition to registration, the CfP is now open for talks, demos, and
workshops at XDC 2025. While any serious proposal will be gratefully
considered, topics of interest to X.Org and freedesktop.org developers
are encouraged. The program focus is on new development, ongoing
challenges and anything else that will spark discussions among
attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more:

=C2=A0=C2=A0=C2=A0=C2=A0https://indico.freedesktop.org/event/10/abstracts/

The deadline for submissions Friday, 11 July 2025.

We are looking forward to seeing you in Vienna! If you have any
questions, please email the organizer (hfink at snap.com), adding on
CC the X.org board (board at foundation.x.org).

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

=C2=A0=C2=A0=C2=A0=C2=A0https://floss.social/@XOrgDevConf

Best,

Mark

--=-FXhaZJMJIxwcQPQQnwjM
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
</style></head><body><div><div><span style=3D"caret-color: rgb(46, 52, 54);=
 color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">Hello!</sp=
an><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span st=
yle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &=
quot;Adwaita Mono&quot;;">Registration &amp; Call for Proposals are open fo=
r XDC 2025, which will</span><br style=3D"caret-color: rgb(46, 52, 54); col=
or: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D=
"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;A=
dwaita Mono&quot;;">take place at the&nbsp; TU Wien Kuppelsaal in Vienna, A=
ustria on 29</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-col=
or: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mon=
o&quot;;">September to 1 October.</span><br style=3D"caret-color: rgb(46, 5=
2, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br=
 style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family=
: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); c=
olor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;=
&nbsp;&nbsp;</span><a href=3D"https://xdc2025.x.org/" title=3D"Click to ope=
n https://xdc2025.x.org/" style=3D"font-family: &quot;Adwaita Mono&quot;;">=
https://xdc2025.x.org</a><br style=3D"caret-color: rgb(46, 52, 54); color: =
rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"car=
et-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwai=
ta Mono&quot;;">&nbsp;&nbsp;</span><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span st=
yle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &=
quot;Adwaita Mono&quot;;">As usual, the conference is free of charge and op=
en to the general</span><br style=3D"caret-color: rgb(46, 52, 54); color: r=
gb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"care=
t-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwait=
a Mono&quot;;">public. If you plan on attending, please make sure to regist=
er as early</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46,=
 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-colo=
r: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono=
&quot;;">as possible:</span><br style=3D"caret-color: rgb(46, 52, 54); colo=
r: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"ca=
ret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwa=
ita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;=
</span><a href=3D"https://indico.freedesktop.org/event/10/registrations/" t=
itle=3D"Click to open https://indico.freedesktop.org/event/10/registrations=
/" style=3D"font-family: &quot;Adwaita Mono&quot;;">https://indico.freedesk=
top.org/event/10/registrations/</a><br style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br styl=
e=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &qu=
ot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color:=
 rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">In addition to re=
gistration, the CfP is now open for talks, demos, and</span><br style=3D"ca=
ret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwa=
ita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;">workshops at XDC 2025. W=
hile any serious proposal will be gratefully</span><br style=3D"caret-color=
: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&=
quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54)=
; font-family: &quot;Adwaita Mono&quot;;">considered, topics of interest to=
 X.Org and freedesktop.org developers</span><br style=3D"caret-color: rgb(4=
6, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"=
><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;">are encouraged. The program focus is on =
new development, ongoing</span><br style=3D"caret-color: rgb(46, 52, 54); c=
olor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">challenges and anything else that will spark discuss=
ions among</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, =
52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color=
: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&=
quot;;">attendees in the hallway track.</span><br style=3D"caret-color: rgb=
(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;=
;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-=
family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, =
54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">We are=
 open to talks across all layers of the graphics stack, from the</span><br =
style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family:=
 &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">kernel to des=
ktop environments / graphical applications and about how</span><br style=3D=
"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;A=
dwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb=
(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">to make things better=
 for the developers who build them. Head to the</span><br style=3D"caret-co=
lor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mo=
no&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, =
54); font-family: &quot;Adwaita Mono&quot;;">CfP page to learn more:</span>=
<br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fam=
ily: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); =
color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D"https://in=
dico.freedesktop.org/event/10/abstracts/" title=3D"Click to open https://in=
dico.freedesktop.org/event/10/abstracts/" style=3D"font-family: &quot;Adwai=
ta Mono&quot;;">https://indico.freedesktop.org/event/10/abstracts/</a><br s=
tyle=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: =
&quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color=
: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"c=
aret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adw=
aita Mono&quot;;">The deadline for submissions Friday, 11 July 2025.</span>=
<br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fam=
ily: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); =
color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Adwaita Mono&quot;;">We are looking forward to seeing you in Vienna! If y=
ou have any</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46,=
 52, 54); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-colo=
r: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono=
&quot;;">questions, please email the organizer (hfink at snap.com), adding =
on</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54);=
 font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46=
, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">=
CC the X.org board (board at foundation.x.org).</span><br style=3D"caret-co=
lor: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mo=
no&quot;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54=
); font-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(=
46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;=
">And don't forget, you can follow us on Mastodon for all the latest</span>=
<br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fam=
ily: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54)=
; color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">updates a=
nd to stay connected:</span><br style=3D"caret-color: rgb(46, 52, 54); colo=
r: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><br style=3D"ca=
ret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwa=
ita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46=
, 52, 54); font-family: &quot;Adwaita Mono&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;=
</span><a href=3D"https://floss.social/@XOrgDevConf" title=3D"Click to open=
 https://floss.social/@XOrgDevConf" style=3D"font-family: &quot;Adwaita Mon=
o&quot;;">https://floss.social/@XOrgDevConf</a><br style=3D"caret-color: rg=
b(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot=
;;"><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font=
-family: &quot;Adwaita Mono&quot;;"><span style=3D"caret-color: rgb(46, 52,=
 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;">Best,=
</span><br style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); f=
ont-family: &quot;Adwaita Mono&quot;;"><br style=3D"caret-color: rgb(46, 52=
, 54); color: rgb(46, 52, 54); font-family: &quot;Adwaita Mono&quot;;"><spa=
n style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Adwaita Mono&quot;;">Mark</span></div></div><div><span></span></di=
v></body></html>

--=-FXhaZJMJIxwcQPQQnwjM--

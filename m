Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A361E19DD1
	for <lists+freedreno@lfdr.de>; Fri, 10 May 2019 15:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5860889B8F;
	Fri, 10 May 2019 13:08:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc2a.google.com (mail-yw1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6389B8F
 for <freedreno@lists.freedesktop.org>; Fri, 10 May 2019 13:08:06 +0000 (UTC)
Received: by mail-yw1-xc2a.google.com with SMTP id e74so4654969ywe.11
 for <freedreno@lists.freedesktop.org>; Fri, 10 May 2019 06:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLHk741dBhEK93Wszh4GBNgrzBBJGyCmK3aLtmQDaHM=;
 b=BimHKYlTjXp/ADXmIV+QpCpxrfYWGkka4ldyZsbK7DmPn2QqnELxGgzZh3YXab1Z/g
 /14Q0EBYB6UeI/WgIFaoHwSJS/aeAgTYR7UQtPn4Bl4OFvEi90swIUV9s/P8BjiinJ7p
 SRsd3mYVNTxyynVgLiQ64b3dzjLCwEUplOiNgQMwwuEPY4xjh51dQIsS3cIShR/8vccW
 WXouZUGDFokMrt1DdV7SUNFJBD9t4zb00TNWNWecfEgLza6R+KaZqJKqQAG9/4kVda2l
 2SZXMvXpfS/rXrTRoOp5hqX9gNOTJ+gF9T+lNnA5C4PPppw4iLP60gqwSm9MYhtShP26
 P8wA==
X-Gm-Message-State: APjAAAVUIcwGtKgQ6UgCxXeIR5d2pypSkCMhhXfovIPmlKCtKdVSS83e
 UnX2CRcgxQrmSXAzckqzkcX/Mr0nQNO0ZhH3jdaJxA==
X-Google-Smtp-Source: APXvYqw0mUVIhOVU6ygGC9If6xCD7pmx2EHCL+6Ig6dX0u+0NnY0F1Vu5c0i76pZkm3Gv7HvpEMemAzx3QmhPDwKmwU=
X-Received: by 2002:a25:dcd0:: with SMTP id y199mr5318196ybe.464.1557493685520; 
 Fri, 10 May 2019 06:08:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAD=kLpt5pSiy0HBoQ61LR9BGyKUq6jJrHSFE_kp4D3W8W9XVgg@mail.gmail.com>
 <CAF6AEGvdnO9ydtpehr0yKdFvv-9yTDRCbuLaUMu__Xma6EYmjg@mail.gmail.com>
In-Reply-To: <CAF6AEGvdnO9ydtpehr0yKdFvv-9yTDRCbuLaUMu__Xma6EYmjg@mail.gmail.com>
From: Shubham Verma <shubhunic@gmail.com>
Date: Fri, 10 May 2019 18:37:51 +0530
Message-ID: <CAD=kLptcGHsd7rWz8FVS6=igtmsikVE5rBx0Gu2-k+pcaqxreA@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pLHk741dBhEK93Wszh4GBNgrzBBJGyCmK3aLtmQDaHM=;
 b=hNaRcwGXa2lAvvUVeUv5w2ePMi1Fr+XA6FMLVnAu+9tCtAEN3jVP7K23d0J3d7QQJp
 rb3oyhYsvYIcQVJsCIYzOxHK4a+MMzNG+/U5vAkq8+bT227XPB1oAe/13Juo8ukFouyy
 h/YQlYRMI/API+lMl7QjlkMDhsD7971yjAWDKZVIociGaDRGO2MjDcG+9OK/SW5cu8vc
 sflGchlgRgs47iW9vDkdnEVlrePXoUVT0d8JToMzBVsePNt+cW5zs/tFubZzUvR7Dhe7
 ean+4AgTNOD5UvlxCFWZh+C19bBz0oN3dKUgYnPfxo2IJRxrwXB0TeCtg/u17IECQ7W/
 xpQw==
Subject: Re: [Freedreno] About EVOC 2019 project ideas
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: evoc@foundation.x.org, freedreno <freedreno@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0694465815=="
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--===============0694465815==
Content-Type: multipart/alternative; boundary="000000000000dd8f5805888841a3"

--000000000000dd8f5805888841a3
Content-Type: text/plain; charset="UTF-8"

Thank you for the information sir. Then we can work on compressed textures
project.

On Fri, 10 May 2019 6:16 pm Rob Clark, <robdclark@gmail.com> wrote:

> Hi, actually the texture tiling project was selected for a GSoC
> project which is just starting up.. But there may be other projects
> for other drivers or in other areas of mesa/xserver/drm/etc.  Adding
> evoc list.
>
> BR,
> -R
>
> On Fri, May 10, 2019 at 5:40 AM Shubham Verma <shubhunic@gmail.com> wrote:
> >
> > Hello Dear Sir,
> >
> > My name is Shubham Verma. I am a B tech 2nd-year I.T. student I would
> like to look into working with X.Org for the Endless Vacation of Code
> program 2019 this summer.
> >
> > As this is my first EVOC  I wanted to know what other things I have to
> do to be part of an organization.
> >
> > I mentioned my interest and project on which I want to work on below,
> have a look at that and tell me what will be good for me. I want to work on
> the project of Texture Tiling and Compressed Textures under the guidance of
> yours and I want to know which project of Freedreno in the idealist is not
> selected by any student.
> >
> > I would be grateful if you can tell me if there's anything else that I
> could do which would be appreciated. Any further guidance or inputs would
> certainly be of great help.
> >
> >
> > Thank you!
> > _______________________________________________
> > Freedreno mailing list
> > Freedreno@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/freedreno
>

--000000000000dd8f5805888841a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thank you for the information sir. Then we can work =
on compressed textures project.<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 10 May 2019 6:16 pm Rob Clark, &lt;<a=
 href=3D"mailto:robdclark@gmail.com">robdclark@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Hi, actually the texture tiling projec=
t was selected for a GSoC<br>
project which is just starting up.. But there may be other projects<br>
for other drivers or in other areas of mesa/xserver/drm/etc.=C2=A0 Adding<b=
r>
evoc list.<br>
<br>
BR,<br>
-R<br>
<br>
On Fri, May 10, 2019 at 5:40 AM Shubham Verma &lt;<a href=3D"mailto:shubhun=
ic@gmail.com" target=3D"_blank" rel=3D"noreferrer">shubhunic@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; Hello Dear Sir,<br>
&gt;<br>
&gt; My name is Shubham Verma. I am a B tech 2nd-year I.T. student I would =
like to look into working with X.Org for the Endless Vacation of Code progr=
am 2019 this summer.<br>
&gt;<br>
&gt; As this is my first EVOC=C2=A0 I wanted to know what other things I ha=
ve to do to be part of an organization.<br>
&gt;<br>
&gt; I mentioned my interest and project on which I want to work on below, =
have a look at that and tell me what will be good for me. I want to work on=
 the project of Texture Tiling and Compressed Textures under the guidance o=
f yours and I want to know which project of Freedreno in the idealist is no=
t selected by any student.<br>
&gt;<br>
&gt; I would be grateful if you can tell me if there&#39;s anything else th=
at I could do which would be appreciated. Any further guidance or inputs wo=
uld certainly be of great help.<br>
&gt;<br>
&gt;<br>
&gt; Thank you!<br>
&gt; _______________________________________________<br>
&gt; Freedreno mailing list<br>
&gt; <a href=3D"mailto:Freedreno@lists.freedesktop.org" target=3D"_blank" r=
el=3D"noreferrer">Freedreno@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/freedreno" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.or=
g/mailman/listinfo/freedreno</a><br>
</blockquote></div></div></div>

--000000000000dd8f5805888841a3--

--===============0694465815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

--===============0694465815==--

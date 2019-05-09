Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7CA19D5A
	for <lists+freedreno@lfdr.de>; Fri, 10 May 2019 14:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41E389D1D;
	Fri, 10 May 2019 12:40:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc33.google.com (mail-yw1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BF489617
 for <freedreno@lists.freedesktop.org>; Fri, 10 May 2019 01:42:14 +0000 (UTC)
Received: by mail-yw1-xc33.google.com with SMTP id e74so3458291ywe.11
 for <freedreno@lists.freedesktop.org>; Thu, 09 May 2019 18:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=J4GPTB2nisjHiJ5n/CLoZ9QaKshaLR4NhNQf9B3Sktw=;
 b=b1QQLgy+JhZ2hoPS8SWsQ4VypDVYSd2/FiILSu9Vn1Jq1jOdMNSZHChQJ27t+Fy/0e
 3rC5DKjEJZu0JYDyEcOmOtZekI0jOdbaLO8joktYnhXaHGIJY0P8x175fsI0uesvzcIj
 Ckf0/gYsKhjxTHMginwqHbWZklQENUoC2UMV9YkyjYcQEjQKm8obHN5xNrg8vbwlTaVb
 /EwkdWBvRLD0aNnKXS9a0VD7MnVlZT0Pk/LSFovbpXzaCA1avXMy1pdtezbJmtBIsBiY
 8+4rrti0oXke9K79L1IZHyU1PzboDf4qGINRK52l4DFitsZxcFqbHKaJ8eBEeH98nqiT
 d6og==
X-Gm-Message-State: APjAAAWgK5PCzruKu7hzJXWf8vXB1AYoIgvU0lBolV7Nr3c+Gf0Q2m68
 bDw7jknd2QJKN6sO7dQCnMhrttslUPq0SZQzAIPnsfhG+RA=
X-Google-Smtp-Source: APXvYqxeYn9Ore4BFqNT0GKDa3NvIwY0LOw7kCEXN/mEw4pXLbiuDDef+APV3bS7726XBQpgBlLYD3L9UzjQr8f+Xa0=
X-Received: by 2002:a25:d196:: with SMTP id i144mr4008761ybg.241.1557452532946; 
 Thu, 09 May 2019 18:42:12 -0700 (PDT)
MIME-Version: 1.0
From: Shubham Verma <shubhunic@gmail.com>
Date: Thu, 9 May 2019 10:28:29 +0530
Message-ID: <CAD=kLpt5pSiy0HBoQ61LR9BGyKUq6jJrHSFE_kp4D3W8W9XVgg@mail.gmail.com>
To: freedreno@lists.freedesktop.org
X-Mailman-Approved-At: Fri, 10 May 2019 12:40:15 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=J4GPTB2nisjHiJ5n/CLoZ9QaKshaLR4NhNQf9B3Sktw=;
 b=oYjn4eFOTZRP8NTynFe0KV78hvjHQjXhjY9nOCX4LBctKMmz1AELyduaCyRRoTttHG
 qOM99IS45F23lY1IwBk/qfKGA7/f88ZvkhiY3P2n6+7FPeZ+DgpJmoRcW0uQ5YmaOq/e
 Rew41U72ev/pG2eZrJBqsGYp+BOfyDr4VXGzPWIlpRVRwlvO3TVYYyM2WSZmZuaGShZs
 JqVlgg0dRf/dACytqKOAZ6rt7wTnjKSVTGXlc320acL5v+ZlRDygsJAGjTcJ/tX9IDm3
 3kOtwInPobO5v/ovxiVSQpgSu6RkZ4oXbAPpIYB616SC0MSPsGA8AxbHsQWziQcyHcxI
 8HAw==
Subject: [Freedreno] About EVOC 2019 project ideas
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
Content-Type: multipart/mixed; boundary="===============1616865447=="
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

--===============1616865447==
Content-Type: multipart/alternative; boundary="000000000000fb1d7205887eac36"

--000000000000fb1d7205887eac36
Content-Type: text/plain; charset="UTF-8"

Hello Dear Sir,

My name is Shubham Verma. I am a B tech 2nd-year I.T. student I would like
to look into working with X.Org for the Endless Vacation of Code program
2019 this summer.

As this is my first EVOC  I wanted to know what other things I have to do
to be part of an organization.

I mentioned my interest and project on which I want to work on below, have
a look at that and tell me what will be good for me. I want to work on the
project of Texture Tiling and Compressed Textures under the guidance of
yours and I want to know which project of Freedreno in the idealist is not
selected by any student.

I would be grateful if you can tell me if there's anything else that I
could do which would be appreciated. Any further guidance or inputs would
certainly be of great help.


Thank you!

--000000000000fb1d7205887eac36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello Dear Sir,</div><div><br></div>=
<div>My name is Shubham Verma. I am a B tech 2nd-year I.T. student I would =
like to look into working with X.Org for the Endless Vacation of Code progr=
am 2019 this summer.</div><div><br></div><div>As this is my first EVOC=C2=
=A0 I wanted to know what other things I have to do to be part of an organi=
zation.</div><div><br></div><div>I mentioned my interest and project on whi=
ch I want to work on below, have a look at that and tell me what will be go=
od for me. I want to work on the project of Texture Tiling and Compressed T=
extures under the guidance of yours and I want to know which project of Fre=
edreno in the idealist is not selected by any student.</div><div><br></div>=
<div>I would be grateful if you can tell me if there&#39;s anything else th=
at I could do which would be appreciated. Any further guidance or inputs wo=
uld certainly be of great help.</div><div><br></div><div><br></div><div>Tha=
nk you!</div></div></div>

--000000000000fb1d7205887eac36--

--===============1616865447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5v
IG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

--===============1616865447==--

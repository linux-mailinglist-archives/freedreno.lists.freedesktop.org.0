Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1E28E66F
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92696E28F;
	Thu, 15 Aug 2019 08:34:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA8E89D63
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:34:30 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b29so1165881lfq.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7i16DpGe/WrEnWRFWrw6WDyR2YmJ49EsxY0UWyxcbfk=;
 b=HPLIfuhbHQdm1L9menO/fiDJXev9PmDO6fkuY6yYvGRPvJAnOy3wf2o2rhUl8/Tdly
 Czt1/5nmrBL10TWAe7Yo15c0+LTVUYfydDB0QGo/3TpgCkxBZOOMGdBegtr15TGMdlKN
 8GK7Vp2C7I9H4O7k8FvgqZsZWgo33O6eprmPMlJQQkq/K7n9ZRTuTjkU15NEOm/thktw
 CnX1r+I/N1vDx4AhTAEWdA+82OK/jrxweQaSEtmgcbzEHqAgWZM3gM6cetq+FfHnsj5k
 KHn3NcrOBpg1HDLtiWlTX/rTGa3mC83VlvCdz5BnOlVLgRLlts3M4vuIyuB6Ym9STT9E
 0nww==
X-Gm-Message-State: APjAAAW9bwPjJMHpJ2uL8+9tHscGYZSrR0SZcdyi/quHX4ga6DIpRads
 rD4a957/7tVHvmgnewDnkivEIeTdzRR5TWP6kSls8Q==
X-Google-Smtp-Source: APXvYqxb0UB6/giI18HHjmcKPLqMYP0VUKp7BEJ9Az/O76XbGpUEV3T+utaGsTe3hzjxU1rcsCu+m7ocZF57FmoUKmk=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1629302lfq.152.1565858068523; 
 Thu, 15 Aug 2019 01:34:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-10-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-10-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:34:17 +0200
Message-ID: <CACRpkdYU-6LvFKRkj0yMMCmAnX0XtGe7rMwbXbhf2GCp77Ciyw@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=7i16DpGe/WrEnWRFWrw6WDyR2YmJ49EsxY0UWyxcbfk=;
 b=TVUoUOIaS51Agv5l0PMa3o6r7lDWfkGGfAKJhDlNLIl7488xPFjP4Zc62E1GcUW1VV
 o0tMKL+wXnt1XdSF1KbK0Lt2NPVz37E6SBBibznbqskqTNxpsTEGO/IN8IWSuP8NEn+L
 YweJ7nuU+lmreFBFY/Jygo7zNIKriXEtK9XOLtxp1wnYaEzcfK6K91ZsV5tKqCLz0pji
 +j+VLUGXtDrQ6JvziL1YCvfd7+ThtaWoW8fly7i71IZV69lt92FEoue8vUkPf1PR+fIT
 BuuAkU61fn6Twlw0EMMwqgfTgHrOwgjtkdqRSq+SUTWsfkxUHCcsuL1aUGE1euu6qHxW
 QxwQ==
Subject: Re: [Freedreno] [PATCH 09/11] ARM: dts: qcom: pm8941: add 5vs2
 regulator node
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, MSM <linux-arm-msm@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMjo0OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IHBtODk0MSBpcyBtaXNzaW5nIHRoZSA1dnMyIHJlZ3VsYXRv
ciBub2RlIHNvIGxldCdzIGFkZCBpdCBzaW5jZSBpdHMKPiBuZWVkZWQgdG8gZ2V0IHRoZSBleHRl
cm5hbCBkaXNwbGF5IHdvcmtpbmcuIFRoaXMgcmVndWxhdG9yIHdhcyBhbHJlYWR5Cj4gY29uZmln
dXJlZCBpbiB0aGUgaW50ZXJydXB0cyBwcm9wZXJ0eSBvbiB0aGUgcGFyZW50IG5vZGUuCj4KPiBO
b3RlIHRoYXQgdGhpcyByZWd1bGF0b3IgaXMgcmVmZXJyZWQgdG8gYXMgbXZzMiBpbiB0aGUgZG93
bnN0cmVhbSBNU00KPiBrZXJuZWwgc291cmNlcy4KCldoZW4gSSBsb29rZWQgYXQgaXQgaXQgc2Vl
bWVkIGxpa2UgdGhpcyBjb252ZW50aW9uIGlzIHVzZWQgZm9yIHBvd2VyCnN1cHBsaWVzIHRoYXQg
YXBwZWFyIG9uIGJvdGggdGhlIG1haW4gUE1JQyBhbmQgdGhlICJleHRyYSAoYm9vdD8gYmFzaWM/
CmxvdyBwb3dlcj8pIFBNSUMgdGhhdCB0aGUgbWFpbiA4MHh4IFBNSUMgaGFzIG12czEgYW5kIHRo
ZQpvdGhlciA4OXh4IFBNSUMgaGFzIG12czIuCgpJIHN1cHBvc2UgaXQgaXMgbmFtZWQgIm12cyIg
b24gYm90aCBQTUlDcyBhbmQgdGhpcyBpcyBqdXN0IGEgcmFpbApuYW1lIHNvIGFzIG5vdCB0byBj
b25mdXNlIHRoZSBzY2hlbWF0aWM/Cgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFz
bmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

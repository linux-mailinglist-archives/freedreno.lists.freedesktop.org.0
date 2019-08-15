Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5464E8E616
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908926E8C5;
	Thu, 15 Aug 2019 08:18:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBF76E8C3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:18:41 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id j17so1135246lfp.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n93Dng/Ji8MdS4CMyB8lWHjceWaq72wrZdpqfUie2jw=;
 b=DobcvFzCnsNUeN8J7BBCQL2sEYc/+soICHDGgS5aHMiXlEqpa2yrezKSujf4hM+1dZ
 b5v7R/B8UKVN7Ni27IStYfUPXrFEGBx6cucL/jmOlzt81tkZV/nHcNfBgVPm4d7TrLBr
 hvxO6dk3E8bl6BEqsxcJ0BjSxXeJoOAgTzFUGK9yu4viIN+1fAnx/A1cdlyX1yvP2ByB
 V93vollGop69btFHRARGW4v6tf5q3UAuW8MxxI87g2TL1f81Jh2ajn1+38YNIuLZ1hro
 0q2J39IYnYjQXerAkjMZVDTg/uhe/RaMw+t/84kmco+BT5NFimtGaKw9TPntmxNiWmVg
 F5dQ==
X-Gm-Message-State: APjAAAX4w61oD2QKhYV1wzMTRSYYjNuyUGnHbwz3XBxhNXWu7QlvDps0
 M2YzKDx2FqRFxYoUs9aBOMZgJhXdZfUttozuauTy3Q==
X-Google-Smtp-Source: APXvYqz+3m9CpHTiryHGgaHMtDawA41PP43UTCZWzylvPS7O0bar1RDoxUlI3ihahWRnC9SzzajOeS5xqZGxmVYZE8o=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr1883275lfn.60.1565857119990; 
 Thu, 15 Aug 2019 01:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-5-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-5-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:18:28 +0200
Message-ID: <CACRpkdbj10yneOP4JKFGXyiY4e1vS6-oB=W2vs6nj_X2uAY=pQ@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=n93Dng/Ji8MdS4CMyB8lWHjceWaq72wrZdpqfUie2jw=;
 b=n917679wlyShUhrE5Ig3CFfBox9eY1vDh5kRoK7P3mDg7njrsuDaJ4qJSjP0n0hbvN
 6XifsLDIS3pWYVy7ZekSuZ95mPYr4uznZ084qrwwJW9GSUwY02fmoiMMGjcPWsPLiNYJ
 BJt4KywfKUnhrIVLnU600Uws2yZ9Et0XWqrlcCzH7U6LxN7OD1HNTr293DBvwy30Q1cs
 11+aPHS28sOkmSS/L2JI9Bmr2f3qQsIvSylZyRF9Pv2QANJ0oTZ7TKwfE6F/SM1L/Nyw
 XBCZnmBV99kF3Gb8iTlXZgSaY1JtoKpN45vN06DanE0j0nSsx191aIGKHyhj6a+FPHth
 etVQ==
Subject: Re: [Freedreno] [PATCH 04/11] drm/bridge: analogix-anx78xx: convert
 to i2c_new_dummy_device
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFRoZSBpMmNfbmV3X2R1bW15KCkgZnVuY3Rpb24gaXMgZGVw
cmVjYXRlZCBzaW5jZSBpdCByZXR1cm5zIE5VTEwgb24KPiBlcnJvci4gQ2hhbmdlIHRoaXMgdG8g
dXNlIHRoZSByZWNvbW1lbmRlZCByZXBsYWNlbWVudAo+IGkyY19uZXdfZHVtbXlfZGV2aWNlKCkg
dGhhdCByZXR1cm5zIGFuIGVycm9yIGNvZGUgdGhhdCBjYW4gYmUgcmVhZCB3aXRoCj4gUFRSX0VS
UigpIGFuZCBmcmllbmRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXli
QG9uc3RhdGlvbi5vcmc+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVp
akBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJl
bm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752D8E698
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19106E929;
	Thu, 15 Aug 2019 08:35:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97AD16E90B
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:35:24 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c9so1154831lfh.4
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rIQuHahZHT61N3pBhyPaMSRx0lDKJTzgLeGkPUGpwnw=;
 b=n9EXHOCLYmvf3E9F6UoR6Rrbl+HECfA0wegdIuSRe3RIgFiuG1GIEmKAg31UA1PYqX
 C1HYK2aEDV05wGM6iDpue+dfUpMlbcbTE2pKdPibJtZYQh4shdjQn6qfzFwSFKBQ0sUm
 7TZ8xdBdX2OSbZj+kfhPDIVeT6XMs19Puy4TlcZfbb/jC8Hb7bfIoQL63FXAv6EISk/j
 5zZj1E+H1xVvkKA46JnQoK06Py0I/PlMECZtLEq2hhJKenRBl82TxzZp8qS/SxIC7N4L
 6+Nr1SsYoczbJgY+W5vdWqUrUdMIBdG3/ps5amQXiXUsrhxmTxKD3HdkID5sbdv3n3rc
 mxgQ==
X-Gm-Message-State: APjAAAWqPc4rlL1eSGQvmFdPfUr3xQPI7j1XcmWX4erNgF6aFgrZGYcB
 V0B7kMNzk94++iWcnB+vXOuBPTJ04MoWn703lHD3Kg==
X-Google-Smtp-Source: APXvYqy4JWhaSExzEs8fNpyvhhFIffJYnQjxDmgWOFMcNEneP7xcjaUdbR6c+1Du9tQXJhhtHsvVS1Z3y4aDb+ws8Qs=
X-Received: by 2002:ac2:5939:: with SMTP id v25mr1829550lfi.115.1565858122600; 
 Thu, 15 Aug 2019 01:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-4-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-4-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:35:10 +0200
Message-ID: <CACRpkdbCwUbn68trGZTN8pe8rF8x6SeAW1gd7bwFTs3z-6vK=A@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rIQuHahZHT61N3pBhyPaMSRx0lDKJTzgLeGkPUGpwnw=;
 b=Y+FH2yajTgKkaI7nsmE3WEZkZeDokd2RUNA2EldWJj3L3ayjASGWVw8k2Ij/OubaDA
 M5j0TR6ZH7t2zzUaVTqdINB8m5lZjQKpnPOSypEFo2alm8nos9NKEpcKFvMeG4r1uAGP
 8AaHAOiGbMsxK4DiqokN1Oe/6ULi7Td0OYQaU6PgDrUrliFei/NY6KsdXRXQTJ6grcA2
 +XXBHx1lgL1P0ofcfjauBj28vKllqp7gfVIDQ8OSvDzcvPiPEFztsRnRSqMrrh/2PyyG
 Dd0SqjtUzV6NYaebRMJOREUG+7ff7D1na1lXslQREjafp/2W4q53ICtF5IW5iS9XRfz6
 bsYg==
Subject: Re: [Freedreno] [PATCH 03/11] drm/bridge: analogix-anx78xx: silence
 -EPROBE_DEFER warnings
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFNpbGVuY2UgdHdvIHdhcm5pbmcgbWVzc2FnZXMgdGhhdCBv
Y2N1ciBkdWUgdG8gLUVQUk9CRV9ERUZFUiBlcnJvcnMgdG8KPiBoZWxwIGNsZWFudXAgdGhlIHN5
c3RlbSBib290IGxvZy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBv
bnN0YXRpb24ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

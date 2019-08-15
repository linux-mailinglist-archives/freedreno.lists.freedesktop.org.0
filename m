Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8E48E611
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:18:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2F06E8C3;
	Thu, 15 Aug 2019 08:18:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854F66E8C3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:18:12 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id t3so1498766ljj.12
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7xfr16BH5ZJjmVp0865t1tdCv0TJfQQ8MOvl0IA0RI=;
 b=MHfjEtfypmbXYlyFGC0I4wFLcqlNE6SGId4jTTrgoVRHNXRYBF2LJZ+oTsCY56VGM3
 fNDWKmuH29VFVyfHYIoZf/q018VdrwKVP+vPh5bq8sNRixG/Gyvi5wlPN91imGJMN3DJ
 zq6B1H5BHCi7JHwNbTeDDUvVRyemv0TBEsot6Sgf0uu+hSadYCSdb9XGAjBxETrQ6Tcw
 u9ZPAS/V2ffN5te31x33Fo2i3d9p1M2WvBYTsNOGYBQa0DBsBXyCquMz5DN3qTrSXd/I
 1eY09D2rKSm/9O98a8ULMo0ZwcysPRohYMczM3zmET4MYu9kNIpcC4haeLhMpCZvBeTD
 jTnw==
X-Gm-Message-State: APjAAAUtYhI010eLl3JQqc6kJqxjHfKNRUWYUAiO+sCIpunBKrI1yc3l
 NthVOmEL1qiMwcS8XZCLKUuPBSTH9JH8OGhx7PUo4w==
X-Google-Smtp-Source: APXvYqwlNuGYnM4syJ7wAaplZofwwfNvfLAdOC0xu1V73tUg0jS10SDexNQ4wMU3AxJ+Dtlu9zFGYve/VAiy/marM2E=
X-Received: by 2002:a05:651c:28c:: with SMTP id
 b12mr2044788ljo.69.1565857090860; 
 Thu, 15 Aug 2019 01:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-3-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-3-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:17:59 +0200
Message-ID: <CACRpkdaDHoJvoH93Amzv2gSDGbgAsF-iNLiEFA3Fuov3D4uh5Q@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=W7xfr16BH5ZJjmVp0865t1tdCv0TJfQQ8MOvl0IA0RI=;
 b=h/iE0ACwRL8YZpox9tiry6Y6F9AtQ6fulXq/U4nRshmUS5LIgMjgsMcGGCCmgSfY0J
 nglNTBQxeLzOt23t5VWv3b16qAW7RU72nYgfDHIc6rn/87aL9AlP5VRxR1gOtdNN2rzJ
 CE8Oaxl6PzFKEDehEhvT9xMnQ2BuRQKgGSacBPydzgzfPTcdrYIriDbFD0KYhisx/fYQ
 TfxHkfwUUu+WzgWKIvWBuJerhIihKrkXphGv+H3J2ktph4Au4Vf7P8one0DBq1AYscNq
 Ya5pxqW6o6aiYu+tmytDC5UQsm+gOAXmFAltlAlJRfVa6YAKIB8IWmHbMqFum5Xh0C62
 Y8KQ==
Subject: Re: [Freedreno] [PATCH 02/11] drm/bridge: analogix-anx78xx: add new
 variants
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEFkZCBzdXBwb3J0IGZvciB0aGUgNzgwOCB2YXJpYW50LiBX
aGlsZSB3ZSdyZSBoZXJlLCB0aGUgb2YgbWF0Y2ggdGFibGUKPiB3YXMgbWlzc2luZyBzdXBwb3J0
IGZvciB0aGUgNzgxMiBhbmQgNzgxOCB2YXJpYW50cywgc28gYWRkIHRoZW0gYXMgd2VsbC4KPgo+
IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2
aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJz
LApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVk
cmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CCF667E8
	for <lists+freedreno@lfdr.de>; Fri, 12 Jul 2019 09:42:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127D76E2E6;
	Fri, 12 Jul 2019 07:42:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2072A6E2E2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Jul 2019 07:42:55 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id t8so5753496qkt.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Jul 2019 00:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=T9t4sMdQ7ju6F95r8VqvTuSRnDoqwe8Mg8/EN7g9bjA=;
 b=hNWxrpOwTXyDjrDjPSN2xHK1yWMBv5i2P5UVTLTlmIevH0WRcm3pSQq32HSAWqJnLD
 i5ACRFe5y1nPqSBnKHMH/6ZPa+//WVu4/RhghcYkhMNn6P3IAl6sLs/xH1oBZQJkwOho
 q1lfOx7PqHRW24DiQ9Kuy8MFSAO11mrPasGY8ZthWsdQg8YA4rVipkfs38/FFZ1mHan2
 5pb++t4as3QxzhieJZUXcoq8zN98J1EkmrhrkkwZQ8Y8I+1VPRb7hBdzdrtxlrYq1Wgp
 MJYKzHPBha0DkNVFnaNmAwq8C1VEQz8QD1WBa5OAwlQ6FdVhV6xbewfd4N4czprH2xA6
 0nZQ==
X-Gm-Message-State: APjAAAVDmAhlTND1hMu2bKgHzmtEn6DvbX19GxrcBGtbSxfzLrFFnp8b
 QoF9bcdvXr4mAD6la9Nfkd3efb/ln/b5RF01x5/nlA==
X-Google-Smtp-Source: APXvYqwrgaL71IJVsa72rhVPOh+cWEZTyj1wxVLTO7GH4TREGLwUjIqC+Ue6eLE9ZNTL9jxZF/dPXtjZfP7KY6zczmo=
X-Received: by 2002:a37:bcc7:: with SMTP id m190mr5072496qkf.433.1562917375149; 
 Fri, 12 Jul 2019 00:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <86afdc0bca6939901870176dcf55f279f7b10a08.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <86afdc0bca6939901870176dcf55f279f7b10a08.1562843413.git.andrzej.p@collabora.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Fri, 12 Jul 2019 09:42:44 +0200
Message-ID: <CA+M3ks63WY4umDR_1apjLj4kDf8jpm-CLsC-XO7dY=LbY--p-w@mail.gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=T9t4sMdQ7ju6F95r8VqvTuSRnDoqwe8Mg8/EN7g9bjA=;
 b=rk/R6JuNMGMSZJb+YPovsTkrtFyiszy1QWZh3TpLHFIqylcWHxh/ewIgd5a91wVrQN
 ceahiCjA8ikBPJluTWFpkNkYsV/2p3vlCRMfVhOMdONZ8Zsfd3+3N/qVDb4F6+pIMDnK
 MbECjms9qZWlKYELmMDYGSebaDp1YXaSOCKmgRxegfoFrGHo+siChFMRBKT6zhvAcFLi
 UXNatuEC7/Nah1UVkg8fj0wFrba/yP9t7EBPLYREIDMsvG8kovZq5n+fy87RmOjt2+sl
 282rTn+x8xEupAa3RoC0ULJjlpGrxGjO+Ro8hneewvhjGYR9H4mz+vUwj9n1jyvbXOaQ
 ghUQ==
Subject: Re: [Freedreno] [PATCH v4 15/23] drm: sti: Provide ddc symlink in
 hdmi connector sysfs directory
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

TGUgamV1LiAxMSBqdWlsLiAyMDE5IMOgIDEzOjMwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiBhIMOpY3JpdCA6Cj4KPiBVc2UgdGhlIGRkYyBwb2ludGVy
IHByb3ZpZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0aS9z
dGlfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jCj4gaW5kZXggZjAzZDYx
N2VkYzRjLi45MGY4ZGI2M2MwOTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0aS9z
dGlfaGRtaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jCj4gQEAgLTEy
NzksNiArMTI3OSw3IEBAIHN0YXRpYyBpbnQgc3RpX2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiAgICAgICAgIGRybV9icmlk
Z2VfYXR0YWNoKGVuY29kZXIsIGJyaWRnZSwgTlVMTCk7Cj4KPiAgICAgICAgIGNvbm5lY3Rvci0+
ZW5jb2RlciA9IGVuY29kZXI7Cj4gKyAgICAgICBkcm1fY29ubmVjdG9yLT5kZGMgPSBoZG1pLT5k
ZGNfYWRhcHQ7Cj4KPiAgICAgICAgIGRybV9jb25uZWN0b3IgPSAoc3RydWN0IGRybV9jb25uZWN0
b3IgKiljb25uZWN0b3I7Cj4KPiAtLQo+IDIuMTcuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

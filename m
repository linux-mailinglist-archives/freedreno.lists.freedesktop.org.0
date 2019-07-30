Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 108587A8AB
	for <lists+freedreno@lfdr.de>; Tue, 30 Jul 2019 14:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95606E4CD;
	Tue, 30 Jul 2019 12:37:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923A96E4CD
 for <freedreno@lists.freedesktop.org>; Tue, 30 Jul 2019 12:37:03 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id d17so62695104qtj.8
 for <freedreno@lists.freedesktop.org>; Tue, 30 Jul 2019 05:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=n792zjXbKMn7YCTSjsK0c7rZug8cVAZEXdpG+zafkUs=;
 b=Bx0JjdWaHpxivnX80QIXv9tfjFcJqNTq13+iUMBBzRoCsiZlKFuzP5pGlDUArC0h24
 7fZp4pqMPgbL9N3fGxmfUh94eWcd7iTrAuwI6oa3K+dZdO4/9+3zVUpendUCYJekaDKO
 +KL9WD9VDw26PlOzc/d5PAnGy9HE+0sJGBy1RYZm718G2rZ58ixD3J+iu6DXY0bg8d/V
 kZxKxkmHmcIx3sD3yfhteNt1+FvR+rNDgCDUuyuu5IqMY5XMT7z5tEhzaazEtqQXqdNp
 2jRYkmapCDHjUq5snQsfVM6QdrNi/Vw/gYPpGRkwlW2Cy0on9RJxiGdOTBDwidlm5cp6
 8BiA==
X-Gm-Message-State: APjAAAXl+JKoo1Et3EhoU6aClXvUeVIIAX8ARyv8+tbBuEEYehPMbn1S
 XZtjOPc46h2rNI3NAo2kPqY0YRY4NJ3GM4KL0aYByA==
X-Google-Smtp-Source: APXvYqwUTlaCNODMj8Our73tOJ/aN3xFKkF1HOiUDO6XMR5NzvTl2Jv1UFszMtRL0CaUO3v2uM3c75R2zBlJJ/fKvGs=
X-Received: by 2002:aed:3f47:: with SMTP id q7mr82155223qtf.209.1564490222670; 
 Tue, 30 Jul 2019 05:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1564161140.git.andrzej.p@collabora.com>
 <510765aff8ef99683aa2da48bd08004376b1980a.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <510765aff8ef99683aa2da48bd08004376b1980a.1564161140.git.andrzej.p@collabora.com>
From: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Date: Tue, 30 Jul 2019 14:36:50 +0200
Message-ID: <CA+M3ks46eO_yE+Jd9SWPJ6eD+m1TZPCKuBcZsmpy6Ta9PZFfhw@mail.gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=n792zjXbKMn7YCTSjsK0c7rZug8cVAZEXdpG+zafkUs=;
 b=hqyWeBR0GpIR/dKAgWibP2xmKk9SulmD7z5Dn+OwVwnVkWx+7ziiileTfA+PtyflzT
 NCtwjTC8sYHI9UNdSZI7dpe2iy1Q3zkU4UWH8iy54ARmGAGk9bHzgdkGTOLq61jMo/y1
 6ZXG0nKNN679OcMRcoxPasMqFkniZKs/5KmVzMSRjOM5u+W+D3GhD5osis1Bv5P6nBGr
 asuMBD5TQGSYd+CowUBZgKxIXeKrOeEgHYtwCRUdNaLtTxLx6BR56v/WZ3hWbhByGhh4
 G7rSygWiMjDi4IzIFtZV//YhW726BKSTPcJrUCjVB4gqtadF/n7wzQ+OY5/N7h087FL8
 HssA==
Subject: Re: [Freedreno] [PATCH v6 16/24] drm: sti: Provide ddc symlink in
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
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 "moderated list:ARM/S5P EXYNOS AR..." <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, Jyri Sarha <jsarha@ti.com>,
 Vincent Abriou <vincent.abriou@st.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
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

TGUgdmVuLiAyNiBqdWlsLiAyMDE5IMOgIDE5OjI3LCBBbmRyemVqIFBpZXRyYXNpZXdpY3oKPGFu
ZHJ6ZWoucEBjb2xsYWJvcmEuY29tPiBhIMOpY3JpdCA6Cj4KPiBVc2UgdGhlIGRkYyBwb2ludGVy
IHByb3ZpZGVkIGJ5IHRoZSBnZW5lcmljIGNvbm5lY3Rvci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5jb20+CgpSZXZpZXdlZC1i
eTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+Cgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgfCA2ICsrKystLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3Rp
X2hkbWkuYwo+IGluZGV4IGYwM2Q2MTdlZGM0Yy4uMzNkMDZlMGE5MTY4IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9z
dGkvc3RpX2hkbWkuYwo+IEBAIC0xMjg0LDggKzEyODQsMTAgQEAgc3RhdGljIGludCBzdGlfaGRt
aV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpk
YXRhKQo+Cj4gICAgICAgICBkcm1fY29ubmVjdG9yLT5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BP
TExfSFBEOwo+Cj4gLSAgICAgICBkcm1fY29ubmVjdG9yX2luaXQoZHJtX2RldiwgZHJtX2Nvbm5l
Y3RvciwKPiAtICAgICAgICAgICAgICAgICAgICAgICAmc3RpX2hkbWlfY29ubmVjdG9yX2Z1bmNz
LCBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOwo+ICsgICAgICAgZHJtX2Nvbm5lY3Rvcl9pbml0
X3dpdGhfZGRjKGRybV9kZXYsIGRybV9jb25uZWN0b3IsCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJnN0aV9oZG1pX2Nvbm5lY3Rvcl9mdW5jcywKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaGRtaS0+ZGRjX2FkYXB0KTsKPiAgICAgICAg
IGRybV9jb25uZWN0b3JfaGVscGVyX2FkZChkcm1fY29ubmVjdG9yLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICZzdGlfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKPgo+IC0tCj4gMi4x
Ny4xCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJl
ZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F213D7D840
	for <lists+freedreno@lfdr.de>; Thu,  1 Aug 2019 11:08:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6FF6E422;
	Thu,  1 Aug 2019 09:08:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D8F6E422
 for <freedreno@lists.freedesktop.org>; Thu,  1 Aug 2019 09:08:38 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1ht735-0004xe-Fz; Thu, 01 Aug 2019 11:06:59 +0200
Message-ID: <1564650408.7439.11.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 dri-devel@lists.freedesktop.org
Date: Thu, 01 Aug 2019 11:06:48 +0200
In-Reply-To: <db323a3cdfd643cef65d796e959c16a14f105920.1564591626.git.andrzej.p@collabora.com>
References: <65481afa-1104-4ee9-e53d-f2732a10d4b9@baylibre.com>
 <cover.1564591626.git.andrzej.p@collabora.com>
 <db323a3cdfd643cef65d796e959c16a14f105920.1564591626.git.andrzej.p@collabora.com>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 07/13] drm/mediatek: Provide ddc symlink in
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
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, kernel@collabora.com,
 Anthony Koo <Anthony.Koo@amd.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Emil Velikov <emil.velikov@collabora.com>, "David \(ChunMing\)
 Zhou" <David1.Zhou@amd.com>, Mario Kleiner <mario.kleiner.de@gmail.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Francis <David.Francis@amd.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 linux-arm-msm@vger.kernel.org, CK Hu <ck.hu@mediatek.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Shashank Sharma <shashank.sharma@intel.com>, linux-tegra@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Todor Tomov <todor.tomov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA3LTMxIGF0IDE4OjU4ICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3og
d3JvdGU6Cj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25u
ZWN0b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVq
LnBAY29sbGFib3JhLmNvbT4KPiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcu
b3JnPgo+IFJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+
CgpyZWdhcmRzClBoaWxpcHAKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jIHwgNyArKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiBpbmRleCBj
ZTkxYjYxMzY0ZWIuLmY0MTk3NjViN2NjMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
aGRtaS5jCj4gQEAgLTEyOTksOSArMTI5OSwxMCBAQCBzdGF0aWMgaW50IG10a19oZG1pX2JyaWRn
ZV9hdHRhY2goc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKPiAgCXN0cnVjdCBtdGtfaGRtaSAq
aGRtaSA9IGhkbWlfY3R4X2Zyb21fYnJpZGdlKGJyaWRnZSk7Cj4gIAlpbnQgcmV0Owo+ICAKPiAt
CXJldCA9IGRybV9jb25uZWN0b3JfaW5pdChicmlkZ2UtPmVuY29kZXItPmRldiwgJmhkbWktPmNv
bm4sCj4gLQkJCQkgJm10a19oZG1pX2Nvbm5lY3Rvcl9mdW5jcywKPiAtCQkJCSBEUk1fTU9ERV9D
T05ORUNUT1JfSERNSUEpOwo+ICsJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGJy
aWRnZS0+ZW5jb2Rlci0+ZGV2LCAmaGRtaS0+Y29ubiwKPiArCQkJCQkgICZtdGtfaGRtaV9jb25u
ZWN0b3JfZnVuY3MsCj4gKwkJCQkJICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEsCj4gKwkJCQkJ
ICBoZG1pLT5kZGNfYWRwdCk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJZGV2X2VycihoZG1pLT5kZXYs
ICJGYWlsZWQgdG8gaW5pdGlhbGl6ZSBjb25uZWN0b3I6ICVkXG4iLCByZXQpOwo+ICAJCXJldHVy
biByZXQ7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZy
ZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

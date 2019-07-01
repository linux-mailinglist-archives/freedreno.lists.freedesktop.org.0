Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2685A090
	for <lists+freedreno@lfdr.de>; Fri, 28 Jun 2019 18:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B7096E972;
	Fri, 28 Jun 2019 16:12:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62A86E95B;
 Fri, 28 Jun 2019 16:05:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id A22CA289CE8
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 28 Jun 2019 18:01:21 +0200
Message-Id: <0dd014de0ff9cc5098a1b5145b4e65afe9726982.1561735433.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <cover.1561735433.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Fri, 28 Jun 2019 16:12:29 +0000
Subject: [Freedreno] [PATCH v3 07/22] drm/mediatek: Provide ddc symlink in
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
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Vincent Abriou <vincent.abriou@st.com>, Rob Clark <robdclark@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIHwgOSArKysrLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwppbmRleCA1ZDZhOWYwOTRkZjUuLjZjNTMyMWRjYzRi
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKQEAgLTE0Niw3ICsxNDYsNiBAQCBz
dHJ1Y3QgbXRrX2hkbWkgewogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgcGh5ICpwaHk7
CiAJc3RydWN0IGRldmljZSAqY2VjX2RldjsKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkY19hZHB0
OwogCXN0cnVjdCBjbGsgKmNsa1tNVEtfSERNSV9DTEtfQ09VTlRdOwogCXN0cnVjdCBkcm1fZGlz
cGxheV9tb2RlIG1vZGU7CiAJYm9vbCBkdmlfbW9kZTsKQEAgLTEyMTMsMTAgKzEyMTIsMTAgQEAg
c3RhdGljIGludCBtdGtfaGRtaV9jb25uX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAq
Y29ubikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0OwogCi0JaWYgKCFoZG1pLT5kZGNf
YWRwdCkKKwlpZiAoIWNvbm4tPmRkYykKIAkJcmV0dXJuIC1FTk9ERVY7CiAKLQllZGlkID0gZHJt
X2dldF9lZGlkKGNvbm4sIGhkbWktPmRkY19hZHB0KTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNv
bm4sIGNvbm4tPmRkYyk7CiAJaWYgKCFlZGlkKQogCQlyZXR1cm4gLUVOT0RFVjsKIApAQCAtMTUw
OSw5ICsxNTA4LDkgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShzdHJ1Y3Qg
bXRrX2hkbWkgKmhkbWksCiAJfQogCW9mX25vZGVfcHV0KHJlbW90ZSk7CiAKLQloZG1pLT5kZGNf
YWRwdCA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShpMmNfbnApOworCWhkbWktPmNvbm4u
ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGkyY19ucCk7CiAJb2Zfbm9kZV9wdXQo
aTJjX25wKTsKLQlpZiAoIWhkbWktPmRkY19hZHB0KSB7CisJaWYgKCFoZG1pLT5jb25uLmRkYykg
ewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgZGRjIGkyYyBhZGFwdGVyIGJ5IG5vZGVc
biIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

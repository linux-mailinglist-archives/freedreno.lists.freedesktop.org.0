Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AE05A07B
	for <lists+freedreno@lfdr.de>; Fri, 28 Jun 2019 18:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641E96E95F;
	Fri, 28 Jun 2019 16:12:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471506E962;
 Fri, 28 Jun 2019 16:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2996D289CFE
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 28 Jun 2019 18:01:34 +0200
Message-Id: <890f701b0722295ef2f03c89e14271ee11487743.1561735433.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <cover.1561735433.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Fri, 28 Jun 2019 16:12:29 +0000
Subject: [Freedreno] [PATCH v3 20/22] drm/bridge: ti-tfp410: Provide ddc
 symlink in connector sysfs directory
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
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMgfCAxOSArKysrKysr
KystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwppbmRleCBkYmYzNWM3YmM4NWUuLmU1
NTM1OGYwYTViYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCkBAIC0yNiw3ICsyNiw2
IEBAIHN0cnVjdCB0ZnA0MTAgewogCXVuc2lnbmVkIGludAkJY29ubmVjdG9yX3R5cGU7CiAKIAl1
MzIJCQlidXNfZm9ybWF0OwotCXN0cnVjdCBpMmNfYWRhcHRlcgkqZGRjOwogCXN0cnVjdCBncGlv
X2Rlc2MJKmhwZDsKIAlpbnQJCQlocGRfaXJxOwogCXN0cnVjdCBkZWxheWVkX3dvcmsJaHBkX3dv
cms7CkBAIC01NSwxMCArNTQsMTAgQEAgc3RhdGljIGludCB0ZnA0MTBfZ2V0X21vZGVzKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJc3RydWN0IGVkaWQgKmVkaWQ7CiAJaW50IHJl
dDsKIAotCWlmICghZHZpLT5kZGMpCisJaWYgKCFkdmktPmNvbm5lY3Rvci5kZGMpCiAJCWdvdG8g
ZmFsbGJhY2s7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgZHZpLT5kZGMpOwor
CWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBkdmktPmNvbm5lY3Rvci5kZGMpOwogCWlm
ICghZWRpZCkgewogCQlEUk1fSU5GTygiRURJRCByZWFkIGZhaWxlZC4gRmFsbGJhY2sgdG8gc3Rh
bmRhcmQgbW9kZXNcbiIpOwogCQlnb3RvIGZhbGxiYWNrOwpAQCAtOTgsOCArOTcsOCBAQCB0ZnA0
MTBfY29ubmVjdG9yX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLCBib29s
IGZvcmNlKQogCQkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOwogCX0KIAot
CWlmIChkdmktPmRkYykgewotCQlpZiAoZHJtX3Byb2JlX2RkYyhkdmktPmRkYykpCisJaWYgKGR2
aS0+Y29ubmVjdG9yLmRkYykgeworCQlpZiAoZHJtX3Byb2JlX2RkYyhkdmktPmNvbm5lY3Rvci5k
ZGMpKQogCQkJcmV0dXJuIGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkOwogCQllbHNlCiAJCQly
ZXR1cm4gY29ubmVjdG9yX3N0YXR1c19kaXNjb25uZWN0ZWQ7CkBAIC0yOTcsOCArMjk2LDggQEAg
c3RhdGljIGludCB0ZnA0MTBfZ2V0X2Nvbm5lY3Rvcl9wcm9wZXJ0aWVzKHN0cnVjdCB0ZnA0MTAg
KmR2aSkKIAlpZiAoIWRkY19waGFuZGxlKQogCQlnb3RvIGZhaWw7CiAKLQlkdmktPmRkYyA9IG9m
X2dldF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19waGFuZGxlKTsKLQlpZiAoZHZpLT5kZGMpCisJ
ZHZpLT5jb25uZWN0b3IuZGRjID0gb2ZfZ2V0X2kyY19hZGFwdGVyX2J5X25vZGUoZGRjX3BoYW5k
bGUpOworCWlmIChkdmktPmNvbm5lY3Rvci5kZGMpCiAJCWRldl9pbmZvKGR2aS0+ZGV2LCAiQ29u
bmVjdG9yJ3MgZGRjIGkyYyBidXMgZm91bmRcbiIpOwogCWVsc2UKIAkJcmV0ID0gLUVQUk9CRV9E
RUZFUjsKQEAgLTM2Nyw3ICszNjYsNyBAQCBzdGF0aWMgaW50IHRmcDQxMF9pbml0KHN0cnVjdCBk
ZXZpY2UgKmRldiwgYm9vbCBpMmMpCiAKIAlyZXR1cm4gMDsKIGZhaWw6Ci0JaTJjX3B1dF9hZGFw
dGVyKGR2aS0+ZGRjKTsKKwlpMmNfcHV0X2FkYXB0ZXIoZHZpLT5jb25uZWN0b3IuZGRjKTsKIAlp
ZiAoZHZpLT5ocGQpCiAJCWdwaW9kX3B1dChkdmktPmhwZCk7CiAJcmV0dXJuIHJldDsKQEAgLTM4
Miw4ICszODEsOCBAQCBzdGF0aWMgaW50IHRmcDQxMF9maW5pKHN0cnVjdCBkZXZpY2UgKmRldikK
IAogCWRybV9icmlkZ2VfcmVtb3ZlKCZkdmktPmJyaWRnZSk7CiAKLQlpZiAoZHZpLT5kZGMpCi0J
CWkyY19wdXRfYWRhcHRlcihkdmktPmRkYyk7CisJaWYgKGR2aS0+Y29ubmVjdG9yLmRkYykKKwkJ
aTJjX3B1dF9hZGFwdGVyKGR2aS0+Y29ubmVjdG9yLmRkYyk7CiAJaWYgKGR2aS0+aHBkKQogCQln
cGlvZF9wdXQoZHZpLT5ocGQpOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5v
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

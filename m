Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A58A5A086
	for <lists+freedreno@lfdr.de>; Fri, 28 Jun 2019 18:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DEBB6E96A;
	Fri, 28 Jun 2019 16:12:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8D46E95B;
 Fri, 28 Jun 2019 16:06:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 55103289CEF
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Fri, 28 Jun 2019 18:01:26 +0200
Message-Id: <db660d95c4d3cc643c9da7e7a3aecfa13bc73fb7.1561735433.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <cover.1561735433.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Fri, 28 Jun 2019 16:12:29 +0000
Subject: [Freedreno] [PATCH v3 12/22] drm: zte: Provide ddc symlink in hdmi
 connector sysfs directory
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
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS96dGUvenhfaGRtaS5jIHwgMjUgKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMgYi9kcml2
ZXJzL2dwdS9kcm0venRlL3p4X2hkbWkuYwppbmRleCBiZmU5MThiMjdjNWMuLjg2MmE4NTVlYTE0
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMKQEAgLTI5LDE1ICsyOSwxMSBAQAogI2RlZmluZSBaWF9I
RE1JX0lORk9GUkFNRV9TSVpFCQkzMQogI2RlZmluZSBERENfU0VHTUVOVF9BRERSCQkweDMwCiAK
LXN0cnVjdCB6eF9oZG1pX2kyYyB7Ci0Jc3RydWN0IGkyY19hZGFwdGVyIGFkYXA7Ci0Jc3RydWN0
IG11dGV4IGxvY2s7Ci19OwotCiBzdHJ1Y3QgenhfaGRtaSB7CiAJc3RydWN0IGRybV9jb25uZWN0
b3IgY29ubmVjdG9yOwogCXN0cnVjdCBkcm1fZW5jb2RlciBlbmNvZGVyOwotCXN0cnVjdCB6eF9o
ZG1pX2kyYyAqZGRjOworCS8qIHByb3RlY3RzIGRkYyBhY2Nlc3MgKi8KKwlzdHJ1Y3QgbXV0ZXgg
ZGRjX2xvY2s7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07
CiAJdm9pZCBfX2lvbWVtICptbWlvOwpAQCAtMjY0LDcgKzI2MCw3IEBAIHN0YXRpYyBpbnQgenhf
aGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3Ip
CiAJc3RydWN0IGVkaWQgKmVkaWQ7CiAJaW50IHJldDsKIAotCWVkaWQgPSBkcm1fZ2V0X2VkaWQo
Y29ubmVjdG9yLCAmaGRtaS0+ZGRjLT5hZGFwKTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5l
Y3RvciwgY29ubmVjdG9yLT5kZGMpOwogCWlmICghZWRpZCkKIAkJcmV0dXJuIDA7CiAKQEAgLTU2
MiwxMCArNTU4LDkgQEAgc3RhdGljIGludCB6eF9oZG1pX2kyY194ZmVyKHN0cnVjdCBpMmNfYWRh
cHRlciAqYWRhcCwgc3RydWN0IGkyY19tc2cgKm1zZ3MsCiAJCQkgICAgaW50IG51bSkKIHsKIAlz
dHJ1Y3QgenhfaGRtaSAqaGRtaSA9IGkyY19nZXRfYWRhcGRhdGEoYWRhcCk7Ci0Jc3RydWN0IHp4
X2hkbWlfaTJjICpkZGMgPSBoZG1pLT5kZGM7CiAJaW50IGksIHJldCA9IDA7CiAKLQltdXRleF9s
b2NrKCZkZGMtPmxvY2spOworCW11dGV4X2xvY2soJmhkbWktPmRkY19sb2NrKTsKIAogCS8qIEVu
YWJsZSBEREMgbWFzdGVyIGFjY2VzcyAqLwogCWhkbWlfd3JpdGViX21hc2soaGRtaSwgVFBJX0RE
Q19NQVNURVJfRU4sIEhXX0REQ19NQVNURVIsIEhXX0REQ19NQVNURVIpOwpAQCAtNTkwLDcgKzU4
NSw3IEBAIHN0YXRpYyBpbnQgenhfaGRtaV9pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFk
YXAsIHN0cnVjdCBpMmNfbXNnICptc2dzLAogCS8qIERpc2FibGUgRERDIG1hc3RlciBhY2Nlc3Mg
Ki8KIAloZG1pX3dyaXRlYl9tYXNrKGhkbWksIFRQSV9ERENfTUFTVEVSX0VOLCBIV19ERENfTUFT
VEVSLCAwKTsKIAotCW11dGV4X3VubG9jaygmZGRjLT5sb2NrKTsKKwltdXRleF91bmxvY2soJmhk
bWktPmRkY19sb2NrKTsKIAogCXJldHVybiByZXQ7CiB9CkBAIC02MDgsMTcgKzYwMywxNSBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IGkyY19hbGdvcml0aG0genhfaGRtaV9hbGdvcml0aG0gPSB7CiBz
dGF0aWMgaW50IHp4X2hkbWlfZGRjX3JlZ2lzdGVyKHN0cnVjdCB6eF9oZG1pICpoZG1pKQogewog
CXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcDsKLQlzdHJ1Y3QgenhfaGRtaV9pMmMgKmRkYzsKIAlp
bnQgcmV0OwogCi0JZGRjID0gZGV2bV9remFsbG9jKGhkbWktPmRldiwgc2l6ZW9mKCpkZGMpLCBH
RlBfS0VSTkVMKTsKLQlpZiAoIWRkYykKKwlhZGFwID0gZGV2bV9remFsbG9jKGhkbWktPmRldiwg
c2l6ZW9mKCphZGFwKSwgR0ZQX0tFUk5FTCk7CisJaWYgKCFhZGFwKQogCQlyZXR1cm4gLUVOT01F
TTsKIAotCWhkbWktPmRkYyA9IGRkYzsKLQltdXRleF9pbml0KCZkZGMtPmxvY2spOworCWhkbWkt
PmNvbm5lY3Rvci5kZGMgPSBhZGFwOworCW11dGV4X2luaXQoJmhkbWktPmRkY19sb2NrKTsKIAot
CWFkYXAgPSAmZGRjLT5hZGFwOwogCWFkYXAtPm93bmVyID0gVEhJU19NT0RVTEU7CiAJYWRhcC0+
Y2xhc3MgPSBJMkNfQ0xBU1NfRERDOwogCWFkYXAtPmRldi5wYXJlbnQgPSBoZG1pLT5kZXY7Ci0t
IAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

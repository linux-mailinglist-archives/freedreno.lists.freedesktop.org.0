Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39373084
	for <lists+freedreno@lfdr.de>; Wed, 24 Jul 2019 16:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D990B6E563;
	Wed, 24 Jul 2019 14:01:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3663C6E55D;
 Wed, 24 Jul 2019 14:01:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id EE3BB260454
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 24 Jul 2019 15:59:25 +0200
Message-Id: <6fea36724e29e0a6629a19a821727043e730a1e5.1563960855.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
Subject: [Freedreno] [PATCH v5 03/24] drm/exynos: Provide ddc symlink in
 connector's sysfs
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
Cc: amd-gfx@lists.freedesktop.org, "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
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
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

U3dpdGNoIHRvIHVzaW5nIHRoZSBkZGMgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9y
LgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29sbGFi
b3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMgfCAxNyAr
KysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1p
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKaW5kZXggYmMxNTY1ZjE4
MjJhLi5kZGE5NGRlNGFmZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5
bm9zX2hkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19oZG1pLmMKQEAg
LTEyNSw3ICsxMjUsNiBAQCBzdHJ1Y3QgaGRtaV9jb250ZXh0IHsKIAl2b2lkIF9faW9tZW0JCQkq
cmVnczsKIAl2b2lkIF9faW9tZW0JCQkqcmVnc19oZG1pcGh5OwogCXN0cnVjdCBpMmNfY2xpZW50
CQkqaGRtaXBoeV9wb3J0OwotCXN0cnVjdCBpMmNfYWRhcHRlcgkJKmRkY19hZHB0OwogCXN0cnVj
dCBncGlvX2Rlc2MJCSpocGRfZ3BpbzsKIAlpbnQJCQkJaXJxOwogCXN0cnVjdCByZWdtYXAJCQkq
cG11cmVnOwpAQCAtODcxLDEwICs4NzAsMTAgQEAgc3RhdGljIGludCBoZG1pX2dldF9tb2Rlcyhz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXN0cnVjdCBlZGlkICplZGlkOwogCWlu
dCByZXQ7CiAKLQlpZiAoIWhkYXRhLT5kZGNfYWRwdCkKKwlpZiAoIWNvbm5lY3Rvci0+ZGRjKQog
CQlyZXR1cm4gLUVOT0RFVjsKIAotCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBoZGF0
YS0+ZGRjX2FkcHQpOworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3It
PmRkYyk7CiAJaWYgKCFlZGlkKQogCQlyZXR1cm4gLUVOT0RFVjsKIApAQCAtOTQwLDggKzkzOSwx
MCBAQCBzdGF0aWMgaW50IGhkbWlfY3JlYXRlX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2VuY29kZXIg
KmVuY29kZXIpCiAJY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCA9IHRydWU7CiAJY29ubmVj
dG9yLT5wb2xsZWQgPSBEUk1fQ09OTkVDVE9SX1BPTExfSFBEOwogCi0JcmV0ID0gZHJtX2Nvbm5l
Y3Rvcl9pbml0KGhkYXRhLT5kcm1fZGV2LCBjb25uZWN0b3IsCi0JCQkmaGRtaV9jb25uZWN0b3Jf
ZnVuY3MsIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSk7CisJcmV0ID0gZHJtX2Nvbm5lY3Rvcl9p
bml0X3dpdGhfZGRjKGhkYXRhLT5kcm1fZGV2LCBjb25uZWN0b3IsCisJCQkJCSAgJmhkbWlfY29u
bmVjdG9yX2Z1bmNzLAorCQkJCQkgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkJICBj
b25uZWN0b3ItPmRkYyk7CiAJaWYgKHJldCkgewogCQlEUk1fREVWX0VSUk9SKGhkYXRhLT5kZXYs
CiAJCQkgICAgICAiRmFpbGVkIHRvIGluaXRpYWxpemUgY29ubmVjdG9yIHdpdGggZHJtXG4iKTsK
QEAgLTE4OTIsNyArMTg5Myw3IEBAIHN0YXRpYyBpbnQgaGRtaV9nZXRfZGRjX2FkYXB0ZXIoc3Ry
dWN0IGhkbWlfY29udGV4dCAqaGRhdGEpCiAJCXJldHVybiAtRVBST0JFX0RFRkVSOwogCX0KIAot
CWhkYXRhLT5kZGNfYWRwdCA9IGFkcHQ7CisJaGRhdGEtPmNvbm5lY3Rvci5kZGMgPSBhZHB0Owog
CiAJcmV0dXJuIDA7CiB9CkBAIC0yMDQ0LDcgKzIwNDUsNyBAQCBzdGF0aWMgaW50IGhkbWlfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoaGRhdGEtPnJlZ3NfaGRtaXBo
eSkKIAkJaW91bm1hcChoZGF0YS0+cmVnc19oZG1pcGh5KTsKIGVycl9kZGM6Ci0JcHV0X2Rldmlj
ZSgmaGRhdGEtPmRkY19hZHB0LT5kZXYpOworCXB1dF9kZXZpY2UoJmhkYXRhLT5jb25uZWN0b3Iu
ZGRjLT5kZXYpOwogCiAJcmV0dXJuIHJldDsKIH0KQEAgLTIwNzEsNyArMjA3Miw3IEBAIHN0YXRp
YyBpbnQgaGRtaV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoaGRh
dGEtPnJlZ3NfaGRtaXBoeSkKIAkJaW91bm1hcChoZGF0YS0+cmVnc19oZG1pcGh5KTsKIAotCXB1
dF9kZXZpY2UoJmhkYXRhLT5kZGNfYWRwdC0+ZGV2KTsKKwlwdXRfZGV2aWNlKCZoZGF0YS0+Y29u
bmVjdG9yLmRkYy0+ZGV2KTsKIAogCW11dGV4X2Rlc3Ryb3koJmhkYXRhLT5tdXRleCk7CiAKLS0g
CjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

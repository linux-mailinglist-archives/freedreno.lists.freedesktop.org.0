Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C00A77714F
	for <lists+freedreno@lfdr.de>; Fri, 26 Jul 2019 20:35:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB6A6EE1E;
	Fri, 26 Jul 2019 18:35:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1762C6EE1E;
 Fri, 26 Jul 2019 18:35:32 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 30FDE2007C;
 Fri, 26 Jul 2019 20:35:22 +0200 (CEST)
Date: Fri, 26 Jul 2019 20:35:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <20190726183520.GA22572@ravnborg.org>
References: <cover.1564161140.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=aLplU-UxzNz5UvDdbIMA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Subject: Re: [Freedreno] [PATCH v6 00/24] Associate ddc adapters with
 connectors
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
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGkgQW5kZXplai4KCk9uIEZyaSwgSnVsIDI2LCAyMDE5IGF0IDA3OjIyOjU0UE0gKzAyMDAsIEFu
ZHJ6ZWogUGlldHJhc2lld2ljeiB3cm90ZToKPiBJdCBpcyBkaWZmaWN1bHQgZm9yIGEgdXNlciB0
byBrbm93IHdoaWNoIG9mIHRoZSBpMmMgYWRhcHRlcnMgaXMgZm9yIHdoaWNoCj4gZHJtIGNvbm5l
Y3Rvci4gVGhpcyBzZXJpZXMgYWRkcmVzc2VzIHRoaXMgcHJvYmxlbS4KPiAKPiBUaGUgaWRlYSBp
cyB0byBoYXZlIGEgc3ltYm9saWMgbGluayBpbiBjb25uZWN0b3IncyBzeXNmcyBkaXJlY3Rvcnks
IGUuZy46Cj4gCj4gbHMgLWwgL3N5cy9jbGFzcy9kcm0vY2FyZDAtSERNSS1BLTEvZGRjCj4gbHJ3
eHJ3eHJ3eCAxIHJvb3Qgcm9vdCAwIEp1biAyNCAxMDo0MiAvc3lzL2NsYXNzL2RybS9jYXJkMC1I
RE1JLUEtMS9kZGMgXAo+IAktPiAuLi8uLi8uLi8uLi9zb2MvMTM4ODAwMDAuaTJjL2kyYy0yCj4g
Cj4gVGhlIHVzZXIgdGhlbiBrbm93cyB0aGF0IHRoZWlyIGNhcmQwLUhETUktQS0xIHVzZXMgaTJj
LTIgYW5kIGNhbiBlLmcuIHJ1bgo+IGRkY3V0aWw6Cj4gCj4gZGRjdXRpbCAtYiAyIGdldHZjcCAw
eDEwCj4gVkNQIGNvZGUgMHgxMCAoQnJpZ2h0bmVzcyk6IGN1cnJlbnQgdmFsdWUgPSAgICA5MCwg
bWF4IHZhbHVlID0gICAxMDAKPiAKPiBUaGUgZmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcyBhZGRz
IHN0cnVjdCBpMmNfYWRhcHRlciBwb2ludGVyIHRvIHN0cnVjdAo+IGRybV9jb25uZWN0b3IuIElm
IHRoZSBmaWVsZCBpcyB1c2VkIGJ5IGEgcGFydGljdWxhciBkcml2ZXIsIHRoZW4gYW4KPiBhcHBy
b3ByaWF0ZSBzeW1ib2xpYyBsaW5rIGlzIGNyZWF0ZWQgYnkgdGhlIGdlbmVyaWMgY29kZSwgd2hp
Y2ggaXMgYWxzbyBhZGRlZAo+IGJ5IHRoaXMgcGF0Y2guCj4gCj4gUGF0Y2ggMiBhZGRzIGEgbmV3
IHZhcmlhbnQgb2YgZHJtX2Nvbm5lY3Rvcl9pbml0KCksIHNlZSB0aGUgY2hhbmdlbG9nCj4gYmVs
b3cuCj4gCj4gUGF0Y2hlcyAzLi4yNCBhcmUgZXhhbXBsZXMgb2YgaG93IHRvIGNvbnZlcnQgYSBk
cml2ZXIgdG8gdGhpcyBuZXcgc2NoZW1lLgo+IAouLi4KPiAKPiB2NS4udjY6Cj4gCj4gLSBpbXBy
b3ZlZCBzdWJqZWN0IGxpbmUgb2YgcGF0Y2ggMQo+IC0gYWRkZWQga2VybmVsLWRvYyBmb3IgZHJt
X2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkKPiAtIGltcHJvdmVkIGtlcm5lbC1kb2MgZm9yIHRo
ZSBkZGMgZmllbGQgb2Ygc3RydWN0IGRybV9jb25uZWN0b3IKPiAtIGFkZGVkIFJldmlld2VkLWJ5
IGluIHBhdGNoZXMgMTcgYW5kIDE4Cj4gLSBhZGRlZCBBY2tlZC1ieSBpbiBwYXRjaCAyCj4gLSBt
YWRlIHRoZSBvd25lcnNoaXAgb2YgZGRjIGkyY19hZGFwdGVyIGV4cGxpY2l0IGluIGFsbCBwYXRj
aGVzLAo+IHRoaXMgbWFkZSB0aGUgYWZmZWN0ZWQgcGF0Y2hlcyBtdWNoIHNpbXBsZXIKCkxvb2tz
IGdvb2Qgbm93LgpQYXRjaCAxIGFuZCAyIGFyZToKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8
c2FtQHJhdm5ib3JnLm9yZz4KClRoZSByZW1haW5pbmcgcGF0Y2hlcyBhcmU6CkFja2VkLWJ5OiBT
YW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CgoJU2FtCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

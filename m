Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A7B3A6D
	for <lists+freedreno@lfdr.de>; Mon, 16 Sep 2019 14:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252FA6E967;
	Mon, 16 Sep 2019 12:35:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B02F16E910;
 Mon, 16 Sep 2019 10:36:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 0662A28D1E3
To: Andrzej Hajda <a.hajda@samsung.com>, Brian Masney
 <masneyb@onstation.org>, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 agross@kernel.org, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
References: <20190815004854.19860-1-masneyb@onstation.org>
 <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
 <20190815004854.19860-6-masneyb@onstation.org>
 <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <98199a9b-f7e0-ef95-62d7-401273457692@collabora.com>
Date: Mon, 16 Sep 2019 12:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 16 Sep 2019 12:35:36 +0000
Subject: Re: [Freedreno] [PATCH 05/11] drm/bridge: analogix-anx78xx: correct
 value of TX_P0
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 jonas@kwiboo.se, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 daniel@ffwll.ch, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SGkgQW5kcnplaiBhbmQgQnJpYW4KCk9uIDE2LzkvMTkgMTI6MDIsIEFuZHJ6ZWogSGFqZGEgd3Jv
dGU6Cj4gT24gMTUuMDguMjAxOSAwMjo0OCwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+PiBXaGVuIGF0
dGVtcHRpbmcgdG8gY29uZmlndXJlIHRoaXMgZHJpdmVyIG9uIGEgTmV4dXMgNSBwaG9uZSAobXNt
ODk3NCksCj4+IHNldHRpbmcgdXAgdGhlIGR1bW15IGkyYyBidXMgZm9yIFRYX1AwIHdvdWxkIGZh
aWwgZHVlIHRvIGFuIC1FQlVTWQo+PiBlcnJvci4gVGhlIGRvd25zdHJlYW0gTVNNIGtlcm5lbCBz
b3VyY2VzIFsxXSBzaG93cyB0aGF0IHRoZSBwcm9wZXIgdmFsdWUKPj4gZm9yIFRYX1AwIGlzIDB4
NzgsIG5vdCAweDcwLCBzbyBjb3JyZWN0IHRoZSB2YWx1ZSB0byBhbGxvdyBkZXZpY2UKPj4gcHJv
YmluZyB0byBzdWNjZWVkLgo+Pgo+PiBbMV0gaHR0cHM6Ly9naXRodWIuY29tL0FJQ1Ava2VybmVs
X2xnZV9oYW1tZXJoZWFkL2Jsb2IvbjcuMS9kcml2ZXJzL3ZpZGVvL3NsaW1wb3J0L3NsaW1wb3J0
X3R4X3JlZy5oCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54
Nzh4eC5oIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4
LWFueDc4eHguaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5oCj4+
IGluZGV4IDI1ZTA2M2JjZWNiYy4uYmM1MTFmYzYwNWM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaAo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaAo+PiBAQCAtNiw3ICs2LDcgQEAKPj4gICNpZm5k
ZWYgX19BTlg3OHh4X0gKPj4gICNkZWZpbmUgX19BTlg3OHh4X0gKPj4gIAo+PiAtI2RlZmluZSBU
WF9QMAkJCQkweDcwCj4+ICsjZGVmaW5lIFRYX1AwCQkJCTB4NzgKPiAKPiAKPiBUaGlzIGJvdGhl
cnMgbWUgbGl0dGxlLiBUaGVyZSBhcmUgbm8gdXBzdHJlYW0gdXNlcnMsIGdyZXBwaW5nIGFuZHJv
aWQKPiBzb3VyY2VzIHN1Z2dlc3RzIHRoYXQgYm90aCB2YWx1ZXMgY2FuIGJlIHVzZWQgWzFdWzJd
wqAgKGdyZXAgZm9yICIjZGVmaW5lCj4gVFhfUDAiKSwgbW9yZW92ZXIgdGhlcmUgaXMgY29kZSBz
dWdnZXN0aW5nIGJvdGggdmFsdWVzIGNhbiBiZSB2YWxpZCBbM10uCj4gCj4gQ291bGQgeW91IHZl
cmlmeSBkYXRhc2hlZXQgd2hpY2ggaTJjIHNsYXZlIGFkZHJlc3NlcyBhcmUgdmFsaWQgZm9yIHRo
aXMKPiBjaGlwLCBpZiBib3RoIEkgZ3Vlc3MgdGhpcyBwYXRjaCBzaG91bGQgYmUgcmV3b3JrZWQu
Cj4gCgpPbiBteSBjYXNlIHRoZSB2YWxpZCBpMmMgc2xhdmUgYWRkcmVzcyBpcyAweDcwIChmcm9t
IGRhdGFzaGVldCwgdmVyeSBzb3JyeSBJCmNhbid0IHNoYXJlIGl0KSBhbmQgdGhlIGJyaWRnZSB1
c2VkIGlzIGFuIEFOWDc4MTQsIGl0IGNvdWxkIGJlIHRoYXQgQU5YNzgwOCBvcgpBTlg3ODEyIGhh
dmUgZGlmZmVyZW50IHNsYXZlIGFkZHJlc3Nlcz8KClJlZ2FyZHMsCiBFbnJpYwoKPiAKPiBbMV06
Cj4gaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20va2VybmVsL21zbS8rL2FuZHJvaWQt
bXNtLWZsby0zLjQtamItbXIyL2RyaXZlcnMvbWlzYy9zbGltcG9ydF9hbng3ODA4L3NsaW1wb3J0
X3R4X3JlZy5oCj4gCj4gWzJdOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9BbmRyb2lkR1gvU2ltcGxl
R1gtTU0tNi4wX0g4MTVfMjBkL2Jsb2IvbWFzdGVyL2RyaXZlcnMvdmlkZW8vc2xpbXBvcnQvYW54
NzgxMi9zbGltcG9ydDc4MTJfdHhfcmVnLmgKPiAKPiBbM106Cj4gaHR0cHM6Ly9naXRodWIuY29t
L2NvbW1hYWkvYW5kcm9pZF9rZXJuZWxfbGVlY29fbXNtODk5Ni9ibG9iL21hc3Rlci9kcml2ZXJz
L3ZpZGVvL21zbS9tZHNzL2RwL3NsaW1wb3J0X2N1c3RvbV9kZWNsYXJlLmgjTDczCj4gCj4gCj4g
UmVnYXJkcwo+IAo+IEFuZHJ6ZWoKPiAKPiAKPj4gICNkZWZpbmUgVFhfUDEJCQkJMHg3YQo+PiAg
I2RlZmluZSBUWF9QMgkJCQkweDcyCj4+ICAKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9A
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZnJlZWRyZW5v

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1FAB3857
	for <lists+freedreno@lfdr.de>; Mon, 16 Sep 2019 12:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1F96E910;
	Mon, 16 Sep 2019 10:40:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17EF6E910;
 Mon, 16 Sep 2019 10:40:06 +0000 (UTC)
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id BA7C13E8F9;
 Mon, 16 Sep 2019 10:40:04 +0000 (UTC)
Date: Mon, 16 Sep 2019 06:40:04 -0400
From: Brian Masney <masneyb@onstation.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190916104004.GB1644@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <CGME20190815004918epcas3p135042bc52c7e3c8b1aca7624d121af97@epcas3p1.samsung.com>
 <20190815004854.19860-6-masneyb@onstation.org>
 <dc10dd84-72e2-553e-669b-271b77b4a21a@samsung.com>
 <98199a9b-f7e0-ef95-62d7-401273457692@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98199a9b-f7e0-ef95-62d7-401273457692@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1568630406;
 bh=wtwhbwzLFX1hOxjHI6Km7YJYGl4UdbLbrZnDLLvMrxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZCbe4Dvg00xGUQPAJF2/aulQkpQnoxQ9lj5hlCcH+yDvWz62utM+p5k/NFiRgU5g7
 ejeE3yaBaSO72f5dG0dLexNQgj3mUW/ZcK9AIHSwI0LwXFUiGBSvVZMgPYYx4dpRRy
 Q2xqU7xpuIY37lxivUDxElfp7rj2ouOFcdwdZimc=
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
 narmstrong@baylibre.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonas@kwiboo.se, agross@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 Andrzej Hajda <a.hajda@samsung.com>, robdclark@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMTYsIDIwMTkgYXQgMTI6MzY6MTlQTSArMDIwMCwgRW5yaWMgQmFsbGV0Ym8g
aSBTZXJyYSB3cm90ZToKPiBIaSBBbmRyemVqIGFuZCBCcmlhbgo+IAo+IE9uIDE2LzkvMTkgMTI6
MDIsIEFuZHJ6ZWogSGFqZGEgd3JvdGU6Cj4gPiBPbiAxNS4wOC4yMDE5IDAyOjQ4LCBCcmlhbiBN
YXNuZXkgd3JvdGU6Cj4gPj4gV2hlbiBhdHRlbXB0aW5nIHRvIGNvbmZpZ3VyZSB0aGlzIGRyaXZl
ciBvbiBhIE5leHVzIDUgcGhvbmUgKG1zbTg5NzQpLAo+ID4+IHNldHRpbmcgdXAgdGhlIGR1bW15
IGkyYyBidXMgZm9yIFRYX1AwIHdvdWxkIGZhaWwgZHVlIHRvIGFuIC1FQlVTWQo+ID4+IGVycm9y
LiBUaGUgZG93bnN0cmVhbSBNU00ga2VybmVsIHNvdXJjZXMgWzFdIHNob3dzIHRoYXQgdGhlIHBy
b3BlciB2YWx1ZQo+ID4+IGZvciBUWF9QMCBpcyAweDc4LCBub3QgMHg3MCwgc28gY29ycmVjdCB0
aGUgdmFsdWUgdG8gYWxsb3cgZGV2aWNlCj4gPj4gcHJvYmluZyB0byBzdWNjZWVkLgo+ID4+Cj4g
Pj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9BSUNQL2tlcm5lbF9sZ2VfaGFtbWVyaGVhZC9ibG9i
L243LjEvZHJpdmVycy92aWRlby9zbGltcG9ydC9zbGltcG9ydF90eF9yZWcuaAo+ID4+Cj4gPj4g
U2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4gPj4g
LS0tCj4gPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5oIHwgMiAr
LQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+
Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4
eHguaCBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgtYW54Nzh4eC5oCj4gPj4gaW5k
ZXggMjVlMDYzYmNlY2JjLi5iYzUxMWZjNjA1YzkgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4LmgKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2FuYWxvZ2l4LWFueDc4eHguaAo+ID4+IEBAIC02LDcgKzYsNyBAQAo+ID4+ICAj
aWZuZGVmIF9fQU5YNzh4eF9ICj4gPj4gICNkZWZpbmUgX19BTlg3OHh4X0gKPiA+PiAgCj4gPj4g
LSNkZWZpbmUgVFhfUDAJCQkJMHg3MAo+ID4+ICsjZGVmaW5lIFRYX1AwCQkJCTB4NzgKPiA+IAo+
ID4gCj4gPiBUaGlzIGJvdGhlcnMgbWUgbGl0dGxlLiBUaGVyZSBhcmUgbm8gdXBzdHJlYW0gdXNl
cnMsIGdyZXBwaW5nIGFuZHJvaWQKPiA+IHNvdXJjZXMgc3VnZ2VzdHMgdGhhdCBib3RoIHZhbHVl
cyBjYW4gYmUgdXNlZCBbMV1bMl3CoCAoZ3JlcCBmb3IgIiNkZWZpbmUKPiA+IFRYX1AwIiksIG1v
cmVvdmVyIHRoZXJlIGlzIGNvZGUgc3VnZ2VzdGluZyBib3RoIHZhbHVlcyBjYW4gYmUgdmFsaWQg
WzNdLgo+ID4gCj4gPiBDb3VsZCB5b3UgdmVyaWZ5IGRhdGFzaGVldCB3aGljaCBpMmMgc2xhdmUg
YWRkcmVzc2VzIGFyZSB2YWxpZCBmb3IgdGhpcwo+ID4gY2hpcCwgaWYgYm90aCBJIGd1ZXNzIHRo
aXMgcGF0Y2ggc2hvdWxkIGJlIHJld29ya2VkLgo+ID4gCj4gCj4gT24gbXkgY2FzZSB0aGUgdmFs
aWQgaTJjIHNsYXZlIGFkZHJlc3MgaXMgMHg3MCAoZnJvbSBkYXRhc2hlZXQsIHZlcnkgc29ycnkg
SQo+IGNhbid0IHNoYXJlIGl0KSBhbmQgdGhlIGJyaWRnZSB1c2VkIGlzIGFuIEFOWDc4MTQsIGl0
IGNvdWxkIGJlIHRoYXQgQU5YNzgwOCBvcgo+IEFOWDc4MTIgaGF2ZSBkaWZmZXJlbnQgc2xhdmUg
YWRkcmVzc2VzPwoKSSBoYXZlbid0IGJlZW4gYWJsZSB0byBmaW5kIGFueSBvZiB0aGUgZGF0YXNo
ZWV0cyBmb3IgdGhlc2UgZGV2aWNlcwpvbmxpbmUuIFByb2R1Y3QgYnJpZWZzIGFyZSBvbmxpbmUg
KHN1Y2ggYXMgCmh0dHBzOi8vd3d3LmFuYWxvZ2l4LmNvbS9lbi9zeXN0ZW0vZmlsZXMvQU5YNzgw
OF9wcm9kdWN0X2JyaWVmLnBkZiksIGJ1dAp0aGV5IGRvbid0IHByb3ZpZGUgdGhpcyB0eXBlIG9m
IGluZm9ybWF0aW9uLgoKQnJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v

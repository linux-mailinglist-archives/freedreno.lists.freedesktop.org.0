Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A0D8E1F5
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 02:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F7A6E87F;
	Thu, 15 Aug 2019 00:49:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65CCC6E87B;
 Thu, 15 Aug 2019 00:49:12 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 351503E95F;
 Thu, 15 Aug 2019 00:49:08 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Date: Wed, 14 Aug 2019 20:48:43 -0400
Message-Id: <20190815004854.19860-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830151;
 bh=PCy1j7MQudvJstVSVlYc4cRcJStkAE4OqJRndsZJOI0=;
 h=From:To:Cc:Subject:Date:From;
 b=q+P4dvnY8kCbSHP6/cQeJNcM49HQS1+tGPc+xTcR+NwY72Dg4KvVyK6FG5xTEo6OD
 Y0IU/xMhrkp5ILcJF73dQBeXzhK6vqkhotTJU3BhwoVHVXfT7SDH+vnJ/YUcDoyfct
 XVblgW3CGsQv/S/J6MMGbtBm1olh/8loyiE9N9b0=
Subject: [Freedreno] [PATCH 00/11] ARM: dts: qcom: msm8974: add support for
 external display
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
 daniel@ffwll.ch, enric.balletbo@collabora.com, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYmVnaW5zIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgZXh0ZXJuYWwg
ZGlzcGxheSBvdmVyCkhETUkgdGhhdCBpcyBzdXBwb3J0ZWQgb24gbXNtODk3NCBTb0NzLiBJJ20g
dGVzdGluZyB0aGlzIHNlcmllcyBvbiB0aGUKTmV4dXMgNSwgYW5kIEknbSBhYmxlIHRvIGNvbW11
bmljYXRlIHdpdGggdGhlIEhETUkgYnJpZGdlIHZpYSB0aGUKYW5hbG9naXgtYW54Nzh4eCBkcml2
ZXIsIGhvd2V2ZXIgdGhlIGV4dGVybmFsIGRpc3BsYXkgaXMgbm90IHdvcmtpbmcKeWV0LgoKV2hl
biBJIHBsdWcgaW4gdGhlIEhETUkgY2FibGUsIHRoZSBtb25pdG9yIGRldGVjdHMgdGhhdCBhIGRl
dmljZSBpcwpob29rZWQgdXAsIGJ1dCBub3RoaW5nIGlzIHNob3duIG9uIHRoZSBleHRlcm5hbCBt
b25pdG9yLiBUaGUgaG90IHBsdWcKZGV0ZWN0IEdQSU8gKGhwZC1ncGlvcykgb24gdGhlIGFuYWxv
Z2l4LWFueDc4eHggYnJpZGdlIGFuZCBNU00gSERNSQpkcml2ZXJzIGRvIG5vdCBjaGFuZ2Ugc3Rh
dGUgd2hlbiB0aGUgc2xpbXBvcnQgYWRhcHRlciBvciBIRE1JIGNhYmxlIGlzCnBsdWdnZWQgaW4g
b3IgcmVtb3ZlZC4gSSB3b25kZXIgaWYgYSByZWd1bGF0b3IgaXMgbm90IGVuYWJsZWQgc29tZXdo
ZXJlPwpJIGhhdmUgYSBjb21tZW50IGluIHBhdGNoIDEwIHJlZ2FyZGluZyAnaHBkLWdkc2Mtc3Vw
cGx5JyB0aGF0IG1heQpwb3RlbnRpYWxseSBiZSBhbiBpc3N1ZS4KCkknbSBzdGlsbCBkaWdnaW5n
IGluIG9uIHRoaXMsIGhvd2V2ZXIgSSdkIGFwcHJlY2lhdGUgYW55IGZlZWRiYWNrIGlmCmFueW9u
ZSBoYXMgdGltZS4gTW9zdCBvZiB0aGVzZSBwYXRjaGVzIGFyZSByZWFkeSBub3csIHNvIEkgbWFy
a2VkIHRoZQpvbmVzIHRoYXQgYXJlbid0IHJlYWR5IHdpdGggJ1BBVENIIFJGQycuCgpJJ20gdXNp
bmcgYW4gQW5hbG9naXggU2VtaWNvbmR1Y3RvciBTUDYwMDEgU2xpbVBvcnQgTWljcm8tVVNCIHRv
IDRLIEhETUkKQWRhcHRlciB0byBjb25uZWN0IG15IHBob25lIHRvIGFuIGV4dGVybmFsIGRpc3Bs
YXkgdmlhIGEgc3RhbmRhcmQgSERNSQpjYWJsZS4gVGhpcyB3b3JrcyBqdXN0IGZpbmUgd2l0aCB0
aGUgZG93bnN0cmVhbSBNU00ga2VybmVsIHVzaW5nCkFuZHJvaWQuCgpCcmlhbiBNYXNuZXkgKDEx
KToKICBkdC1iaW5kaW5nczogZHJtL2JyaWRnZTogYW5hbG9naXgtYW54Nzh4eDogYWRkIG5ldyB2
YXJpYW50cwogIGRybS9icmlkZ2U6IGFuYWxvZ2l4LWFueDc4eHg6IGFkZCBuZXcgdmFyaWFudHMK
ICBkcm0vYnJpZGdlOiBhbmFsb2dpeC1hbng3OHh4OiBzaWxlbmNlIC1FUFJPQkVfREVGRVIgd2Fy
bmluZ3MKICBkcm0vYnJpZGdlOiBhbmFsb2dpeC1hbng3OHh4OiBjb252ZXJ0IHRvIGkyY19uZXdf
ZHVtbXlfZGV2aWNlCiAgZHJtL2JyaWRnZTogYW5hbG9naXgtYW54Nzh4eDogY29ycmVjdCB2YWx1
ZSBvZiBUWF9QMAogIGRybS9icmlkZ2U6IGFuYWxvZ2l4LWFueDc4eHg6IGFkZCBzdXBwb3J0IGZv
ciBhdmRkMzMgcmVndWxhdG9yCiAgQVJNOiBxY29tX2RlZmNvbmZpZzogYWRkIENPTkZJR19EUk1f
QU5BTE9HSVhfQU5YNzhYWAogIGRybS9tc20vaGRtaTogc2lsZW5jZSAtRVBST0JFX0RFRkVSIHdh
cm5pbmcKICBBUk06IGR0czogcWNvbTogcG04OTQxOiBhZGQgNXZzMiByZWd1bGF0b3Igbm9kZQog
IEFSTTogZHRzOiBxY29tOiBtc204OTc0OiBhZGQgSERNSSBub2RlcwogIEFSTTogZHRzOiBxY29t
OiBtc204OTc0LWhhbW1lcmhlYWQ6IGFkZCBzdXBwb3J0IGZvciBleHRlcm5hbCBkaXNwbGF5Cgog
Li4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2FueDc4MTQudHh0ICAgICAgIHwgICA2ICstCiAu
Li4vcWNvbS1tc204OTc0LWxnZS1uZXh1czUtaGFtbWVyaGVhZC5kdHMgICAgfCAxNDAgKysrKysr
KysrKysrKysrKysrCiBhcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSAgICAgICAg
ICAgfCAgODAgKysrKysrKysrKwogYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1wbTg5NDEuZHRzaSAg
ICAgICAgICAgIHwgIDEwICsrCiBhcmNoL2FybS9jb25maWdzL3Fjb21fZGVmY29uZmlnICAgICAg
ICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC1hbng3OHh4
LmMgICAgIHwgIDYwICsrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4LWFu
eDc4eHguaCAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vaGRtaS9oZG1pX3BoeS5j
ICAgICAgICAgICB8ICAgOCArLQogOCBmaWxlcyBjaGFuZ2VkLCAyOTUgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9mcmVlZHJlbm8=

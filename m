Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 636B68E201
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 02:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFEC6E88F;
	Thu, 15 Aug 2019 00:49:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1232C6E88D;
 Thu, 15 Aug 2019 00:49:18 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id C34763EE60;
 Thu, 15 Aug 2019 00:49:16 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
 a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
 sean@poorly.run
Date: Wed, 14 Aug 2019 20:48:52 -0400
Message-Id: <20190815004854.19860-10-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815004854.19860-1-masneyb@onstation.org>
References: <20190815004854.19860-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1565830157;
 bh=MgVVYz3IFOaEWkO0SUurG8P6fyggfR5oXu1sG6fhpmg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bp3wTiAHR/MmK4BZ7UH9Kofa1DoQnFfUoY1BKE1p7bS2jKvwMZ7NtUQ5SBR5Yj8oM
 zZ7+UhUUD4ei3UIylr8qmYdCQjodCRWJM/JTShTg5Zfsl89p5BwGyP2ttJlRD5qKXe
 N+p9CACHiMQ9R+jKZjKW/Z3Ee5GDeUksSCLoV/uE=
Subject: [Freedreno] [PATCH 09/11] ARM: dts: qcom: pm8941: add 5vs2
 regulator node
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

cG04OTQxIGlzIG1pc3NpbmcgdGhlIDV2czIgcmVndWxhdG9yIG5vZGUgc28gbGV0J3MgYWRkIGl0
IHNpbmNlIGl0cwpuZWVkZWQgdG8gZ2V0IHRoZSBleHRlcm5hbCBkaXNwbGF5IHdvcmtpbmcuIFRo
aXMgcmVndWxhdG9yIHdhcyBhbHJlYWR5CmNvbmZpZ3VyZWQgaW4gdGhlIGludGVycnVwdHMgcHJv
cGVydHkgb24gdGhlIHBhcmVudCBub2RlLgoKTm90ZSB0aGF0IHRoaXMgcmVndWxhdG9yIGlzIHJl
ZmVycmVkIHRvIGFzIG12czIgaW4gdGhlIGRvd25zdHJlYW0gTVNNCmtlcm5lbCBzb3VyY2VzLgoK
U2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQog
YXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1wbTg5NDEuZHRzaSB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvcWNvbS1wbTg5NDEuZHRzaSBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20tcG04OTQxLmR0c2kK
aW5kZXggZjE5ODQ4MGM4ZWY0Li5jMWYyMDEyZDFjOGIgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3Fjb20tcG04OTQxLmR0c2kKKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvcWNvbS1wbTg5
NDEuZHRzaQpAQCAtMTc4LDYgKzE3OCwxNiBAQAogCQkJCXFjb20sdnMtc29mdC1zdGFydC1zdHJl
bmd0aCA9IDwwPjsKIAkJCQlyZWd1bGF0b3ItaW5pdGlhbC1tb2RlID0gPDE+OwogCQkJfTsKKwor
CQkJcG04OTQxXzV2czI6IDV2czIgeworCQkJCXJlZ3VsYXRvci1lbmFibGUtcmFtcC1kZWxheSA9
IDwxMDAwPjsKKwkJCQlyZWd1bGF0b3ItcHVsbC1kb3duOworCQkJCXJlZ3VsYXRvci1vdmVyLWN1
cnJlbnQtcHJvdGVjdGlvbjsKKwkJCQlxY29tLG9jcC1tYXgtcmV0cmllcyA9IDwxMD47CisJCQkJ
cWNvbSxvY3AtcmV0cnktZGVsYXkgPSA8MzA+OworCQkJCXFjb20sdnMtc29mdC1zdGFydC1zdHJl
bmd0aCA9IDwwPjsKKwkJCQlyZWd1bGF0b3ItaW5pdGlhbC1tb2RlID0gPDE+OworCQkJfTsKIAkJ
fTsKIAl9OwogfTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZnJlZWRyZW5v

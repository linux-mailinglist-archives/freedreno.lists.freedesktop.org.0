Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3DFF93D
	for <lists+freedreno@lfdr.de>; Sun, 17 Nov 2019 12:48:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278596E450;
	Sun, 17 Nov 2019 11:48:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 773B76E44B;
 Sun, 17 Nov 2019 11:48:40 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id B2A693E8F6;
 Sun, 17 Nov 2019 11:48:38 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Date: Sun, 17 Nov 2019 06:48:21 -0500
Message-Id: <20191117114825.13541-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1573991319;
 bh=GmSQbPGsqt7hQkZ5e0T4S/NK61H3Et1C5o5BqmHyzFg=;
 h=From:To:Cc:Subject:Date:From;
 b=pVvBpIOewqOttuCPEHkzNsvb1fhuSPjKR91EyXeog8JkXFeNOG+uP+rsBUg/Phrbd
 zxZaWJtngOdtEpTR6psBmMEoXWhVKtIRywYC3wGskhFcNeiwyavZuN3uaBRVCuSz2f
 4co11X/FuDoqPWznKf0fLCAx8w6qUwepClRaiEC0=
Subject: [Freedreno] [PATCH 0/4] drm/msm/gpu: add support for ocmem
 interconnect
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, daniel@ffwll.ch, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

U29tZSBBM3h4IGFuZCBhbGwgQTR4eCBBZHJlbm8gR1BVcyBkbyBub3QgaGF2ZSBHTUVNIGluc2lk
ZSB0aGUgR1BVIGNvcmUKYW5kIG11c3QgdXNlIHRoZSBPbiBDaGlwIE1FTW9yeSAoT0NNRU0pIGlu
IG9yZGVyIHRvIGJlIGZ1bmN0aW9uYWwuClRoZXJlJ3MgYSBzZXBhcmF0ZSBpbnRlcmNvbm5lY3Qg
cGF0aCB0aGF0IG5lZWRzIHRvIGJlIHNldHVwIHRvIE9DTUVNLgpUaGlzIHBhdGNoIHNlcmllcyBh
ZGRzIHN1cHBvcnQgZm9yIHRoYXQgcGF0aCwgYW5kIHNldHMgdGhlIHZvdGVzIGZvciB0aGUKdHdv
IGludGVyY29ubmVjdCBwYXRocyB0byB0aGUgaGlnaGVzdCBzcGVlZCBmb3IgYTN4eCBhbmQgYTR4
eC1iYXNlZApwbGF0Zm9ybXMuCgpCcmlhbiBNYXNuZXkgKDQpOgogIGR0LWJpbmRpbmdzOiBkcm0v
bXNtL2dwdTogZG9jdW1lbnQgc2Vjb25kIGludGVyY29ubmVjdAogIGRybS9tc20vZ3B1OiBhZGQg
c3VwcG9ydCBmb3Igb2NtZW0gaW50ZXJjb25uZWN0IHBhdGgKICBkcm0vbXNtL2EzeHg6IHNldCBp
bnRlcmNvbm5lY3QgYmFuZHdpZHRoIHZvdGUKICBkcm0vbXNtL2E0eHg6IHNldCBpbnRlcmNvbm5l
Y3QgYmFuZHdpZHRoIHZvdGUKCiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21zbS9n
cHUudHh0ICAgfCAgNiArKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2EzeHhfZ3B1
LmMgICAgICAgICB8ICA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4
X2dwdS5jICAgICAgICAgfCAgOCArKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8v
YTZ4eF9nbXUuYyAgICAgICAgIHwgIDYgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hZHJlbm9fZ3B1LmMgICAgICAgfCAyMCArKysrKysrKysrKysrKystLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9ncHUuaCAgICAgICAgICAgICAgICAgfCAgMyArKy0KIDYgZmlsZXMgY2hh
bmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWls
aW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A2105E2B
	for <lists+freedreno@lfdr.de>; Fri, 22 Nov 2019 02:27:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5D46F4CB;
	Fri, 22 Nov 2019 01:27:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141C56EF2E;
 Fri, 22 Nov 2019 01:26:59 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 29A634FE4B;
 Fri, 22 Nov 2019 01:26:58 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run,
	robh+dt@kernel.org
Date: Thu, 21 Nov 2019 20:26:45 -0500
Message-Id: <20191122012645.7430-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191122012645.7430-1-masneyb@onstation.org>
References: <20191122012645.7430-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1574386018;
 bh=10+BffMjbxiihXp6FLNavq2ojK7BnwQalTkr2swFDV0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B4PBjm7ak6+ckQMuruSs+lNSKhx4HGQp1r7NQ+jtOLVtul4UT9S+MWUKQbftGMmUH
 se7DCsKdYvEdUkRlB2yzm29m1jDnHKhn2zYbz2d7dfBDL2YsYQbmXlPbyEC33iZkVi
 cgSz9BKwjnThtuXLPoY4AK/LUMjvHlnsfI7P0qzw=
Subject: [Freedreno] [PATCH v2 4/4] drm/msm/a4xx: set interconnect bandwidth
 vote
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

U2V0IHRoZSB0d28gaW50ZXJjb25uZWN0IHBhdGhzIGZvciB0aGUgR1BVIHRvIG1heGltdW0gc3Bl
ZWQgZm9yIG5vdyB0bwp3b3JrIHRvd2FyZHMgZ2V0dGluZyB0aGUgR1BVIHdvcmtpbmcgdXBzdHJl
YW0uIFdlIGNhbiByZXZpc2l0IGEgbGF0ZXIKdGltZSB0byBvcHRpbWl6ZSB0aGlzIGZvciBiYXR0
ZXJ5IGxpZmUuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9u
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Fk
cmVuby9hNHh4X2dwdS5jCmluZGV4IGIwMTM4OGE5ZTg5ZS4uMjUzZDhkODVkYWFkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNHh4X2dwdS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vYWRyZW5vL2E0eHhfZ3B1LmMKQEAgLTU5MSw2ICs1OTEsMTQgQEAgc3RydWN0
IG1zbV9ncHUgKmE0eHhfZ3B1X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAkJZ290byBm
YWlsOwogCX0KIAorCS8qCisJICogU2V0IHRoZSBJQ0MgcGF0aCB0byBtYXhpbXVtIHNwZWVkIGZv
ciBub3cgYnkgbXVsdGlwbHlpbmcgdGhlIGZhc3Rlc3QKKwkgKiBmcmVxdWVuY3kgYnkgdGhlIGJ1
cyB3aWR0aCAoOCkuIFdlJ2xsIHdhbnQgdG8gc2NhbGUgdGhpcyBsYXRlciBvbiB0bworCSAqIGlt
cHJvdmUgYmF0dGVyeSBsaWZlLgorCSAqLworCWljY19zZXRfYncoZ3B1LT5pY2NfcGF0aCwgMCwg
QnBzX3RvX2ljYyhncHUtPmZhc3RfcmF0ZSkgKiA4KTsKKwlpY2Nfc2V0X2J3KGdwdS0+b2NtZW1f
aWNjX3BhdGgsIDAsIEJwc190b19pY2MoZ3B1LT5mYXN0X3JhdGUpICogOCk7CisKIAlyZXR1cm4g
Z3B1OwogCiBmYWlsOgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9mcmVlZHJlbm8=

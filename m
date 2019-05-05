Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CFC13FF5
	for <lists+freedreno@lfdr.de>; Sun,  5 May 2019 16:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0E4892C2;
	Sun,  5 May 2019 14:01:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5168891CD
 for <freedreno@lists.freedesktop.org>; Sun,  5 May 2019 13:12:10 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 57E794501D;
 Sun,  5 May 2019 13:04:27 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Date: Sun,  5 May 2019 09:04:09 -0400
Message-Id: <20190505130413.32253-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 05 May 2019 14:01:47 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557061467;
 bh=BQ2yu4qmkQ3KcZaluxSLD+o9hT++EGQuoLaMCUSn0dA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s1K5Mv7+r41NE5t824brUqiDq6BUxdeAohYmJbzZhjNWgeo+/TSMLquJYIdgzHJqa
 M2RRz59JpdpzI1aB8B6xt32ULAnf3S/6t4voYJmFw9LddJ/QYHPzLgNVP2q+U9b+ap
 Ebd1sz7pUj9oyLeSytEIrsnUKmg/L3SBSN5LehKI=
Subject: [Freedreno] [PATCH RFC 2/6] drm/msm: add dirty framebuffer helper
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

QWRkIGRybV9hdG9taWNfaGVscGVyX2RpcnR5ZmIoKSBjYWxsYmFjayB0byB0aGUgbXNtIGZyYW1l
YnVmZmVyIGRyaXZlcgpmb3IgdGhlIGRpcnR5IGlvY3RsLgoKU2lnbmVkLW9mZi1ieTogQnJpYW4g
TWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZmIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZmIuYwppbmRleCAxMzYwNTg5NzhlMGYuLjg2MjRhOGU0MDI1ZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9tc21fZmIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9m
Yi5jCkBAIC0xNiw2ICsxNiw3IEBACiAgKi8KIAogI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgor
I2luY2x1ZGUgPGRybS9kcm1fZGFtYWdlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2Vt
X2ZyYW1lYnVmZmVyX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+
CiAKQEAgLTM1LDYgKzM2LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKm1zbV9m
cmFtZWJ1ZmZlcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlcl9mdW5jcyBtc21fZnJhbWVidWZmZXJfZnVuY3MgPSB7CiAJLmNy
ZWF0ZV9oYW5kbGUgPSBkcm1fZ2VtX2ZiX2NyZWF0ZV9oYW5kbGUsCiAJLmRlc3Ryb3kgPSBkcm1f
Z2VtX2ZiX2Rlc3Ryb3ksCisJLmRpcnR5ID0gZHJtX2F0b21pY19oZWxwZXJfZGlydHlmYiwKIH07
CiAKICNpZmRlZiBDT05GSUdfREVCVUdfRlMKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVl
ZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

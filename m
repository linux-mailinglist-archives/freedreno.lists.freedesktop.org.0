Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9C523E66
	for <lists+freedreno@lfdr.de>; Mon, 20 May 2019 19:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6FC8919D;
	Mon, 20 May 2019 17:24:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DA48919D
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2019 17:24:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f204so180280wme.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 May 2019 10:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=37CxHYKlFVVAIEnj21tdjvUOrJCuiyhrkjA75AgmUDE=;
 b=mUlsAovtzoKeNJTh9Cuc5dvv+lfS+vwCigp9M9OAS0DZfyJwEYhqoCR+NAcpjaAVOn
 eEtAjyg57P08MkQtc45kuOSITqbB0nprghjbmMfgJO6HzM8y8M+1Tn62D11KQYDBQMbs
 skqYi3Qa9tHqp6oxwJ0lF5ZThCFZGNyyn6M2P3uyBPW7y6kO7UUTAy5MVaRC3SLBTUu8
 ahvMtzQTiCiHqV8C6p5Z/UXIBZxw/r7sKqhEHeougjqspKBu75KjA8c7MOzsuFDl4zZr
 d5r2BEQGkvSyDYOxyh8OrP8NAFz/n6tUd4S3bRVl1ieoT6TtWINNyf5fNoX0osnkAiXd
 +/kw==
X-Gm-Message-State: APjAAAXO2PhKqXWMpSGkPteXPYkQrHdMSAV40jgiFTrGIQJVqLkZnpTM
 Z3bzJU4EjvFOZ+oCpgWHWkrooQ==
X-Google-Smtp-Source: APXvYqxV/0ooJTzXznpbzssyf0Zwt44GQp/pzzVYbD8W+Rh1jTkMM3EzUOJLQxOAZDv/ikTEgktB8w==
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr146017wme.121.1558373075294; 
 Mon, 20 May 2019 10:24:35 -0700 (PDT)
Received: from localhost.localdomain ([91.253.179.221])
 by smtp.gmail.com with ESMTPSA id b12sm180021wmg.27.2019.05.20.10.24.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 10:24:34 -0700 (PDT)
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 20 May 2019 19:23:55 +0200
Message-Id: <1558373038-5611-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558373038-5611-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1558373038-5611-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=37CxHYKlFVVAIEnj21tdjvUOrJCuiyhrkjA75AgmUDE=;
 b=QXPL+94F09z4z+ao64JQeUt9XFjjtv8g/N09kNE3fTGLUbp/qYLl1g57/r3St9bLbM
 8ytkzOh0Wuy8BN9SlXxU9XZyfWLOan/bGagJczwA0VwsDnRdfZC+BvBUhMUoa7OVVnGu
 Xm4cRqIxYjsIiLDMFpj6u8/02xysp+dxL6e8g=
Subject: [Freedreno] [PATCH 1/4] drm/msm: Fix improper uses of
 smp_mb__{before, after}_atomic()
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
Cc: Andrea Parri <andrea.parri@amarulasolutions.com>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>,
 stable@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, "Paul E. McKenney" <paulmck@linux.ibm.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhlc2UgYmFycmllcnMgb25seSBhcHBseSB0byB0aGUgcmVhZC1tb2RpZnktd3JpdGUgb3BlcmF0
aW9uczsgaW4KcGFydGljdWxhciwgdGhleSBkbyBub3QgYXBwbHkgdG8gdGhlIGF0b21pY19zZXQo
KSBwcmltaXRpdmUuCgpSZXBsYWNlIHRoZSBiYXJyaWVycyB3aXRoIHNtcF9tYigpcy4KCkZpeGVz
OiBiMWZjMjgzOWQyZjkyICgiZHJtL21zbTogSW1wbGVtZW50IHByZWVtcHRpb24gZm9yIEE1WFgg
dGFyZ2V0cyIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJlcG9ydGVkLWJ5OiAiUGF1bCBF
LiBNY0tlbm5leSIgPHBhdWxtY2tAbGludXguaWJtLmNvbT4KUmVwb3J0ZWQtYnk6IFBldGVyIFpp
amxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmVhIFBhcnJp
IDxhbmRyZWEucGFycmlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBSb2IgQ2xhcmsgPHJvYmRj
bGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+CkNjOiBsaW51
eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogIlBhdWwgRS4gTWNL
ZW5uZXkiIDxwYXVsbWNrQGxpbnV4LmlibS5jb20+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVl
bXB0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVl
bXB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X3ByZWVtcHQuYwppbmRleCAz
ZDYyMzEwYTUzNWZiLi5lZTA4MjBlZTBjNjY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNXh4X3ByZWVtcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNXh4X3ByZWVtcHQuYwpAQCAtMzksMTAgKzM5LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
ZXRfcHJlZW1wdF9zdGF0ZShzdHJ1Y3QgYTV4eF9ncHUgKmdwdSwKIAkgKiBwcmVlbXB0aW9uIG9y
IGluIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciBzbyBiYXJyaWVycyBhcmUgbmVlZGVkCiAJICogYmVm
b3JlLi4uCiAJICovCi0Jc21wX21iX19iZWZvcmVfYXRvbWljKCk7CisJc21wX21iKCk7CiAJYXRv
bWljX3NldCgmZ3B1LT5wcmVlbXB0X3N0YXRlLCBuZXcpOwogCS8qIC4uLiBhbmQgYWZ0ZXIqLwot
CXNtcF9tYl9fYWZ0ZXJfYXRvbWljKCk7CisJc21wX21iKCk7CiB9CiAKIC8qIFdyaXRlIHRoZSBt
b3N0IHJlY2VudCB3cHRyIGZvciB0aGUgZ2l2ZW4gcmluZyBpbnRvIHRoZSBoYXJkd2FyZSAqLwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

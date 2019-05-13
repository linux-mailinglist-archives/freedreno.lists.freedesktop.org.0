Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE231B90E
	for <lists+freedreno@lfdr.de>; Mon, 13 May 2019 16:49:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F90089F35;
	Mon, 13 May 2019 14:49:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A7389F1B
 for <freedreno@lists.freedesktop.org>; Mon, 13 May 2019 14:49:27 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id r3so15000415qtp.10
 for <freedreno@lists.freedesktop.org>; Mon, 13 May 2019 07:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f57f9CrkLHcFePwjN3FU4Rm5r4Irtea70kxXmHOLUco=;
 b=Ew8TwTk2VJdsUGtcKrv4ygalBvAw936UmWTw05vYgxXBr6Pb3FUDkAzTyc0ZLp2HDk
 yoc0uWskSqybVM5wftCHBdsbRrYh3hibpHaRUE2+0lsCuJUp2mWgKrqmiiz8zzjyAnja
 FWzuVk44denstiXjVDZQeK1BihO1IcBhvxPY6gOmncUdjxFyYMif3PzG6WkCGNuOSfyq
 ihuJOgq0scaplGbK1nxRg5zo/P1kn4mHyn3fElxOAqXuFqhRASyipReMCMZ1dQnEW6d3
 UxrswEZyDqpU8sMEQAB4/6qsUuS3Z8QC3G2+YlxrZK+DzIrKtj0ZGngTUJN10l7zEyyR
 6QZQ==
X-Gm-Message-State: APjAAAUznw+/xcP9aM5s6q+ShBni/Ha4XeDxsrJbfT7Vrg4uIck3rV6v
 3dL9eB+yLsmcFxTZCesextN38A==
X-Google-Smtp-Source: APXvYqzkJCxySOotyEccUkLJnh8/L72NsFkDS7twtnhdQDc/s7sFH4Ei7ug85zyIi2vDurk31ZYd4Q==
X-Received: by 2002:ac8:33bc:: with SMTP id c57mr23963559qtb.252.1557758967170; 
 Mon, 13 May 2019 07:49:27 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g206sm6871504qkb.75.2019.05.13.07.49.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 May 2019 07:49:26 -0700 (PDT)
Date: Mon, 13 May 2019 10:49:26 -0400
From: Sean Paul <sean@poorly.run>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20190513144926.GQ17077@art_vandelay>
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-6-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190508204219.31687-6-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f57f9CrkLHcFePwjN3FU4Rm5r4Irtea70kxXmHOLUco=;
 b=eNRYCOI4Cpe7VbMGN3Mij1vUAro3bwftdHrWDAXGJjKa4FxsC20E1IR4yp7rfJaHgU
 NFr4NGb/l8gYtiWC5t8U/QmKwQkIJoFMioynbUv5GiZA2XPvw4SPpiFgyXeCpt8+F+lc
 HQb53Xpc7qcpSry382HT166WeDmlRPNZLhytbJcbIs6NClgbtS3OZrV7lu3f76a30aVC
 OuSheK4Wo5RMbkTM3Xcpizy9fWOQzk34+h9Olt6u+E1S1PgFoAsAyFjTn7laW+wDx3YT
 H+KU9HdNYmUU6r0NjsuV4y2SFvsKbLPSKNIV1VFTFzILwwtNfqsaKnQTy4Qm80iidvhk
 7Igw==
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDE6NDI6MTVQTSAtMDcwMCwgUm9iIENsYXJrIHdyb3Rl
Ogo+IEZyb206IEdlb3JnaSBEamFrb3YgPGdlb3JnaS5kamFrb3ZAbGluYXJvLm9yZz4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBHZW9yZ2kgRGpha292IDxnZW9yZ2kuZGpha292QGxpbmFyby5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIHwgMTQgKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRleCA5NzE3OWJlYzg5MDIuLjU0ZDJi
NGMyYjA5ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+
IEBAIC0xNiw2ICsxNiw3IEBACj4gICAqIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRw
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGludXgv
aW50ZXJjb25uZWN0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KPiAgCj4gICNpbmNs
dWRlICJtc21fZHJ2LmgiCj4gQEAgLTEwNTAsNiArMTA1MSwxOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNvbXBvbmVudF9vcHMgbWRwNV9vcHMgPSB7Cj4gIAo+ICBzdGF0aWMgaW50IG1kcDVfZGV2
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiArCXN0cnVjdCBpY2Nf
cGF0aCAqcGF0aDAgPSBvZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJwb3J0MCIpOwo+ICsJc3RydWN0
IGljY19wYXRoICpwYXRoMSA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInBvcnQxIik7Cj4gKwlz
dHJ1Y3QgaWNjX3BhdGggKnBhdGhfcm90ID0gb2ZfaWNjX2dldCgmcGRldi0+ZGV2LCAicm90YXRv
ciIpOwo+ICsKPiArCWlmIChJU19FUlIocGF0aDApKQoKU2FtZSBjb21tZW50cyBoZXJlIHJlOiBO
VUxMIHZhbHVlCgo+ICsJCXJldHVybiBQVFJfRVJSKHBhdGgwKTsKPiArCWljY19zZXRfYncocGF0
aDAsIDAsIE1CcHNfdG9faWNjKDY0MDApKTsKPiArCj4gKwlpZiAoIUlTX0VSUihwYXRoMSkpCj4g
KwkJaWNjX3NldF9idyhwYXRoMSwgMCwgTUJwc190b19pY2MoNjQwMCkpOwo+ICsJaWYgKCFJU19F
UlIocGF0aF9yb3QpKQo+ICsJCWljY19zZXRfYncocGF0aF9yb3QsIDAsIE1CcHNfdG9faWNjKDY0
MDApKTsKPiArCj4gIAlEQkcoIiIpOwo+ICAJcmV0dXJuIGNvbXBvbmVudF9hZGQoJnBkZXYtPmRl
diwgJm1kcDVfb3BzKTsKPiAgfQo+IC0tIAo+IDIuMjAuMQo+IAoKLS0gClNlYW4gUGF1bCwgU29m
dHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

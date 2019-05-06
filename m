Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A376148D3
	for <lists+freedreno@lfdr.de>; Mon,  6 May 2019 13:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C79898A7;
	Mon,  6 May 2019 11:20:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB2689230
 for <freedreno@lists.freedesktop.org>; Mon,  6 May 2019 07:08:53 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id k18so8320492lfj.13
 for <freedreno@lists.freedesktop.org>; Mon, 06 May 2019 00:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ckxUK0EUtxo/rY9pVfkfhX61lQYjZP3T6ZijSk+Xis=;
 b=CsYFDJZttmqVEFU5yDTj93cCaMH1bHPRF6z9IWFaW/0PYdBp7vte9Ne03gvIdr0vhX
 lMjYqYGgsVt78PA+LiTU7Ch4qTJfc+rZf0PpRRG02tVKXIm1Eu87K6TwWYaNc+8Y6LtU
 cEVs3SBlyrRh+Dt8nKHI21rkMkzhLo+XYgQwk1p1Ir61BaNP6NgV6vBHe3khFa+r/mb/
 sa35UXmb8ED5opsqUcLwHIHfLdJrNF22PBA7aqlT4dKEKq/67ICE0xGxUqatmUPR7Ekj
 i7bymSrDAmrmHT3G26tFBpQilekdX2OAwfeKPjaYMQfm8ai6djOYMOcHZwoA/9yI6BW3
 CwiQ==
X-Gm-Message-State: APjAAAXJCBto0eBZb0bozDb/h+wUZa195mPVo9zpxsb4Oj50QPTbq13S
 jvtBVVr+8jjQXrFvd8hr/31dC4NdJLt8Um548IbIVA==
X-Google-Smtp-Source: APXvYqzCc/OSjn4pYKPp9j7dsjoSNEmMF6+y2Uv/KDTK9i/yRnI7v8HdczB/oMXqR5l+25NY5pgqs0RUm+/PLM5ihP0=
X-Received: by 2002:ac2:5381:: with SMTP id g1mr11913523lfh.130.1557126532214; 
 Mon, 06 May 2019 00:08:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-6-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-6-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2019 09:08:40 +0200
Message-ID: <CACRpkdZ608b7+mh8Ln9N7EdGQmu2YNdZqRzoYjwfZXtcWqFE5g@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Mon, 06 May 2019 11:20:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=1ckxUK0EUtxo/rY9pVfkfhX61lQYjZP3T6ZijSk+Xis=;
 b=r/h/kNCyuv2LvDzVu1yxK2Pm9OQBmhjtYxX3feYYLTgvRpNmfmIv3nnqgAboDR0p0E
 B2Rw1gnv2ZURIXNuRQtBE/9IZ3ViUqrugMcI+kGblYdzsYaPm1H471eRPgzRnX+xdBDu
 dbCZroaZtjew5vv0xcxC4b0ofWDB8YT8OA6yQCUyyI+jdhtx76GNqhTsAip/WQ7mLI3X
 baWB6qrwoWrac+JVW+frSKfR3417U0+pNBq7bU1IjZ0+PDbrWX/PyUh1cMCj1Ma6g/eF
 aQXzDs+MTOJeL6OShLSE/c2sKBInacUOLjcAGdio5C2LJU3cxx3RIlsh+Su4juviTVcf
 6z7A==
Subject: Re: [Freedreno] [PATCH RFC 5/6] ARM: dts: qcom: msm8974-hammerhead:
 add support for backlight
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
Cc: Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU3VuLCBNYXkgNSwgMjAxOSBhdCAzOjA0IFBNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gQWRkIG5lY2Vzc2FyeSBkZXZpY2UgdHJlZSBub2RlcyBmb3Ig
dGhlIG1haW4gTENEIGJhY2tsaWdodC4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8
bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KCj4gVGhpcyByZXF1aXJlcyB0aGlzIHNlcmllcyB0aGF0IEkg
c3VibWl0dGVkIHRvIHRoZSBMRUQgLyBiYWNrbGlnaHQKPiBzdWJzeXN0ZW06Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGttbC8yMDE5MDQyNDA5MjUwNS42NTc4LTEtbWFzbmV5YkBvbnN0YXRp
b24ub3JnLwo+IEl0J3MgcmVjZWl2ZWQgMyB7UmV2aWV3ZWQsQWNrZWR9LUJ5cywgYW5kIGhhcyBu
byBvdXRzdGFuZGluZyBjaGFuZ2UKPiByZXF1ZXN0cywgc28gSSBleHBlY3QgaXQnbGwgYmUgbWVy
Z2VkIHNvb24uCgpJZiB0aGUgRFQgYmluZGluZ3MgYXJlIEFDS2VkIGFuZCByZXZpZXdlZCB3ZSBj
YW4gbWVyZ2UgRFRTCmZpbGVzIHVzaW5nIGl0IElNTy4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBt
YWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

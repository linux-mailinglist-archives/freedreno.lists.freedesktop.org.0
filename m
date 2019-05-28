Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2608C2C811
	for <lists+freedreno@lfdr.de>; Tue, 28 May 2019 15:46:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B2689817;
	Tue, 28 May 2019 13:46:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1459898F1
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 13:46:27 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v18so14651375lfi.1
 for <freedreno@lists.freedesktop.org>; Tue, 28 May 2019 06:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uimJHxg6x5yQ0SkHYR4jhNo2jzcs/560scjjidJxXaA=;
 b=hJUTqJ6GPQ81zdcjnkYlzOATzzjcUB1subrDpXW4Fa74aRbnQizGs2F24+kTKdW7ZX
 W79J/VFeyjJCheXaVCDznkgK4vPpXPggxFQlKMcyzp5KIQi5ZrmDBQ/PIGlY16ce9Ks6
 6cP1bRbCG8ShXoOmgUgeMXud8goNCmR6RyLbKrygRgHDLBKPepD236j2Q34vj3LZBpw6
 3otqmjLPNKurCM0SAIvKc2D3f2OXP5hwqjcxvnuB90h/sUp0dmP78MR7sgNI6M6WnPPR
 hihx7YCtlHeBzN8assAy3X4azM+voYmGePHYusJVC2zSV0JDOcq6LKvz+yd0YAW19S0u
 3RCw==
X-Gm-Message-State: APjAAAWEt5RnK0oIQaBzjIarbsmxv4/QerRrGt/1QBBG7i4ymDJKgEDc
 N+TzK2fViBG7YL7y9TdpGk0esvwOneCqZ7jhdTKlFQ==
X-Google-Smtp-Source: APXvYqy4gMwzBlvFh/Ib5gpRrpfYM0F0Z553OBKhHwqFjc4A6FVcEqQkL1jjwcIYhdWJgpLzcJ0GmyoVFzYPjUkcRek=
X-Received: by 2002:ac2:48ad:: with SMTP id u13mr33425124lfg.60.1559051186146; 
 Tue, 28 May 2019 06:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190509020352.14282-1-masneyb@onstation.org>
In-Reply-To: <20190509020352.14282-1-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 May 2019 15:46:14 +0200
Message-ID: <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uimJHxg6x5yQ0SkHYR4jhNo2jzcs/560scjjidJxXaA=;
 b=wIhuxC/qafCCzj9xj0e1GyrPTHQ9LBOu5VnQiwMSnJKjudJatYnjbRzVzl7upG0ngG
 cWtzKZmvp4vPIiRmvem2OWDEplCrgRfOuYzeq7EjL6eblc1GzwDuuKZ/uZmXUkyNAH6M
 h9ICrKl5D7CVaL58rjVCvLBqaPUOu/RAf73EcQDaGcodz0JIMVeJAaFbOlYrV7vaY7hb
 QOvaCL5bfa8tmpaGCOdUxmeU8tEyo+OhnsBwZdL+LTvxyjKmLP60bPkiyBYGH1eR6nw8
 87ZbuRmU9ShywtYnKzjS+OIQJmbJ9jsjjuUx2i0hIDJr5LWtHvg2bAOY8ivWaoxDmWM0
 b3Yg==
Subject: Re: [Freedreno] [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5
 display support
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
Cc: Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Jonathan Marek <jonathan@marek.ca>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCA0OjA0IEFNIEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0
YXRpb24ub3JnPiB3cm90ZToKCj4gSGVyZSBpcyBhIHBhdGNoIHNlcmllcyB0aGF0IGFkZHMgaW5p
dGlhbCBkaXNwbGF5IHN1cHBvcnQgZm9yIHRoZSBMRwo+IE5leHVzIDUgKGhhbW1lcmhlYWQpIHBo
b25lLiBJdCdzIG5vdCBmdWxseSB3b3JraW5nIHNvIHRoYXQncyB3aHkgc29tZQo+IG9mIHRoZXNl
IHBhdGNoZXMgYXJlIFJGQyB1bnRpbCB3ZSBjYW4gZ2V0IGl0IGZ1bGx5IHdvcmtpbmcuCj4KPiBU
aGUgcGhvbmVzIGJvb3RzIGludG8gdGVybWluYWwgbW9kZSwgaG93ZXZlciB0aGVyZSBpcyBhIHNl
dmVyYWwgc2Vjb25kCj4gKG9yIG1vcmUpIGRlbGF5IHdoZW4gd3JpdGluZyB0byB0dHkxIGNvbXBh
cmVkIHRvIHdoZW4gdGhlIGNoYW5nZXMgYXJlCj4gYWN0dWFsbHkgc2hvd24gb24gdGhlIHNjcmVl
bi4gVGhlIGZvbGxvd2luZyBlcnJvcnMgYXJlIGluIGRtZXNnOgoKSSB0ZXN0ZWQgdG8gYXBwbHkg
cGF0Y2hlcyAyLTYgYW5kIGdvdCB0aGUgY29uc29sZSB1cCBvbiB0aGUgcGhvbmUgYXMgd2VsbC4K
SSBzZWUgdGhlIHNhbWUgdGltb3V0cywgYW5kIEkgYWxzbyBub3RpY2UgdGhlIHVwZGF0ZSBpcyBz
bG93IGluIHRoZQpkaXNwbGF5LCBhcyBpZiB0aGUgRFNJIHBhbmVsIHdhcyBydW5uaW5nIGluIGxv
dyBwb3dlciAoTFApIG1vZGUuCgpXYXMgYm9vdGluZyB0aGlzIHRvIGRvIHNvbWUgb3RoZXIgd29y
aywgYnV0IGhhcHB5IHRvIHNlZSB0aGUgcHJvZ3Jlc3MhCgpZb3VycywKTGludXMgV2FsbGVpagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8g
bWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

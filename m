Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F80814A9
	for <lists+freedreno@lfdr.de>; Mon,  5 Aug 2019 11:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF996E2E1;
	Mon,  5 Aug 2019 09:01:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C84A6E2E1
 for <freedreno@lists.freedesktop.org>; Mon,  5 Aug 2019 09:01:47 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id k18so78599073ljc.11
 for <freedreno@lists.freedesktop.org>; Mon, 05 Aug 2019 02:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ofL+84/X8WTQ87INym+beTDzeijUUSg8XFUdF2WJ2nY=;
 b=hRgy1UPzxf6duG2nwZtkNzfGmTigjT90vglCjQ7B1m70ZAxpxvTI1fMACq51khnhWG
 Xz7wsiQ5/ffOnJou8ZICkkIkhoiauK6/aEIwsHAECE7iWPKcak/xeTRV/wRFY9exI6tD
 AZueu/mWRS92158qlQdKwdc+5DepCq5kdWhniG4IpoFb2HQnoxHRG1/gabxNapxpvuLF
 PL71rSxB1tYKfxHaAyoxZrSlSXXJbR1NNsdzjHlXjWDsB0w3dlAk5JHt2VmmnkXzI3cR
 lfJfi31kJKgimJFSrD7EnyOcdK++TX68ENhsJ0Jc6cdwANHOPPcTDJOVpN6oeRjiUUSf
 M5/Q==
X-Gm-Message-State: APjAAAV4yw2+jcOZAFG+D0OP+HaujHvR+WBd5ahZoI0+elKlrkmP759x
 VMKh1+74EmGdFdFmtZlalA2/wP34pPk416xI5CBC8Q==
X-Google-Smtp-Source: APXvYqyy6J/Oydbl1XgI8D9WR+GWwiKIDSANNwFAP8xjqs4qVcz/MsRWaN94GdaujXiAmgVlHAwCD5VXOfoYorScUgQ=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16260537ljs.54.1564995705613; 
 Mon, 05 Aug 2019 02:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
 <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Aug 2019 11:01:34 +0200
Message-ID: <CACRpkdaf7ZOr-ci0VnYcS=cVpmHyvQrDS2PY_tE18ZfhLfmRGA@mail.gmail.com>
To: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=ofL+84/X8WTQ87INym+beTDzeijUUSg8XFUdF2WJ2nY=;
 b=HmmKYJ7mhl+/8zgV9AOWeEOrzP4ybrJE9LPi6oF9/4j1y1StKRkLvw3DtlIUUtQwuE
 gCDxlJNM1DvxV89sqaeJ0toUIG+U4tE8sIKq5Dd/5U6w3hx5i8swa1xLCQYKyMNkXkcZ
 339+gnXSRpxc91M+kGqwLni0gcEs37hlPMyfftjiD2YsRS/RwRFoAbuG14NcUAH2iUTh
 K4CZxw1SQEirbsAbhXBwme1CPbreRdfMGuORnDUe83NO9lWk1irmvVb7FokaCIt3/yfo
 HHQm7fIHSOd7JZpxApSeRGwiKwNDJCyobxFYtzlpWJkRw6LhOwJ0dYGu7VnO6m6DTvce
 7Fow==
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/mdp4: Drop unused GPIO include
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
Cc: MSM <linux-arm-msm@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU3VuLCBKdWwgMjgsIDIwMTkgYXQgMTI6MDIgUE0gTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBTYXQsIEp1biAyOSwgMjAxOSBhdCAzOjAxIFBN
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiA+IFRo
aXMgZmlsZSBpcyBub3QgdXNpbmcgYW55IHN5bWJvbHMgZnJvbSA8bGludXgvZ3Bpby5oPiBzbyBq
dXN0Cj4gPiBkcm9wIHRoaXMgaW5jbHVkZS4KPiA+Cj4gPiBDYzogUm9iIENsYXJrIDxyb2JkY2xh
cmtAZ21haWwuY29tPgo+ID4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4gQ2M6
IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gPiBDYzogZnJlZWRyZW5vQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPgo+Cj4gUm9iICYgZnJpZW5kczogY2FuIHRoaXMgYmUgbWVyZ2VkIHRv
IHdoZXJldmVyIHlvdSBtZXJnZQo+IHRoZSBNU00gRFJNIHBhdGNoZXM/IElmIGl0IGlzIGluIGRy
bS1taXNjIEkgY2FuIGFwcGx5IGl0Cj4gYnV0IEkgbmVlZCBzb21lIEFDS3MuCgpQaW5nIG9uIHRo
aXMhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9mcmVlZHJlbm8=

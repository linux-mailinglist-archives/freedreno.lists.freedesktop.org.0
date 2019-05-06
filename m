Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60D0148D1
	for <lists+freedreno@lfdr.de>; Mon,  6 May 2019 13:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6DC89885;
	Mon,  6 May 2019 11:20:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E061F89236
 for <freedreno@lists.freedesktop.org>; Mon,  6 May 2019 07:09:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u21so987353lja.5
 for <freedreno@lists.freedesktop.org>; Mon, 06 May 2019 00:09:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iRT2BpDptSkxB+ApVYaSpu4TH0+tPZF2HuarptiGZHE=;
 b=XLE519r2Lu5akCuPP0pfzRVP2PYQdxUFymmNk+yWUvjpOezptq5PEcf2mUrU15nEsH
 WTDYOh6OxoXWUu8/7zpdwQNPu5JHhkmIrcVbLRP2ePHRccgvGD4+vCxs2iTG5FN3HHN8
 dwywN+9b9nx96g8VYCqWGidK5sqKxexvZxhBxAXeLAHsW7PcAjZNn0erDQaYCA/sTq1F
 lcM79483OvugA8YAN5RVFHPl6I0NlJoJiCGxB61mm69IdP85mWkcCvdZok5nvvjnNQLI
 AHPy5zWA1UysEYibhJ6gfQroXMma2FwUcGgUj+9B7C0m4qIRkEJoaBtqPt0ObTppN9Yl
 od0Q==
X-Gm-Message-State: APjAAAUesySB/uB4hvH410mlDonPqvEXnO28Rg+N9vrDKg0Pfr2ND1G5
 +uV0JUCgzQYM1onI+GYJk3Cfq4HnCsbtAuZrFIlC8Q==
X-Google-Smtp-Source: APXvYqzoDokcVuvzHXFld3YjPVy3p1eBu2FljGmJcbGtSdNiGf7iikESKDnQSx54yh3i2/GC34Hlw9JUZsHZhhRerZE=
X-Received: by 2002:a2e:8e93:: with SMTP id z19mr9439736ljk.159.1557126573442; 
 Mon, 06 May 2019 00:09:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-7-masneyb@onstation.org>
In-Reply-To: <20190505130413.32253-7-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2019 09:09:21 +0200
Message-ID: <CACRpkdZeMcn-kJqtaZUmfXeibh3SmyKDMUMZt-gLSzEDhGcdCA@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Approved-At: Mon, 06 May 2019 11:20:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=iRT2BpDptSkxB+ApVYaSpu4TH0+tPZF2HuarptiGZHE=;
 b=oKQMEJ8hH/CtsoFlFjBJEHKYnOh4w/g2pDH66nAnJWQ20Bk5RpeuVDK4fYGsd80t9p
 byiDPusCcIFnWgH5BXvaRXanBTBFCJXeidbHDr5G45NiIafotdeIuOz2VZykaC5H5Mp7
 Nt9PVf7G+4Swhgyxg4QvbTm2YBJcbUPRdTbUp1SwOlewc1CYb/GLrGuOb6cmQc0yb4a/
 BrP3pyrvcYHSqZNzskcaDH54+p+5J+0CzC6yNY0DcmV45l1J+6m8LmA4v53vZvbhzZ7B
 lbTe0TnINsOdajsQO3lUCoKbIXFXHwOa3cxXBTBTMW4Y8TZWgRbWv/7E2GDTiCcMxUBR
 ar8w==
Subject: Re: [Freedreno] [PATCH RFC 6/6] ARM: dts: qcom: msm8974-hammerhead:
 add support for display
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
YXRpb24ub3JnPiB3cm90ZToKCj4gQWRkIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIGRpc3BsYXkg
Zm91bmQgb24gdGhlIExHIE5leHVzIDUgKGhhbW1lcmhlYWQpCj4gcGhvbmUuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KClJldmlld2VkLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMg
V2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpG
cmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

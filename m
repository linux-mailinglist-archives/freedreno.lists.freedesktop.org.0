Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF98E627
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3346E8C5;
	Thu, 15 Aug 2019 08:23:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3F16E8C5
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:23:43 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u15so1559560ljl.3
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t0NopUkqBTLA90SLW4pHyzSS/xf0ZSXYWDKGwtJAIsY=;
 b=cCdGrt8dCRopco41j54BU1J+tgWUJLPPiTBQwSL0wie3JUk86dNf0oEZcOOUzC73Bz
 UX2k3oLFLhR2ReXYmnbnZkSODc3nupYF3DaGLo3UcpMgBnOjAKKiBEJVKuQa8zX36zj+
 6CE93QWbBSANwcgvwiZYM4pbYVI7U/XYuq1gl84EjMYTVsidlyKTtKLQgtM1SC0L4vKn
 9oeieTvYGNl+4a1Yv5arm55wew+/vi4bwGH6lOiCC0/JSjQ/HZBlr4kFVE4h1nbCnOQK
 eGNjdQn7w9fZ02mgSylzka+xG5Z2VnhhHZe61UDagI2D1NfK+m4yEj84T8PpqAwrVr3o
 h/BA==
X-Gm-Message-State: APjAAAWL3kkC+j256WGAh8Gz/D2GlebTn0EE3sp9WDhVfQWvAfNJ/s6j
 4K46VBWEU7TyM6q/uW3oji8B3SqjB79S4LXBhaU2Yw==
X-Google-Smtp-Source: APXvYqzE4/aMh5whMI0MclqVZfrD6ndHr/RkELyc9WknR09MC3TLKaJoB0cexdnz/NmuFUXRKZuieK+MZxg1NivzFuo=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr200669ljg.62.1565857421866;
 Thu, 15 Aug 2019 01:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-8-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-8-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:23:30 +0200
Message-ID: <CACRpkda3uCk05FNfeesa6ZgL4MPcQPwjv506jMNmvMkvwCnLdg@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=t0NopUkqBTLA90SLW4pHyzSS/xf0ZSXYWDKGwtJAIsY=;
 b=XfZzDLa/pb4I6O618ihMETOAk22ZCfhPAN12JvjQDq86genpOOd9UIrjs1jDPfXHKv
 C4XbzbKfduo6gxH7+9d535juc4lDa3KVomsptlT5IuBLZAjjZa9RDW+DaFQ5jw+Hd6qz
 mvNDo2UoQAGTnFAb/z0MOQcgu+YNlE2gKQ/YaLvbGyKa55lgeWkOqmclOig+Qaw/vlFe
 cNlUE6ev+m2Z4fhHUkF3Fc5Qp0FShH4ZtRp0bE3Vz4mlR/Xl4QSWA+RxNjkVmDlNnU3c
 M9PVoAFWM/0SAqsGo/gmz/i8D6JE8b5LUjHeOHZCBhzPxG4uQmcxIyE7hoOUmdnT/gLF
 SnCg==
Subject: Re: [Freedreno] [PATCH 07/11] ARM: qcom_defconfig: add
 CONFIG_DRM_ANALOGIX_ANX78XX
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Dave Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Andy Gross <agross@kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, MSM <linux-arm-msm@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMjo0OSBBTSBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25z
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEFkZCBDT05GSUdfRFJNX0FOQUxPR0lYX0FOWDc4WFggYXMg
YSBtb2R1bGUgc28gdGhhdCB0aGUgZXh0ZXJuYWwgZGlzcGxheQo+IGNhbiBiZSB1c2VkIG9uIHRo
ZSBOZXh1cyA1IHBob25lcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5
YkBvbnN0YXRpb24ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxl
aWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==

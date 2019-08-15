Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7FA8E69C
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144686E93A;
	Thu, 15 Aug 2019 08:35:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149416E93A
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:35:47 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id c19so1130443lfm.10
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LckeMEL++L98xkE6bRHUomn8itgtRqdrAYiiSW7aPt8=;
 b=UFLfooJe65UjR3TnrXoHT+Vl5BrGpj3L6dPrIkNyr9ocEQKpamRBGrJIOgWSNUMNT5
 rhlQzXCcOlQRBL4kfGXj/8VTvUVAi3JQ7sg3cRVSSj7wA2DKLh1ECFW8ISSI8DlPgZ4T
 ilR+uPoFOc72y8IAro2cqpzrXnVlSjW0860PLMxk0BNdeWl9qV5lCBaz7nKNY0o59QAE
 LJ/Lpj6d4suLRGJzDAETvqTR3fWsWCCkku8T849kIaCjf9FUPmYvgVqSNDN3KF3jVbXR
 cvySXkU/z8lRfREm4hLT8IMvzsgOSHH87Fy1CvKYCXKYKvcNZWjZstz+/h1/EPHZXPFE
 nI8A==
X-Gm-Message-State: APjAAAUvFK6XLS6D+l+QUnfgNujiXqkygpKD94VZHmrJSWIjJbjVEdTN
 x8A8c7htFi0qQaANkKZpmASzRPc2NsaDbaRN6RjCOg==
X-Google-Smtp-Source: APXvYqwK1EXF1OlxOI1zDtBRCI1LlnDOnp15wcax8wzG7tnNStvRwTaXt1N5txPI2Ni93wI6DJH8/9XBc1qmOdGdFeU=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr1783154lfy.141.1565858143676; 
 Thu, 15 Aug 2019 01:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-9-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-9-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:35:31 +0200
Message-ID: <CACRpkdavMPW1gv8jGUJb-48+=9XCmT=_bsMQFEx3Tk06aQNcAA@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=LckeMEL++L98xkE6bRHUomn8itgtRqdrAYiiSW7aPt8=;
 b=jPedfFTQpgM6N16VFCMmcxfHRcTAvQLEVyl2L+pi2uNbG2bAZTYPJy6zsyYd/zsq75
 qLGM6kd/VOPA6/+zGy4f2K6XHTk26IBdEHY/QLWxecOs/9lvtdbmOJfZwKIQJ7DlE+sE
 YPADIXmnziNit+bcqcv1rMbb3OPAfelMCc27OtpaNVFdT2cms0GzvMd1b8R0vzNSkYZj
 89bhsFLRmjCXBeGnfb0+txiyL5JPTobZE1xPE4SJnCl4HZqvVhB6UcxWPwOK7DObetSQ
 fffSbk6TjILxq9Q88zUiRn1VeY8FagM25tADUr0X8nG874svkQvTRhpsxvLxr4M5G22L
 rQ2Q==
Subject: Re: [Freedreno] [PATCH 08/11] drm/msm/hdmi: silence -EPROBE_DEFER
 warning
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IFNpbGVuY2UgYSB3YXJuaW5nIG1lc3NhZ2UgZHVlIHRvIGFu
IC1FUFJPQkVfREVGRVIgZXJyb3IgdG8gaGVscCBjbGVhbnVwCj4gdGhlIHN5c3RlbSBib290IGxv
Zy4KPgo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3Jn
PgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4K
CllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ZyZWVkcmVubw==

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE68E633
	for <lists+freedreno@lfdr.de>; Thu, 15 Aug 2019 10:25:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3405B6E288;
	Thu, 15 Aug 2019 08:25:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DEB6E288
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 08:25:19 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x3so1133432lfn.6
 for <freedreno@lists.freedesktop.org>; Thu, 15 Aug 2019 01:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P02BSDCRijPbd9yK/6Voa9R/D56p990RHfEVvViY/Bo=;
 b=NWjZx1Y+ECD+0r55bTejmKuh09VWX1Ytb+zo1+L/lHJ1eABdFXv/zQd6oRLoOpmGIw
 jadK0AjJn9xieqnVDmdDJZ1HocqLknVetEH5troq2J8O3YTlM6Nh7LE6YBKPYNGQZMTm
 PTDOuCWncLyNOhn0jE0jGWqU/jdSavkLJYZHJZ/T2DV6ERWa4M/HhYSzIXs5JuB8sQoq
 OmGL/QvCFpjbj5aO9LSNMCB0MTXr5WeVp8RHutNsEo4P1es288nkRysIzvsntGUA3LJv
 zygek2oT0B4SiRQyBM98vtNtwpY8bBlzak65sphv/KAWSyAd+CYyGwx8Q/vGKrBhUz8c
 tW/g==
X-Gm-Message-State: APjAAAUkBvcRtr6oVHohV/qAAh6QQW3FDyR6kGQKjipDvBX9ouHkTdK2
 BF90zSHbWzbPn8lsNIrcQINDZuzJ7qtWAmc1DeugcA==
X-Google-Smtp-Source: APXvYqwuz6gUlIPqwTv4NphE9CuB8QLz9uvS26JNUXQ4p8UjA/NuXYuyNh1rl3LRryriamcIaIyf7prYAZZock0AxlY=
X-Received: by 2002:ac2:4c07:: with SMTP id t7mr1613650lfq.152.1565857518224; 
 Thu, 15 Aug 2019 01:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-11-masneyb@onstation.org>
In-Reply-To: <20190815004854.19860-11-masneyb@onstation.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Aug 2019 10:25:06 +0200
Message-ID: <CACRpkdYkmLXOJHGy5S55r60zZVY9dg5m9j87S3wx=banFxx6aQ@mail.gmail.com>
To: Brian Masney <masneyb@onstation.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=P02BSDCRijPbd9yK/6Voa9R/D56p990RHfEVvViY/Bo=;
 b=VwGU6RQs7iolsd3xhQ/RkLbxvAo8VLkErvnXtuEhQmdWmK+++AzDqwQcuwgE0X927k
 Xk1vn5vYXh3iYZc1Ah5SkL8Dn0uUnfO+jYr1jwuAmBphIqlCxmDSCATpGnl27Ai5CXWm
 YD4wkOLZrBYoyhR4aN8RpI18MKGPkk/YYbjfPEW9G4/iO/Kbz/73F0C5g9LIiZM+7NW+
 SWMSaC74D0zgMt6U1z7UYiWvzxRj+tYEBacypVR9VrNjLFL2Uy/AVDacXEKsfVm9BBZ7
 DjX2KwkQOk7M498JD3EVo4RSmkCSboE7ziaIIdobStjnVp99VmOZudUnn/aaxrywezgs
 OKHw==
Subject: Re: [Freedreno] [PATCH RFC 10/11] ARM: dts: qcom: msm8974: add HDMI
 nodes
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
dGF0aW9uLm9yZz4gd3JvdGU6Cgo+IEFkZCBIRE1JIHR4IGFuZCBwaHkgbm9kZXMgdG8gc3VwcG9y
dCBhbiBleHRlcm5hbCBkaXNwbGF5IHRoYXQgY2FuIGJlCj4gY29ubmVjdGVkIG92ZXIgdGhlIFNs
aW1Qb3J0LiBUaGlzIGlzIGJhc2VkIG9uIHdvcmsgZnJvbSBKb25hdGhhbiBNYXJlay4KPgo+IFNp
Z25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgoKUmV2aWV3
ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApM
aW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVu
bw==

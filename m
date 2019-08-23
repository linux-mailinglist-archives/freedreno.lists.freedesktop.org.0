Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B980C9A7D5
	for <lists+freedreno@lfdr.de>; Fri, 23 Aug 2019 08:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CA36E3FE;
	Fri, 23 Aug 2019 06:52:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF796E3FE
 for <freedreno@lists.freedesktop.org>; Fri, 23 Aug 2019 06:52:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u15so7861240ljl.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Aug 2019 23:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G5vut+/7GfWn6npImvF9Rc3EcWl6Bwqxpc3Tm/7byaQ=;
 b=HYufA8kH+/3rfphEO9JdzplF8FfA9DvnhhxuYLO6MoRvvLBdsRClGkubzHcOV2k83+
 /L8zfeNUtmFhKbCxU5HpkP6S2Sd2aGRtqHFnygZyXpUgjJwzcc+pbCgG3/r/1LMOpp8R
 CGbvDQdsfwvKhEZpmeTea3dgiUcF8iQdxOWb+Tsh01prUyhGgK8F3wsjKIlNr2HKvV6b
 uxoAMLnPuSGo1/tCowM5rJ+HqvGVxMXY07FIJeJaqDjAaojab6PswOo+GvvdJ4tfMKCu
 iOVZldvxOE6+TdsyJEJYCy6xnuiI9EnmKg50cquZaEe4XuXtRV+XJ/TprVSPOhlyiFPo
 dtwQ==
X-Gm-Message-State: APjAAAWRq6LKGbVg2ZmREd/KoAzo+6K/XfJEEWAtVSvH7H/aOy9HhZbe
 gfRtUVuEAmtsqtKhl/waKlbnaPtM/DmxEDWGlYDX5Q==
X-Google-Smtp-Source: APXvYqyEKzwPdx0ZjJjocJJunKwmjsRZdIowtZKK6Batd8JU0Y56aba6StNeDVmOZui0Y27K+B6WJCN6um5Z3JBIC5I=
X-Received: by 2002:a2e:80da:: with SMTP id r26mr1814316ljg.62.1566543135677; 
 Thu, 22 Aug 2019 23:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <1565707585-5359-1-git-send-email-jcrouse@codeaurora.org>
 <1565707585-5359-2-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1565707585-5359-2-git-send-email-jcrouse@codeaurora.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2019 08:52:04 +0200
Message-ID: <CACRpkdbtPo9dr7E2hZ4=fEWTXappWTaypKJyd9M2jz0tYu7HXw@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>, Andy Gross <agross@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=G5vut+/7GfWn6npImvF9Rc3EcWl6Bwqxpc3Tm/7byaQ=;
 b=MVIXR6k8i6ZWuPASEFHHR9F0nPCzK0eVjc8PYz7FptLy2OJujuacqW6lgWGhwQySFz
 3QAySOWoE9nAwQwl1xLEODlrOsAyBMu2u04vibbBBVpvxgU2d/d9lFgSf123gf2E114D
 /jPW1MjyPfCGwgmewUy7qWtuRuFl0ZdoBgJUXWuNSSUvkanykJHAMib9ZE1FHuoQnZgx
 XzaapAMFiJGaBP/N7hmC43ow43jjVG9Li0erAVdh6tyQNjy9HmQDLOQfs/eqEiCTGeze
 cBBi02p/e6U/e0HvajIHRSQG3k6yQHhDjihSPwrKZVq8gfHYtJswFQUJzcr833qCT5/D
 N/8w==
Subject: Re: [Freedreno] [PATCH v2 2/2] arm: Add DRM_MSM to defconfigs with
 ARCH_QCOM
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Leonard Crestez <leonard.crestez@nxp.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Anson Huang <Anson.Huang@nxp.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Brian Masney <masneyb@onstation.org>,
 Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
 MSM <linux-arm-msm@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Simon Horman <horms+renesas@verge.net.au>,
 Fabrice Gasnier <fabrice.gasnier@st.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Frank Rowand <frank.rowand@sony.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgNDo0NiBQTSBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNv
ZGVhdXJvcmEub3JnPiB3cm90ZToKCj4gTm93IHRoYXQgQ09ORklHX0RSTV9NU00gaXMgbm8gbG9u
Z2VyIGRlZmF1bHQgJ3knIGFkZCBpdCBhcyBhIG1vZHVsZSB0byBhbGwKPiBBUkNIX1FDT00gZW5h
YmxlZCBkZWZjb25maWdzIHRvIHJlc3RvcmUgdGhlIHByZXZpb3VzIGV4cGVjdGVkIGJ1aWxkCj4g
YmVoYXZpb3IuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVh
dXJvcmEub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KCkkgc3VwcG9zZSBBbmR5IHdpbGwgcGljayB0aGlzIHVwPwoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
RnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v

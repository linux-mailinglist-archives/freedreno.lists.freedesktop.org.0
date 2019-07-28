Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88D77EF7
	for <lists+freedreno@lfdr.de>; Sun, 28 Jul 2019 12:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC7489BF4;
	Sun, 28 Jul 2019 10:02:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C47089BF4
 for <freedreno@lists.freedesktop.org>; Sun, 28 Jul 2019 10:02:33 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id x25so55661010ljh.2
 for <freedreno@lists.freedesktop.org>; Sun, 28 Jul 2019 03:02:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqJPOf3ole/ocwpSBgy0ZOy0oBYIEFe0Lpin0fI4i4g=;
 b=l+BI17HKA04nDalffKEQvCFMA4/vw+d7bfu+/VRZATbHe25tLJ/fr+QcyZWxrSgwcI
 i1cGQQQ0uZx8lqyTYXrwRo+YgQHNKwpW9+o7KOknWHvBHcxR1m7VN2WNY71OdvacK3lH
 ykath//DMp+f82ZNeUC2qQFqN+sfXJi1qFSQeY2qzXuEA2ageLu5UFbuAhiZOYvry3Qx
 WSSgIRYhqFtvX9tJ4icH4vo4qqKaM6b9/dB4mW1XXdvwhWEltySf7Bkpf9oBft/oMxGf
 nCx06V/B2ztJ/9TwSnLD2Ajmf6A4A4mmpbeziZ2OHNA+J73AGSIlAp/wSkFo2HuBsGsC
 +1mg==
X-Gm-Message-State: APjAAAX1Q9UUWSY82OHtMtQFJl3GTX/f9am1AYEov23Wi6MjyMSDa8y7
 sXDWT1zbqSpQ1fzx/iT8y5gM7zw5ZtWmJZkePOMJcg==
X-Google-Smtp-Source: APXvYqz6EmJJJTKLfbfJEwbI9boVgwgnhYa+vwRfTg39dxtl7DiKAYb7s7X1xZfaTDAEq8Rul0rr79Hz1LXszhPLgOM=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr32928008ljm.180.1564308151456; 
 Sun, 28 Jul 2019 03:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jul 2019 12:02:20 +0200
Message-ID: <CACRpkdZ-6qBxzTTY4=CV+-ZmnTRPmPNAWrHMb_cMXTYdaNeYQQ@mail.gmail.com>
To: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dqJPOf3ole/ocwpSBgy0ZOy0oBYIEFe0Lpin0fI4i4g=;
 b=ATSPbECq/2Dk57WgaaHGygsRg1afRoCRLL5jv2+lMJP5BmgY/x/Y6ccmzhGFuwVKwg
 xwU9DQbweCbPfb7SnrSXADgqPsF4lVdP9zsoQZIR9HUy2aUBe9kRKuAzeaRP8UyS5AMk
 E/nPFTLjgD+WnqqqgS9LIlTuZACBvgBZ2mbE3kKlax864d/M+qrTAgzs2yVeVERJ2271
 vMTx/LdiJhVtUCm8ph6Iv01CiTj42iENItK5UUp754dQfQLsmmnchn6s5PWEDbylafvu
 tzJIvhikFsRS+4YtJONZtCO9GD/x/2XIIhvRbjYOLNtS4JRTxi3eNvr/CXHfYiaCnGXs
 LB8g==
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

T24gU2F0LCBKdW4gMjksIDIwMTkgYXQgMzowMSBQTSBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGlzIGZpbGUgaXMgbm90IHVzaW5nIGFueSBzeW1i
b2xzIGZyb20gPGxpbnV4L2dwaW8uaD4gc28ganVzdAo+IGRyb3AgdGhpcyBpbmNsdWRlLgo+Cj4g
Q2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KPiBDYzogU2VhbiBQYXVsIDxzZWFu
QHBvb3JseS5ydW4+Cj4gQ2M6IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCj4gQ2M6IGZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpSb2IgJiBmcmllbmRzOiBjYW4gdGhpcyBi
ZSBtZXJnZWQgdG8gd2hlcmV2ZXIgeW91IG1lcmdlCnRoZSBNU00gRFJNIHBhdGNoZXM/IElmIGl0
IGlzIGluIGRybS1taXNjIEkgY2FuIGFwcGx5IGl0CmJ1dCBJIG5lZWQgc29tZSBBQ0tzLgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJl
ZWRyZW5v

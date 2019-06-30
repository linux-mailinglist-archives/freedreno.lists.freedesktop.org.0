Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5B5B056
	for <lists+freedreno@lfdr.de>; Sun, 30 Jun 2019 17:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F115A89932;
	Sun, 30 Jun 2019 15:18:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CA689932
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jun 2019 15:18:53 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id h10so10491649ljg.0
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jun 2019 08:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HpE46Z6NWvdrS3lUw3ggCLBRnMjBwHHDcERIdjH6Lfc=;
 b=TtWUWbc407v6sK9IfvEMHT+D7DZOZc2AIzBNjOO05y3u+7wfXIoy8oda02IV9OL/UN
 seh+v9cTgdVJNpN71t+L5vuBcfEj/mfVZB6nuaIpY1UmA10DrGmU1ehKDpmjBPe4KCPT
 zgBxmVClTb11iz5jqbJzoM70t/PD9DcMH2OMGrS21Z73wvfK7mO3dX6zmekbrO+3GsxN
 4f+6krojUH4PYnqZpNxtqrGiSEzw1ZNLftiUFRiXpSTGvW3URFChK7A4Gxgo8jywjpb1
 p0eyFM43fsJtY7CeXOP7RsYQpu35AO3AipcPO8ONf50BFpBnvJPTZc0IZiu5m943YRP5
 KgUA==
X-Gm-Message-State: APjAAAWO0Qou0iuHY1MIAB1+fM2DXUkGeZ2rleXK1zJhOnroLzfgFdlm
 m2GkGB7E998GfJoF9uLcbZddHdaF3Fs/5gwtxg0rPg==
X-Google-Smtp-Source: APXvYqyKV3l5gyErMxjKVpfAN7k4MLE/7m4iA8/iiX3NkTUuMtONgnsOIROJ+Gi3Fplauela34cwa52JNx/MRP7FH2A=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr11621890ljm.180.1561907931835; 
 Sun, 30 Jun 2019 08:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190629125933.679-1-linus.walleij@linaro.org>
 <20190629125933.679-4-linus.walleij@linaro.org>
 <CAF6AEGun2QEMVyO+L3W0UJubgzVPrFr5jkVoTOwHpy9b4MeJMQ@mail.gmail.com>
In-Reply-To: <CAF6AEGun2QEMVyO+L3W0UJubgzVPrFr5jkVoTOwHpy9b4MeJMQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 30 Jun 2019 17:18:39 +0200
Message-ID: <CACRpkdYAmVSiUQozgCvaNe_X1hcmhAzeApQcSxdhWC_wg0tdsg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=HpE46Z6NWvdrS3lUw3ggCLBRnMjBwHHDcERIdjH6Lfc=;
 b=lNA5GC01Ut8STwziDZJ14QDg5Jkz1OhXo58x/jpwiIA94v/qDZQmIz+rShADdD7LZb
 kGPohCC3lRFssrv01dW4Dmve6RPDWLS/ngQD+NbljIYFzrUXUcNFcIqz4s8S1DX8iJC+
 okLacsbZggc128MbinPna6eeiBhSAYZsCNsGVeKTPuWVCZ3qepp0k/konAKzRPlE6+a3
 iUnK/JBW2jnHjiHjetqnfPwqYGUTIWoHcUtSMYCqPggUVTmgHQKp8rTXo2qteSu7Z7qn
 A5k9mr7LF23EoJvk9qC1eJ+1+QxefWLMLG8m2WztyMBKAhTr2CdoZwwpoWOMNMNnMv4v
 ZbNA==
Subject: Re: [Freedreno] [PATCH 4/7] gpio: of: Support some legacy Qualcomm
 HDMI bindings
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU3VuLCBKdW4gMzAsIDIwMTkgYXQgMzoyNiBQTSBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+IHdyb3RlOgoKPiBJJ20gb2sgd2l0aCB0aGlzLi4gYWx0aG91Z2ggSSB3b25kZXIgaWYg
d2UgbmVlZCB0byB0cnkgdGhpcyBoYXJkIGZvcgo+IGJhY2t3YXJkcyBjb21wYXQ/ICBBdCBsZWFz
dCBJIGRvbid0IHNlZSBhbnkgdXBzdHJlYW0gZHRzCj4gdXNpbmcgdGhlIG9sZCBuYW1lcy4gIE1h
eWJlIGl0IGlzIG9rIHRvIGp1c3QgbG9vayB0aGUgb3RoZXIgd2F5IGFuZCBicmVhayB0aGVtLgoK
SSBhbSB1c3VhbGx5IG9mIHRoZSBvcGluaW9uIHRoYXQgaWYgYSB0cmVlIGZhbGxzIGluIHRoZSBm
b3Jlc3QgYW5kIG5vb25lCmlzIHRoZXJlIHRvIGhlYXIgaXQsIHdobyBjYXJlcyB3aGF0IHNvdW5k
IGl0IG1ha2VzLgoKU28gd2UgY2FuIGp1c3QgYXBwbHkgdGhlIG90aGVyIHBhdGNoZXMgYW5kIG5v
dCB0aGlzIG9uZSwgd2hpY2gKc2hvdWxkIHdvcmsganVzdCBmaW5lLiBJdCB3aWxsIHN1cHBvcnQg
dGhlIHZhcmlhbnRzIG9mIHRoZQpiaW5kaW5ncyBlbmRpbmcgd2l0aCAiLWdwaW9zIiBvciAiLWdw
aW8iLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZnJlZWRyZW5v

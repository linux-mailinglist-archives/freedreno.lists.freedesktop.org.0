Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DFCA56EB
	for <lists+freedreno@lfdr.de>; Mon,  2 Sep 2019 15:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B59896D8;
	Mon,  2 Sep 2019 13:01:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B81896D8
 for <freedreno@lists.freedesktop.org>; Mon,  2 Sep 2019 13:01:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id l14so12805084lje.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Sep 2019 06:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5NR6SvqKZT8L7ZtanApWaNMwb/LKNTFMGGSxMB6t2dk=;
 b=kgGnWbhWPjabQn74nD6bbIhmRxcE3kw1MRylWToabM2dkHvWh4/VEWFXxLKv0YIBXX
 08BPwiqCoDM0XBg4qAOHWAs9esVBO5Oao+UJcoJpz7bEZ2420780OQxJrBcRC6nz3MnA
 qIg9joYb9tmH9pDfX89XSWcEsCEXZTTQgxDBiGkwQBWiFOi2YN6IEDos87cvTXMCSX7b
 dG/6LEkQIFcrYrYYkX4Y42p+XP7CiFnGK/mZpyg6umnZy/bOYBsltcnh3sYZDlu3QHB1
 6xGltSIJtukmL/iyUFvXaU8nJK1R/VjJl05D+pglli6kH5jC1cTW4ci6nF9vWUllpGB2
 8J+Q==
X-Gm-Message-State: APjAAAXsfNc4L1ycpaiKFaujlIF9pYoiUgCNHOady8P/hYw90sprcrvO
 XQv7CNZIZ9szMrvTc+wvFLA2fG875K6N1ei4khhMJg==
X-Google-Smtp-Source: APXvYqxF27ULThXbJYCc6j0IIoVfgOfuo8St/uOkqnhFcc5aJJkkUk/jebNzy01Hbjqux/cfhiZnA41Nn6YMdw1FVf8=
X-Received: by 2002:a05:651c:28c:: with SMTP id
 b12mr16399878ljo.69.1567429300022; 
 Mon, 02 Sep 2019 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190823073448.8385-1-linus.walleij@linaro.org>
 <20190823073448.8385-5-linus.walleij@linaro.org>
 <CAF6AEGvPtoEfAsB0KSP3ydmHGTdwnnM--Ru+dUY+7EEpw_8v_g@mail.gmail.com>
In-Reply-To: <CAF6AEGvPtoEfAsB0KSP3ydmHGTdwnnM--Ru+dUY+7EEpw_8v_g@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2019 15:01:28 +0200
Message-ID: <CACRpkdYVwBsr+_vpFPytYZ+432ofm50RWZcGPTVvm-vnXp57fg@mail.gmail.com>
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=5NR6SvqKZT8L7ZtanApWaNMwb/LKNTFMGGSxMB6t2dk=;
 b=bGuiQvFbYJWc9O7OONGeyRj9kfrDmMmvY/nKW221nA3ldxyh17lVPvcxl+/ltWNeXg
 jENWFnEjUX3HX5mWR4sBd4vwTZN8334r1qqD2Dmvv9JgSUm/LLekdNCq9rjSWoHF4xY/
 VDH0VIXtFW+rA1Sqb2VEakMkCmN4BsSi5LvumP88szkjYrIXLy+R+FSwzqlPWig4ohGK
 AOH4A1E8uf3g7Jg4wlGXZ8kEALQNREsvqAmPKLTLSJhPLp8IGS3r2nLGgpn5bMK9Vswe
 Pqrzl+dqNvqtb/Ie4ZtE1B6y2QNvW9f/fi1tgKgn8gwDmPOQTnP3OazT7cA2+UEfDi+H
 MFKw==
Subject: Re: [Freedreno] [PATCH 5/6 v2] drm/msm/hdmi: Bring up HDMI
 connector OFF
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
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU3VuLCBTZXAgMSwgMjAxOSBhdCA2OjI4IFBNIFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4gd3JvdGU6Cgo+IEknbSBwaWNraW5nIHVwIHRoZSBlYXJsaWVyIHBhdGNoZXMgaW4gdGhp
cyBzZXJpZXMuLgoKVGhhbmtzIGEgbG90IDopCgo+IGFsdGhvdWdoIEkgd29uJ3QKPiBoYXZlIGEg
Z29vZCB3YXkgdG8gdGVzdCBvbiBkZXZpY2VzIHdoaWNoIHVzZSB0aGUgaGRtaSBibG9jayBmb3Ig
YSBmZXcKPiB3ZWVrcyAod2hlbiBJIGNvbXBsZXRlIG15IG1vdmUsIGFuZCBnZXQgYmFjayBhIGJ1
bmNoIG9mIGJvYXJkcyB0aGF0Cj4gYXJlIGluIGJveGVzIHJpZ2h0IG5vdykgc28gSSdtIGdvaW5n
IHRvIHdhaXQgb24gdGhlIGxhc3QgdHdvIEkgdGhpbmsuCgpUaGF0J3MgZmluZS4gSXQgaXMganVz
dCBvY2Nhc2lvbmFsIGRyaXZlLWJ5IGNvZGluZyBhbnl3YXkuCgpZb3VycywKTGludXMgV2FsbGVp
agpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJl
bm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=

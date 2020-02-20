Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9416572B
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2020 06:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFA06E113;
	Thu, 20 Feb 2020 05:48:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B313E6E0F3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2020 05:48:46 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id j16so2607002otl.1
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2020 21:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b0F6mdIbbyqJ8pmrP/z43Dyul8vyOpgKKbRJlBxceSI=;
 b=Dj/PTuGcX5bvKKNndi7kNoL5fDDrnj8sA5ecSWCgXS5spldvi9f+HfbQiZk1BZ4Q27
 BqVHTzq3Jf/QSqAp8/o6T1qrNhMFBsPsukftmAY6VAtLwds2AtYb1zdRi6JHsHzMHyPP
 pUeCmkvyJt0aPlrTsOCCPfW0xGxsF4RZiM+L5AoVWG7xz6Ool8zSOAEy72MrFFrFIr8J
 /9s8GKi1Vt8QkHBdpOr3i0EPmG2GCBqdRJDwC0d/9CboaJyQi3o230tDWy1i3vTVABT7
 gZBTcuyBl/po1AuNmHZazbR6K82R+/fFvOvgzIIUHoJyr4xEwtTxTQAY2J2XDOKzxFfx
 qP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b0F6mdIbbyqJ8pmrP/z43Dyul8vyOpgKKbRJlBxceSI=;
 b=KGtINJa7mpb0m3BS7Ld87RXbyNBBGs1cjD5OAhCMGkn//TIyQXVt8uiHfvclzFsLLl
 rHZmVAFg+cMYD0JiUEOFAB2sf2n681xSFOUFaq+r6DySnA10BuPFvba+MNDrL2Q8Sp7x
 xlWdW70AFh3z1Q3rb7RBwnKB7pbvSU6pPVjXYWKs5kMz2TEBCDjvdVlsSq0NXin8aWUX
 hqKe2z2t0Ro1/9es9nbqRicFtJ15sgWJG2r4ymZNM9DCEGbPMAoaaleZxgeWC7vFA5ww
 CYzDFoLHs1C3D7RN+jxXzKLUaBleTcMwedRYb84NcG31gZaO9XS+eP6PN+sMZ9S/vHkD
 DuPA==
X-Gm-Message-State: APjAAAWeSUPhE5Vw8T64RI+e6FG8+5k6Fy2DZa8+JOQDKSyV9xeC1FJA
 8xv6CSNxYoH0YpFZow4aFiCTKUZnW+iCh1UrOEA6eA==
X-Google-Smtp-Source: APXvYqzKncDhV3hzHRxI4jFA2zFrFbfgTQzje+xro87W+aJ9SnJ1h1RBfXJLiqq06+0n0Lm5UwlHJjEcfTJS0vOnrPs=
X-Received: by 2002:a9d:7d93:: with SMTP id j19mr23329830otn.102.1582177725955; 
 Wed, 19 Feb 2020 21:48:45 -0800 (PST)
MIME-Version: 1.0
References: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1582147978-31475-1-git-send-email-jcrouse@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 19 Feb 2020 21:48:34 -0800
Message-ID: <CALAqxLUzCN=xuF1Kx0Op_E0zMXK7PbHqynPu6TDozTMRrAuxkw@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v1 0/4] msm/gpu/a6xx: use the DMA-API for
 GMU memory allocations
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>, lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 1:33 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> When CONFIG_INIT_ON_ALLOC_DEFAULT_ON the GMU memory allocator runs afoul of
> cache coherency issues because it is mapped as write-combine without clearing
> the cache after it was zeroed.
>
> Rather than duplicate the hacky workaround we use in the GEM allocator for the
> same reason it turns out that we don't need to have a bespoke memory allocator
> for the GMU anyway. It uses a flat, global address space and there are only
> two relatively minor allocations anyway. In short, this is essentially what the
> DMA API was created for so replace a bunch of memory management code with two
> calls to allocate and free DMA memory and we're fine.
>
> The only wrinkle is that the memory allocations need to be in a very specific
> location in the GMU virtual address space so in order to get the iova allocator
> to do the right thing we need to specify the dma-ranges property in the device
> tree for the GMU node. Since we've not yet converted the GMU bindings over to
> YAML two patches quickly turn into four but at the end of it we have at least
> one bindings file converted to YAML and 99 less lines of code to worry about.
>
> Jordan Crouse (4):
>   dt-bindings: display: msm: Convert GMU bindings to YAML
>   dt-bindings: display: msm: Add required dma-range property
>   arm64: dts: sdm845: Set the virtual address range for GMU allocations
>   drm/msm/a6xx: Use the DMA API for GMU memory objects

Awesome! Thanks so much for the quick turnaround on this! This set
resolves the crashes I was seeing with
CONFIG_INIT_ON_ALLOC_DEFAULT_ON.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks again!
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

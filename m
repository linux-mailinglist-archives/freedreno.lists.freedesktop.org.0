Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E216F3F4
	for <lists+freedreno@lfdr.de>; Wed, 26 Feb 2020 00:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BC38932E;
	Tue, 25 Feb 2020 23:54:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EAA892D6
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2020 23:54:30 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id 77so1272553oty.6
 for <freedreno@lists.freedesktop.org>; Tue, 25 Feb 2020 15:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oAqDSepBGZ4n0kSIgLmpw4sGTwUtrjb0cUzefUU3KuM=;
 b=MbmqYJ3bTxMe7ILHkl8V1BpKi1o65X47MQwpIZFrKvtnxk5Ia7N4Yxh5jXyzl2UHvg
 LFq79hPlxXf+vrVpK/EaB0+1KrISSykbDer85dM71TmGGfWgEsppOzZcSB5V83fUgmF7
 aDssLGD4jKvmaA4YHFtgPZ5gPfHlhFTuFPJtyqzseOdWael2CHhcynNMr4O0jrAt3Evz
 LEAQjMvnMx0lLTC2hu5KJWQmalT4BxaNRZmUwh14P5YNkQW2oUMFpeOtu9xr1IoumhII
 5nQzlJtlv4Itjcmv5ROdVTh+fM0ynFs6JeOFmnDPyps9PFIgACjP8ZuyJySV304cOToe
 mK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oAqDSepBGZ4n0kSIgLmpw4sGTwUtrjb0cUzefUU3KuM=;
 b=P/wqkBf3xdLZfj7OgrrNLGgaSBwAUaOWO7/soOu6TXmoDu40XH4hXj/6kt4+GQCbVk
 O+rdBZSfWEptHmirUVrHla8NXS1J/9h4u4jt+5C/P6B9Yy98vcVlwINE/2OHkf/B6XLC
 KYHBY2yF4bziyHbIKsqHpQpKUEcpWYzo8qHQnDR3I8Dlw2xs+X4oiojoVdQeCAR905Sz
 I5kWapAezmwmZ+s8hj77ins9ircJVHW4o6AvgPzxg1lylOhWcDzBALWxz6EObYz7Dt2y
 L6BciMPhhGdvbmc4DadcbWk8K4DFh1HUzL03JNW35DN/AVINaIw34ZsjWNh4yyqhBv3K
 BM3Q==
X-Gm-Message-State: APjAAAXvaxHGPZY/Zz6OzgRwHhw+rZ7BPTLMpdf87XHHL4ul2nfCdsqp
 jDG/xs3m9MjkobmmabqCl4fjeA8bId5H9wKb5Rctiw==
X-Google-Smtp-Source: APXvYqxHExvDxP3YDUCsYTbRz8HnGzFZhKBTxskzmLJjMa5mreChK7b0tovjYeFp4V6uvGP5Rvmqe9fzCWzwee3BXhU=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr791163otq.221.1582674870075; 
 Tue, 25 Feb 2020 15:54:30 -0800 (PST)
MIME-Version: 1.0
References: <1582223216-23459-1-git-send-email-jcrouse@codeaurora.org>
 <1582223216-23459-5-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1582223216-23459-5-git-send-email-jcrouse@codeaurora.org>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 25 Feb 2020 15:54:19 -0800
Message-ID: <CALAqxLWc4QQPyh=R6=0uFnLLicTYJ3NMO6QSc_yF31bJ2Z_rkQ@mail.gmail.com>
To: Jordan Crouse <jcrouse@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v2 4/4] drm/msm/a6xx: Use the DMA API for
 GMU memory objects
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
Cc: freedreno@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Todd Kjos <tkjos@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Feb 20, 2020 at 10:27 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> The GMU has very few memory allocations and uses a flat memory space so
> there is no good reason to go out of our way to bypass the DMA APIs which
> were basically designed for this exact scenario.
>
> v2: Pass force_dma false to of_dma_configure to require that the DMA
> region be set up and return error from of_dma_configure to fail probe.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 112 +++-------------------------------
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |   5 +-
>  2 files changed, 11 insertions(+), 106 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 983afea..c36b38b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
...
> -       count = bo->size >> PAGE_SHIFT;
> +       bo->virt = dma_alloc_attrs(gmu->dev, bo->size, &bo->iova, GFP_KERNEL,
> +               bo->attrs);
>
...
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 2af91ed..31bd1987 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -13,7 +13,7 @@ struct a6xx_gmu_bo {
>         void *virt;
>         size_t size;
>         u64 iova;
> -       struct page **pages;
> +       unsigned long attrs;
>  };

As a head up, Todd reported that this patch is causing build trouble
w/ arm32, as the iova needs to be a dma_attr_t.

I've got a patch for the android-mainline tree to fix this, but you
might want to spin a v3 to address this.
  https://android-review.googlesource.com/c/kernel/common/+/1243928

thanks
-john
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 668443E97C2
	for <lists+freedreno@lfdr.de>; Wed, 11 Aug 2021 20:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D4D6E1A4;
	Wed, 11 Aug 2021 18:38:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1C36E106
 for <freedreno@lists.freedesktop.org>; Wed, 11 Aug 2021 18:38:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso5120568wms.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Aug 2021 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eQhLP2HpYl3mxTssveBjr1kKyZxliJO4Ylz3sYBifvQ=;
 b=gLXLq97An/NSHIdiFRGjpYHcahaLAOeMqlOjQ0lTs/Oy4mVwecGF13c0K9Z4sEDDMF
 leSrj6Wpzj/UoirgeM7fbSLqOJuOI4oXLfEGbFGOfLANd/M8F7/35YJQeqYF/GqDcj9q
 HD2u/UIT8+K+A/p/EsAVN3tncwWLRQEw7BVTZ3zGtZ6ssxgU1ugKQzF10LMHDs13Rwm4
 SvVMB1p89BRdfLyNcG94XAzKjs+JtwQgQKpjDKtPm4+3FI4nXmPCgG5Eh56vEwzx12Fz
 fn+LUSshcWrwiRl9TDTfctF72r/GFuIZ/TdPnTg7SqlSp2IhStANjvcqF4AFY3m8iT2s
 MCSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eQhLP2HpYl3mxTssveBjr1kKyZxliJO4Ylz3sYBifvQ=;
 b=HMw4/b1rRj7ZFqB7eewFqTre1JtNhIp505+DspRj7n27rCRtEEtVNzKwGJObxQ/S/V
 4hVpMqNL8+AYwVmy5q1DF3D87/o3U5GdXkt3XsFO/x8JcjBrCPNhvi/6gxzmlkPoySbQ
 axdblucxyYOfptgkhLG0TzaD3+Jf3SiA56V64bAwTxX20T6a+q4+SD1oGr5LYcrCtsVe
 at7ylrsx+KjMgunuId81YlZ11cZ9idlakWa8xqcNpLUTHcwJT1TOPnPJ7c4DnKcCevgi
 cMIk5wH/yrpYytxUKeXhjj3B5STzF4aoBFYjolA9Z+6SAKHhjwdZTXN7FUjlp8cgWJ4I
 seiw==
X-Gm-Message-State: AOAM530rqee645ncx2QfddedRyHNdOPS5Tl/J9icRYEkDsG9dsUl8a9T
 ps07jNhA52Kp8FdKCUtLtR0aDvKfcjr82qksVyQ=
X-Google-Smtp-Source: ABdhPJxp/OJghjYG77CWEM0BOC7nX2DHfOVMFK6FSsbOPvoPAsWIZPqN5jxhG9kBOsxFLJVVBylnYEgwmGBfWPkcw2Q=
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr11477927wmg.164.1628707133341; 
 Wed, 11 Aug 2021 11:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210811180844.2130484-1-markyacoub@chromium.org>
In-Reply-To: <20210811180844.2130484-1-markyacoub@chromium.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 11 Aug 2021 11:43:09 -0700
Message-ID: <CAF6AEGveSFBOQkP=NXeRZAuAeL_yQc5Sq6LO+huf4bJO6c2yKA@mail.gmail.com>
To: Mark Yacoub <markyacoub@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Mark Yacoub <markyacoub@google.com>, 
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm: Read frame_count and line_count
 even when disabled.
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Aug 11, 2021 at 11:12 AM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> [why]
> Reading frame count register used to get the vblank counter, which calls
> dpu_encoder_phys to get the frame count. Even when it's disabled, the
> vblank counter (through frame count) should return a valid value for the
> count. An invalid value of 0, when compared to vblank->last (in
> drm_vblank.c::drm_update_vblank_count()) returns an invalid number that
> throws off the vblank counter for the lifetime of the process.
>
> Rationale:
> In drm_vblank.c::drm_update_vblank_count(), the new diff is calculated
> through:
> diff = (cur_vblank - vblank->last) & max_vblank_count;
> cur_vblank comes from: cur_vblank = __get_vblank_counter(dev, pipe);
> When the value is 0, diff results in a negative number (a very large
> number as it's unsigned), which inflates the vblank count when the diff
> is added to the current vblank->count.
>
> [How]
> Read frame_count register whether interface timing engine is enabled or
> not.
>
> Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
> Tested on ChromeOS Trogdor(msm)
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Rob Clark <robdclark@chromium.org>

But I suspect we may have a bit more work for the display-off case..
or at least I'm not seeing anything obviously doing a pm_runtime_get()
in this call path.

I'm also not sure if the line/frame-count registers loose state across
a suspend->resume cycle, it might be that we need to save/restore
these registers in the suspend/resume path?  Abhinav?

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 ++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 2 +-
>  2 files changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 116e2b5b1a90f..c436d901629f3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -266,13 +266,8 @@ static void dpu_hw_intf_get_status(
>
>         s->is_en = DPU_REG_READ(c, INTF_TIMING_ENGINE_EN);
>         s->is_prog_fetch_en = !!(DPU_REG_READ(c, INTF_CONFIG) & BIT(31));
> -       if (s->is_en) {
> -               s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> -               s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
> -       } else {
> -               s->line_count = 0;
> -               s->frame_count = 0;
> -       }
> +       s->frame_count = DPU_REG_READ(c, INTF_FRAME_COUNT);
> +       s->line_count = DPU_REG_READ(c, INTF_LINE_COUNT);
>  }
>
>  static u32 dpu_hw_intf_get_line_count(struct dpu_hw_intf *intf)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 3568be80dab51..877ff48bfef04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -41,7 +41,7 @@ struct intf_prog_fetch {
>  struct intf_status {
>         u8 is_en;               /* interface timing engine is enabled or not */
>         u8 is_prog_fetch_en;    /* interface prog fetch counter is enabled or not */
> -       u32 frame_count;        /* frame count since timing engine enabled */
> +       u32 frame_count; /* frame count since timing engine first enabled */
>         u32 line_count;         /* current line count including blanking */
>  };
>
> --
> 2.33.0.rc1.237.g0d66db33f3-goog
>

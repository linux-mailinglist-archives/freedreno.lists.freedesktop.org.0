Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A354BABFA
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 22:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF31510E856;
	Thu, 17 Feb 2022 21:44:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F89710E85A
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 21:44:26 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id de39so6056900qkb.13
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 13:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Rr98hn7oiLwb3sXhDwP8hg9nXg3EcyZrzHqqe01vCc=;
 b=wDX+ftq8p+8jCvPhoDUIKpyHez2FGPXGflM+13rCN6II1W7Twta88jBt9Vh6AXzA9+
 lB3wcNhgtT25fEv1/4LUmh46Qkgt8dPgIAPXH39QFtsWAV08PeWR70fJGDszVZKpmy8N
 bBT9z3/p568CaqdB40b6uiGxrCA0IW5m5paj/kEqIrvzoMOcJxZwPumgOfzdZSyNED1a
 VOTfeQPdXgU1qwv6PGPRQOLuwypQpqDNq2U7R+Si/701OldJ2QSkvJNpQj2opO1n3rc1
 97r9oMOdjUASWzGt3K+fw9hY/icpqFoOvdqa1rePx3SEU5ABhPICmxpLYKFPzntDIJNo
 4myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Rr98hn7oiLwb3sXhDwP8hg9nXg3EcyZrzHqqe01vCc=;
 b=0LHXpRGb+dEGpcHAaevCqOgooSO1OyuwvqzK/MIndRbYUZmyMNpDoZfF4ecMUafwiA
 7/nlSXzu3ibZtRZZxip2wWPZkpBkrPSPEs99WFZwd6GxX6N5iA7fL26FP8efO2lvXywc
 bsMZS2D4G4hVEm63sg3ZvSoTAL/tMA8Oxo8S1y6DJljMaABiZe6lvGp7IpNVqeBkm3AA
 73/4rG3g40dgvvEPCSuF2rezVejHovVHb9MNAYBWxM4glJD0qlDDF2VvK9I8+vGkDW2t
 jsb8ou4yZ1gj7T48vXxR30vPGU47yNmIelK1At4nsgKphGiWUqTNZrujiVzPjwtCg8x3
 UBAQ==
X-Gm-Message-State: AOAM533kA1+vH+jSUSugieN33EII2Zb1U6ICZgm67V64MK9yMz3MlOES
 q4bItl+rMh5tZWmytPgmvSLqM3CCKUT8o6XItf+9nA==
X-Google-Smtp-Source: ABdhPJwLUI59eFj6lZZDKPgP4ChCLwHjm29xnX5XQmsVjKzi21hEk4rXhMhPTrxHPZZGxIDxkpvEgBRHkaYoHyLrbm0=
X-Received: by 2002:a05:620a:4307:b0:507:d5b1:f65e with SMTP id
 u7-20020a05620a430700b00507d5b1f65emr2849018qko.363.1645134265492; Thu, 17
 Feb 2022 13:44:25 -0800 (PST)
MIME-Version: 1.0
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Feb 2022 00:44:14 +0300
Message-ID: <CAA8EJposi1jVw+N7AsuHX8An44K-MiwpsOauY7FHRj5wnBBKMw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 2/4] drm/msm/dpu: replace BIT(x) with
 correspond marco define string
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, bjorn.andersson@linaro.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022 at 00:36, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> To improve code readability, this patch replace BIT(x) with
> correspond register bit define string
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 284f561..c2cd185 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -60,6 +60,12 @@
>
>  #define   INTF_MUX                      0x25C
>
> +#define INTF_CFG_ACTIVE_H_EN   BIT(29)
> +#define INTF_CFG_ACTIVE_V_EN   BIT(30)
> +
> +#define INTF_CFG2_DATABUS_WIDEN        BIT(0)
> +#define INTF_CFG2_DATA_HCTL_EN BIT(4)
> +
>  static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>                 const struct dpu_mdss_cfg *m,
>                 void __iomem *addr,
> @@ -130,13 +136,13 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>
>         if (active_h_end) {
>                 active_hctl = (active_h_end << 16) | active_h_start;
> -               intf_cfg |= BIT(29);    /* ACTIVE_H_ENABLE */
> +               intf_cfg |= INTF_CFG_ACTIVE_H_EN;
>         } else {
>                 active_hctl = 0;
>         }
>
>         if (active_v_end)
> -               intf_cfg |= BIT(30); /* ACTIVE_V_ENABLE */
> +               intf_cfg |= INTF_CFG_ACTIVE_V_EN;
>
>         hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>         display_hctl = (hsync_end_x << 16) | hsync_start_x;
> @@ -182,7 +188,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>                                 (0x21 << 8));
>
>         if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> -               intf_cfg2 |= BIT(4);
> +               intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
>                 display_data_hctl = display_hctl;
>                 DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
>                 DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry

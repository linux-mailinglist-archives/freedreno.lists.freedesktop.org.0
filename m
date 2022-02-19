Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873664BC517
	for <lists+freedreno@lfdr.de>; Sat, 19 Feb 2022 03:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8954B10EB31;
	Sat, 19 Feb 2022 02:53:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA7310E1A5
 for <freedreno@lists.freedesktop.org>; Sat, 19 Feb 2022 02:53:45 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so5849759ooa.11
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 18:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=f5vEdCUlfGdIQtRWRsGoWXSeUt1R4/WNoy8oLgpJuys=;
 b=RidN6xLUFjRyZ+Ah0PNlUoPWg+enFvbTkoryQfuJAcs7GwdFLzNPUOAWNzeSKxDTcB
 yAWeU8y/LwBZAUwmeAgHYWPF6WQdpsc/NJWl9Q3AvI+eFoUmYxJpzSfJCZ8MFgH+4PiS
 r2yW2IQyoUOYpa32jKeQl9xpvZ7jGQ+CfC/Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=f5vEdCUlfGdIQtRWRsGoWXSeUt1R4/WNoy8oLgpJuys=;
 b=gt1lmSd4FW3uA29rgx13a18FGS+WugyCAZ6/DvBT3GLtkTBA3iUNuRq74sV0ThQ8BN
 8HmV1G7qbwRO6ecOVTEZrUd/JjRUI6atjMO1PqVz//KtTf0gz+BFUXye3fw75vjYW1up
 ItqDNKthjpv2FZ7ddUpsK0xB8l0HIo4O3vByirEwSUSBaZkIog3GLK/bkQ2pvi4lONHp
 hsC9F2l4VyL1vMFfbM/83+NCCKPZ0nz2JxordX3JMi2KfP+pnKg9dZr4WKB2wnBmXCre
 +ljFxmbo9IjsE3a+avp/+Q9ui/p2GQXHELce71xGoZ19fo0ozfe7fNHKnASECK/B15Dx
 +inA==
X-Gm-Message-State: AOAM533detoUYa7wZRBrEeYna9lw1gKstcNpuBpnnXod0z3QIOchP3Wy
 1ur+dNO6rZt95pBVKj3quHfUTTOhwxJloXfO8XfZng==
X-Google-Smtp-Source: ABdhPJyBlc86HejjCoLhE/76E81JC3NnHA3Yc+WN4totHtXcpBMqvJ+K7mcqSTwlvteOVgopTott8oar138D5sbwF0U=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr3847366oao.8.1645239224666; Fri, 18 Feb
 2022 18:53:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:53:44 -0800
MIME-Version: 1.0
In-Reply-To: <1645133788-5057-4-git-send-email-quic_khsieh@quicinc.com>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:53:44 -0800
Message-ID: <CAE-0n51Rewcp7uefTBJ2HwJN7gp-aTxrWe71XQ-RKosqw8uq8Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 3/4] drm/msm/dpu: revise timing engine
 programming to support widebus feature
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-17 13:36:27)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0d315b4..0c22839 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -217,6 +219,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>         15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>  };
>
> +
> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc)

const?

> +{
> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);

const?

> +
> +       return dpu_enc->wide_bus_en;
> +}
> +
>  static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>  {
>         struct dpu_hw_dither_cfg dither_cfg = { 0 };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index 99a5d73..893d74d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -168,4 +168,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>   */
>  int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc);
>
> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc);

const drm_enc?

> +
>  #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index c2cd185..4e4fa56 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -147,17 +156,36 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>         hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>         display_hctl = (hsync_end_x << 16) | hsync_start_x;
>
> -       if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
> +       /*
> +        * DATA_HCTL_EN controls data timing which can be different from
> +        * video timing. It is recommended to enable it for all cases, except
> +        * if compression is enabled in 1 pixel per clock mode
> +        */
> +       if (p->wide_bus_en)
> +               intf_cfg2 |= (INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN);

Drop useless parenthesis please.

> +
> +       data_width = p->width;
> +
> +       hsync_data_start_x = hsync_start_x;
> +       hsync_data_end_x =  hsync_start_x + data_width - 1;
> +
> +       display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
> +
> +       if (dp_intf) {
> +               /* DP timing adjustment */
> +               display_v_start += p->hsync_pulse_width + p->h_back_porch;
> +               display_v_end   -= p->h_front_porch;

Is this code movement intentional?

> +
>                 active_h_start = hsync_start_x;
>                 active_h_end = active_h_start + p->xres - 1;
>                 active_v_start = display_v_start;

display_v_start is different now.

>                 active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>
> -               display_v_start += p->hsync_pulse_width + p->h_back_porch;
> -               display_v_end   -= p->h_front_porch;
> -
>                 active_hctl = (active_h_end << 16) | active_h_start;
>                 display_hctl = active_hctl;
> +
> +               intf_cfg |= INTF_CFG_ACTIVE_H_EN;
> +               intf_cfg |= INTF_CFG_ACTIVE_V_EN;

		  intf_cfg |= INTF_CFG_ACTIVE_H_EN | INTF_CFG_ACTIVE_V_EN;

would be one less line.

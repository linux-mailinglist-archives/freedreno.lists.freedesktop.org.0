Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9710050990E
	for <lists+freedreno@lfdr.de>; Thu, 21 Apr 2022 09:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C9010F537;
	Thu, 21 Apr 2022 07:29:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A704D10F541
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 07:29:07 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2f18982c255so42975647b3.1
 for <freedreno@lists.freedesktop.org>; Thu, 21 Apr 2022 00:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m011XXbYrARlCJZuVIwZ1MmmxLat8mnhR1eqzotMc/s=;
 b=Ma/8eAa/aSMQBGK6sbaeE+7esV3W+xuIUySZRjT3zur6atrwOLO+DOFQQ0IkEtBJnA
 SDnZiMjjxayddNwfM4GR93mVCkQSeIq2aRuXK7dF06Ru/nMTWSJXpj0MHut9mgy9PYc7
 xthf92PyONhBQoxhb7cgyQrPJMg8fOC1WZz0fPc2l6iAwTwSSRZmbDq6DCzGSGZyji5F
 TC4WX9VriYwwOoPJ7KWDt8XfapJi5nowk5PyoheyUNl+wEGlMAg1SBFD3H3Lj3wAntVb
 lzzbMaBHgvI4ciQ/yfv7xsRSwVKiqMhD/TfqPLdJ4WCymjHMJ7qEAb6Fhow3rTb72uL/
 iqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m011XXbYrARlCJZuVIwZ1MmmxLat8mnhR1eqzotMc/s=;
 b=nJZbo37gJlAsESKUd27lcZoIcG5V3IsFvIXmL+qiSel0AGFTAOP27hW/pHD+InEOId
 awv/sEN0NyCH46jiGxkq+s1N4RDktIaozKDASMmyBnvw5EUEW9sZ/B4v35SuuHBKQ5yW
 aqts92PTAp6Do6u0JGXWRfAfvNmIlnnsLK2J7IrLKW2vnoKCDRoy41phE+0sjRcCkp3u
 LRBftpCwCO07PrpIKnddjI7irmigGD6AelVD2FHl5lljazk4tj63FOHtc8todnJAq16D
 P2oKfpCcvWc3qZOE+axN9vi0SsTfyG9lIpnq8IFIZAvFa2ff1koA91eeuDEKgEkSJtm2
 S5yw==
X-Gm-Message-State: AOAM531ADCzjn5befsLYEMuKAK305rixUdf/AHOHanwTxQFZnNznuyXo
 vYDV+vbwELDkbXtqcW1VXEm/gtuGMI3R5vDUKXsFhw==
X-Google-Smtp-Source: ABdhPJx4TCO7KwX4DdWCjHLr7a268g3r6HhFBrW/0TaOJc7yLHcCwSs1fic/Qh8VfuGh9syLUrLYF8vXvv6EJzCoPyk=
X-Received: by 2002:a81:324e:0:b0:2f1:d8f4:40df with SMTP id
 y75-20020a81324e000000b002f1d8f440dfmr10543327ywy.289.1650526146783; Thu, 21
 Apr 2022 00:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <1650498587-14749-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650498587-14749-7-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1650498587-14749-7-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Apr 2022 10:28:55 +0300
Message-ID: <CAA8EJprY3hHWLsYQDF1Qc-ZnteJxtWmUsqnyvHewVGPXGR4otA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 06/18] drm/msm/dpu: rename
 dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 21 Apr 2022 at 02:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Rename dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg and move it
> to dpu_hw_utils file so that other modules in addition to
> SSPP such as writeback can use it as all the fields can
> be used by writeback as well.
>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 18 +-----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 15 +++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
>  4 files changed, 19 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 09cdc35..0a0864d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -627,7 +627,7 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_pipe *ctx,
>  }
>
>  static void dpu_hw_sspp_setup_cdp(struct dpu_hw_pipe *ctx,
> -               struct dpu_hw_pipe_cdp_cfg *cfg,
> +               struct dpu_hw_cdp_cfg *cfg,
>                 enum dpu_sspp_multirect_index index)
>  {
>         u32 idx;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 92b071b..a81e166 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -193,22 +193,6 @@ enum {
>  };
>
>  /**
> - * struct dpu_hw_pipe_cdp_cfg : CDP configuration
> - * @enable: true to enable CDP
> - * @ubwc_meta_enable: true to enable ubwc metadata preload
> - * @tile_amortize_enable: true to enable amortization control for tile format
> - * @preload_ahead: number of request to preload ahead
> - *     DPU_SSPP_CDP_PRELOAD_AHEAD_32,
> - *     DPU_SSPP_CDP_PRELOAD_AHEAD_64
> - */
> -struct dpu_hw_pipe_cdp_cfg {
> -       bool enable;
> -       bool ubwc_meta_enable;
> -       bool tile_amortize_enable;
> -       u32 preload_ahead;
> -};
> -
> -/**
>   * struct dpu_hw_pipe_ts_cfg - traffic shaper configuration
>   * @size: size to prefill in bytes, or zero to disable
>   * @time: time to prefill in usec, or zero to disable
> @@ -359,7 +343,7 @@ struct dpu_hw_sspp_ops {
>          * @index: rectangle index in multirect
>          */
>         void (*setup_cdp)(struct dpu_hw_pipe *ctx,
> -                       struct dpu_hw_pipe_cdp_cfg *cfg,
> +                       struct dpu_hw_cdp_cfg *cfg,
>                         enum dpu_sspp_multirect_index index);
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> index 3913475..a200df1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
> @@ -298,6 +298,21 @@ struct dpu_drm_scaler_v2 {
>         struct dpu_drm_de_v1 de;
>  };
>
> +/**
> + * struct dpu_hw_cdp_cfg : CDP configuration
> + * @enable: true to enable CDP
> + * @ubwc_meta_enable: true to enable ubwc metadata preload
> + * @tile_amortize_enable: true to enable amortization control for tile format
> + * @preload_ahead: number of request to preload ahead
> + *     DPU_*_CDP_PRELOAD_AHEAD_32,
> + *     DPU_*_CDP_PRELOAD_AHEAD_64
> + */
> +struct dpu_hw_cdp_cfg {
> +       bool enable;
> +       bool ubwc_meta_enable;
> +       bool tile_amortize_enable;
> +       u32 preload_ahead;
> +};
>
>  u32 *dpu_hw_util_get_log_mask_ptr(void);
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c77c3d9d..08b8c64 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1246,9 +1246,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>                                 pstate->multirect_index);
>
>                 if (pdpu->pipe_hw->ops.setup_cdp) {
> -                       struct dpu_hw_pipe_cdp_cfg cdp_cfg;
> +                       struct dpu_hw_cdp_cfg cdp_cfg;
>
> -                       memset(&cdp_cfg, 0, sizeof(struct dpu_hw_pipe_cdp_cfg));
> +                       memset(&cdp_cfg, 0, sizeof(struct dpu_hw_cdp_cfg));
>
>                         cdp_cfg.enable = pdpu->catalog->perf.cdp_cfg
>                                         [DPU_PERF_CDP_USAGE_RT].rd_enable;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC34E78E3E1
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 02:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0317B10E63B;
	Thu, 31 Aug 2023 00:23:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B034410E05F
 for <freedreno@lists.freedesktop.org>; Thu, 31 Aug 2023 00:23:54 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3a99eeb95aaso126553b6e.2
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 17:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693441434; x=1694046234; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5BOO2syw+fNhCrXECBXKb4WvH6HIj2S7NLiqitDsR7Q=;
 b=BQwajHov50s7Gy+H17h4C1fxKVwUDo2CrlP+RZArnwTUiFOxm4WyqpIgFCVeg58sY4
 /oL0Q6WIYx0UIts4dy9KcErz3msX5SqvUnRTBg90Se5oWxyqrG3IXOOlJIdP90rAsYZu
 ++iabeQZcPWtO+//2zTLcvejKBSWKOuJHAg/KQVvEq6nsR3LsoJ7QPJWlDzclr7rFew9
 LU7gMN8aXRMk3GXBaP1KP0AYL/1+MqJeYLrr/eauiDp9K8Nb739GLgd7DDHjYEIw0Pnh
 nBHK9Lail9CNhMkzhp1J3KY4VZ1PsDbvAOcXoPBd8sHB76kZOD3jpAquaQYagEyvejtk
 axOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693441434; x=1694046234;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5BOO2syw+fNhCrXECBXKb4WvH6HIj2S7NLiqitDsR7Q=;
 b=k30IRDXJzuy3EbcpxU8pCV5EEEz3heYHh4aWSboWL138HYMTlE95nm1H+wk4ENGc/q
 jLbt9BDBXWx+Q5m9yMRDb8tuenvoZ9xfwokDxqimznHSHjqfkl0UKM4LiQzjvj+dJ0Ge
 EJlX4JpXnESbcFSAQNtg/e61wa3xevGKOn5OadYqZN4sHZSg9XftagepAhqE89AGaOhG
 pCP1t7DGlCYncTMPofjWqNGva3y0j4eHeAhtQX2R3yt8RwnGiwWSIlnSAMw/09YGwZtX
 muQaf0E1mdSN9V8h/SE/GJMWvO9/mL/LoEQSf7A1uwozuW5ViTq1gsAXv1Y97aTPGXsW
 ryLA==
X-Gm-Message-State: AOJu0YzSgoHjRPENN6NuIeaQ/lHo1YZrtPgLOslZzqYWp+9TAo+9PIU0
 ckYSAqCGQMhLQSsqfJFX7iBRYZCaLd3B0ne3VrJmj9mzjBDxUSlA
X-Google-Smtp-Source: AGHT+IGnF0dg+8lHMwzar97XASKXcVVXik66Axj2Ag03K7pEFP7DRu1/ixa0m1/hpdcaZN46FRpiDSgtP5bi24UTLe4=
X-Received: by 2002:a05:6358:7e47:b0:134:e631:fd2b with SMTP id
 p7-20020a0563587e4700b00134e631fd2bmr3651336rwm.0.1693441433824; Wed, 30 Aug
 2023 17:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-14-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-14-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:23:42 +0300
Message-ID: <CAA8EJpr=BJFuyeerO=6G9cz80vtCNsassXskZ+7uC4cSvDBeAw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 13/16] drm/msm/dpu: reserve cdm blocks for
 writeback in case of YUV output
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Reserve CDM blocks for writeback if the format of the output fb
> is YUV. At the moment, the reservation is done only for writeback
> but can easily be extended by relaxing the checks once other
> interfaces are ready to output YUV.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 ++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1b1e07292a9e..7a3d179bdfba 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -16,6 +16,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_probe_helper.h>
> +#include <drm/drm_framebuffer.h>
>
>  #include "msm_drv.h"
>  #include "dpu_kms.h"
> @@ -615,9 +616,11 @@ static int dpu_encoder_virt_atomic_check(
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
>         struct dpu_global_state *global_state;
> +       struct drm_framebuffer *fb;
>         struct drm_dsc_config *dsc;
>         int i = 0;
>         int ret = 0;
> +       bool needs_cdm = false;
>
>         if (!drm_enc || !crtc_state || !conn_state) {
>                 DPU_ERROR("invalid arg(s), drm_enc %d, crtc/conn state %d/%d\n",
> @@ -655,6 +658,22 @@ static int dpu_encoder_virt_atomic_check(
>
>         topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>
> +       /*
> +        * Use CDM only for writeback at the moment as other interfaces cannot handle it.
> +        * if writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
> +        * earlier.
> +        */
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               fb = conn_state->writeback_job->fb;
> +
> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb))))
> +                       needs_cdm = true;
> +               if (needs_cdm && !dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +               else if (!needs_cdm && dpu_enc->cur_master->hw_cdm)
> +                       crtc_state->mode_changed = true;
> +       }

What would be the (estimated) check for DP?

> +
>         /*
>          * Release and Allocate resources on every modeset
>          * Dont allocate when active is false.
> @@ -664,7 +683,7 @@ static int dpu_encoder_virt_atomic_check(
>
>                 if (!crtc_state->active_changed || crtc_state->enable)
>                         ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -                                       drm_enc, crtc_state, topology, false);
> +                                       drm_enc, crtc_state, topology, needs_cdm);
>         }
>
>         trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> @@ -1126,6 +1145,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>
>         dpu_enc->dsc_mask = dsc_mask;
>
> +       if (dpu_enc->disp_info.intf_type == INTF_WB && conn_state->writeback_job) {
> +               struct dpu_hw_blk *hw_cdm = NULL;
> +               struct drm_framebuffer *fb;
> +
> +               fb = conn_state->writeback_job->fb;
> +
> +               if (fb && DPU_FORMAT_IS_YUV(to_dpu_format(msm_framebuffer_format(fb)))) {

You can drop all fb-related conditions here. If we have CDM, we know
that we asked for it. If we do not, it's because we do not need it.

> +                       dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +                                                     drm_enc->base.id, DPU_HW_BLK_CDM,
> +                                                     &hw_cdm, 1);
> +               }
> +               dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
> +       }
> +
>         cstate = to_dpu_crtc_state(crtc_state);
>
>         for (i = 0; i < num_lm; i++) {
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

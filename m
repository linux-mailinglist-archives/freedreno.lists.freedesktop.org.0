Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADA270401C
	for <lists+freedreno@lfdr.de>; Mon, 15 May 2023 23:56:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FA510E298;
	Mon, 15 May 2023 21:56:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB18310E297
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 21:56:16 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-55a8019379fso123503857b3.0
 for <freedreno@lists.freedesktop.org>; Mon, 15 May 2023 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684187775; x=1686779775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0lPlc4qEgFtAyauRuU20afGpSG3CXt4C4kt+lMYU99Q=;
 b=HKVOb41nnA/UURo70T56UwgUW5N8aPA/Od/3f9DMurCvqTPRFwzp06QhjpRKC/tpDJ
 mKJSg2QW1JZwTG0CsufHAPqFJpfeCfYbQ7la3zkUe3xUWpnC1wbVxXfiL8rguIhS8xW8
 DfWtLmIZ0w8DgPpf2KiOYF85IO8AZ8xQNbCfxsCt4IMVagwXxGUZQkFZEzbd4/SPggpq
 +pWmN1nNFJZvGjdIj4i8Kktz5DGzyQZuRMblMBGApcDJcQxvzWhZ2ZbZvHXvFkW6M7/O
 /kEkAl/yrprKPWxTkthiJVgI452TMlpR9h9Jv+FyV9mJqNp6YpVgT/kW8SagISVSz/9N
 H7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684187775; x=1686779775;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0lPlc4qEgFtAyauRuU20afGpSG3CXt4C4kt+lMYU99Q=;
 b=arM3s8f6w0gODXaNyhrVpZvEKfXL+Mk9X+dKQvHanHweDVbwIRmOp5DWgtH2/TzGAS
 aGO48mNz3tcExmvVelQ2ambEtBOnhS7Uzbyn71XJdsJ/KyYoKEwyKCwu71EryYoA3DEP
 F9vyhVdSyunZfwa/DsUWd7zSv3JyLgAOWNKoV0/2jAvvftmk3nSVYkg0zgpoOTl8j4mF
 hYloAHc1Se3sAmCC5k51m1mnmQU6VkTmIAN9JraMVKUC8X1lDNuuuKmBeF1hnZQNQEzH
 RQG0hrEnZCrWkeWNhixj3GN1B65Kw0yX7KrH/wmEty4Tx/e62TgpJL2MCb4kGmfFTKPw
 XkhQ==
X-Gm-Message-State: AC+VfDxqragsbpGEfNbdGGYKd3+p+jfzg/vHzSjMo0WP7WEmoDM7FdKk
 Dt3kmVqCrgbcub06xn3qMQrsmuGnEZfL7hmG+HM8yQ==
X-Google-Smtp-Source: ACHHUZ5yRt2IrPj/LNDhSE6gz+54j5EsXLzffnQwJylOHzaeRQYt5+9R+AGRcrxk8JfJEEUtBcf4z+r1GNt2r5ohhhs=
X-Received: by 2002:a0d:ef03:0:b0:55a:7c7:a2e1 with SMTP id
 y3-20020a0def03000000b0055a07c7a2e1mr30708227ywe.4.1684187775600; Mon, 15 May
 2023 14:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <1684185928-24195-1-git-send-email-quic_khsieh@quicinc.com>
 <1684185928-24195-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684185928-24195-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 May 2023 00:56:04 +0300
Message-ID: <CAA8EJprT23Bp+Mfm6XOMn4MfqdexWEjnBEC4mp144=r_cmZTTg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v9 2/8] drm/msm/dpu: add DPU_PINGPONG_DSC
 feature bit for DPU < 7.0.0
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 16 May 2023 at 00:25, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> DPU < 7.0.0 requires the PINGPONG block to be involved during
> DSC setting up. Since DPU >= 7.0.0, enabling and starting the DSC
> encoder engine was moved to INTF with the help of the flush mechanism.
> Add a DPU_PINGPONG_DSC feature bit to restrict the availability of
> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() on the
> PINGPONG block to DPU < 7.0.0 hardware, as the registers are not
> available on DPU 7.0.0 and higher anymore.
> Add DPU_PINGPONG_DSC to PINGPONG_SDM845_MASK, PINGPONG_SDM845_TE2_MASK
> and PINGPONG_SM8150_MASK which is used for all DPU < 7.0 chipsets.
>
> changes in v6:
> -- split patches and rearrange to keep catalog related files at this patch
>
> changes in v9:
> -- delete add BIT(DPU_PINGPONG_DSC)  to PINGPONG_SDM845_TE2_MASK
>
> changes in v7:
> -- rewording commit text as suggested at review comments

This is definitely not in an order. Please keep the changelogs sorted
in way easy for other people to read.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 82b58c6..f2a1535 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -76,13 +76,13 @@
>         (BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>
>  #define PINGPONG_SDM845_MASK \
> -       (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE))
> +       (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
>
>  #define PINGPONG_SDM845_TE2_MASK \
>         (PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
>
>  #define PINGPONG_SM8150_MASK \
> -       (BIT(DPU_PINGPONG_DITHER))
> +       (BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>
>  #define CTL_SC7280_MASK \
>         (BIT(DPU_CTL_ACTIVE_CFG) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 6ee48f0..83854e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -144,7 +144,8 @@ enum {
>   * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
>   * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>   * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_DITHER,    Dither blocks
> + * @DPU_PINGPONG_DITHER     Dither blocks
> + * @DPU_PINGPONG_DSC        PP block supports DSC
>   * @DPU_PINGPONG_MAX
>   */
>  enum {
> @@ -153,6 +154,7 @@ enum {
>         DPU_PINGPONG_SPLIT,
>         DPU_PINGPONG_SLAVE,
>         DPU_PINGPONG_DITHER,
> +       DPU_PINGPONG_DSC,
>         DPU_PINGPONG_MAX
>  };
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry

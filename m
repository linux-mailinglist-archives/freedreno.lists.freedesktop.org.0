Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A489642D6
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 13:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7D510E62C;
	Thu, 29 Aug 2024 11:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="msp8h5P6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991C410E611
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 11:17:08 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2d439572aeaso379539a91.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724930228; x=1725535028; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=am22cKQWP6n0/ohrouxqRikoVkqYhCxzxqagOImmkVY=;
 b=msp8h5P6fxWDmGUOP1GQA0N0RAInS/A2wYVAE7nm2DrDhDBlwRhvk7w5mkuZNIPkzI
 wYetW+2PVGSR9G+BsLFfpwd1q2T9FZG0+zZNGRM+G7bMQyjV0sZJMElz9qvKC6BFxS5p
 LPwMn6aIJgufZNRxqIFnLSt2Mg1CpZZZP7BVohrNp0XfWKfvo+U26CxNuzARjnSkEXIM
 cg7TxnFCQZqF1SDNAq3OtPOGOXBkrLptT/tXdDuJl0XD4VrtYEoAwoCs6GDF0Ee6f52/
 bcB8COmet0rkLe5LiHp3XleBA34A4H9v+UwNYt7wosz527w/+xvboYqxJ6HZ1nbZ5Nwj
 ba5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724930228; x=1725535028;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=am22cKQWP6n0/ohrouxqRikoVkqYhCxzxqagOImmkVY=;
 b=VCklyv92cN10Kl6DA/cENKnNjvzZSjiZsUSi3d7wjzYo4MaOPcuqbVfK1tudJfwXZ3
 r3bnjDCzwsC/oDnCuzaCdAyEOPvs2BxGYNMP48jfijuf16pTuX6Yn5pDp44oQjE5uEYx
 NzYlAg7oKOGrIvipCZ38PDKylhKGHXhMiu7iE+jj2eGbP459T57UgvG6zwLodkViofOk
 LqK13bsEai4E3BLBtXslzpdym760veb56xVVGfaoaoQuqYyrPyZKnUsfMRSvBj1AhzfV
 Ny6uXQawNOmrD0Auohr3uxdjs6u7e6IwYRzI7aN4ydoxMmpR5GqyQnLzff7c+PqX3Fpl
 sOcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXCjnynMzuZshLc3wpzmYuCbbn2tMpGhhyticOOYC6fVykCPaUasME33ht6/16fpnzu6assN7U3Ek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoxRW1045mN4iv5ZSa7nuUdGqNBmi3NGGQQJqZ+iUxVOT96uUg
 306mxvZ/6jWq4UP31XPayQIBxfUDUjQhGhFI9HFHeMLpH+qG3v838OkWaZSP+u8FQ7myjq28P/+
 6hO8NbcuIAhhULVF9pLt6Ol+JrIlXOuq5FZalUQ==
X-Google-Smtp-Source: AGHT+IH1T12mE9rHPH6kUY/iyJq0y2Ytt3ckXTMcNy8IISCWNcOwToqApPMtf/a43021k38iLM0rMUNHMbBnKa/5qAc=
X-Received: by 2002:a17:90b:4387:b0:2d4:27de:dc39 with SMTP id
 98e67ed59e1d1-2d856a5f271mr3395023a91.6.1724930227802; Thu, 29 Aug 2024
 04:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-10-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-10-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:16:55 +0300
Message-ID: <CAA8EJppFCVQPFa1-o7T08Bs+vzbykDXwVTOq4=B2LuWJb2gYGw@mail.gmail.com>
Subject: Re: [PATCH 10/21] drm/msm/dpu: fix lm number counter for quad-pipe
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
>
> Add the case to reserve multiple pair mixer for high resolution

I think you already know what is missing here.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 8 +++++++-
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 33cfd94badaba..f57725ad494d2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -54,7 +54,7 @@
>  #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
>         (MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
>
> -#define MAX_CHANNELS_PER_ENC 2
> +#define MAX_CHANNELS_PER_ENC 4
>
>  #define IDLE_SHORT_TIMEOUT     1
>
> @@ -2029,8 +2029,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
>         struct dpu_hw_mixer_cfg mixer;
>         int i, num_lm;
>         struct dpu_global_state *global_state;
> -       struct dpu_hw_blk *hw_lm[2];
> -       struct dpu_hw_mixer *hw_mixer[2];
> +       struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
> +       struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
>         struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
>
>         memset(&mixer, 0, sizeof(mixer));
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index e219d706610c2..77d7ff789346e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>                 if (!rm->mixer_blks[i])
>                         continue;
>
> -               lm_count = 0;
> +               /*
> +                * Clear the last bit to drop the previous primary mixer if
> +                * fail to find its peer.
> +                */
> +               lm_count &= 0xfe;
>                 lm_idx[lm_count] = i;
>
>                 if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> @@ -353,6 +357,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>
>                 trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
>                                          pp_idx[i] + PINGPONG_0);
> +               DPU_DEBUG("reserve lm[%d]:%d, pp_idx[%d]:%d, dspp[%d]:%d for enc_id %d\n",
> +                         i, lm_idx[i], i, pp_idx[i], i, dspp_idx[i], enc_id);
>         }
>
>         return 0;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

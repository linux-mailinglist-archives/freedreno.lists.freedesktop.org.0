Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FA2997840
	for <lists+freedreno@lfdr.de>; Thu, 10 Oct 2024 00:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0417310E81E;
	Wed,  9 Oct 2024 22:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YVwxhCMR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C0A10E81F
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2024 22:10:44 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e25d164854dso241472276.2
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2024 15:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728511843; x=1729116643; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xtAgb4fDwR8y044wOUqsOfoIaUs5RpregpF0Vbg17ec=;
 b=YVwxhCMRTA8KHe+3aBMSpBG7fUgRPDs5xVMTzZhQ7UB4w6Y9EdoQRdSBFoF/NZFK+n
 QnWolxuTDQbGJOASYRCqIRxBq1n5cmdgqRXOZ2dkfSsqh5Wv2prHzVbMGmmgydbGgFCo
 gAg3hXGqXdn7uQoTBqUKR1IYy1QOPptVqSxxEYqEwyRUV4KS8W+GZrriz7A/Jg4KPutG
 W6o/klpYkopM6MAfToGFvzG8lzvybqjFdl2VxKG2fyIXMD+j2Cx32b+lGy/Vii9pq6Ev
 o828pELMaEit5CCh06w4diJYD/wfaugBMGvb/3p768zcr0jgi4HB9jJy2qjP/RuqRkbd
 wIkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728511843; x=1729116643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xtAgb4fDwR8y044wOUqsOfoIaUs5RpregpF0Vbg17ec=;
 b=lypgi778afkEO7SMPpG6x/YLsF00ZFfN8f2HAugNbZJTPdQBTOxmrTwfYxGL0MYDy5
 4XvUxMyczTg5F2NftZCHsmQaTgcHsqfOM58IQyMQbXybxAv+gZmJVQoIizs8T+mLMTqv
 uc4IKsGRI1uAbtgtXAoaHVWRfmsIkcDIehtAXfLx/yaw5BIoWxbabELBMdB09XmshvQT
 ysQrY+Rm+2UEtcIDghq73ntOMwCfz7cK5eKQ3kc1CETwvV3znGOOCl/yrWZ1d1cIn8ie
 sBXi82g2+6CmTLPlJHiSwTy1gXJChjBvAR3VfBnLRWyhox9d0KFLI1fq8mp2JGf5mGA4
 /cNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmzt6Qa8JvfE/CDNiVdn2n6wr/5uUbibcEN9dseAtz1R3vB3v9me3lwnWbQx7J2cZuGNbd8JWrEco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAZ2CymYYU4ah2QyYIaoBnmZNoIckSrcR7k86zKZyUB+SsRn07
 oFdWxZONUR2eK/+8q9S0NJGNYZGEJUMY0nPi4npb3dlxqOYERDaVHaBaL2i44Kn6+ESiM/k80DQ
 LALBeXaMWqsYwMgDf50wXWp94LKb10ul5VLH1yQ==
X-Google-Smtp-Source: AGHT+IHACXmWe3jpzlY9m/ZYdvlB2E4eJi+KdXxEERqoyLJzG9ZNpE57951BZflPz6EbH6Z4ysSQYB+i+QLWebrYgNo=
X-Received: by 2002:a05:6902:18d3:b0:e1a:72e9:b243 with SMTP id
 3f1490d57ef6-e28fe33b965mr4050297276.9.1728511842970; Wed, 09 Oct 2024
 15:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 01:10:31 +0300
Message-ID: <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
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

On Wed, 9 Oct 2024 at 09:39, Jun Nie <jun.nie@linaro.org> wrote:
>
> Only 2 DSC engines are allowed, or no DSC is involved currently.

Can't parse this phrase.

> We need 4 DSC in quad-pipe topology in future. So let's only configure
> DSC engines in use, instread of maximum number of DSC engines.

Nit: instead

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 39700b13e92f3..e8400b494687c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>                 ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>  }
>
> -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> -                                struct drm_dsc_config *dsc)
> +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
>  {
>         /* coding only for 2LM, 2enc, 1 dsc config */
> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       struct dpu_crtc_state *cstate = to_dpu_crtc_state(drm_enc->crtc->state);
> +       struct drm_dsc_config *dsc = dpu_enc->dsc;

Why? This doesn't seem to be related to num_dscs introduction.

> +       int num_dsc = cstate->num_dscs;
>         struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>         struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>         struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];

[...]

> @@ -1953,7 +1956,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>         }
>
>         if (dpu_enc->dsc)
> -               dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
> +               dpu_encoder_prep_dsc(drm_enc);
>  }
>
>  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

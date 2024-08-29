Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11C9642BA
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 13:10:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C6710E623;
	Thu, 29 Aug 2024 11:10:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="X+po/v1h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A80E10E623
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 11:10:27 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-6d0e7dfab60so6479577b3.3
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 04:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929826; x=1725534626; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IMZRn0sUhAT7QPLtxYhsMgrNJCWGnuhAKggHYsS2Lvc=;
 b=X+po/v1hV7ppAP7m/Tug1UGZ5LmNRQ/gXqQ3DshM4PgYa29gBnev62vaDBYYfG+752
 UXn0oHdThrKAVDfPBZomk1TG+3HU3KqWM8h0lSMCeXGGaf+3zEe7YXpcoe2xBuSY+cvN
 IY4q6yGC8oiaQ0/2CngzaCDi0SkrYymrmjkq5mMlXR+pdG4a42+L6SS+srJO1gahOKZO
 mDaznlrj8QXiG9/ibQ7q0Ae1V8nKO6W3FJLAdC32th0FK8orgRjDUxdWawRwdrsc7yja
 wK/o9eA4MxRZTscW8ZP7rKPrevCqO6UyICyKoBxFmTU88O0hwqnZWmzkw7zHpd2tE9jX
 y/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929826; x=1725534626;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IMZRn0sUhAT7QPLtxYhsMgrNJCWGnuhAKggHYsS2Lvc=;
 b=lGj5eab7lZSwy4J3CYqSX7pC9G2dhpyRI65wD4oukfCGKuzjO0Wsds9RnTXzvxw2CG
 beIEQlpkaama5177YsJ8J4TNmErHloDSqmVuh4mzIvoeLv6/97GKGCMuLLQXG1fTHUC5
 z4wm+Ew5nacKHPUh3amkbt9isA8jOT5XK6Ndb8kl8Ihn8MkUf3DTUHFiOUoopqicaNZe
 6i17ayovuGJmXPu2btILXhYFZRVweXgeO+1Q2sqjV/PcpGBwn1Qk+eddc+mtvb/16X2O
 3r/kfIw7Du6TYppgm6FbIKbBcsyAe6NAU3xSeGpX59pi85YK3s4frZKtNzMM1F03p3n5
 LXcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqf0EbVQVJjz4DOtLb8m8oz1lKkBKbGR0VWB7yjtD8bkHMaekjv+B7fSM+uxJiO8ohSkvn9X4TX2k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPB5E4wqNPAxT6eAwXax6C6Lv+zN/2HpYi7ZfcJAFGlMNReCL7
 EWS/n5yGMA3SPbyP9fbDbZ8wRKkDMkg0JOMunp9JlbxtWFuCTGzYYhTocCkArcl10Y+WyHF1Je7
 jh6dZ4p0/F67g/K/94Rpt7U/dAoPw8HJKCD/YkA==
X-Google-Smtp-Source: AGHT+IExKB2y+YYKi+w/X2u1O51Cl6dOZJ7yQ6Ws+aZXHZmk8aKxUzPH5YQQBBnmoCI91r2oWOFUFXCggGYyUusPgOo=
X-Received: by 2002:a05:6902:e0b:b0:e13:cb58:dd15 with SMTP id
 3f1490d57ef6-e1a5ab47dfbmr2665701276.8.1724929826178; Thu, 29 Aug 2024
 04:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:10:15 +0300
Message-ID: <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
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
> Do not assume DSC number as 2. Because there are 4 DSC in
> quad pipe case.

Please expand the commit message. You prefer brevity, but your
comments lack clarifications.

>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 6bdd9c21ff3ed..05b203be2a9bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>                 if (dpu_enc->phys_encs[i])
>                         intf_count++;
>
> -       /* See dpu_encoder_get_topology, we only support 2:2:1 topology */
> +       /* DSC and mixer are mapped 1:1, so reuse the mixer number */

Why? DSCmerge is a valid topology even if it is not supported yet.

>         if (dpu_enc->dsc)
> -               num_dsc = 2;
> +               num_dsc = dpu_crtc_get_lm_num(drm_enc->crtc->state);
>
>         return (num_dsc > 0) && (num_dsc > intf_count);
>  }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

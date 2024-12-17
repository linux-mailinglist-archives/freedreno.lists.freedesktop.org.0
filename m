Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD289F3FF5
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 02:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD3B10E82C;
	Tue, 17 Dec 2024 01:26:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hJ6Xdkon";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E76510E2DB
 for <freedreno@lists.freedesktop.org>; Tue, 17 Dec 2024 01:26:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-54024ecc33dso5146694e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 17:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734398807; x=1735003607; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qIrp81ZiiTPfk+3VPzj+WgFvsCEPmx+xpVPwG8ujmf0=;
 b=hJ6XdkonPvFI6AuJbo8lsBBFFALTCNlHiRizuOzPQ0VqG8YgohNjwMNxLcm76hLqEL
 jEa6l50HDrGOu1Q76vazyex3dIBMtdEohWEAQnarQneTU2Q1ilX1Rggxsxz+pnvjiTXV
 gtvUb+3BYCb5vnUxITkEYxH+Z8Be7dlIrGV7m2/it9MazTrnlRty8LqL/muxRCnpzimJ
 KNGVrbrQHd/KzZQFW30PyCRSolqu73kF/QnCeYMURJNg7akIrGy8PAxXSc8yT8UYuDn8
 AQ9ziD+iWa8Sefle2rEUKR8xIHdV3B/jQBW3dnYBnVB+n7ri73lqE1WUiMh/uhwlQSgl
 YdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734398807; x=1735003607;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIrp81ZiiTPfk+3VPzj+WgFvsCEPmx+xpVPwG8ujmf0=;
 b=Zw1SjEdGK+u6QFAknfsa7W+Qraf2FeOpLtmnKP16UMnDyEi4pkz6+kQOpVC3LF4x1/
 Nb5+YhaFVeYuxRQ2t4BukdohPmBaI/5h/Rh2dRPZQX475PjfJmCWNq7ILilbyNNuUHZA
 NeLQaLCXpe1inVGY4k1xaa3sTuA4UPq36LOFUnEZEN2TMOdQi/pGAfZc5AwlK5piM9PO
 zYgzJhqGKEz/MFuOmF/RsWEQGWZCRXz3nbWxoRJpb414KhAfgvivQQUQ8WUM/3g6sfR3
 UvVrgv7I+E/Mg1PDVS/1gS60HjVXQ8GrFh/uzbsIeJOS1m7rZfho+mos/RcKOLmK3RvZ
 w0zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjB2bqOL684o0P5fntviQX6xgOBsTYerjoOIUs456P+hwhc4uXN/H55ZTGaA7qv0m3++1oy/6FRo4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNa0jSIP+ZaCAixSk1BLWNvgn9YP4v1jvIm+03uYESVteR/3fR
 lxbT/uKAlU3LqHXK8DcxD2YbitdlSIGmpYITr+pg11NKdFYdL3vmaiHopRr+Gnw=
X-Gm-Gg: ASbGncvMrd4GC3aPzeWUH/3Ch0Yb+hInUNgbB7GbDfejA1gdviMyIPEsfPlS3uqFaHz
 cy28V6TXIl7ZP11lGInSyBiH4V1FkoivmSBJsWjCK1/v/vJ3u0mQSBQ2DApLHvqHpxaCj05JUfM
 qPAfqXWLmDYMrq+OHm3oZqGWGsgq6qAw0lz36XQYLZSccNQPAz6MXX12XbGU7f16fP/ZM9zN6sW
 aiEwwEBEBVWIK/8BGRi9jsOfAsiB3J0XzHqrmHLmKUd+Xh//IcKPj7h6Vrh4BjLUWkWwVXAUnDh
 Wp+FYiDfrZbprfxv/QSjbeC8KT1ppCCdO8df
X-Google-Smtp-Source: AGHT+IEFAVlmrtBdKZDemHD4kc4Sr3HT/4sKo+aUJjr1NtBRsFlsJQQbmQnA6rmmhL+0WNq+tfoLFA==
X-Received: by 2002:a05:6512:b94:b0:540:1be6:f15f with SMTP id
 2adb3069b0e04-540857ff3b8mr5394531e87.0.1734398806909; 
 Mon, 16 Dec 2024 17:26:46 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120b9f62dsm1002965e87.17.2024.12.16.17.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 17:26:45 -0800 (PST)
Date: Tue, 17 Dec 2024 03:26:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 05/25] drm/msm/dpu: get rid of struct
 dpu_rm_requirements
Message-ID: <ykvaxv26maaxz5z4odttbfumuqanhtjsnleebprsh273ci6k6k@alm6o7vuzkfi>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-5-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-5-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:16PM -0800, Jessica Zhang wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The struct dpu_rm_requirements was used to wrap display topology and
> hw resources, which meant INTF indices. As of commit ef58e0ad3436
> ("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
> resources struct was removed, leaving struct dpu_rm_requirements
> containing a single field (topology). Remove the useless wrapper.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 71 ++++++++++-------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
>  3 files changed, 25 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..5172ab4dea995a154cd88d05c3842d7425fc34ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -800,7 +800,7 @@ static int dpu_encoder_virt_atomic_check(
>  
>  		if (!crtc_state->active_changed || crtc_state->enable)
>  			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -					drm_enc, crtc_state, topology);
> +					drm_enc, crtc_state, &topology);
>  		if (!ret)
>  			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
>  							  global_state, crtc_state);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index c247af03dc8ef7174eedf3d5cc267d64f17a8656..cd5960af4a151428cc6fb7154c3ffdb65ebcf287 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #define pr_fmt(fmt)	"[drm:%s] " fmt, __func__
> +#include "msm_drv.h"

Why is it necessary? struct msm_display_topology has been moved to
dpu_rm.h

>  #include "dpu_kms.h"
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_ctl.h"

-- 
With best wishes
Dmitry

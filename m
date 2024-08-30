Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF879667FF
	for <lists+freedreno@lfdr.de>; Fri, 30 Aug 2024 19:32:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0847010EAB6;
	Fri, 30 Aug 2024 17:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WOg0swgX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98C6810EAB7
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 17:31:59 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f5064816edso22679041fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 10:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725039118; x=1725643918; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oVSYJZ8Ei4cvPl9DgIsE5I78GhgQxtf/dQWxZMnQ4Ag=;
 b=WOg0swgXjPlflk8FEvMpgO7Jmbdeub0KQNSJHSO/xico0ZNIgEcMTXJKpeZivJfaRn
 M7fjevfAGOWuK50DuWmBD7DXsfUY9bdSzteVJmRIMWbhXJmXB4QvvMVHJ+m54n9ABhVC
 dV2bzyoQbxDQIrztqKZT3I82w6k/p3IefN9iaje5T8VCSD6bjOE8sUr53bumjOMNtwmS
 ezopcOo3BP0bb6Ztm0kW2RISfxMozAuwvwnGLGem3S13Le7EABTqDn0ntbuwtW9q/nVR
 ukPI5HQDVK0fgybFj7BZwrxwVtq9WQde3p/lGsItva92azZJRlIpQH70SFySDi7597Wu
 El5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725039118; x=1725643918;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oVSYJZ8Ei4cvPl9DgIsE5I78GhgQxtf/dQWxZMnQ4Ag=;
 b=eXXRu8V9fzIPa1u7tygNVjhd+saWw+u4Yg1cVVZuWitC4Fajui7ZxBuGpDekE3AJD1
 Y7NDKCvnddKfvLk8k1GB60s+r+cVKeL2qo47yGq3ixSBgbGZXYZxcH2j1m7FHoiDo/Lo
 W2Og8nFBkh1RgndGBRIj5Ybn1ngPgmbDAHsN/IhQqJccUbqKofp6fKkx1TeZrBWpL1b5
 hxdZIqcH+z5wH2A/tVoNg864SqNw0UD6Ydr36aW//w3evVWmsXickR3Wr+U6cBzo8e3K
 pLem0ABVEQF2+fmZcMDUYfnFa0u1d85epxAOZlCeX/sXRHdgzJjbGUfvpYdpMV9UOFWy
 +7tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjcIdAc/lNTr0TdH29bbdUBCd3rDEupjTUwkcqUz9ZdAo2UddhKRpNFhgQt+SGajZJ76mRoFpIvYY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzq2P4YHk3LXZZDS9J7Nw6ufDmZQsJ7FBkrrTcoIR58AjdxI62e
 qgi8xwYMXyJzcZNzPAZdR7b8EESef1nGjQnpSrovUOSyK93uHTha/amBfMUL5Pk=
X-Google-Smtp-Source: AGHT+IFh4H/WWx4Qa+vKO6krpjLgwhrJdZoe1PK4esC7igv3wvWH3VSPKe4yX8cIQPl6dqk5jTsx7Q==
X-Received: by 2002:a05:6512:1251:b0:52b:9c8a:734f with SMTP id
 2adb3069b0e04-53546bb2b1fmr2135489e87.50.1725039117000; 
 Fri, 30 Aug 2024 10:31:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079b8f9sm701354e87.46.2024.08.30.10.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:31:56 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:31:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 18/21] drm/msm/dpu: Start frame done timer after encoder
 kickoff
Message-ID: <nj5stynavntbe4neop7b7pul5qm2dns5tfnucxhpvubmbs3dsf@3orpp3swrkey>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-18-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-18-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:39PM GMT, Jessica Zhang wrote:
> Create a separate API for starting the encoder frame done timer and call
> it after the encoder kickoff is finished
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 21 ++++++++++++++-------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  1 +
>  3 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c8ef59af444c..daf5f751f584 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -970,8 +970,10 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  
>  	dpu_vbif_clear_errors(dpu_kms);
>  
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
> +	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
>  		dpu_encoder_kickoff(encoder);
> +		dpu_encoder_start_frame_done_timer(encoder);
> +	}
>  
>  	reinit_completion(&dpu_crtc->frame_done_comp);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index bde385318018..9d495a186eb8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1945,18 +1945,12 @@ bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
>  	return true;
>  }
>  
> -void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
> +void dpu_encoder_start_frame_done_timer(struct drm_encoder *drm_enc)

Docs please. With this fixed and with the reason for the change being
added to the commit message:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  {
>  	struct dpu_encoder_virt *dpu_enc;
> -	struct dpu_encoder_phys *phys;
>  	unsigned long timeout_ms;
> -	unsigned int i;
>  
> -	DPU_ATRACE_BEGIN("encoder_kickoff");
>  	dpu_enc = to_dpu_encoder_virt(drm_enc);
> -
> -	trace_dpu_enc_kickoff(DRMID(drm_enc));
> -
>  	timeout_ms = DPU_ENCODER_FRAME_DONE_TIMEOUT_FRAMES * 1000 /
>  			drm_mode_vrefresh(&drm_enc->crtc->state->adjusted_mode);
>  

-- 
With best wishes
Dmitry

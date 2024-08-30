Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEE9966811
	for <lists+freedreno@lfdr.de>; Fri, 30 Aug 2024 19:35:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A10E10EABA;
	Fri, 30 Aug 2024 17:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AwRWGR+z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDA610EABA
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 17:35:43 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53343bf5eddso2654150e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 30 Aug 2024 10:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725039341; x=1725644141; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kszvRJtY9UGsU6dSkuAKZT1ejxQUCF702RsOxPJFqC0=;
 b=AwRWGR+z1SIvi0qPqNNzIpPWcQD9II/aUrvjiTXycR5yd6QggV3DnxqN60ODXlVD98
 4H5Vm4qcP9JDm0Z9LTGAmbGfVwY7ubYaUiHBoMXqrDrNN7i7G3YbAdEb2/5ufdKvamcU
 U5r971/7r4tM1ULoU35MgzwxzUMoYn9xiAL1lBThuECUrUkAMN0G2PccETXNgxUC4tgz
 6F84o/JRcnvM+9Vwp2IOi8xX4qqcnEtiMkpOKBzidb0I8vLvR6ozZjytgbqMx4i/eZJm
 o9laj9FdNVDAZor4DUOOs6ySVgXOffLYhGLmguMjykcmEL1KPSsR/+rTuACbu3XWH32C
 +maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725039341; x=1725644141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kszvRJtY9UGsU6dSkuAKZT1ejxQUCF702RsOxPJFqC0=;
 b=c/WxxWzMwdV7Tvwn32zkRCPiibFKDaRkYddul2CpqFv2HTywtWHmKKM1PlrDF7k9MK
 7tsIJfXIwkHsQYGoxS2FVe1bzSnOH3D3u/72Ji3Upy3pv+VTHCvqeV0SrXIjIUTl/s38
 /oN+e3z5pqrmUpljZp3hFdOQq6SYlMtve7v8yPu5qJA22/lcovsjw+xJp8fcuClE9tAg
 Cm5gATVWVuLhmb+cHil1YGJYluM6tWQ9UjbVO/ef9PRtcB/9NpR46uBOj/jfGSApGN6X
 DKVxpLePBsll+iny4YrgQCEB39pq/n/AhgUUBmSQMfcqwUs00SFePltRS4RfCkQYXzxk
 lbpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbQgbqUBWicSZHsfMMmvT0UxIeKXtlXD4y6FBVsWsgjn2vACOOk8Gi2i3FM0GCD4bE/AA4U4KDfss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDyRXoP72HWt1GdMOLVjLKqbty9/w116HgfinGDgYRizyI70zi
 rAyOOlyKqPK1Urwo6pY1ZdrD2Uz+vpFAQ6bGpsfW0JNntmVzfp3MM5Hcum9+XPw=
X-Google-Smtp-Source: AGHT+IHCy243phrYX32uZ8Q5Wu2rEjZgqHS0zJ/yPF/KqeBOfUc3WEuE4JWw/Au+SqfMB4Bhg8zLwg==
X-Received: by 2002:a05:6512:b06:b0:52f:c24b:175f with SMTP id
 2adb3069b0e04-53546b371eemr1986217e87.20.1725039340587; 
 Fri, 30 Aug 2024 10:35:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-535408412b3sm709664e87.216.2024.08.30.10.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:35:40 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:35:38 +0300
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
Subject: Re: [PATCH 20/21] drm/msm/dpu: Reorder encoder kickoff for CWB
Message-ID: <ghzsvz37j7tgj2c6kkixpnyo2ezc33vd53zrgynet5krk75ut4@lcxhpuruv6ut>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-20-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-20-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:41PM GMT, Jessica Zhang wrote:
> Add a helper that will handle the correct order of the encoder kickoffs
> for concurrent writeback.
> 
> For concurrent writeback, the realtime encoder must always kickoff last
> as it will call the trigger flush and start.
> 
> This avoids the following scenario where the writeback encoder
> increments the pending kickoff count after the WB_DONE interrupt is
> fired:
> 
> If the realtime encoder is kicked off first, the encoder kickoff will
> flush/start the encoder and increment the pending kickoff count. The
> WB_DONE interrupt then fires (before the writeback encoder is kicked
> off). When the writeback encoder enters its kickoff, it will skip the
> flush/start (due to CWB being enabled) and hit a frame done timeout
> as the frame was kicked off (and the WB_DONE interrupt fired) without
> the pending kickoff count being incremented.
> 
> In addition, the writeback timer should only start after the realtime
> encoder is kicked off to ensure that we don't get timeouts when the
> system has a heavy load (ex. when debug logs are enabled)
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 67 ++++++++++++++++++++++++++------
>  1 file changed, 55 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index daf5f751f584..d2f91e89eba7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -928,6 +928,42 @@ static int _dpu_crtc_wait_for_frame_done(struct drm_crtc *crtc)
>  	return rc;
>  }
>  
> +static int dpu_crtc_kickoff_clone_mode(struct drm_crtc *crtc)
> +{
> +	struct drm_encoder *encoder;
> +	struct drm_encoder *rt_encoder = NULL, *wb_encoder;
> +
> +	/* Find encoder for real time display */
> +	drm_for_each_encoder_mask(encoder, crtc->dev,
> +				  crtc->state->encoder_mask) {
> +		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
> +			wb_encoder = encoder;
> +		else
> +			rt_encoder = encoder;
> +	}
> +
> +	if (!rt_encoder || !wb_encoder) {
> +		DRM_DEBUG_ATOMIC("real time or wb encoder not found\n");
> +		return -EINVAL;
> +	}
> +
> +	dpu_encoder_prepare_for_kickoff(wb_encoder);
> +	dpu_encoder_prepare_for_kickoff(rt_encoder);
> +
> +	/*
> +	 * Kickoff real time encoder last as it's the encoder that
> +	 * will do the flush
> +	 */
> +	dpu_encoder_kickoff(wb_encoder);
> +	dpu_encoder_kickoff(rt_encoder);
> +
> +	/* Don't start frame done timers until the kickoffs have finished */
> +	dpu_encoder_start_frame_done_timer(wb_encoder);
> +	dpu_encoder_start_frame_done_timer(rt_encoder);
> +
> +	return 0;
> +}
> +
>  void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  {
>  	struct drm_encoder *encoder;
> @@ -952,13 +988,25 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  			goto end;
>  		}
>  	}
> -	/*
> -	 * Encoder will flush/start now, unless it has a tx pending. If so, it
> -	 * may delay and flush at an irq event (e.g. ppdone)
> -	 */
> -	drm_for_each_encoder_mask(encoder, crtc->dev,
> -				  crtc->state->encoder_mask)
> -		dpu_encoder_prepare_for_kickoff(encoder);
> +
> +	if (drm_crtc_in_clone_mode(crtc->state)) {
> +		if (dpu_crtc_kickoff_clone_mode(crtc))
> +			goto end;
> +	} else {
> +		/*
> +		 * Encoder will flush/start now, unless it has a tx pending.
> +		 * If so, it may delay and flush at an irq event (e.g. ppdone)
> +		 */
> +		drm_for_each_encoder_mask(encoder, crtc->dev,
> +				crtc->state->encoder_mask)
> +			dpu_encoder_prepare_for_kickoff(encoder);
> +
> +		drm_for_each_encoder_mask(encoder, crtc->dev,
> +				crtc->state->encoder_mask) {
> +			dpu_encoder_kickoff(encoder);
> +			dpu_encoder_start_frame_done_timer(encoder);
> +		}
> +	}
>  
>  	if (atomic_inc_return(&dpu_crtc->frame_pending) == 1) {
>  		/* acquire bandwidth and other resources */
> @@ -970,11 +1018,6 @@ void dpu_crtc_commit_kickoff(struct drm_crtc *crtc)
>  
>  	dpu_vbif_clear_errors(dpu_kms);
>  
> -	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask) {
> -		dpu_encoder_kickoff(encoder);
> -		dpu_encoder_start_frame_done_timer(encoder);
> -	}
> -

I think I understand why you wanted to move the kickoff before the
frame_pending, etc. However at the same time dpu_vbif_clear_errors()
should be called before kickoff.

>  	reinit_completion(&dpu_crtc->frame_done_comp);
>  
>  end:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

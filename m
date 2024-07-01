Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEB091E8C3
	for <lists+freedreno@lfdr.de>; Mon,  1 Jul 2024 21:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB83610E04D;
	Mon,  1 Jul 2024 19:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rJXhEOkY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58E710E04D
 for <freedreno@lists.freedesktop.org>; Mon,  1 Jul 2024 19:43:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cdf2c7454so7152841e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 01 Jul 2024 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719862998; x=1720467798; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oscpSDO7CeUkkgmCfEkVvaRyN/meIA6JpS1dhxrIHl0=;
 b=rJXhEOkYEiTJpuIcv3E7dihjtP8JYoJoJ5gTZzaHDtxLmg6+FRD5DJb0+Bz+RmJr2L
 ZTwihh0yakrkupnUuoVrbC3jNptFDGkZC1vePw2cFeHYIeN/etRXPUQTGxgUicuXahje
 QiCOfX6AcfX8/GT8h8BnT3yl4FFAd67/wzoXd7Ua9w1VKCRSur863HtHe01hGCBtNuNI
 V7hAst/wO9tOUJHY+o3lo1bbsyPET9WrT9UdhbOACyZkYV42l8Kf0NiqrkAlnQy4V7am
 4C+WXKSZ1BEULzr8KR48dp89bqZFTAKs/dWSLJ7844or+TXC3Y1RcS0lqQeDFrM/fBCv
 o+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719862998; x=1720467798;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oscpSDO7CeUkkgmCfEkVvaRyN/meIA6JpS1dhxrIHl0=;
 b=gIlU+0fCfAfbE9FAd/DaUBm0vlGltiG5EUT2E6WBt+KqWYgGDujAtHcV92olV65Tx3
 fUk2eQfFGRCNwtGDKlFT+n+e43rtWde8dD+AN4kjHx2H41Rr3u2WEA4bCSFwIQerXCGS
 51Gq0EoFmtB8fShEG93WtOubD5mAzgXlSIYpjGPOgz5D2Mewh+ZvJZmCLttlfKQWVlta
 BPhHam7OetOQcLwyRStRGA8B8PKFevF/wxheg2STRpDK89QxAJIKWbK4zXmrPW3V14/X
 mKR1LCrpYgbKhktcfTGp7eCvezQsbZPEheDqguukD+H8Fefj1eCSBTVxE/5dDMLC6pH3
 TFuw==
X-Gm-Message-State: AOJu0YzqI+7Ejiuu9bAJkd5JGEJTb/prlQruruztHCXMSdTDjVeRhdu/
 CzvMJ9hsOdzHraOjIOzc7c5x9Xd+OMSFVU8+aTJQrjcFcx3ta8DKUTI5Lfzjxog=
X-Google-Smtp-Source: AGHT+IFJ7WfUoSw0//3UtLKEzdeD18XEuk93La1NkOaUbrCL4a3tDiQ5T8y7FR/KCltxgwltD2/Zqg==
X-Received: by 2002:a2e:bc88:0:b0:2ee:4c6c:5874 with SMTP id
 38308e7fff4ca-2ee5e37ff02mr73446291fa.10.1719862997936; 
 Mon, 01 Jul 2024 12:43:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160d26dsm14817021fa.25.2024.07.01.12.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:43:17 -0700 (PDT)
Date: Mon, 1 Jul 2024 22:43:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
Message-ID: <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
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

On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> There is no recovery mechanism in place yet to recover from mmu
> faults for DPU. We can only prevent the faults by making sure there
> is no misconfiguration.
> 
> Rate-limit the snapshot capture for mmu faults to once per
> msm_kms_init_aspace() as that should be sufficient to capture
> the snapshot for debugging otherwise there will be a lot of
> dpu snapshots getting captured for the same fault which is
> redundant and also might affect capturing even one snapshot
> accurately.

Please squash this into the first patch. There is no need to add code
with a known defficiency.

Also, is there a reason why you haven't used <linux/ratelimit.h> ?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
>  drivers/gpu/drm/msm/msm_kms.h | 3 +++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> index d5d3117259cf..90a333920c01 100644
> --- a/drivers/gpu/drm/msm/msm_kms.c
> +++ b/drivers/gpu/drm/msm/msm_kms.c
> @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsigned long iova, int flags, void
>  {
>  	struct msm_kms *kms = arg;
>  
> -	msm_disp_snapshot_state(kms->dev);
> +	if (!kms->fault_snapshot_capture) {
> +		msm_disp_snapshot_state(kms->dev);
> +		kms->fault_snapshot_capture++;

When is it decremented?

> +	}
>  
>  	return -ENOSYS;
>  }
> @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
>  		mmu->funcs->destroy(mmu);
>  	}
>  
> +	kms->fault_snapshot_capture = 0;
>  	msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler);
>  
>  	return aspace;
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 1e0c54de3716..240b39e60828 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -134,6 +134,9 @@ struct msm_kms {
>  	int irq;
>  	bool irq_requested;
>  
> +	/* rate limit the snapshot capture to once per attach */
> +	int fault_snapshot_capture;
> +
>  	/* mapper-id used to request GEM buffer mapped for scanout: */
>  	struct msm_gem_address_space *aspace;
>  
> -- 
> 2.44.0
> 

-- 
With best wishes
Dmitry

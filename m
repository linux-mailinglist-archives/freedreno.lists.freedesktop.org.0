Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC99736A00
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 12:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BB010E2B8;
	Tue, 20 Jun 2023 10:56:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54CE710E2A6
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 10:56:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so2628850e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 03:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687258576; x=1689850576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VwGJvKL8bIVSVsxQLUUZbS85sC7vlo43qu3RpJRu4DY=;
 b=pHv2LtB1UWqfvUWhXXRTaV2WuDy886fOPcAt8BWym0KEDqSoTizehoS/ATy6BwKOgH
 b0XDbq320c9d7hLHG5VSKnMG/Mb6AMbRA2EAHB43RIhr5+lTHDZcLcCQgcWh9zUaJp6U
 hnMa5BNnX9UQS/VZ5rbgQIy32MXMW8VYPWRr2f272W5fdQb4qQ0UcAfF57aftbB7UBhf
 hIV+XlZmrKnwXNVzbQz/vTk28G7HiF2gUOKutJFeB0ubt9UINqhZEhyT9UuV6GpBZI3T
 bxXhqvEmA3TJ9ZhJFwMIvNMi5xlNCwoueCGJfcyM1+xfStdXpY4VSgeVwguWKd5kxb0x
 HPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687258576; x=1689850576;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VwGJvKL8bIVSVsxQLUUZbS85sC7vlo43qu3RpJRu4DY=;
 b=fXEsSTrmgSDfiLnH6hsHiszFSr372CLzdlwsHy7i6EYMmnz+T3vFlF4Hi4OBgAUpZp
 thOc5zMrwyoOckzSe5BiWUyIQY8PZb67bTkzMt0polg8E4lk2TCu1yiPIJgFnSiFiS6o
 bUuOetXFqN2DR8MWhq6nQs7/LYXWDmEG+ThLNrrEf8y2B7GgyIzhgXc+UhOqm7h8ch7t
 QgnHNBvuvTFnd/Sk3YfkMPhZhqT1Mz7hLq9fxIsNFeSEg6BJFFblf/vm2kDy4dDyxhEG
 u1UBnhGyzkEckM4z43tGg5UIXMaN/atG3vBv2FVttIHcENi1QaVmDkUT0y9APOlYs2IL
 SREw==
X-Gm-Message-State: AC+VfDxEA/RXKWJzu8kndgNyA1CZQuUCwaN1XynCSaXi4ycwHlZN85NY
 lNeFVVcf7BQ0y1+o7s9xLTaJgN5bFVNcTkJZ62Q=
X-Google-Smtp-Source: ACHHUZ6gLfBFkX5OpvpQ1KU0BrK026q12jba0np2sWg67nwCGim7wU5dkJbVHle3NJb4iis6pc3eAg==
X-Received: by 2002:a05:6512:46c:b0:4f8:5bbb:7fa0 with SMTP id
 x12-20020a056512046c00b004f85bbb7fa0mr5327995lfd.13.1687258575976; 
 Tue, 20 Jun 2023 03:56:15 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac24c22000000b004f862732a3asm314255lfq.194.2023.06.20.03.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:56:15 -0700 (PDT)
Message-ID: <6d598438-f10f-8678-7878-829b8b3ae790@linaro.org>
Date: Tue, 20 Jun 2023 12:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 7/8] drm/msm/dpu: drop
 dpu_core_perf_destroy()
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> This function does nothing, just clears several data pointers. Drop it
> now.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
>  3 files changed, 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 78a7e3ea27a4..f779ad544347 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>  }
>  #endif
>  
> -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
> -{
> -	if (!perf) {
> -		DPU_ERROR("invalid parameters\n");
> -		return;
> -	}
> -
> -	perf->max_core_clk_rate = 0;
> -	perf->core_clk = NULL;
> -	perf->dev = NULL;
> -}
> -
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
>  		struct drm_device *dev,
>  		const struct dpu_perf_cfg *perf_cfg,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e8a7916b6f71..e1198c104b5e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>   */
>  void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
>  
> -/**
> - * dpu_core_perf_destroy - destroy the given core performance context
> - * @perf: Pointer to core performance context
> - */
> -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
> -
>  /**
>   * dpu_core_perf_init - initialize the given core performance context
>   * @perf: Pointer to core performance context
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 6e62606e32de..4439147d2c35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  	return 0;
>  
>  drm_obj_init_err:
> -	dpu_core_perf_destroy(&dpu_kms->perf);
>  hw_intr_init_err:
>  perf_err:
>  power_error:
This screams for another cleanup ;)

Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

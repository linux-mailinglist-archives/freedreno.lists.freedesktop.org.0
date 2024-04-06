Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 004F189A87E
	for <lists+freedreno@lfdr.de>; Sat,  6 Apr 2024 04:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53B85113CE5;
	Sat,  6 Apr 2024 02:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OyVA1/1z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19FF113CE4
 for <freedreno@lists.freedesktop.org>; Sat,  6 Apr 2024 02:56:39 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516d536f6f2so1404091e87.2
 for <freedreno@lists.freedesktop.org>; Fri, 05 Apr 2024 19:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712372198; x=1712976998; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XkuhIBlU9RYiWnHnizddy2d21zdQrAfJBlCZtmWWd30=;
 b=OyVA1/1zRQpla3mi87w1QUvKFnLanu1eOoHAWJjZnRhy7uYxbFu9sNdyHTlU3JSFF0
 /8AUvhEF4UDwm3r06hXFEzAAqQKfRX8kcDVFZ77twWP270SV3Cyg5F8MUgHolG5l5pWQ
 fxCg5sJomWVDpMQkYug+v1StXbCqtoa86/rhKFWfwaF3fdK19OHBNxsJFB2gr+J8i8hI
 zwOfN8wxD0GX4ecSJp+I29bs1yg8XUfCR/6fNxz/Dh3wkRK1PKXDm9C3lewNkUyAzjpu
 xMuwq3xV9qv03dqUvL4dufXYrkOX45FH0rZsItRUSYA/r+PK9xzTodjf844qaaJbcJn8
 ufDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712372198; x=1712976998;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkuhIBlU9RYiWnHnizddy2d21zdQrAfJBlCZtmWWd30=;
 b=eapcBfGXFceJAVXLX+arok5Wt2+V4yaF87NkUGt8+FYFEVV+1AOvXlE4f45EN01amF
 n9mAIMRrtsNKrztqgFw/Q9sn5dOFeK5/bzt13gBsBqsWiugkZonRnx5yQPpMbOpD7ThA
 xrlq1JPHJXwAjMNUWY4JH6mpXjrbfVNLIp218GZgDurYqsxuOi4F1PKI8ESTJCR3ObWe
 i9Sca0sNrw4iJiPUCCzuAs0dR9xuSa1mxfS5SAwoWWj28w1AGJ4BEl/ix4f8W5amhAMO
 BC5V6vmI9I2vmRc0fk5fIqf/tprBSWS1qCoTio+xtmwnzLsdQFgfd7xuUTT6ZjW5eo1t
 aq1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsG/OajZ6/s/EQptezOwCAXjMjC1JVJpJn6Xv3hxC7MdAxdzulsIkeBxQiASDJlCYjd7TL5u/DiY15OqPti23UpBAtiECrBvVDzTlVvbNn
X-Gm-Message-State: AOJu0YwxCqdjR/+PrMXXEz00N/RU7qWRJoJM5Kjazb9fFkUwsZ2cQsAv
 wlXsCkM2rDCi45pML1B9Xw60HKANxNCnekZljZs6pxKFo9UQCnpeE3nhpxr+N+w=
X-Google-Smtp-Source: AGHT+IEFyrUrT2ZntAekgJgSNMszFLZJgTqy/cn0YWgronRwNk9wRp1wJ9lXCAf/pLYAAOSg/cRiUg==
X-Received: by 2002:a05:6512:3d09:b0:513:c6ec:fa6c with SMTP id
 d9-20020a0565123d0900b00513c6ecfa6cmr3037333lfv.48.1712372197844; 
 Fri, 05 Apr 2024 19:56:37 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 be37-20020a056512252500b00515af4b4878sm356263lfb.183.2024.04.05.19.56.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 19:56:37 -0700 (PDT)
Date: Sat, 6 Apr 2024 05:56:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
Message-ID: <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
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

On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
> From: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
> the highest. Falling back to it when things go wrong is largely
> suboptimal, as more often than not, the top frequencies are not
> supposed to work on other bins.

Isn't it better to just return an error here instead of trying to guess
which speedbin to use?

If that's not the case, I think the commit should be expanded with
actually setting default_speedbin for the existing GPUs.

> 
> Let the developer specify the intended "lowest common denominator" bin
> in struct adreno_info. If not specified, partial struct initialization
> will ensure it's set to zero, retaining previous behavior.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> [Konrad: clean up, add commit message]
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 2 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0674aca0f8a3..4cbdfabbcee5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2915,7 +2915,7 @@ static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *i
>  		DRM_DEV_ERROR(dev,
>  			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>  			speedbin);
> -		supp_hw = BIT(0); /* Default */
> +		supp_hw = BIT(info->default_speedbin); /* Default */
>  	}
>  
>  	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 77526892eb8c..460b399be37b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -110,6 +110,7 @@ struct adreno_info {
>  	 * {SHRT_MAX, 0} sentinal.
>  	 */
>  	struct adreno_speedbin *speedbins;
> +	unsigned int default_speedbin;
>  };
>  
>  #define ADRENO_CHIP_IDS(tbl...) (uint32_t[]) { tbl, 0 }
> 
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry

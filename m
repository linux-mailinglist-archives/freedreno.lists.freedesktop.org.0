Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAB54C8ED
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 14:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0D10E5D5;
	Wed, 15 Jun 2022 12:48:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA5A10E5E2
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 12:48:24 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id g2so13140999ljk.5
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 05:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=IKkEI1vEAYy+wKZ0nZJbXYdiseAo5I2B96TpHBLOCmU=;
 b=dil/QRv2b/+pgYvnTk+wUqC3Cwp1uy4EqTIdoZshFp3gnU+y7nTLSEE8a+JCYTQdEX
 UspKPIMjc2gz4WLI9G9hDJfvxvT7GmcfRNob78gK3lHxjkKZC1hxjnqsLZ4i/rdku/qK
 TI9sBkSgPSOpBz8jNsWTfDakANzDLpS3/thSMQYt7lkVcQiggvUUcQN96w0D/CU1qf9w
 Z+sgm+WzJEvK8AYrJiDeiNACECWIyr7c5Oi8gSgiF3B2qbigGRAqvoYOkpAwZjxiSFn8
 co8Quua2Iq1d+BF/rUejm4SXYJTNRGY2oca8oOWPmGsegz+1iwQGURpzlOhonvv+70+l
 hZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IKkEI1vEAYy+wKZ0nZJbXYdiseAo5I2B96TpHBLOCmU=;
 b=HcLxii9N7UciqZi/etUVM9ZoKA0U3cSbOra4aiaSrExmsfckFhh1DUK0hYrAW4asIP
 eX3zqM9VJRakvbHXf+GDH3dp4BaBMkavEAYfA0ZVQo6SQdOD36azf1UsUFcHKaF/ovSl
 bRPo/oxtX4PpypITjGQD2UANPw0D7DNGuenDdWgbWu9Vk9Sa7Fx4e6PCbK9EpCOtLuAe
 t+rm9LFrqexA30XVXevD8KbdOOHTbqYmDOmLnG0RIHvChaqpMIKKmJvev0hGHJbXR5SM
 8vwA8yRRS/ZrjVr13dO0fcidVLn9QD1QRcn+FQyIT52pKmldKRlOFNT4nRykFPCL6g9B
 QkMw==
X-Gm-Message-State: AJIora+RuVKUR6+lRKvv+YI2v68XUvDYtqPCeRp678H44wGq2SzyZN04
 EZCKNfU4cAG/1zJirmm2odxJ+g==
X-Google-Smtp-Source: AGRyM1uetcxrCiKpy9pOfOUbCy/it8Y6OjjPF+K52yYDh1v5ozTUJOrEQmpJBZfAc5I/iizeKGJCLg==
X-Received: by 2002:a2e:91c6:0:b0:259:1427:f85c with SMTP id
 u6-20020a2e91c6000000b002591427f85cmr5091572ljg.405.1655297302558; 
 Wed, 15 Jun 2022 05:48:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a199141000000b0047255d2119bsm1784208lfj.202.2022.06.15.05.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:48:21 -0700 (PDT)
Message-ID: <6ad85a23-0156-2774-1215-ea02257cc107@linaro.org>
Date: Wed, 15 Jun 2022 15:48:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Wan Jiabing <wanjiabing@vivo.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220426132126.686447-1-wanjiabing@vivo.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220426132126.686447-1-wanjiabing@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: Use div64_ul instead of do_div
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

On 26/04/2022 16:21, Wan Jiabing wrote:
> Fix following coccicheck warning:
> drivers/gpu/drm/msm/msm_gpu_devfreq.c:72:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_ul instead.
> 
> Use div64_ul instead of do_div to avoid a possible truncation.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index d2539ca78c29..c2ea978c8921 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -69,7 +69,7 @@ static void get_raw_dev_status(struct msm_gpu *gpu,
>   	df->time = time;
>   
>   	busy_time *= USEC_PER_SEC;
> -	do_div(busy_time, sample_rate);
> +	busy_time = div64_ul(busy_time, sample_rate);
>   	if (WARN_ON(busy_time > ~0LU))
>   		busy_time = ~0LU;
>   


-- 
With best wishes
Dmitry

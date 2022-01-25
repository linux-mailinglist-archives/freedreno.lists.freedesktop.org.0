Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E39749A77D
	for <lists+freedreno@lfdr.de>; Tue, 25 Jan 2022 03:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B4D10ECCA;
	Tue, 25 Jan 2022 02:47:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A95410ECC4
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jan 2022 02:47:43 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bu18so53973846lfb.5
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 18:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WSgw+Bai9akIbsNX8qE1iDGkZDqwpur2u3wwvUxZaos=;
 b=oh0ZGUYdJjwb/WULwnJIpti/MED7HLmMZVHOk9IKD0rr8P1tHXUBsy0GnBK6ZwnYIh
 tJCowFsUgGAVBBYLsw4BFJPAXHTlcoHxc6pkhKCwUUiyLK18hTNYa8EkrIiEUCK30f7+
 e9B86H6+E5jHBxNituWhdgYulf+E1Pmn2NoWGyUzDcZqU09ii/UfH4aWOc4QYjXOagRL
 nIKlAMTUw4RY6LRQmrof23eAD/aSAyNlQuygygGFJf+hwTpZPljRaWoVquCojr6YlrO8
 3vjCDFb1uGUKdCHRnXgGSUZMUGealQRlTR0nNvT522GnnVDptIvCHG88NDdprW0RNcVK
 mqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WSgw+Bai9akIbsNX8qE1iDGkZDqwpur2u3wwvUxZaos=;
 b=jjPH1tuqBk1KXf+GYarnlLLLzpf8EubZeeDD81F2Jzt6aHlwlKrpyEwltxJILda2f1
 uUVCzu+3OxL1IRVVQ70vbJKYKc6RVLI2egkZQUIPjrX8Cb2F6GxnRDCVA//ksYYoLcne
 87nTyKWT9+JNQE/C8yTygKAFkVlzIVx+CD9s87VV4+1w6jo2XTSJjQxKwqJ6NXwx7p76
 zkfkqH1Mgcm1ZrHWsTfBekhfQ1c6XHEtbHJ+t7iInFZkQ69XBr5uK7pHBIAnlcJ5nUXf
 3jkdDGUelBYgi36j/RxscajHPSukluNfOQtRDcTY+VBPItzTxKzQDKmkve00Q+h4CfwC
 /7wA==
X-Gm-Message-State: AOAM532aLW0m4AG/KvgxR2bsKWwPBLxw3QvK2xC3mqYqaIWRaQr7ko5s
 8eCj8giXy1YdwLnslWGItYW2/A==
X-Google-Smtp-Source: ABdhPJw/HdOl+VUK3mcD6a1INueBqbK59eArLJlh5fV2q6DjMOQxtjwEObG+XzPUSBGydBKpE5XwKw==
X-Received: by 2002:a19:640c:: with SMTP id y12mr5522574lfb.245.1643078861686; 
 Mon, 24 Jan 2022 18:47:41 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u1sm1065629lfc.98.2022.01.24.18.47.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 18:47:40 -0800 (PST)
Message-ID: <4d9fa340-19fd-ee0f-0244-15ded5e66c67@linaro.org>
Date: Tue, 25 Jan 2022 05:47:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220113163215.215367-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220113163215.215367-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/a6xx: Add missing suspend_count
 increment
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Danylo Piliaiev <dpiliaiev@igalia.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 13/01/2022 19:32, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Reported-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> Fixes: 3ab1c5cc3939 ("drm/msm: Add param for userspace to query suspend count")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 51b83776951b..17cfad6424db 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1560,6 +1560,8 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
>   		for (i = 0; i < gpu->nr_rings; i++)
>   			a6xx_gpu->shadow[i] = 0;
>   
> +	gpu->suspend_count++;
> +
>   	return 0;
>   }
>   


-- 
With best wishes
Dmitry

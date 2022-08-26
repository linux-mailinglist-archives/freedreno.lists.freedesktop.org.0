Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC95A2590
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 12:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8917510E836;
	Fri, 26 Aug 2022 10:12:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0910710E836
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 10:12:21 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bt10so1400623lfb.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 03:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Qvdys5dN+I9LUJHbK/6/No5KAdnIwq9CjmDCgjRtEK4=;
 b=qIIieiaXoC5YiikqGgeEJZ3Tej8dv40luO2+mNsojGpHrOqCMligsPfkpU0/dmBSav
 a2r7l9eXfPiJrTPymQcPszvHOfTscqbaU4NDP0Sw8oY9X+e8NHUCJCx1VmzFv+yGFGcy
 zppzzUrkE4x02ADCI4FBHNkZSSiDS+FIOS1jme/7jgzR0/7xdRSrFp/JnODlqiFY7Rs0
 jB9G3J9TSyAgYAgZFxAIe1sPsah/yJB1Pzgln7YiS5U6MMPcX49vpmE9CVel3rRm790o
 DP0w0bDy2ByNdMnyj4mYjFIhqBXlLI5hCQNCO+VbwGzB6lEAXuR1Vp6oeSQDPJj0tu5s
 IO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Qvdys5dN+I9LUJHbK/6/No5KAdnIwq9CjmDCgjRtEK4=;
 b=xIxF1n+yrKrctNEZJXnDqQb7aJB6sKvJRIqBiqM0KuT54cmpi0tgmP9lNGHoEVLIyt
 u2JwnVH6wC3K6OIsxaWtS4RS6YTf2rL/UYHEiJvxI4U6/cHVLOjSdOl/zh02fCgzFmdD
 01L8xow4PmojnPcSIlTwrmwnKmdWC9qLX5Qk21YZDzjDtdFPSIBMZlNYsggUbq/rqpGg
 WFflYG5Findyk5Xf/4lQmyptS/quu3m34vUY3IK6OsOIfxnNm6DEzOejoD1ZmHJX6PFH
 94TMhfT8mkXvPoB28WxFmzb6D4dWtgylWT9VKo5bDCOvjNBWQzG+dMkhCEgICevLLG3m
 IG7A==
X-Gm-Message-State: ACgBeo2RXWDPpErN1C/5p/ZdXpTywXaerectVk/iICTrG1xZvUxFfWiE
 p+qEsGa9mZ9fkI7xcFmNZvLjnA==
X-Google-Smtp-Source: AA6agR6Ltpi7l0Rgxs/vwz5K1n21dO7YyWaBFrO/NCQdw9rAlL17n3agYbkSNTrnrYz0RdTIQw71kg==
X-Received: by 2002:a05:6512:304c:b0:492:cd69:6cb8 with SMTP id
 b12-20020a056512304c00b00492cd696cb8mr2547841lfb.551.1661508739349; 
 Fri, 26 Aug 2022 03:12:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c5-20020ac25f65000000b00492c627cab5sm323446lfc.254.2022.08.26.03.12.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 03:12:18 -0700 (PDT)
Message-ID: <941ddc17-87d3-aa3c-e6bb-46ecf4a7dfca@linaro.org>
Date: Fri, 26 Aug 2022 13:12:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
References: <20220826084524.2217022-1-yangyingliang@huawei.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220826084524.2217022-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH -next] drm/msm/adreno: Switch to
 memdup_user_nul() helper
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
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 26/08/2022 11:45, Yang Yingliang wrote:
> Use memdup_user_nul() helper instead of open-coding to
> simplify the code.
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 382fb7f9e497..50b33e14237b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -339,17 +339,9 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>   	case MSM_PARAM_CMDLINE: {
>   		char *str, **paramp;
>   
> -		str = kmalloc(len + 1, GFP_KERNEL);
> -		if (!str)
> -			return -ENOMEM;
> -
> -		if (copy_from_user(str, u64_to_user_ptr(value), len)) {
> -			kfree(str);
> -			return -EFAULT;
> -		}
> -
> -		/* Ensure string is null terminated: */
> -		str[len] = '\0';
> +		str = memdup_user_nul(u64_to_user_ptr(value), len);
> +		if (IS_ERR(str))
> +			return PTR_ERR(str);
>   
>   		if (param == MSM_PARAM_COMM) {
>   			paramp = &ctx->comm;

-- 
With best wishes
Dmitry


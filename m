Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C715A24B7
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1340B10E7C6;
	Fri, 26 Aug 2022 09:43:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D68210E7F4
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:43:31 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id u24so1091358lji.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=+lqDjb0qBgeqnkEqJaLG27x7N3wtLO3gCVuMcmo3TBw=;
 b=VhxJOtjjqS32cws+7S6MknCuthUPbEFAM8r54Og1meOmNOF5aLgq+CDq6b6oHJv0wz
 QVjTQgDiLo99fHiCA1l9RbuoSugkVrj4tm4rQdNo6iH8nv8T0YtwZz2944Ouuex4twr3
 r49e+nez32HZCyhRn1NuMHD0UtltpqlFfa7TQJIH5G9S2qwqg9FRtWkzu43i8gP9//rJ
 inkrP8pAQZJZpI/sHBVb5zaYmW3+uDHlDyz96Mq48JAZJOMp5TnmHZRtOXLstbqdnY9Q
 nd1nhPbLPsAwKAdyzAR8Wv88RDl5dibLpYwgH3RDoKvfBX/7MXf5F2gkdMl3BsPGjU2f
 srxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=+lqDjb0qBgeqnkEqJaLG27x7N3wtLO3gCVuMcmo3TBw=;
 b=mWKFvBr4yZ+Q0u/lXg60KAvRmQ9N54jVnY73XNLXGNlzKzyRQ3HnmhkUQfQjuysWCM
 y6+RqZMBmswOKePt0KYXjtc3A0Lg626fyCvEVMjRVcbfVwtsrxti9HuauYylFoCVn/R7
 jcwHDfwWV6V3ChLlJn6FF3FbqwmvWvydtY5g7ktW9fh6PmHqaJ7vzzo5wSidGr1dXfW7
 eeWbFYeVPWotc6LQqNWVP/JCs7nG0Z3dQW+JcLhj7VwNcX3QfvksGqxhGbXI6h57A7uc
 l8gVHjLSnApusuzQpA5GmZQj1xrPaSl/4F0lILRXyz+ruNaERLl4iovgzbfM5B7GYefu
 O6EA==
X-Gm-Message-State: ACgBeo0+5QtJ5IXAT0tPRzl2M8Q04vpgKYC/EQsEbz4ac34UramVtZ5T
 OSk0Grb8qadUubrnPM3bVllzBA==
X-Google-Smtp-Source: AA6agR60mdKAFt3fcZSOqh0nQB0mBgQpUkcT+i+VJYGcCuzDHjy0Ta+/PXxV5E04Iyz2oJx0T+2haw==
X-Received: by 2002:a2e:b602:0:b0:261:e4a6:8c89 with SMTP id
 r2-20020a2eb602000000b00261e4a68c89mr2163985ljn.354.1661507009617; 
 Fri, 26 Aug 2022 02:43:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a056512078700b0048b0aa2f87csm321710lfr.181.2022.08.26.02.43.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:43:29 -0700 (PDT)
Message-ID: <658faa4e-ad16-7b13-87f3-27ea91db4ba3@linaro.org>
Date: Fri, 26 Aug 2022 12:43:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Jilin Yuan <yuanjilin@cdjrlc.com>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, airlied@linux.ie, daniel@ffwll.ch
References: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220823115409.46653-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm: fix repeated words in comments
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 23/08/2022 14:54, Jilin Yuan wrote:
>   Delete the redundant word 'one'.

The whitespace is unnecessary.

> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")


> ---
>   drivers/gpu/drm/msm/msm_gem.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index c75d3b879a53..e300c70e8904 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -118,7 +118,7 @@ struct msm_gem_object {
>   	 * An object is either:
>   	 *  inactive - on priv->inactive_dontneed or priv->inactive_willneed
>   	 *     (depending on purgeability status)
> -	 *  active   - on one one of the gpu's active_list..  well, at
> +	 *  active   - on one of the gpu's active_list..  well, at
>   	 *     least for now we don't have (I don't think) hw sync between
>   	 *     2d and 3d one devices which have both, meaning we need to
>   	 *     block on submit if a bo is already on other ring

-- 
With best wishes
Dmitry


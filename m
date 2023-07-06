Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E3F74A78C
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 01:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8626810E122;
	Thu,  6 Jul 2023 23:26:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B5510E121
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jul 2023 23:26:18 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b702319893so19377291fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 16:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688685976; x=1691277976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pG4QUNw/1VF1olIkAIG6YVjaLZEGzevFOo4Q/EoszHY=;
 b=SbViTNpiDnn1/SVFjlm4q7uEQ0PDGSLkSl+jjOd8wsH9QCH00ozbLsUFLWhTghUYWS
 /Oel0EybjDJnKhPvkYZ5MxPz1AOLXr8rMwplqqHz2Rs2QBNc1uUdso0g9Xxiye0QcsgC
 bJGqD8ICio6AyzSTyjSrOFdOYW77HwCXuNaAOLHFpEeMtH1lOlVMVP5TO81JkSurusB1
 y6yyD4wYO6w+eeOWFCNKsJ7pMbckwG2hBRCfMEE2jS9uuW1noVOGTrNCZfvzGUJyP1dm
 6tglL6vAEFYQWUXjCtmRYAnSY+x8p6Y6+VpL8HE0uqSDWUVl4VgaFH0bW+TST0i6OzRp
 CggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688685976; x=1691277976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pG4QUNw/1VF1olIkAIG6YVjaLZEGzevFOo4Q/EoszHY=;
 b=dkx8aRmkPRDN2MWDiSnxc5d6a0GR2ckKkzTuNKAjB4Na37I4mQrznAqiqI6SgH5Ubr
 YR8ED7H0yr9VPdrFyIb0/JznKtgQDlKPm/QApvTh4ixT8BfONPxl7O/EWlwwkY3LWLH4
 Gb6OH3h8hV8C+Jqihm08AHiTA6WYhLe1uk1kJ75pH8G6kqIfI8XzyAPAhZmtrKqqPY3u
 HbUfkeR70McN0kdZXqMJWDcjmTr0GHMoDW/4lCshZHAgWuftG2p53+pKzu3hPXZXqGPJ
 SKnS/dGJjrdD6dPOa6Amx0sW5Z6wfRhpDnAKRUwjvaSiaC7tH8ThTaWe3qUnWdxC83m7
 WKKQ==
X-Gm-Message-State: ABy/qLZDJZ44X7ZmJPw2K99FnzwJZMuGKjeJYG6hxaYZVXETtcvv8JgB
 cihfUxwAYdhWPBNkKlu034kLEQ==
X-Google-Smtp-Source: APBJJlGo06Jx2plcZiTY2QU9Nba6Qqa47IHnccfsTTJbavzf+dxOw1rk0SJT3T/OnI0zsTaOgiGLdQ==
X-Received: by 2002:a05:6512:3049:b0:4f9:586b:dba1 with SMTP id
 b9-20020a056512304900b004f9586bdba1mr2902032lfb.4.1688685975641; 
 Thu, 06 Jul 2023 16:26:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
 by smtp.gmail.com with ESMTPSA id
 16-20020ac24830000000b004faeedbb29dsm438524lft.64.2023.07.06.16.26.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 16:26:15 -0700 (PDT)
Message-ID: <536f38a8-5e83-4ed5-24c0-70fbdd788cc2@linaro.org>
Date: Fri, 7 Jul 2023 01:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-4-robdclark@gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-4-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 03/12] drm/msm/adreno: Remove redundant revn
 param
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> This just duplicates what is in adreno_info, and can cause confusion if
> used before it is set.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
[...]

> -	return gpu->revn == revn;
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
I'm unsure about changing this behavior. Especially in a6xx code,
where these calls may guard things like SMMU behavior (the LLCC-SMMU
programming dance is unconditional if adreno_is_a7xx)

Though if gpu->info is missing, it's a lost cause anwyways..

So I guess this is really the least bad thing to do

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +	return gpu->info->revn == revn;
>  }
>  
>  static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
> @@ -160,18 +158,16 @@ static inline bool adreno_has_gmu_wrapper(const struct adreno_gpu *gpu)
>  
>  static inline bool adreno_is_a2xx(const struct adreno_gpu *gpu)
>  {
> -	/* revn can be zero, but if not is set at same time as info */
> -	WARN_ON_ONCE(!gpu->info);
> -
> -	return (gpu->revn < 300);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return (gpu->info->revn < 300);
>  }
>  
>  static inline bool adreno_is_a20x(const struct adreno_gpu *gpu)
>  {
> -	/* revn can be zero, but if not is set at same time as info */
> -	WARN_ON_ONCE(!gpu->info);
> -
> -	return (gpu->revn < 210);
> +	if (WARN_ON_ONCE(!gpu->info))
> +		return false;
> +	return (gpu->info->revn < 210);
>  }
>  
>  static inline bool adreno_is_a225(const struct adreno_gpu *gpu)

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C75468B465C
	for <lists+freedreno@lfdr.de>; Sat, 27 Apr 2024 14:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DCD10E5EB;
	Sat, 27 Apr 2024 12:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dXC47XPN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9342E10E5EB
 for <freedreno@lists.freedesktop.org>; Sat, 27 Apr 2024 12:23:24 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a55b93f5540so395364666b.1
 for <freedreno@lists.freedesktop.org>; Sat, 27 Apr 2024 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714220603; x=1714825403; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=q7feFsI4WVcCZqt8j1/zezoxOfm4nxdXTKy0SLTOZx4=;
 b=dXC47XPNKsMGniv7+QCsnl77Si2I/y+TafmoxIhAtkyLgRmKQ2BWhqpQQv8QkcjHts
 963ELO1/kgBvb/wqU+jEH235bqy73tvjlJ4/mziq4xliZg/ZEI93OyfbbCywERzveNpk
 5+ZMUu5Z6aIqPUBIZLPx75sdQu9Nn7epENCUuy7nc2rt7qJpjECV/fMfN0DrweIbmYzU
 H4ALlzUr80WPJqJ5/Z3sWBL2Ta+EJXHWdJsfZn9NlEq5gpF2p1OKV/9KHY0uLFnT4Dnp
 kSemXcr3AXA6MzRhRSt0CDXkGmJv1ql3z7ET+lmX+GV7UNXNtrboG3CuYqo/HyJCcGTa
 zXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714220603; x=1714825403;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7feFsI4WVcCZqt8j1/zezoxOfm4nxdXTKy0SLTOZx4=;
 b=hMNVMkfo9skKNRs504nRJGQN3EH61wQQz3u0HX1qxkoBYcb4T3MrjN5pW1DmttgZ3V
 DaxzHqkAeTYUV2xztJQr/sBCqiR4NRcqC1xgEQx6AFZB/7ho+ncc2s1OPIentOIxcCBE
 +eOUyth798V9/doeRo+f5mgOHXDzZrYNseTLAdN3WW1qwH3FYv8pqQIZLugRSttzRIMp
 6m+O8mCO2hZgKa+OscVH/wny6RZFoEuSCrrmwYsTiheBneuxp8cA2UULK7pPo00xD4K2
 cSzWxGq3ggW8Uhzi6oyoZSSIdYlXnF+bCzXO6EyQLqJXj6x04ZclZQatzLeLaRBsvo3G
 hLsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFanebiee32if3dyRFZG8COivIarueazjOBu8JjM4LE8GUBftzTXH6/pkd8mPFEZjVM3msTCANXUyoNuh8FU1KkTQUHlG+AIFQjp0mhrb5
X-Gm-Message-State: AOJu0YyCXMxpMIP8x7Im/DnAXYBEo5E/sbIX9oRd3jv3Nh7m+GGC18B1
 veEejkvRpy3s5wr2SMZ07iPkHjk0Oabi93Z5NqaCIO7kMto/yG0A4rjivH7Lrm8=
X-Google-Smtp-Source: AGHT+IFbaj5sBTaVsCJGlICozBDXoIZ8kRg1Q7t9/iGxTf3ZXwP9MONYauqbj6euuh8E7QsT22Aieg==
X-Received: by 2002:a17:906:71d4:b0:a58:f143:b458 with SMTP id
 i20-20020a17090671d400b00a58f143b458mr74637ejk.62.1714220602983; 
 Sat, 27 Apr 2024 05:23:22 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 x21-20020a1709060a5500b00a521891f8cbsm11630570ejf.224.2024.04.27.05.23.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 05:23:22 -0700 (PDT)
Message-ID: <b1c4f42d-c730-438b-be96-bacb84c38547@linaro.org>
Date: Sat, 27 Apr 2024 14:23:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] drm/msm/a7xx: Add missing register writes from
 downstream
To: Connor Abbott <cwabbott0@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jun Nie <jun.nie@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com>
 <20240426-a750-raytracing-v2-6-562ac9866d63@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240426-a750-raytracing-v2-6-562ac9866d63@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 26.04.2024 8:34 PM, Connor Abbott wrote:
> This isn't known to fix anything yet, but it's a good idea to add it.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4a3b12b20802..d88ec857f1cb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1953,6 +1953,14 @@ static int hw_init(struct msm_gpu *gpu)
>  				  BIT(6) | BIT(5) | BIT(3) | BIT(2) | BIT(1));
>  	}
>  
> +	if (adreno_is_a750(adreno_gpu)) {
> +		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));

"/* Disable ubwc merged UFC request feature */"

> +
> +		gpu_write(gpu, REG_A6XX_TPL1_DBG_ECO_CNTL1, 0xc0700);

"/* Enable TP flaghint and other performance settings */"

> +	} else if (adreno_is_a7xx(adreno_gpu)) {
> +		gpu_rmw(gpu, REG_A6XX_RB_CMP_DBG_ECO_CNTL, BIT(19), BIT(19));

This is supposed to be bit(11) on !A750:

"/* Disable non-ubwc read reqs from passing write reqs */"

Konrad

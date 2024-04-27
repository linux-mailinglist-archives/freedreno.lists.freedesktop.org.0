Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541008B4659
	for <lists+freedreno@lfdr.de>; Sat, 27 Apr 2024 14:20:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2414010EDBE;
	Sat, 27 Apr 2024 12:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XmO2K+gG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDDF10EFC4
 for <freedreno@lists.freedesktop.org>; Sat, 27 Apr 2024 12:20:37 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a4715991c32so322981166b.1
 for <freedreno@lists.freedesktop.org>; Sat, 27 Apr 2024 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714220436; x=1714825236; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mSQsBtgmsU3uYBJujpqJQaj4SAUUA8XK3YqsMHQFkf8=;
 b=XmO2K+gGzVeWQIuZbp+yjNKtNO5wN6x+55kuGyw1E40IW8jlDDD/UXfmM+nMg0/wc3
 jwaRsGZt13li8FLHajUuuzCaTIlpAaBevD4ZrV1Fj7F61u2SQVcyPP4UOGcLNOeJDSQM
 Rgv1V2vHvtQpIbanbMOstPfwyaGUXtHRP/3phy0OdovltQB+YD+BZo+ZrwrZm/E0LzX6
 bWMMxkOc/FdI6bb4tzMP+Jm05xXS1YFjVJzPD/trkTy05lymLKuViDtEhXShsMiDmkko
 EHSQb9PPxKSpI5YVEh7FxTBIsssiVE2TnkxQjcZMySXgMESGEYUjl6r3gKg3dmq04PjT
 sMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714220436; x=1714825236;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mSQsBtgmsU3uYBJujpqJQaj4SAUUA8XK3YqsMHQFkf8=;
 b=hpPUN3tTOqS9r23Su93S8yKhVP3Z5m7vH8Z8dznm22WabwOQ3MxjMG/4xU1QSL+aSR
 HZ6xQFBDIGZm4fJ9uO4Q0mpfGfqGpwu0nlQ4+4u8uG61GOBguAg4CA+59H38Soqgyt2N
 AdGcTw6rWS68swb8PKSu9fvXDep66Pc3aw1BQIB5PX8kuAj2x/C+lGrhnTC+UN6xkMyA
 m05G2RDW2+GjePIvvMPve36lFque/mK3ohoF3J8pd2x2X9JoW0oKl4Bjv+t8mjCGve8i
 XcYln/4Ir0evtW6/rLqr2nP143BdVwZk6VYg5c4ODwOzC1hidZbtY+mVXD3vomOt3hkT
 57lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9iRsZcZwZXV6ajgayTIifF/GLPJFaBY/ds7IUyLiyeU5332+2RDlIaJvdAbmIt79h6dSXEq360RJNbjBBiSm1tKOkHA7dzMfIPBziE+oA
X-Gm-Message-State: AOJu0Yxk4xtbSWfO8mCeXu1/MvE/eAXDtI5jje4kapWJ9VIiGaqsJUM+
 rpr8e+oi/MI1W4q5Xvia3Cy0IwAFTjNjagIDD7bYDIZ6n+4ScKb6mN+bsNOiNWY=
X-Google-Smtp-Source: AGHT+IFz/JWwE6INIIuIxvGtKgZC7SjUWshhyGl4RxSGCf+fd1pANSyuUSznrF5FUQHUkJp1OQDfIg==
X-Received: by 2002:a17:906:b807:b0:a58:72a6:c5a3 with SMTP id
 dv7-20020a170906b80700b00a5872a6c5a3mr3493339ejb.51.1714220435855; 
 Sat, 27 Apr 2024 05:20:35 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 a11-20020a1709065f8b00b00a58ee439c39sm210374eju.217.2024.04.27.05.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Apr 2024 05:20:35 -0700 (PDT)
Message-ID: <63e34870-fb01-4769-aca9-8ac6843c12b3@linaro.org>
Date: Sat, 27 Apr 2024 14:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] drm/msm: Add MSM_PARAM_RAYTRACING uapi
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
 <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240426-a750-raytracing-v2-5-562ac9866d63@gmail.com>
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
> Expose the value of the software fuse to userspace.
> 
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
>  include/uapi/drm/msm_drm.h              | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 074fb498706f..99ad651857b2 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -376,6 +376,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
>  	case MSM_PARAM_HIGHEST_BANK_BIT:
>  		*value = adreno_gpu->ubwc_config.highest_bank_bit;
>  		return 0;
> +	case MSM_PARAM_RAYTRACING:
> +		*value = adreno_gpu->has_ray_tracing;
> +		return 0;

I'd personally go with MSM_PARAM_FEATURES as a u64 bitmap, but it's
not me that'll have to deal with this on the userland side, so:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

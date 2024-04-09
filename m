Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D88C89D9C5
	for <lists+freedreno@lfdr.de>; Tue,  9 Apr 2024 15:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03C1112D88;
	Tue,  9 Apr 2024 13:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ezJVGgUD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955F2112D8D
 for <freedreno@lists.freedesktop.org>; Tue,  9 Apr 2024 13:07:10 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2d82713f473so95748421fa.3
 for <freedreno@lists.freedesktop.org>; Tue, 09 Apr 2024 06:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712668028; x=1713272828; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mD9HahIS/u9+HSSzjjJzihLRc6+ONRfzq0lWek3XQms=;
 b=ezJVGgUD9vWe3kncItHGIHUQ6gQc3Nsva3zkcDHsZnoCbSSmCaxdKOzwkOa5B8PLoY
 DpGbpQV4m4noJeMubuMallu4Ewb91gmZVNQ5O9O1rVXQ1qA5VhGq2xKTgN2b1FPPfoh7
 wxwXWPYQDjgEIbNRlKcOqv2jYtwJ5QeedUcyHS1OFe0sD9vpLIgVgPMJO06qqpdVn6Gg
 xL3mU9NkHO/N1dpiZPjdFuBUKnpUG41CpJ+pknWj2ES/0wb/kBhr1z7F1MDTyti+pfeO
 PRv8R3uZHZ0gHfXUTcX8WQMVB9Er/OD0AKUtu4boShLEcEKacGdBGW21bj2lInE/5Jg4
 BylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712668028; x=1713272828;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mD9HahIS/u9+HSSzjjJzihLRc6+ONRfzq0lWek3XQms=;
 b=gBZwQVXaa/1dsJGKSCpXKosjxAd7bSs5ljtucA1kaef+hK+Y24D+OGpE0p+4A3P6mK
 yFlrib2TSV0kzre++ETXyzj/sGC8IGnXdTW+g2WJPWg0XR9p7v5csVNJSuT/De3c9zAm
 7anBdZUczbyASP4lIs49Gi0RhBywcQ3hpSTjDycR+Muetiyd1nfcfWsLA8v+iMREU/5a
 XN/R0TSmm3N0UwjGK0ycNmOyPmgcWDwlAPBjYGYLl5Ocg+hDi5CKAMDX6vXolM9wN1v6
 VvWmWQnn9pwMplNFFrS/ev11C0vxSn0I/ANMj8XayaVSz5zAxjPl/CtLtLwP1lqONnBt
 yHsQ==
X-Gm-Message-State: AOJu0YyULjoOkD/+NaYRBswVywBLG3ysF60PmMhP1I/Irk+Rns3ATSpw
 4YtdacoNg7x7SWW1Cs0cHNXSDgrJbqaYiHLEMgVm9waPhHaBDXJ4Qo2m2wnSIm8JozNkGsX5lZo
 Jh2w=
X-Google-Smtp-Source: AGHT+IECVOi5mERBh0lhbexEvVIRcOp7bZFWNoq9SWgbOnpPcHlP2Mqa5Ar2Ql0Cjq7XotzkTLG5uA==
X-Received: by 2002:a05:651c:1a28:b0:2d4:6a34:97bf with SMTP id
 by40-20020a05651c1a2800b002d46a3497bfmr12807180ljb.49.1712668028431; 
 Tue, 09 Apr 2024 06:07:08 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 l25-20020a2e8699000000b002d845ffd60bsm1557767lji.3.2024.04.09.06.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 06:07:08 -0700 (PDT)
Message-ID: <30d4c3bf-6fd8-4f5c-8628-e84b3746d4ca@linaro.org>
Date: Tue, 9 Apr 2024 15:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: fix CP cycles stat retrieval on a7xx
To: zan@falconsigh.net, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, robdclark@gmail.com,
 Zan Dobersek <zdobersek@igalia.com>
References: <20240409125700.651398-1-zan@falconsigh.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240409125700.651398-1-zan@falconsigh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 4/9/24 14:57, zan@falconsigh.net wrote:
> From: Zan Dobersek <zdobersek@igalia.com>
> 
> a7xx_submit() should use the a7xx variant of the RBBM_PERFCTR_CP register
> for retrieving the CP cycles value before and after the submitted command
> stream execution.
> 
> Signed-off-by: Zan Dobersek <zdobersek@igalia.com>
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> ---

Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>

Thanks!

Konrad

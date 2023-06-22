Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E173A86F
	for <lists+freedreno@lfdr.de>; Thu, 22 Jun 2023 20:43:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F1710E5A4;
	Thu, 22 Jun 2023 18:43:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E93410E5A4
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 18:43:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b46b11051aso86488581fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 11:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687459426; x=1690051426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6dRnycaB3AP334Fb6uAomoGnhJ7vG39LTkLzaBIFk44=;
 b=AlfRZXwK8UxUZA6aJ02mwY1OmVaJiGFBflSjyu/XPlQ3tSSjleflUNnUAgXb22I/IU
 C7T67D41AHU4Zz9ofK8EVkojsWer5VJ7fHQ/mQzzLg0d666CgBfhTC7tjvoydkbzmlZe
 Yf4FdRXN39IBgkehQiqY0ZTEbhvgZ5RPwOeNe5BEGzsqcN7wvjrGSiyt7yApwN4sC6iF
 uqyuIQuT7xNlSuxUp1r8nKsApy9pMq8hqlcCgKWoL+F9ne7YHPE9eR+NYiUr7lhRDTlQ
 9flJqKZUp5eB6NFsIoQEGWkE/WDgWp0rdT8nJeKMcKtjvTgw/SLpWOquMtKwxuOV597k
 Etbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459426; x=1690051426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6dRnycaB3AP334Fb6uAomoGnhJ7vG39LTkLzaBIFk44=;
 b=fLsTYwTMUWjaVkjQONghJx7jX98uoteFzyV5/2Tr2aCuhFp+4MeinWZB731BZ3Cmpa
 07Xbh0aIgEicM5ozs/cW1lSadD7cQ29zIDdBiCo183pS0XzERGlqGdhc3BJod6LoRNk5
 /Joa2RQRFp5GIHI6OemP/BYGL4LzFw43e2UlCiOEhxBxfg/DK7Gh5xLUJHXkkS49hYwG
 jXhK6a1DsRBFeJs2YHUK+6BxR0Wdb/civ1HpGDeSQSrQzz3lufyGWR4pbYX6sQwXAvUx
 7bRgy6U3PHzn4ewSuJvgkA+LlHNndRhXrLK3b1NZUN2Zp3S5xEHDe5WyDLMeSFhNZuMa
 hZOw==
X-Gm-Message-State: AC+VfDy8817pdWgvrrzhJMNbYtyx/aIDTKccsMqNl9jYPq7aibV3Vs5j
 RC+7UREnziwrrGEWmQls6C56/Q==
X-Google-Smtp-Source: ACHHUZ67cCLc2mNUuPFSD/Jh8swXlxU7En9u7t8+O8lyPR7iCOmc1Fqhssh8nplz/Zr/zvQ9+slolA==
X-Received: by 2002:a2e:a175:0:b0:2a8:a9f7:205b with SMTP id
 u21-20020a2ea175000000b002a8a9f7205bmr12168056ljl.36.1687459426140; 
 Thu, 22 Jun 2023 11:43:46 -0700 (PDT)
Received: from [10.2.145.31] ([193.65.47.217])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a2e3a04000000b002ad9a1bfa8esm1414772lja.1.2023.06.22.11.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 11:43:45 -0700 (PDT)
Message-ID: <1f259e13-0a49-f06e-9578-8de533115f92@linaro.org>
Date: Thu, 22 Jun 2023 21:43:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
 <20230620-topic-dsiphy_rpm-v2-1-a11a751f34f0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-1-a11a751f34f0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm/dsi: Use
 pm_runtime_resume_and_get to prevent refcnt leaks
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
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20/06/2023 14:43, Konrad Dybcio wrote:
> This helper has been introduced to avoid programmer errors (missing
> _put calls leading to dangling refcnt) when using pm_runtime_get, use it.
> 
> While at it, start checking the return value.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

What about also adding the following tag?

Fixes: 5c8290284402 ("drm/msm/dsi: Split PHY drivers to separate files")


-- 
With best wishes
Dmitry


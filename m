Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096E6E934F
	for <lists+freedreno@lfdr.de>; Thu, 20 Apr 2023 13:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E4A10E253;
	Thu, 20 Apr 2023 11:48:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A94810E20B
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 11:48:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec94eb6dcaso497491e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 20 Apr 2023 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681991287; x=1684583287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bbzxcashoCDQOSY342pzyq2G7WMo2lq5fOYuUvS4juM=;
 b=j/jHkLE3rW45/Eb7oViVdeEuTCbgLb3dJ1DaMd4dkcG01aQyARQoL9vKLJR2MAqee7
 9/3JlhAnHnLuU5TPyvUqpriI5zwG5X73t7jJvMB6ItPvtgLqClrqmHcWiDU3Fgr68EOt
 Pz/XwjHx8Mrv4E8ouFFU0BffiAqbKJ59MdCI/Vr+RxyP+dGsBQ7JrUIZCBn2n97qQZH2
 TX7GTJ3swuBByfoww/DVAh3x+0SUqiWdBhIXQx+Vko5CGEVs8GQYU1Iu3Y9gLauHr4me
 MjKBtTJdHvDteIYw7vS1pTGCbALFrcQPRW84yAevZ+wNzQ4N+9FCDincpXVOfcjvOMwY
 BgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681991287; x=1684583287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bbzxcashoCDQOSY342pzyq2G7WMo2lq5fOYuUvS4juM=;
 b=I2isgqz/9XreBvQYhW1Mp5GJSoXYVdOuMOeKBKzshdfM87kDQfYo2lXRwqMmelmiiJ
 ygS2bXNCc6nPkED/0D9y3mkSU4XcA9jJwrxoT9riZLOpnI/zhJSmaG/leI+U+qJ1k9Ir
 579SPDSkYmB1LuHPflWn74Ka3pwT3Jrg9SMUTzMQ6Gi6kRRRKC9bqjjAM/NLGN4ylGMW
 zebkLs6kKHabJxyT3kClaJNCFNE+aCRVaEjfW3GgWk4PxIvffAe/sk1TAjCquWN7FVpS
 dCedFrZhIQlxSAf3ms7xFKGP+uT1wqjc56H4I+PTRRUaVo4xXN1w+ng13nh5vKGAzt2c
 dn9w==
X-Gm-Message-State: AAQBX9cwoSjrxhbfBcch2gCjptYAUK9LNbTQDnKL8/BJzfzyUyHYP1nN
 I2ZnqwGOZUwXM8A4ftpRIOwalA==
X-Google-Smtp-Source: AKy350bDBd5I0jzSrTgkcplYpxYdInqlBZJb94gB+M0ExOUSpGan2r6Fowa9JWmLRx3tG5jrkzMKMg==
X-Received: by 2002:a19:f80b:0:b0:4eb:2523:e929 with SMTP id
 a11-20020a19f80b000000b004eb2523e929mr375118lff.43.1681991287486; 
 Thu, 20 Apr 2023 04:48:07 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 y21-20020ac24215000000b004ece331c830sm192447lfh.206.2023.04.20.04.48.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 04:48:07 -0700 (PDT)
Message-ID: <a2addd26-e027-c5f5-ee40-e8e5be9d866c@linaro.org>
Date: Thu, 20 Apr 2023 14:48:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230420-topic-dpu_gc-v1-0-d9d1a5e40917@linaro.org>
 <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230420-topic-dpu_gc-v1-1-d9d1a5e40917@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu1: Rename sm8150_dspp_blk to
 sdm845_dspp_blk
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

On 20/04/2023 04:14, Konrad Dybcio wrote:
> SDM845 was the first SoC to include both PCC v4 and GC v1.8.
> We don't currently support any other blocks but the common config
> for these two can be reused for a large amount of SoCs.
> 
> Rename it to indicate the origin of that combo.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>   9 files changed, 27 insertions(+), 27 deletions(-)

For the patch itself:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


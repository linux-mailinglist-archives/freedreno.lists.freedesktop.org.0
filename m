Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7000774A907
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 04:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84E110E4FC;
	Fri,  7 Jul 2023 02:29:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91B610E4FB
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 02:29:38 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb7b2e3dacso2117621e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 06 Jul 2023 19:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688696977; x=1691288977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t3ZR+ulk8qafSu0U6ApGONxyBOmiZshWsm+62zV4VR8=;
 b=SeutLac0YZ4NSuTvHgwey7e4gFIEN/mFlfmlV9rFaaTwqilhz1xZwH8yGbrLx4Xt+F
 GhjRL4mAyHn2S0pnEGPOUO4HUuiCEXWweuyL28ywnasYvxbdMKZdwvGKi+Q90yKe0GZf
 JOf1MDiETLRDO5HFQvFRZ1719feRk2NTcQ2nda2wPKxsM5DizxYnLt1FkO+jmMGY3LUr
 4E0hYnoelzhcG9QhszgOKTgnpE9IAcTjg7lh7P+tJULS6im7eNn+8CKLviizFKl0yXLG
 bEsaKbu7u31r8bT+7zhYklp2H5d+mbBaAL2VvDsoaJMGpYt4pAHiTt7JjKN8Zl1RFZis
 5heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688696977; x=1691288977;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t3ZR+ulk8qafSu0U6ApGONxyBOmiZshWsm+62zV4VR8=;
 b=fOQUCvY+2J1NIr182VZdkHhDAXKfStTWBexYW2rT4jEBKPt931yifNRzoQZa696fxW
 /HjzxtrNthq9jWEP99MQCHHVHgpYrxRIVs1BJSZ3Ue0fXCxztju69pgVHBgujuwAlFS5
 Ab3cf3amkqiCGO1YfadRDXAYk2laAhroXEJcFkxoUtMI79snp9Z8V48WEqt10ZeLDTmH
 nGst2Yvwz/zKX18f54X/DYL1zZgzLeJ8RRVfJgOJZ/sPwhw3397Yz0ibm7eQepExejgv
 0hZIxYIHADTqSUZS6hdQz61K9ui7bY+dDL+n1E2+bbjXMVL1841hG/LPmzvfq77z8wOH
 awPQ==
X-Gm-Message-State: ABy/qLZo49vrdzdIOY+zy5BW6vSrQQgCffK9jlGKkQc4/OyEU/jG1+ux
 W7CBjUSKXX5A3yV3H9s6r7HycQ==
X-Google-Smtp-Source: APBJJlGtzPjV14lMrIL+sZHD5ek9tOBcAzPG8LZjViHzqzrNlekFyda7ViGGtRfR7kU0hP1Z8p+ubQ==
X-Received: by 2002:a19:e04a:0:b0:4f8:5e65:b61b with SMTP id
 g10-20020a19e04a000000b004f85e65b61bmr2351048lfj.65.1688696976952; 
 Thu, 06 Jul 2023 19:29:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac25987000000b004fb8ff1f531sm478578lfn.70.2023.07.06.19.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 19:29:36 -0700 (PDT)
Message-ID: <60df0f9e-9a9c-e55b-6cab-3d89dd90bcdb@linaro.org>
Date: Fri, 7 Jul 2023 05:29:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-6-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230706211045.204925-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/07/2023 00:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It is better to explicitly list it.  With the move to opaque chip-id's
> for future devices, we should avoid trying to infer things like
> generation from the numerical value.

Would it be better to push this to DT? I mean, we already have a 
'dma-cache-coherent' property for it.

> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>   2 files changed, 17 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry


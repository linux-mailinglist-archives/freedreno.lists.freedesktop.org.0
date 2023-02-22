Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3C169FE46
	for <lists+freedreno@lfdr.de>; Wed, 22 Feb 2023 23:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2A010E446;
	Wed, 22 Feb 2023 22:14:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E9910E3E0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 22:14:18 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bp25so12103414lfb.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 Feb 2023 14:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UjstdsFXEibHGl/Lb52G1xWDsWybi8E8M5DwdeJhcIs=;
 b=twyGmbaU/1RhY0RdPkCK6+Lea3A559yLZcl/kj/CKz96X6rldpmMC62buH6qoCj0d1
 CvtHyCbQl301npBLnxKnSz/W8WPFHUXsyqYE1VTEI3p7gURuoeAdWwWbYq8SYD2uuGxS
 JGMCSSwq+RTMKbFk4kIM//9/qUz3XB8o4aXv0tASmWKm+ve802rI9QFgt7kDj9v4poHH
 7/18SbjsrnUvOs7jOgk+JLx4xcGdfH3GRDADFZtxEiYq2bdfdjvbZznfXWT8ZynanNe0
 Slke97a7WQrYDKc5tXxDYxJsV0EtQZ+m20nEJzOCiM8nO+8eeSgHaFjAJTBs6+WyiLmB
 brNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UjstdsFXEibHGl/Lb52G1xWDsWybi8E8M5DwdeJhcIs=;
 b=FO3uCReFOUSgG/87eNXT8Ji4thLLAk13VPOsjusdKpbCSe9D8l6yKRNhIiMXsMaBZX
 7weqzzS0RPkKWLAKdClxEQkvWGZWXNwJh7br45BK30T9ljMsWS+koGXCAvOKtLJJfBlJ
 D8IaJjBZ+Dmb5oET1988P9Fe+O2K2+ZsRV4OlbOACeIrwYO2Ge5E7FgEVGZjse8cznAu
 iuxAfb0nF7Fw/pCTTsSXokM6S1gOZC5SVmbbqjyErFGHUGdyk7f5x94rzyT8MW3qwfqW
 B2zTX06dBngGkyySriA14aws+3WoXdASaC+vN2A6Qo39THG2tfykUxwFO7Mhr1H+ZFCD
 S7fA==
X-Gm-Message-State: AO0yUKUK6PpFCTseJL3ykuT6S4beaCpmrTmj1WOmAgZXxwD5ThkfCNk9
 ee7bF8KIb9vXLQPOt97W5fE5aA==
X-Google-Smtp-Source: AK7set/62mcQ0JyjKXtslHGectPNhJZMscfA5O7SFwmkzjJ4VqR2IgcQbNwXUtQ7nBi1DdwsbL1KXQ==
X-Received: by 2002:ac2:5623:0:b0:4db:86f:86db with SMTP id
 b3-20020ac25623000000b004db086f86dbmr2802827lff.19.1677104056981; 
 Wed, 22 Feb 2023 14:14:16 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004db20d07decsm1193499lfh.209.2023.02.22.14.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 14:14:16 -0800 (PST)
Message-ID: <34cd34f8-86b1-0b8f-6812-fe613e9ffa82@linaro.org>
Date: Wed, 22 Feb 2023 23:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230222-konrad-longbois-next-v1-0-01021425781b@linaro.org>
 <20230222-konrad-longbois-next-v1-5-01021425781b@linaro.org>
 <4b9145e0-0526-dd08-2d92-05a49e50e3bc@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <4b9145e0-0526-dd08-2d92-05a49e50e3bc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/a5xx: Enable optional icc
 voting from OPP tables
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



On 22.02.2023 23:12, Dmitry Baryshkov wrote:
> On 22/02/2023 23:47, Konrad Dybcio wrote:
>> Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
>> handle bus voting as part of power level setting.
> 
> This can probably go to the generic code path rather than sticking it into a5xx only.
The reasoning is explained in the cover letter, a3xx/a4xx already
have "raw" icc set calls which would require more work (and above
all, testing) to untangle while keeping backwards compat, this is
a midterm solution that would allow getting scaling to work earlier.

Konrad
> 
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index d09221f97f71..a33af0cc27b6 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -1775,5 +1775,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>>       /* Set up the preemption specific bits and pieces for each ringbuffer */
>>       a5xx_preempt_init(gpu);
>>   +    ret = dev_pm_opp_of_find_icc_paths(&pdev->dev, NULL);
>> +    if (ret)
>> +        return ERR_PTR(ret);
>> +
>>       return gpu;
>>   }
>>
> 

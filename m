Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60A68A7D1
	for <lists+freedreno@lfdr.de>; Sat,  4 Feb 2023 03:30:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 293CB10E0B0;
	Sat,  4 Feb 2023 02:30:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E09410E0A9
 for <freedreno@lists.freedesktop.org>; Sat,  4 Feb 2023 02:29:59 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id ml19so20405277ejb.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 18:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iUH4Dpa4E/+p8DNNAiGBKYh1jmAMNSUIhKEu7c2nbrM=;
 b=fq7UUstALHqsXy9CinxI8gtwsRQwIwwzF+KlJEcH9dAvJTm1peLM9zoGHK6Z4vMIbt
 ej/z+y1tUutrX+p1NPAU3O8JGdEP5AhrnZSQ7SUZLv6G5uMBQs+JaooR00cCGRzpOzFH
 p/qk0CkWpSNMAHeMgWOd6eG6QOfDdHMPQMjgLmGoeqv9ZqDqKJKF/uv4jtdv8m/Uq4et
 lL2pHcX1oqTJ5AKuzM9IlPMKIe3kKCGbQPAlDOcJqU8X/QHSjpHMjUx4PzhOfNZiG1Pk
 QmaRS12Iq7nb1xX+t/k22mLFOCka7PS5z4KeNBnBb3gRsSXAfwNFeHmQA4P6Yh7yj/b0
 NlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iUH4Dpa4E/+p8DNNAiGBKYh1jmAMNSUIhKEu7c2nbrM=;
 b=zYRTQCTPchv+iHcT7Eu7CKB3nzeVk0qUWK27VhiyaiAdJBa+tR4UKFON3lDo7D5KYK
 rh130OpPVN6jcE7hVImM3q9vwERPBpUg2sIRqTWksdzHpJCgF9UwnIp0UxB6wEABHtMb
 Z001X8iZnd9gtulI1I3mwIFOHpmODCjCZxS3oq2tPPdk6QMEX+wA7b05fTzpUxWn9498
 0AVMVZ3tbH1PHWgTwEHV9c4tlhA5RwZ/g9x0gR718fW6Yv3IYwoms8y7PkJrpNIvUfVj
 oHWrx5pwoZNESMcjXTGQPjO+G3piFpfOYgHEh7lpfOqRPQzXaH19EF5vdPtX7IUeWwFI
 clUQ==
X-Gm-Message-State: AO0yUKVGrbe6fIobygZ5pb5BTXfdnUOaTXpTofXKQK6IrDl1GsOkewU5
 fr7aGX1H7X7YRsaHYmDNtD/YHg==
X-Google-Smtp-Source: AK7set8ODmOQ3oIjx+VLPwwyC6C4k23xPs4bcTwN/C3t7GloZ1dUNZsAiIqF3OFcleQSoWWEfY+qPQ==
X-Received: by 2002:a17:907:7ea9:b0:88d:ba89:184b with SMTP id
 qb41-20020a1709077ea900b0088dba89184bmr8043772ejc.28.1675477797729; 
 Fri, 03 Feb 2023 18:29:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 rn26-20020a170906d93a00b008845c668408sm2172049ejb.169.2023.02.03.18.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 18:29:57 -0800 (PST)
Message-ID: <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
Date: Sat, 4 Feb 2023 04:29:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA
 features in hw catalog
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/02/2023 01:35, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Downstream driver uses dpu->caps->smart_dma_rev to update
>> sspp->cap->features with the bit corresponding to the supported SmartDMA
>> version. Upstream driver does not do this, resulting in SSPP subdriver
>> not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
>> feature bits to dpu hw catalog.
>>
> 
> While reviewing this patch, I had a first hand experience of how we are 
> reusing SSPP bitmasks for so many chipsets but I think overall you got 
> them right here :)
> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index cf053e8f081e..fc818b0273e7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -21,13 +21,16 @@
>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>   #define VIG_SDM845_MASK \
>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>   #define VIG_SC7180_MASK \
>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>   #define VIG_SM8250_MASK \
>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>> @@ -42,6 +45,7 @@
>>   #define DMA_SDM845_MASK \
>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
>>       BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>       BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>   #define DMA_CURSOR_SDM845_MASK \
> 
> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other chipsets 
> like 8250, 8450, 8550.
> 
> At the moment, for visual validation of this series, I only have 
> sc7180/sc7280. We are leaving the rest for CI.
> 
> Was that an intentional approach?
> 
> If so, we will need tested-by tags from folks having 
> 8350/8450/8550/sc8280x,qcm2290?
> 
> I am only owning the visual validation on sc7280 atm.

I'm not quite sure what is your intent here. Are there any SoCs after 
845 that do not have SmartDMA 2.5? Or do you propose to enable SmartDMA 
only for the chipsets that we can visually test? That sounds strange.

-- 
With best wishes
Dmitry


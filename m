Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D36F9B26
	for <lists+freedreno@lfdr.de>; Sun,  7 May 2023 21:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1C410E2DB;
	Sun,  7 May 2023 19:21:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218CD10E2D9
 for <freedreno@lists.freedesktop.org>; Sun,  7 May 2023 19:21:39 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ac7707e34fso43863881fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 07 May 2023 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683487297; x=1686079297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ilIaaUgGIe/T7VjBbDBUFv46HH+1cV1VktC13wAxqEM=;
 b=g8cXPVF3pEcCTTAy3eb0rCKWBlCxNp6qmWHuZTFdU/+q3z2PgtqroklmpF+v/9JC1Z
 JUYFHn0L3VebnZ5hp+5P+HPJgZjLE1DgMXAZWR6GPhwHwmzHLTSjkqj8n2A0mKzNLfDL
 Trv7Ct1xARNspxDPn26WJyA0Au/2nlAxwCEMLnd2TVmdHSI0h3yUhFWxaR3MyZuboTU4
 iP+M5baSMnTWBM0aNsrxhfBkC5zKBaSca2ku4hiQlYomsTwGK2Wran66j+CSm5taUeko
 jn9pVFaLPgtws/qmDswrOXKNo1/+UahwjDMzRGf2oGUsSq32Z1vfUvikHszcp+apqC23
 JOhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683487297; x=1686079297;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ilIaaUgGIe/T7VjBbDBUFv46HH+1cV1VktC13wAxqEM=;
 b=OfzBOZGSOLbJ5qaiP2v1VAXgrD57g4eE7kLPc+tu8a6uzuLIp4GLgqvcMPDujHj6Vt
 LYpmsXh4QkO22lShzOvLWr14xWc1zv5Wl/FgcC6uVtqeGFYeGTUGO9XApPm+45es1y/X
 BcPIeoYky+6xNw4PjSKMqApUOnOr37n/KkPI+4XlZ4Di8XGyo4PDmUivz7bd85UO7qEf
 I6ojvGIhKxyOiXjtLj0pUtERg+2/vYIpT+QstmSCVu5Ie/eu/D4MonHHRi1YWzR/wbk8
 DkR+0m2UNDF6/KLcALRGcrITRhbMkuKviPuSoTgaZdTGqzdHTBV2563KSQ5OajyTXKjC
 d4Ig==
X-Gm-Message-State: AC+VfDwoe09p/qR/7p52PYInjFDcV70GoHUM0wNQxesSAF2+qQiGImPJ
 SiciWDRfKlLK1WjTK2EsEt6VXw==
X-Google-Smtp-Source: ACHHUZ6u2ZsMf3oCE1a5P4CYAeq5aTNQK5jMk9qfQFgQnY1Ies56vQm401hwNCETK25KSohQcUeWYQ==
X-Received: by 2002:a19:ae1a:0:b0:4f2:4d0a:7bdf with SMTP id
 f26-20020a19ae1a000000b004f24d0a7bdfmr469302lfc.52.1683487296869; 
 Sun, 07 May 2023 12:21:36 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 k8-20020ac24568000000b004efeaaabdcdsm1047700lfm.30.2023.05.07.12.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 12:21:36 -0700 (PDT)
Message-ID: <a5748e3d-3f8d-b1ff-c40b-ee40dcfe6f2e@linaro.org>
Date: Sun, 7 May 2023 22:21:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: Add
 DPU_INTF_DATA_COMPRESS feature flag
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 07/05/2023 19:00, Marijn Suijten wrote:
> On 2023-05-05 14:23:50, Jessica Zhang wrote:
>> Add DATA_COMPRESS feature flag to DPU INTF block.
>>
>> In DPU 7.x and later, DSC/DCE enablement registers have been moved from
>> PINGPONG to INTF.
>>
>> As core_rev (and related macros) was removed from the dpu_kms struct, the
>> most straightforward way to indicate the presence of this register would be
>> to have a feature flag.
> 
> Irrelevant.  Even though core_rev was still in mainline until recently,
> we always hardcoded the features in the catalog and only used core_rev
> to select a dpu_mdss_cfg catalog entry.  There is no "if version >= X
> then enable feature Y" logic, this manually-enabled feature flag is the
> only, correct way to do it.
> 
>> Changes in v2:
>> - Changed has_data_compress dpu_cap to a DATA_COMPRESS INTF feature flag
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 7944481d0a33..c74051906d05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -104,7 +104,7 @@
>>   #define INTF_SC7180_MASK \
>>   	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>>   
>> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)
> 
> Konrad: Your SM6350/SM6375 series v3 [1] switched from INTF_SC7180_MASK
> to INTF_SC7280_MASK to enable HCTL on SM6375, but that will now
> erroneously also receive this feature flag and write the new
> DATA_COMPESS mask even if it's DPU 6.9 (< 7.x where it got added).

Yeah, that's why I had the idea of including at least the DPU major in 
the mask name.

It looks like we should enable DPU_DATA_HCTL_EN at least for 
sm8150/sm8250 (and other DPU 6.x) too. I am not sure if it is present on 
sdm845.

> 
> [1]: https://lore.kernel.org/linux-arm-msm/80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org/T/#u
> 
> Depending on who lands first, this flag should be split.
> 
> I still see value in inlining and removing these defines, though that
> brings a host of other complexity.
> 
> - Marijn
> 
>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>   			 BIT(DPU_WB_UBWC) | \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 4eda2cc847ef..01c65f940f2a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -185,6 +185,7 @@ enum {
>>    * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>>    *                                  than video timing
>>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>> + * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>>    * @DPU_INTF_MAX
>>    */
>>   enum {
>> @@ -192,6 +193,7 @@ enum {
>>   	DPU_INTF_TE,
>>   	DPU_DATA_HCTL_EN,
>>   	DPU_INTF_STATUS_SUPPORTED,
>> +	DPU_INTF_DATA_COMPRESS,
>>   	DPU_INTF_MAX
>>   };
>>   
>>
>> -- 
>> 2.40.1
>>

-- 
With best wishes
Dmitry


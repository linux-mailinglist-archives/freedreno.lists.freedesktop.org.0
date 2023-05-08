Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C36FA262
	for <lists+freedreno@lfdr.de>; Mon,  8 May 2023 10:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D38210E185;
	Mon,  8 May 2023 08:36:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3460810E185
 for <freedreno@lists.freedesktop.org>; Mon,  8 May 2023 08:36:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4ecb137af7eso4771555e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 May 2023 01:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683534971; x=1686126971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7vOeK6NJXfng1Er3sfGOPlcD75JIf3x+ne87klUAZe8=;
 b=VjTc2e0tCdENNTGTlYaTu6SbmL+2zAqbhOvhqn8Ke3GrBw0BulOfpPKx61Gnsq+pau
 M97jxNpDaGyMW/osQhp3kBshxpA+lq1IZikHIjue/85Ye3S+zucnAIriJRfMjfKv91XR
 LXpKbcxRWPMkjOWfzBeqUKqb7sO5Tha6rVHExUgAiWXPOrk0KZsN1S5+VrT+AcbkXMhC
 nPuVH3iUsGdjUPSI/8SaEMgn4GZohy/J/J2mdHV6i/+9haCNoFx6/BYxpxKFTdSW8qXJ
 J/O3SefH9o5JXrkzC7cwR4tc+su3M2iLQcHon98PVnTrwxciiN7ExjmgJRWaQ83ztIYC
 sBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683534971; x=1686126971;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7vOeK6NJXfng1Er3sfGOPlcD75JIf3x+ne87klUAZe8=;
 b=Xm+8DaxC+BriBKdo6X6j7bbut9NB+93qrprRR4TELEuMqVYdp56Donvf/WMN5/1Qit
 gwOpl/am4yPcZb/CjAy7YbU/c7KY/3jNtte/knW+GiupkgRns/0IAQYy6SNGEeBFrPpZ
 Wvp7aL9/spc1+3tOKabhzKl5XWuHfm4vgpz2O5vawcburJ4vOrTJ9dS4zyFqnQSp8eLI
 rKtW7LVtv2jLGSLBANZ9Q8rzDRnlBYdJMgnZ7fwIBNPD4v/iqedstg0/sS2oqCGLfXgM
 rptVw6C4B3cfp+jRijdKRWURdOpszRteIi8pWAi3RMDI1Ylbebrh6T6GczwfromD14pJ
 VtiA==
X-Gm-Message-State: AC+VfDz6C2ZIPkFAxlksYdNdttGFu16NJq/cYHITTZdQqAHK16MVIhof
 nnhPd5fzFqbob5fyW9RmS8aKrQ==
X-Google-Smtp-Source: ACHHUZ6/bXi/Yh+/jHrYdIbEzAMWQSkOek/BIP7BFnilquyHz/JZcmKS5cfq6hr+S1+7VeyczkzauA==
X-Received: by 2002:ac2:47e5:0:b0:4ef:ec94:9678 with SMTP id
 b5-20020ac247e5000000b004efec949678mr2744507lfp.20.1683534971320; 
 Mon, 08 May 2023 01:36:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 v9-20020ac25609000000b004efee4ff266sm1230248lfd.67.2023.05.08.01.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 01:36:10 -0700 (PDT)
Message-ID: <6b93e2a9-58aa-bb91-f615-3fdec52596da@linaro.org>
Date: Mon, 8 May 2023 10:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
References: <20230405-add-dsc-support-v2-0-1072c70e9786@quicinc.com>
 <20230405-add-dsc-support-v2-3-1072c70e9786@quicinc.com>
 <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <i6i2xj2tuy5mcxsj674d77kfdb3ne6immkmrzw5f6u4bfx2sth@ef7fzrhdyypx>
Content-Type: text/plain; charset=UTF-8
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
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 7.05.2023 18:00, Marijn Suijten wrote:
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
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 7944481d0a33..c74051906d05 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -104,7 +104,7 @@
>>  #define INTF_SC7180_MASK \
>>  	(BIT(DPU_INTF_INPUT_CTRL) | BIT(DPU_INTF_TE) | BIT(DPU_INTF_STATUS_SUPPORTED))
>>  
>> -#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN)
>> +#define INTF_SC7280_MASK INTF_SC7180_MASK | BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_DATA_COMPRESS)
> 
> Konrad: Your SM6350/SM6375 series v3 [1] switched from INTF_SC7180_MASK
> to INTF_SC7280_MASK to enable HCTL on SM6375, but that will now
> erroneously also receive this feature flag and write the new
> DATA_COMPESS mask even if it's DPU 6.9 (< 7.x where it got added).
> 
> [1]: https://lore.kernel.org/linux-arm-msm/80b46fcb-d6d0-1998-c273-5401fa924c7d@linaro.org/T/#u
> 
> Depending on who lands first, this flag should be split.
I'll adapt my patches. Jessica, no changes required on your side.

> 
> I still see value in inlining and removing these defines, though that
> brings a host of other complexity.
right, we should totally do it after we settle down from the patch
flurry

Konrad
> 
> - Marijn
> 
>>  #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>  			 BIT(DPU_WB_UBWC) | \
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 4eda2cc847ef..01c65f940f2a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -185,6 +185,7 @@ enum {
>>   * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
>>   *                                  than video timing
>>   * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>> + * @DPU_INTF_DATA_COMPRESS          INTF block has DATA_COMPRESS register
>>   * @DPU_INTF_MAX
>>   */
>>  enum {
>> @@ -192,6 +193,7 @@ enum {
>>  	DPU_INTF_TE,
>>  	DPU_DATA_HCTL_EN,
>>  	DPU_INTF_STATUS_SUPPORTED,
>> +	DPU_INTF_DATA_COMPRESS,
>>  	DPU_INTF_MAX
>>  };
>>  
>>
>> -- 
>> 2.40.1
>>

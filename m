Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E05624BC4
	for <lists+freedreno@lfdr.de>; Thu, 10 Nov 2022 21:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA68910E864;
	Thu, 10 Nov 2022 20:28:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4DE10E864
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 20:28:21 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c25so2253316ljr.8
 for <freedreno@lists.freedesktop.org>; Thu, 10 Nov 2022 12:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sd9YOa98jTIDGnNoAp2N24NxIMGU6LQKL4kGMhofZN8=;
 b=aJz+sgQqS/24bjUmgjwjEKfkanziTrN8PgcLoslW40Mt9RT3dOdGlM3s7i7BQjOBur
 YFn4PQLjQckQ6rOfkKmDeGcMg/WjE82ABnKJSEvGyWrWrLWh36bm23CwGmS6Z7pEB2GP
 e4Pg64fwB/7efulqWTZVqbp9F/tM0kKklj0+WMiL20gUG+d1ku0RLkJeuTbBdSyPvf+4
 H9qS2UTmJ4+huBuxI5F/cX2+s2f6mHTeI68kF3oogjobF9G70NhzI5WbtEQzPRONFTHs
 SYa/41jKKT7t6pgUjOu66mGCfY4BgChGCaTugRoFpbPbMXTiQUCBzpKnwy9hw1MhJUQX
 GS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sd9YOa98jTIDGnNoAp2N24NxIMGU6LQKL4kGMhofZN8=;
 b=Yhrp96gez6Q4Q4ocCWg9zLTUK49f3duNqnWrZR8ofSuxQb/DsJflNhlsZPBUVVKObf
 qS+icgRqrHkGh2JY9c/t7scEx8N6Tfj5FBgcLgWrZG0TyoL57fwY7FmOc+ndp0B4eVcM
 zSGIvVDihxu1J4x1N0744QDcBeZcB08KY8ts3mTGUfvIsQX4qB2jwTZrBfHvp5a9zS0R
 9oDbXC8Sfu0V7Z5hR+1UzXj3Hgs7U3VyxO3rUNCyDtFMUzL4uyTYlCtYQ6nE9+5jjWpM
 VhtR7rdUpksV79AdXYxsikCYzOQk2kTcae9xhFt5bnYiyuHEjOam65Ugd4h6iULn2PRG
 4lMg==
X-Gm-Message-State: ACrzQf0xLceLR7zAJJjW0M0hVs2hgjQKgB+XYi4Mq3QMRnv6RPoqoVXl
 WD57b3Oxi8ADo5gWI+IgKPhVyg==
X-Google-Smtp-Source: AMsMyM7T6B7QKw+xW4apR9Cn3zi9ueQCGkpBoppy+5oFE8mV3RD0E+wT+JQTCbqK8ade+2Du8t8xPw==
X-Received: by 2002:a2e:80c4:0:b0:277:fa0:d500 with SMTP id
 r4-20020a2e80c4000000b002770fa0d500mr9170257ljg.51.1668112099609; 
 Thu, 10 Nov 2022 12:28:19 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a05651220c200b00499bf7605afsm10183lfr.143.2022.11.10.12.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 12:28:19 -0800 (PST)
Message-ID: <fc7a4a61-75e2-2111-39f5-7c7103f1c6dd@linaro.org>
Date: Thu, 10 Nov 2022 23:28:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-8-dmitry.baryshkov@linaro.org>
 <d171b737-0d46-df31-05ad-c35593d8dbf5@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d171b737-0d46-df31-05ad-c35593d8dbf5@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH v3 7/8] drm/msm/dpu: add support for SM8450
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 04/11/2022 17:12, Konrad Dybcio wrote:
> 
> On 04/11/2022 14:03, Dmitry Baryshkov wrote:
>> Add definitions for the display hardware used on Qualcomm SM8450
>> platform.
>>
>> Tested-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> 
> Konrad
> 
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>>   4 files changed, 229 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> index 1ce237e18506..3934d8976833 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>> @@ -124,6 +124,15 @@
>>                 BIT(MDP_AD4_0_INTR) | \
>>                 BIT(MDP_AD4_1_INTR))
>> +#define IRQ_SM8450_MASK (BIT(MDP_SSPP_TOP0_INTR) | \
>> +             BIT(MDP_SSPP_TOP0_INTR2) | \
>> +             BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>> +             BIT(MDP_INTF0_7xxx_INTR) | \
>> +             BIT(MDP_INTF1_7xxx_INTR) | \
>> +             BIT(MDP_INTF2_7xxx_INTR) | \
>> +             BIT(MDP_INTF3_7xxx_INTR) | \
>> +             0)
>> +
>>   #define WB_SM8250_MASK (BIT(DPU_WB_LINE_MODE) | \
>>                BIT(DPU_WB_UBWC) | \
>>                BIT(DPU_WB_YUV_CONFIG) | \
>> @@ -367,6 +376,20 @@ static const struct dpu_caps sm8250_dpu_caps = {
>>       .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>>   };
>> +static const struct dpu_caps sm8450_dpu_caps = {
>> +    .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +    .max_mixer_blendstages = 0xb,
>> +    .qseed_type = DPU_SSPP_SCALER_QSEED4,
>> +    .smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>> +    .ubwc_version = DPU_HW_UBWC_VER_40,
>> +    .has_src_split = true,
>> +    .has_dim_layer = true,
>> +    .has_idle_pc = true,
>> +    .has_3d_merge = true,
>> +    .max_linewidth = 5120,
>> +    .pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};
>> +
>>   static const struct dpu_caps sc7280_dpu_caps = {
>>       .max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>>       .max_mixer_blendstages = 0x7,
>> @@ -504,6 +527,33 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
>>       },
>>   };
>> +static const struct dpu_mdp_cfg sm8450_mdp[] = {
>> +    {
>> +    .name = "top_0", .id = MDP_TOP,
>> +    .base = 0x0, .len = 0x494,
>> +    .features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>> +    .highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
> 
> I think it's about time we handle the two-memory-configs situation..
> 
> In my opinion, a dt property would be sane (just like downstream does 
> it), as it's
> 
> *really really really* unlikely that the same SKU would be shipped with 
> 2 different memory gens.

As it's really unlikely, I think we can drop the TODO comment completely 
until we phase a device with different memory type. WDYT?

-- 
With best wishes
Dmitry


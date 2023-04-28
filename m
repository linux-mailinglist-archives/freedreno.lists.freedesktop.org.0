Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2166F18C0
	for <lists+freedreno@lfdr.de>; Fri, 28 Apr 2023 15:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB9210ED3B;
	Fri, 28 Apr 2023 13:04:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73210ED3B
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 13:03:58 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fbfso77516515e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 28 Apr 2023 06:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682687036; x=1685279036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4MbMbUlATowXc/GzzFK/6qJA+BvJceVnEgx9z4d/BqQ=;
 b=GQp4dAAxlfimW0+Et26rBMrNuOs8/Gx5NMF9vQB0oOIv9hb4B38fGYJwVPzfMeTOU2
 U1XfhZtkKfzCJqo7jx2/Rfq0AHkXS34VIESGwxSKxCMAsuYS5NQfg2l2uVIpYH6ShYxh
 u2DpVEXIvGQVATVj+SP849by97JEM4gYwbdY7rl3aOaWYULXfTNd18OYi6MFHyyLEf5r
 BQB86G9IFvFPIPFIGW2iu78MlbBunY/LZlnpnn21d77mqpl/XjUvhftynd1xTVewrCCB
 LszQ6dRzPi2SstoXczR97SZUJxkHtsChbF2XF+W+zo56VpJSqv0PA8hQmkCoF2JDbVuI
 Jmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682687036; x=1685279036;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4MbMbUlATowXc/GzzFK/6qJA+BvJceVnEgx9z4d/BqQ=;
 b=V4GwdzZU+S7ic1gjXC5y3KWG1APKdCVCBZ9LQGNW1W9c9vxSxOJVI/cnNCEgSHeKPq
 ThUxX1uE7A7JYQYi+q9SKBQwWV3qM7J/wl9F6HiMZudTWs2wiwOPwuqaViwNuO+z0jc9
 sHDSng5MTIfCFCNGXOkdRiXhcR9eFg3V86zr6MpLmA9KXRVoT2VVoZP5i8ewWErNEExI
 dfiw4rrUFwARNyAmEcr2eY2GnsrUADc2cTo3ofxFBFrRDjQBqFGK8JHELs1T904U346h
 CSYqgSGZm61OaPQhXsl3B22FK+iig7tHgvRhxiLSrQCXOAJPoPSy4SQ0KTj/GdNxfojM
 5UjQ==
X-Gm-Message-State: AC+VfDyt00b9WDxAiFMAKeOPPKCEZ9BMyAcBAoCX5ClauqwcjGMJjKH+
 wdFTQ5rMK88ymPAmEjSF6AEk+A==
X-Google-Smtp-Source: ACHHUZ5endThDS00P6ln9T3nn6TybpccCQT4dI8fMsO8gyLFTiuj00nOgyEw/vNPvZ1PDE+TEK7inQ==
X-Received: by 2002:a05:600c:d7:b0:3f2:51e7:f110 with SMTP id
 u23-20020a05600c00d700b003f251e7f110mr3715783wmm.32.1682687036381; 
 Fri, 28 Apr 2023 06:03:56 -0700 (PDT)
Received: from [172.23.2.5] ([31.221.30.162]) by smtp.gmail.com with ESMTPSA id
 k25-20020a05600c081900b003f17122587bsm27702230wmp.36.2023.04.28.06.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 06:03:55 -0700 (PDT)
Message-ID: <bfed3b0a-9672-fa59-5591-27ad17f5e96c@linaro.org>
Date: Fri, 28 Apr 2023 16:03:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-7-5def73f50980@linaro.org>
 <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <k25jg7cez2kimpxr4ztbdzjr2adq6a2vjknyvfe5frxujtogfg@vhfdyt45unv6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 07/13] drm/msm/dpu: Add SM6350 support
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 27/04/2023 18:37, Marijn Suijten wrote:
> On 2023-04-21 00:31:16, Konrad Dybcio wrote:
>> Add SM6350 support to the DPU1 driver to enable display output.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> After addressing the comments from Dmitry (CURSOR0->DMA1 and
> CURSOR1->DMA2), this is:
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 
> See below for some nits.
> 
>> ---
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 191 +++++++++++++++++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   3 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>>   4 files changed, 196 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> new file mode 100644
>> index 000000000000..687a508cbaa6
>> --- /dev/null
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
>> @@ -0,0 +1,191 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
>> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
>> + * Copyright (c) 2023, Linaro Limited
>> + */
>> +
>> +#ifndef _DPU_6_4_SM6350_H
>> +#define _DPU_6_4_SM6350_H
>> +
>> +static const struct dpu_caps sm6350_dpu_caps = {
>> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +	.max_mixer_blendstages = 0x7,
>> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> 
> I thought it was QSEED3LITE, but doesn't really matter as both are
> handled similarly.  It'll anyway change when I resubmit:

If I understood correctly, we mixed two things: hw stuff and the 
userspace library. QSEEDv2 was a hardware scaler. "qseedv3/v3lite/v4" 
are software library names that are used with the scalers newer than 
QSEED2. From the driver point we can ignore that and use scaler's hw 
version (which mostly but not always corresponds to the 3/3lite/4).

> 
> https://lore.kernel.org/linux-arm-msm/20230215-sspp-scaler-version-v1-0-416b1500b85b@somainline.org/T/#u
> 
> which should hardcode the register value directly, making this field
> superfluous.
> 
>> +	.has_src_split = true,
>> +	.has_dim_layer = true,
>> +	.has_idle_pc = true,
>> +	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
>> +};

-- 
With best wishes
Dmitry


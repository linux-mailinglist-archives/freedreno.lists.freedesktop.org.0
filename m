Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1174573DB85
	for <lists+freedreno@lfdr.de>; Mon, 26 Jun 2023 11:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D03F10E1C7;
	Mon, 26 Jun 2023 09:38:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DDD10E1C1
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jun 2023 09:38:01 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso841292e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jun 2023 02:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687772278; x=1690364278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HntGu0tHmgccyrJp9do4C9iS153gRi8tQo8VIX2fQsc=;
 b=YPNrdx/H3DhQD+dxZLPJh0Qb6ZTWUSwRvTgt5m6CShDLlLpYJg1oHBUZv1muqRgXjz
 BA5aAAVUUrVvnzaD59YATd+S4UmtBlt9UOeJ7ub0hyn2w1fw5MFqjWcQw2OofMcFMLm6
 izHL5FSbiBFTixFGHLxVkQ8P6nneQhij+wkyZ8L8n56fJsDubBRZQTnqBAaRecIng7Bj
 MI804yWxiICMtxzC5XJGf1ooON45FOKW1axXxGjT97Q1EVlplCz15voCmyvp1k4P5go/
 OWziH5tGh3QuzVC+oZLrEcGz8djhGdcA4HvkhSHEbaXer9tZNGJmC8w2aBk+sOS0McSx
 XlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687772278; x=1690364278;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HntGu0tHmgccyrJp9do4C9iS153gRi8tQo8VIX2fQsc=;
 b=lgMqhmm2sTyEOn9FVTIb8UWQsEMbyU4Xh/FD8/e5rAySrh8cjqaWp8NSVTfuzvhGdA
 fn1gS7teLw0HUp1lDhKOQH+zLirc9Wr4ub68pIZ6jyQ54Q9aJvKhLi1l0H1DAC2jRTsX
 SlFFQkrQw5TRayJMd/EH/Lt177tFn1v7vIqY96fQJuqMczzIVg0HgdSdamc/MHzRTzJo
 u8Diyz0cijJ+cad+/psFfhuaxma9mV4l44so+x79Qwb79YJmsKvQDKWUDSrI69Im14gi
 lSiEYuD1aNoalsrMXmK3LtRK+GLWXhXniCQZH+00SXYj5F1UIdOo5WcFTI2soOerC1s2
 M6cA==
X-Gm-Message-State: AC+VfDxkMx4sRmjveuCktdrgjm0rBceKn3xQwv4EXv/hpbEL/J1qsYzF
 YxsouEPsS/eVrZBbbYoZabyOlg==
X-Google-Smtp-Source: ACHHUZ4Xajymenc5txNv7UpHLVte7g5o3I5DJxUsWEX7tPlNPTQRCWdEcghJR2pWFmpkq67kmo4aVA==
X-Received: by 2002:a19:ca50:0:b0:4f8:5792:37d7 with SMTP id
 h16-20020a19ca50000000b004f8579237d7mr15049605lfj.67.1687772278363; 
 Mon, 26 Jun 2023 02:37:58 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
 by smtp.gmail.com with ESMTPSA id
 e24-20020ac25478000000b004f8675548ebsm1031105lfn.20.2023.06.26.02.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 02:37:58 -0700 (PDT)
Message-ID: <459eef2b-4d66-e6cb-32b4-69cdb1a586fe@linaro.org>
Date: Mon, 26 Jun 2023 11:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-8-1d5a638cebf2@somainline.org>
 <d836cdaa-7d67-82b1-baa6-6d2f8c761b1a@linaro.org>
 <eeyexowcbjmqpmw6xps6ewczamehhyopjkvd2tg72soirpla2r@ydtuxti4r6xk>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <eeyexowcbjmqpmw6xps6ewczamehhyopjkvd2tg72soirpla2r@ydtuxti4r6xk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 08/15] drm/msm/dpu: Add SM6125 support
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 25.06.2023 22:19, Marijn Suijten wrote:
> On 2023-06-24 03:47:27, Konrad Dybcio wrote:
>> On 24.06.2023 02:41, Marijn Suijten wrote:
>>> Add definitions for the display hardware used on the Qualcomm SM6125
>>> platform.
>>>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>> [...]
>>
>>> +static const struct dpu_perf_cfg sm6125_perf_data = {
>>> +	.max_bw_low = 4100000,
>>> +	.max_bw_high = 4100000,
>>> +	.min_core_ib = 2400000,
>>> +	.min_llcc_ib = 800000,
>> While Dmitry will likely validate other values
> 
> Lovely.
> 
>> I can tell you already that this SoC has no LLCC.
> 
> Copy-paste error on downstream?
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.14/-/blob/LA.UM.9.11.c25/arch/arm64/boot/dts/qcom/trinket-sde.dtsi#L146
> 
> - Marijn
Yes.

This code is bogus anyway and is just supposed to vote on DDR_FREQ_MIN

Konrad
> 
>>
>> Konrad
>>> +	.min_dram_ib = 800000,
>>> +	.min_prefill_lines = 24,
>>> +	.danger_lut_tbl = {0xf, 0xffff, 0x0},
>>> +	.safe_lut_tbl = {0xfff8, 0xf000, 0xffff},
>>> +	.qos_lut_tbl = {
>>> +		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
>>> +		.entries = sm8150_qos_linear
>>> +		},
>>> +		{.nentry = ARRAY_SIZE(sc7180_qos_macrotile),
>>> +		.entries = sc7180_qos_macrotile
>>> +		},
>>> +		{.nentry = ARRAY_SIZE(sc7180_qos_nrt),
>>> +		.entries = sc7180_qos_nrt
>>> +		},
>>> +		/* TODO: macrotile-qseed is different from macrotile */
>>> +	},
>>> +	.cdp_cfg = {
>>> +		{.rd_enable = 1, .wr_enable = 1},
>>> +		{.rd_enable = 1, .wr_enable = 0}
>>> +	},
>>> +	.clk_inefficiency_factor = 105,
>>> +	.bw_inefficiency_factor = 120,
>>> +};
>>> +
>>> +const struct dpu_mdss_cfg dpu_sm6125_cfg = {
>>> +	.caps = &sm6125_dpu_caps,
>>> +	.ubwc = &sm6125_ubwc_cfg,
>>> +	.mdp_count = ARRAY_SIZE(sm6125_mdp),
>>> +	.mdp = sm6125_mdp,
>>> +	.ctl_count = ARRAY_SIZE(sm6125_ctl),
>>> +	.ctl = sm6125_ctl,
>>> +	.sspp_count = ARRAY_SIZE(sm6125_sspp),
>>> +	.sspp = sm6125_sspp,
>>> +	.mixer_count = ARRAY_SIZE(sm6125_lm),
>>> +	.mixer = sm6125_lm,
>>> +	.dspp_count = ARRAY_SIZE(sm6125_dspp),
>>> +	.dspp = sm6125_dspp,
>>> +	.pingpong_count = ARRAY_SIZE(sm6125_pp),
>>> +	.pingpong = sm6125_pp,
>>> +	.intf_count = ARRAY_SIZE(sm6125_intf),
>>> +	.intf = sm6125_intf,
>>> +	.vbif_count = ARRAY_SIZE(sdm845_vbif),
>>> +	.vbif = sdm845_vbif,
>>> +	.perf = &sm6125_perf_data,
>>> +	.mdss_irqs = BIT(MDP_SSPP_TOP0_INTR) | \
>>> +		     BIT(MDP_SSPP_TOP0_INTR2) | \
>>> +		     BIT(MDP_SSPP_TOP0_HIST_INTR) | \
>>> +		     BIT(MDP_INTF0_INTR) | \
>>> +		     BIT(MDP_INTF1_INTR) | \
>>> +		     BIT(MDP_INTF1_TEAR_INTR),
>>> +};
>>> +
>>> +#endif
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 0de507d4d7b7..8a02bbdaae8a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -33,6 +33,9 @@
>>>  #define VIG_SC7180_MASK \
>>>  	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
>>>  
>>> +#define VIG_SM6125_MASK \
>>> +	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>> +
>>>  #define VIG_SC7180_MASK_SDMA \
>>>  	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>>>  
>>> @@ -348,6 +351,8 @@ static const struct dpu_sspp_sub_blks sc7280_vig_sblk_0 =
>>>  
>>>  static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
>>>  				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
>>> +static const struct dpu_sspp_sub_blks sm6125_vig_sblk_0 =
>>> +				_VIG_SBLK("0", 3, DPU_SSPP_SCALER_QSEED3LITE);
>>>  
>>>  static const struct dpu_sspp_sub_blks sm8250_vig_sblk_0 =
>>>  				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
>>> @@ -762,6 +767,7 @@ static const struct dpu_qos_lut_entry sc7180_qos_nrt[] = {
>>>  
>>>  #include "catalog/dpu_5_0_sm8150.h"
>>>  #include "catalog/dpu_5_1_sc8180x.h"
>>> +#include "catalog/dpu_5_4_sm6125.h"
>>>  
>>>  #include "catalog/dpu_6_0_sm8250.h"
>>>  #include "catalog/dpu_6_2_sc7180.h"
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index b860784ade72..4314235cb2b8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -861,6 +861,7 @@ extern const struct dpu_mdss_cfg dpu_sc8180x_cfg;
>>>  extern const struct dpu_mdss_cfg dpu_sm8250_cfg;
>>>  extern const struct dpu_mdss_cfg dpu_sc7180_cfg;
>>>  extern const struct dpu_mdss_cfg dpu_sm6115_cfg;
>>> +extern const struct dpu_mdss_cfg dpu_sm6125_cfg;
>>>  extern const struct dpu_mdss_cfg dpu_sm6350_cfg;
>>>  extern const struct dpu_mdss_cfg dpu_qcm2290_cfg;
>>>  extern const struct dpu_mdss_cfg dpu_sm6375_cfg;
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index aa8499de1b9f..a1c7ffb6dffb 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -1305,6 +1305,7 @@ static const struct of_device_id dpu_dt_match[] = {
>>>  	{ .compatible = "qcom,sc8180x-dpu", .data = &dpu_sc8180x_cfg, },
>>>  	{ .compatible = "qcom,sc8280xp-dpu", .data = &dpu_sc8280xp_cfg, },
>>>  	{ .compatible = "qcom,sm6115-dpu", .data = &dpu_sm6115_cfg, },
>>> +	{ .compatible = "qcom,sm6125-dpu", .data = &dpu_sm6125_cfg, },
>>>  	{ .compatible = "qcom,sm6350-dpu", .data = &dpu_sm6350_cfg, },
>>>  	{ .compatible = "qcom,sm6375-dpu", .data = &dpu_sm6375_cfg, },
>>>  	{ .compatible = "qcom,sm8150-dpu", .data = &dpu_sm8150_cfg, },
>>>

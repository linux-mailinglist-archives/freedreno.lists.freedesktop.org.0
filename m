Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCC6D058A
	for <lists+freedreno@lfdr.de>; Thu, 30 Mar 2023 14:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CAD10E2CF;
	Thu, 30 Mar 2023 12:59:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5110710E140
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 12:59:08 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h9so19513005ljq.2
 for <freedreno@lists.freedesktop.org>; Thu, 30 Mar 2023 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680181146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OkrWGH4MXwEdN5HH4k8WbxBYSS0eXOVeRFzbjkupKf8=;
 b=LV9YDY2XMXoj0KZ76FD5YhtnuJTiURe/qSTwQwxuP7LWnlhsxAIa/67DKG2VIIsW+V
 8+IM8ekDBf0mlF/z3NR8gBc1f02uksa6o2WZdJ0WvslBvX8IVurSXIBVih038nCpUCHv
 GykXH54zonAbDv0LrQO1sgU11aHFaysWGZ7UmqPyWnGL98vEyCUEODpOGP1MkOE8cvSP
 ZPMQ2lET5Wx/vQthzM9IP5YWhsXF/miBbNIM0GX9b35SJwKd+e2txbrbN4zFHFY2E41n
 4cTuebs/2q8lZjkgS0lqmj8imHdfEsrJiEr0EVVyh39MZz6m24eXTvY3j2FLtfD5eAsT
 BAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680181146;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OkrWGH4MXwEdN5HH4k8WbxBYSS0eXOVeRFzbjkupKf8=;
 b=4+pqYJreyYhpW+LETNnUeY3S+8d4o8DoQMyKUId6/vQrsbvKur+xA52C/YzfgcdTl6
 sgIOCb3upmhwbwr6ubTH+CXb04o9tvOZ2zqxKrwGmC4A/7c2vbCpI7YUKhneVt9nyn3n
 P5a9KwRMMwknbDd6uyoCGP7BawSbLHs1UT13xdfwoxePesWtsULbukaRUldm/DQNH3Nf
 AN3tLxngAhXCXluOSI6l3D9GCBPVG2IC72pB4gOfqzo3jRHgZ5A4w1xw+7bJCPqEPkpC
 rms3pfOwzM9pR9yRobjsTbKlV6d+6WAg7vXk9pFqrvbNVUAofSazBaj39TZQfnvgbXOX
 dj1g==
X-Gm-Message-State: AAQBX9dx/9Yl0Q3b9qMmmV4KcBB92l95Oec0za+ExHs5HvarGuYeGcrb
 GGl0T42SNrkMab2lbIAtSdmSig==
X-Google-Smtp-Source: AKy350ajNJBJtZCQab0WN3bLgOquJIkb1yU5dEv4R5LXRld3Kqrxx7uVp+bzNPHHIy0QFDEhWMhItQ==
X-Received: by 2002:a2e:b0f3:0:b0:2a0:8d5b:95c with SMTP id
 h19-20020a2eb0f3000000b002a08d5b095cmr7644607ljl.34.1680181146401; 
 Thu, 30 Mar 2023 05:59:06 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a2e99d2000000b00297dad1a2b0sm5732916ljj.103.2023.03.30.05.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:59:06 -0700 (PDT)
Message-ID: <b38a5f50-8c16-4b0b-0b9d-e64c60e0253a@linaro.org>
Date: Thu, 30 Mar 2023 14:59:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-44-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-44-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [v2,
 43/50] drm/msm/dpu: deduplicate sc8280xp with sm8450
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Remove duplicate between sc8280xp and sm8450, which belong to the same
> DPU major revision.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Rebase

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 131 ++---------------
>  .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 135 ++----------------
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h | 118 +++++++++++++++
>  3 files changed, 142 insertions(+), 242 deletions(-)
>  create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 05b7ae3f0343..81cbc99334a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -7,18 +7,7 @@
>  #ifndef _DPU_8_0_SC8280XP_H
>  #define _DPU_8_0_SC8280XP_H
>  
> -static const struct dpu_caps sc8280xp_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 11,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> -	.has_src_split = true,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.has_3d_merge = true,
> -	.max_linewidth = 5120,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> +#include "dpu_8_lm6.h"
>  
>  static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_40,
> @@ -26,102 +15,6 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
>  	.ubwc_swizzle = 6,
>  };
>  
> -static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> -	},
> -};
> -
> -static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x15000, .len = 0x204,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x16000, .len = 0x204,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x17000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -	{
> -	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x18000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> -	},
> -	{
> -	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x19000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> -	},
> -	{
> -	.name = "ctl_5", .id = CTL_5,
> -	.base = 0x1a000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> -	},
> -};
> -
> -/* FIXME: check block length */
> -static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
> -		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> -		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
> -		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -};
> -
> -static const struct dpu_lm_cfg sc8280xp_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> -};
> -
> -static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -};
> -
>  static const struct dpu_pingpong_cfg sc8280xp_pp[] = {
>  	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
>  		  DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8), -1),
> @@ -184,18 +77,18 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
>  };
>  
>  static const struct dpu_mdss_cfg sc8280xp_dpu_cfg = {
> -	.caps = &sc8280xp_dpu_caps,
> +	.caps = &dpu_8_lm6_dpu_caps,
>  	.ubwc = &sc8280xp_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
> -	.mdp = sc8280xp_mdp,
> -	.ctl_count = ARRAY_SIZE(sc8280xp_ctl),
> -	.ctl = sc8280xp_ctl,
> -	.sspp_count = ARRAY_SIZE(sc8280xp_sspp),
> -	.sspp = sc8280xp_sspp,
> -	.mixer_count = ARRAY_SIZE(sc8280xp_lm),
> -	.mixer = sc8280xp_lm,
> -	.dspp_count = ARRAY_SIZE(sc8280xp_dspp),
> -	.dspp = sc8280xp_dspp,
> +	.mdp_count = ARRAY_SIZE(dpu_8_lm6_mdp),
> +	.mdp = dpu_8_lm6_mdp,
> +	.ctl_count = ARRAY_SIZE(dpu_8_lm6_ctl),
> +	.ctl = dpu_8_lm6_ctl,
> +	.sspp_count = ARRAY_SIZE(dpu_8_lm6_sspp),
> +	.sspp = dpu_8_lm6_sspp,
> +	.mixer_count = ARRAY_SIZE(dpu_8_lm6_lm),
> +	.mixer = dpu_8_lm6_lm,
> +	.dspp_count = ARRAY_SIZE(dpu_8_lm6_dspp),
> +	.dspp = dpu_8_lm6_dspp,
>  	.pingpong_count = ARRAY_SIZE(sc8280xp_pp),
>  	.pingpong = sc8280xp_pp,
>  	.merge_3d_count = ARRAY_SIZE(sc8280xp_merge_3d),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index d4f710481b78..a453c31c4bc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -7,18 +7,7 @@
>  #ifndef _DPU_8_1_SM8450_H
>  #define _DPU_8_1_SM8450_H
>  
> -static const struct dpu_caps sm8450_dpu_caps = {
> -	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> -	.max_mixer_blendstages = 0xb,
> -	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> -	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> -	.has_src_split = true,
> -	.has_dim_layer = true,
> -	.has_idle_pc = true,
> -	.has_3d_merge = true,
> -	.max_linewidth = 5120,
> -	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> -};
> +#include "dpu_8_lm6.h"
>  
>  static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
>  	.ubwc_version = DPU_HW_UBWC_VER_40,
> @@ -26,106 +15,6 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
>  	.ubwc_swizzle = 0x6,
>  };
>  
> -static const struct dpu_mdp_cfg sm8450_mdp[] = {
> -	{
> -	.name = "top_0", .id = MDP_TOP,
> -	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> -	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> -	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> -	},
> -};
> -
> -static const struct dpu_ctl_cfg sm8450_ctl[] = {
> -	{
> -	.name = "ctl_0", .id = CTL_0,
> -	.base = 0x15000, .len = 0x204,
> -	.features = BIT(DPU_CTL_ACTIVE_CFG) | BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> -	},
> -	{
> -	.name = "ctl_1", .id = CTL_1,
> -	.base = 0x16000, .len = 0x204,
> -	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> -	},
> -	{
> -	.name = "ctl_2", .id = CTL_2,
> -	.base = 0x17000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> -	},
> -	{
> -	.name = "ctl_3", .id = CTL_3,
> -	.base = 0x18000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> -	},
> -	{
> -	.name = "ctl_4", .id = CTL_4,
> -	.base = 0x19000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> -	},
> -	{
> -	.name = "ctl_5", .id = CTL_5,
> -	.base = 0x1a000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> -	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> -	},
> -};
> -
> -static const struct dpu_sspp_cfg sm8450_sspp[] = {
> -	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> -	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> -	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> -	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> -	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> -	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> -		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> -	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> -	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
> -		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> -};
> -
> -static const struct dpu_lm_cfg sm8450_lm[] = {
> -	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> -	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> -	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> -	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> -	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> -	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> -};
> -
> -static const struct dpu_dspp_cfg sm8450_dspp[] = {
> -	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> -		 &sm8150_dspp_sblk),
> -};
>  /* FIXME: interrupts */
>  static const struct dpu_pingpong_cfg sm8450_pp[] = {
>  	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x69000, MERGE_3D_0, sdm845_pp_sblk_te,
> @@ -199,18 +88,18 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
>  };
>  
>  static const struct dpu_mdss_cfg sm8450_dpu_cfg = {
> -	.caps = &sm8450_dpu_caps,
> +	.caps = &dpu_8_lm6_dpu_caps,
>  	.ubwc = &sm8450_ubwc_cfg,
> -	.mdp_count = ARRAY_SIZE(sm8450_mdp),
> -	.mdp = sm8450_mdp,
> -	.ctl_count = ARRAY_SIZE(sm8450_ctl),
> -	.ctl = sm8450_ctl,
> -	.sspp_count = ARRAY_SIZE(sm8450_sspp),
> -	.sspp = sm8450_sspp,
> -	.mixer_count = ARRAY_SIZE(sm8450_lm),
> -	.mixer = sm8450_lm,
> -	.dspp_count = ARRAY_SIZE(sm8450_dspp),
> -	.dspp = sm8450_dspp,
> +	.mdp_count = ARRAY_SIZE(dpu_8_lm6_mdp),
> +	.mdp = dpu_8_lm6_mdp,
> +	.ctl_count = ARRAY_SIZE(dpu_8_lm6_ctl),
> +	.ctl = dpu_8_lm6_ctl,
> +	.sspp_count = ARRAY_SIZE(dpu_8_lm6_sspp),
> +	.sspp = dpu_8_lm6_sspp,
> +	.mixer_count = ARRAY_SIZE(dpu_8_lm6_lm),
> +	.mixer = dpu_8_lm6_lm,
> +	.dspp_count = ARRAY_SIZE(dpu_8_lm6_dspp),
> +	.dspp = dpu_8_lm6_dspp,
>  	.pingpong_count = ARRAY_SIZE(sm8450_pp),
>  	.pingpong = sm8450_pp,
>  	.merge_3d_count = ARRAY_SIZE(sm8450_merge_3d),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> new file mode 100644
> index 000000000000..80a7b0670467
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
> @@ -0,0 +1,118 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DPU_8_LM6_H
> +#define _DPU_8_LM6_H
> +
> +static const struct dpu_caps dpu_8_lm6_dpu_caps = {
> +	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages = 11,
> +	.qseed_type = DPU_SSPP_SCALER_QSEED4,
> +	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
> +	.has_src_split = true,
> +	.has_dim_layer = true,
> +	.has_idle_pc = true,
> +	.has_3d_merge = true,
> +	.max_linewidth = 5120,
> +	.pixel_ram_size = DEFAULT_PIXEL_RAM_SIZE,
> +};
> +
> +static const struct dpu_mdp_cfg dpu_8_lm6_mdp[] = {
> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x494,
> +	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = { .reg_off = 0x2bc, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = { .reg_off = 0x2c4, .bit_off = 0 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = { .reg_off = 0x2b4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA2] = { .reg_off = 0x2bc, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_DMA3] = { .reg_off = 0x2c4, .bit_off = 8 },
> +	.clk_ctrls[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
> +	},
> +};
> +
> +static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
> +	{
> +	.name = "ctl_0", .id = CTL_0,
> +	.base = 0x15000, .len = 0x204,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
> +	},
> +	{
> +	.name = "ctl_1", .id = CTL_1,
> +	.base = 0x16000, .len = 0x204,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
> +	},
> +	{
> +	.name = "ctl_2", .id = CTL_2,
> +	.base = 0x17000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
> +	},
> +	{
> +	.name = "ctl_3", .id = CTL_3,
> +	.base = 0x18000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
> +	},
> +	{
> +	.name = "ctl_4", .id = CTL_4,
> +	.base = 0x19000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
> +	},
> +	{
> +	.name = "ctl_5", .id = CTL_5,
> +	.base = 0x1a000, .len = 0x204,
> +	.features = CTL_SC7280_MASK,
> +	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
> +	},
> +};
> +
> +static const struct dpu_sspp_cfg dpu_8_lm6_sspp[] = {
> +	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> +		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> +		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> +		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> +		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
> +	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> +		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
> +	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
> +	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
> +		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
> +};
> +
> +static const struct dpu_lm_cfg dpu_8_lm6_lm[] = {
> +	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
> +	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
> +	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
> +	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
> +	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
> +	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK, &sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
> +};
> +
> +static const struct dpu_dspp_cfg dpu_8_lm6_dspp[] = {
> +	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
> +		 &sm8150_dspp_sblk),
> +};
> +
> +#endif

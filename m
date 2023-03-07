Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CF6AF088
	for <lists+freedreno@lfdr.de>; Tue,  7 Mar 2023 19:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4C710E538;
	Tue,  7 Mar 2023 18:31:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B7D10E52C
 for <freedreno@lists.freedesktop.org>; Tue,  7 Mar 2023 18:31:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m6so18317332lfq.5
 for <freedreno@lists.freedesktop.org>; Tue, 07 Mar 2023 10:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678213874;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mfXxXGI1XUIOGrJYihrvmrvOCvNEexUQJmCy3wEWPjA=;
 b=OIO+dadKAI2DGM9QD8NSK9H+YURRaOi6HnPRtMa3qaOOvVV+/r3BUspmsUze0vOkdu
 Sj8hMhI/Mn7Aj5AmbEnIg8/vbmK2ROSs4gwZnXmfvjxuli0fppF3r0qaW2+aMFzSQVyi
 60WJL6Xy5LHRLH4kfh0yqaABZhGeNssG+gkWoJtk+UXQSJvPpTCnbLgp+Ke9qp15HEDl
 cqPWAkgUls7Jdw2LQEdbrVQ6sJP+oR58r+gkGfu9v1wmjtLHHPUL6RpIsbIjGPgnP0sL
 ELYxP7jqUS4G6U7p+JqrUlv+6xcPqqacvZS+5cDQvs+tcBYB9jBVewFkDScRlmXvZwlQ
 5wSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678213874;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mfXxXGI1XUIOGrJYihrvmrvOCvNEexUQJmCy3wEWPjA=;
 b=tFGFU3mRZC/hi+OQNpYMR5Kuqd/3/cniQ4hsF9d4QRgd+8dCjuAD40DQ/2a1gFCYQs
 xgk+hI9ya+yqffdV/rO1Vb15C2VSM9OyUr/eeOPWL3bScHdtuvngJ8SsOGDW8pebBG2R
 7UJF6ALQzrkAn41gir2tZm+GQUXBBpbfwgW0knCYQtb1CKvm3d47CV+mp3Tlz2vkQByW
 yLZUMuhgqnFYLeRY564xXpiZlghj1+9rZF3ySWBOgC82JACrPDAhY//VGZAHrT2q8ZTc
 7IoEcH/Dsyvk4U/2gQs2G9mM1vfN4gppVCFvnzq2FFQ46c7zj/h3GiLLUzqugLtJME3e
 RNJQ==
X-Gm-Message-State: AO0yUKVDd/HYgMmJoRxU++7VVKiof1hkuBuFG2AbC3MIGY8FI6fM9s0M
 T4o6ZIeaDD1J2haLzPL3JYbwfA==
X-Google-Smtp-Source: AK7set/7fR3uyM3rhdzkQ6H96OnnW4/2mkcumR/QHnRwsBPxMbQ2E+nD+Qr/2zkiamzEQAxdqFQb1Q==
X-Received: by 2002:ac2:508e:0:b0:4db:3e32:b92a with SMTP id
 f14-20020ac2508e000000b004db3e32b92amr4172324lfm.69.1678213874515; 
 Tue, 07 Mar 2023 10:31:14 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a05651211c300b004dda7435451sm2094746lfr.202.2023.03.07.10.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 10:31:14 -0800 (PST)
Message-ID: <718562d9-6d92-b18a-920c-4b7fcda6e986@linaro.org>
Date: Tue, 7 Mar 2023 20:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-40-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211231259.1308718-40-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 39/50] drm/msm/dpu: drop duplicate
 vig_sblk instances
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

On 12/02/2023 01:12, Dmitry Baryshkov wrote:
> After fixing scaler version we are sure that sm8450 and sc8280xp vig
> sblk's are duplicates of sm8250_vig_sblk and thus can be dropped.

I will probably partially withdraw or rework this patch to fix the 
scaler->version handling. The rest of the patches are still in the queue.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 ++++----
>   .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
>   3 files changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 094876b1019b..05b7ae3f0343 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -85,13 +85,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>   /* FIXME: check block length */
>   static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>   	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>   	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>   	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>   		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 3d95f2472e7a..d4f710481b78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -84,13 +84,13 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   
>   static const struct dpu_sspp_cfg sm8450_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>   	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>   	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>   	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d84f8eb8f88a..5091cec30bfc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -411,15 +411,6 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>   				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>   
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
> -
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
>   				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
> @@ -431,15 +422,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
> -
>   #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
>   	{ \
>   	.maxdwnscale = SSPP_UNITY_SCALE, \

-- 
With best wishes
Dmitry


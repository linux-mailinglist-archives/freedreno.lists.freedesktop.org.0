Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCE0396346
	for <lists+freedreno@lfdr.de>; Mon, 31 May 2021 17:10:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B01C56E40C;
	Mon, 31 May 2021 15:10:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E8576E40C
 for <freedreno@lists.freedesktop.org>; Mon, 31 May 2021 15:10:28 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622473829; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RDPiykZKxUArsqfr+HyfBzTx4txXnTuaKCrbS8HsMz0=;
 b=lQU1uhKfWPWzNMYSh0FxRT+RntgRNbJPh+bprNvAmX/gzDWeQBpsHSOxOfRnrvfNBqBEXKfr
 XkYZBJ9B9uF2GDf/UpoNxCNVK7zIiV57Ub0rNoFvBZXaHWsJ4fACRrSaWoaKAv7EMo09OG74
 1od6PBfcCkccwTyyDQKm65a5m0s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60b4fc63ea2aacd72918150c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 31 May 2021 15:10:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5AC4C4479C; Mon, 31 May 2021 15:10:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
 version=3.4.0
Received: from [192.168.1.105] (unknown [117.210.184.158])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DA67C433D3;
 Mon, 31 May 2021 15:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6DA67C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=akhilpo@codeaurora.org
To: Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
References: <20210513171431.18632-1-jonathan@marek.ca>
 <20210513171431.18632-9-jonathan@marek.ca>
From: Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <9c87a69d-3af4-db3d-3481-7dc158d1b380@codeaurora.org>
Date: Mon, 31 May 2021 20:40:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210513171431.18632-9-jonathan@marek.ca>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v2 8/8] drm/msm/a6xx: add a660 hwcg table
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Shawn Guo <shawn.guo@linaro.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Iskren Chernev <iskren.chernev@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 5/13/2021 10:44 PM, Jonathan Marek wrote:
> Add a660 hwcg table, ported over from downstream.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 53 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  2 +-
>   3 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index ec66a24fc37e..2713f69e916d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -427,6 +427,59 @@ const struct adreno_reglist a650_hwcg[] = {
>   	{},
>   };
>   
> +const struct adreno_reglist a660_hwcg[] = {
> +	{REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x02222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_SP0, 0x00000080},
> +	{REG_A6XX_RBBM_CLOCK_HYST_SP0, 0x0000F3CF},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL3_TP0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL4_TP0, 0x00022222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY2_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY3_TP0, 0x11111111},
> +	{REG_A6XX_RBBM_CLOCK_DELAY4_TP0, 0x00011111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST2_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST3_TP0, 0x77777777},
> +	{REG_A6XX_RBBM_CLOCK_HYST4_TP0, 0x00077777},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RB0, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RB0, 0x01002222},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_CCU0, 0x00002220},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RB_CCU0, 0x00040F00},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_RAC, 0x25222022},
> +	{REG_A6XX_RBBM_CLOCK_CNTL2_RAC, 0x00005555},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_RAC, 0x00000011},
> +	{REG_A6XX_RBBM_CLOCK_HYST_RAC, 0x00445044},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TSE_RAS_RBBM, 0x04222222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_MODE_GPC, 0x00222222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ_2, 0x00000002},
> +	{REG_A6XX_RBBM_CLOCK_MODE_HLSQ, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TSE_RAS_RBBM, 0x00004000},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_VFD, 0x00002222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GPC, 0x00000200},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TSE_RAS_RBBM, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_VFD, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GPC, 0x04104004},
> +	{REG_A6XX_RBBM_CLOCK_HYST_HLSQ, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_TEX_FCHE, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_TEX_FCHE, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_TEX_FCHE, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_UCHE, 0x22222222},
> +	{REG_A6XX_RBBM_CLOCK_HYST_UCHE, 0x00000004},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_UCHE, 0x00000002},
> +	{REG_A6XX_RBBM_ISDB_CNT, 0x00000182},
> +	{REG_A6XX_RBBM_RAC_THRESHOLD_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_SP_HYST_CNT, 0x00000000},
> +	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
> +	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
> +	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> +	{},
> +};
> +
>   static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>   {
>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index e4db0683d381..6dad8015c9a1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -299,6 +299,7 @@ static const struct adreno_info gpulist[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init = a6xx_gpu_init,
>   		.zapfw = "a660_zap.mdt",
> +		.hwcg = a660_hwcg,
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 63c050919d85..e6b11e6ec82d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -55,7 +55,7 @@ struct adreno_reglist {
>   	u32 value;
>   };
>   
> -extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[];
> +extern const struct adreno_reglist a630_hwcg[], a640_hwcg[], a650_hwcg[], a660_hwcg[];
>   
>   struct adreno_info {
>   	struct adreno_rev rev;
> 
squash with previous one?

-Akhil
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno

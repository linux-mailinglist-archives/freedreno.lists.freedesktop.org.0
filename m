Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35E0B0DB29
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DAA10E044;
	Tue, 22 Jul 2025 13:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Of93aJyQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7D210E044
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:44:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M8rwVB006230
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:44:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/PlvjBmBNhRqz0BnasHFhjw6
 BKLI8rWtueB1348TmAU=; b=Of93aJyQ8B2IXq//kHIuNs5oNAeHAckqmlzzEHin
 JB0jbnxK3HwqmVrHsXdArPWFtS5InJJECABp1JqgOORgL/j51qy9VArRt/ZqegY7
 SRXubWmx6w4Ca6cx60eifdX/A6beIlp2D9WPZSHC3R9A0aI0KRADO8OF3K/uGbg6
 xnelwe9XrpQ1rA1wqz8L2sclzfUaBBp1hNSBcvmZdzz8PcxkT+6dD9iJfze8djQt
 chkRh1WJpqmcvOdijECtCl+fHhCvFt7+BgcAVx6TcFLsC2z40n14TNybb1T7L7y4
 0Eu76qghAovYfV294L5ZFHuqm1ERp1Dc82PxjHmIcW20Dg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047q9mrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:44:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e33d32c501so1266507085a.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 06:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753191861; x=1753796661;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/PlvjBmBNhRqz0BnasHFhjw6BKLI8rWtueB1348TmAU=;
 b=C6XJrUAkkUti0vVwwgEMIlTRV4xErt2+NEPrKgRTqBRRjgu/Ot3Nc+EyhWACTlQnvj
 e+yUewQDGFeZHsfZejwrN5GcdMlr4u/NXQpU8QvNf8yZF84sOLLm1xTKfZ02mnHq/7yO
 tVvlwIFkvGrctNRHTCEnGEPSu5YXAvfBAwrtd0wggvx02pRKmFoTqX4YQyAQXCRCggmk
 0dOYyaoB/qI6y7BhVY5AbcBXNhj6DCNiNWs7+kBb4ogE2fFeVCidAp1Rd5OTbG96UBKl
 Fjb2s+cWcCTOnFi7f4/4sv6Yo7Onp+CiMIktTZTLHN9YyUOR46vB/GmTv+lwq7llSyzY
 uBYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvXPB6euMn9uQu+u0657ozNvtZdAIGK7I6XaC91d4tO2eB1+Infqw6OUjkQ4nnlsAniSq5ANDLn2Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YztKzGCHxwZU673pJSvy3d57c2sezBRMGBeNJJQVzJlmJRh5wWM
 qieMDZxwbkmOnPzEH9lreKfMy44/Uv47JsKwb75LBHQgPSwjlk/WQFGBLImSsI9YM+OIkb6v+Iu
 Mp/NXpnASI81Q4VnPl8mM1vn5ayqUGNiH0r8nEHPmpz0ecM4GdoxXgcW+32PQ7+pY0OWJQFk=
X-Gm-Gg: ASbGncvqFd3/OaU8PhgOSggIlbSzvBWnqACDNAXzyX7tilaP+3sVgkygVLuDB8g3uSR
 z/qkb0FfTPZoadyqHG6EW9xZdUhJfoFVwBpD0bqpal4MvCPnw1AdZ+5dSgg2etwXYWnmFdOI4qH
 NlDxR3PN32Y1u20rzIvbAarH+9glvb6m6OHCkTN5T7r4O0H8ossf80iRcGHFcY67UBDhc0tmrMv
 rkEfjGMV3KGspUVMCwUOSjJVitXuLj9MD5UyUJmeZBqYMJPEC9DBI7nBaLjESIVwnDmGXoImm3J
 6HXjs1kZIgKl8qHdqI84lQuR5alJwSW9ywwZ/qtQnsU69QbxGMxb2yQCiiQm7rEJ6jrdUCcxV7z
 HOEreqcYp4QRp+jOEuCZy7eCPyQhQpKUw1//ocoCDjlAqJyoio0ig
X-Received: by 2002:a05:620a:d96:b0:7e6:2167:6fb with SMTP id
 af79cd13be357-7e6216707e1mr450345185a.57.1753191860624; 
 Tue, 22 Jul 2025 06:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJYjfAd2lPvfeopVnQTvfIiKF4FZMT25Jj8QNn5OT3bmUYHUVmlPAwFf/7JubdQINFF9syIw==
X-Received: by 2002:a05:620a:d96:b0:7e6:2167:6fb with SMTP id
 af79cd13be357-7e6216707e1mr450339985a.57.1753191859973; 
 Tue, 22 Jul 2025 06:44:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a9109c31sm16373981fa.43.2025.07.22.06.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:44:17 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:44:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Message-ID: <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfX5n2k1Iwkh0WE
 5S2pLl3/0JRqfGHt4WytQAUMk+C5BO0gDlNO3JtACum8jYxN2f+E67RlfpYTwGVQVxSoQ8Zts4A
 Wn5aucrRoQ+fpZlGPy3VAbGvXwIy7F3bMwTQaFEpFIcg4KTf2DIjyshZXHe2fygZJDhdNHzghRx
 Lr9g2uZ9cQLT6B7bDC3sSKxZ5nQZ+fpHGmANEGdvYf8U+ZWuRM63++0dltiIugTTwYONFLHoqAb
 ZQOeBHQjx3WhmpQ/jkmka10uo01G0N5lBsqKhsVhcl8WLTq0M+IusROWLIVU+EncvpjK72hv3F1
 8CRIzLyz46w75KwRL/DWBqPsEMmsK8Rt2Zb6Ib5KYXzrSeeYBIwYoLoH1FBLeU8xPxQcx9AR6Vu
 dOZR5yVyKB0zA+07SfxXko4vf8abFqQbaf+z3+UAJw6p8T5rncEugMbUoSdDMBTo2XwHk0CK
X-Proofpoint-ORIG-GUID: DTAzMyoXlTR8T88Ae3AqpLNU4oeKsyV3
X-Proofpoint-GUID: DTAzMyoXlTR8T88Ae3AqpLNU4oeKsyV3
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=687f95b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=kzfAnjQGA3Um0d4qlLMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220112
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
> Set Keepalive votes at appropriate places to block IFPC power collapse
> until we access all the required registers. This is required during gpu
> IRQ handling and also during preemption.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
>  2 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
>  
>  static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  {
> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>  
>  	/*
> @@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
>  		return;
>  
> -	/*
> -	 * Force the GPU to stay on until after we finish
> -	 * collecting information
> -	 */
> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
> -
>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
>  		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
> @@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>  	}
>  }
>  
> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)

a6xx_set_keepalive_vote()

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return;
> +
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
> +}
> +
>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  {
>  	struct msm_drm_private *priv = gpu->dev->dev_private;
> +
> +	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
> +	set_keepalive_vote(gpu, true);
> +
>  	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>  
>  	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
> @@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
>  		a6xx_preempt_irq(gpu);
>  
> +	set_keepalive_vote(gpu, false);
> +
>  	return IRQ_HANDLED;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> @@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>  	a6xx_gpu->postamble_enabled = false;
>  }
>  
> +/*
> + * Set preemption keepalive vote. Please note that this vote is different from the one used in
> + * a6xx_irq()
> + */
> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)

a6xx_set_preempt_keepalive_vote();

> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (adreno_has_gmu_wrapper(adreno_gpu))
> +		return;
> +
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
> +}
> +
>  void a6xx_preempt_irq(struct msm_gpu *gpu)
>  {
>  	uint32_t status;
> @@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>  
>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>  
> +	set_keepalive_vote(gpu, false);
> +
>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>  
>  	/*
> @@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>  
>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>  
> +	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
> +	set_keepalive_vote(gpu, true);
> +
>  	a6xx_fenced_write(a6xx_gpu,
>  		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
>  		BIT(1), true);
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

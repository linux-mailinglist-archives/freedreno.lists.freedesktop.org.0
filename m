Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB13B0E562
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 23:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB7410E062;
	Tue, 22 Jul 2025 21:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fl1N3gdF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2110E062
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:25:07 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKU1Fx006518
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Bx6AND6qIidWf5n32E4fzkLDfQp167XjFiENx1umcI8=; b=fl1N3gdFbnbW6zs3
 xthlnmmIcSvU+LS0IMa6qXorJtBVRpZb82HziDrZHY0Vjv0f3K14l1g+zxiCZ6hm
 BEB//nuFQI2n9o7/I1MEBSn6efFU7sfSeI4aTzTM/vCI0ux5KAFWChrSx0+JR2l6
 SJGkHOQJ6YdfiAdcp8AL6y6qPuPJF3eVq0JrD9YI/6c6cBrSbACDOnyF3TjHxpSZ
 z5w7OENt8aK/hXWans789scPyLlC7dhT5+Xs0uXCmeZJV8wqJM+3ED1L939p/awg
 Vb2byiVFQmvDuZ4Al+UDUmbDdl+zOxRQuDLtfphP7nYd5F7WRJAI2cpnMR+H5Xvv
 fS5Nrw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3enqds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 21:25:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b0e0c573531so4429635a12.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 14:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753219505; x=1753824305;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bx6AND6qIidWf5n32E4fzkLDfQp167XjFiENx1umcI8=;
 b=HZgQq/10tLprxu23BiKzBA9KtRzSdQGqLR18/Sn6BjdRbimIiYFWBINeO3OZ4ZBTj4
 MGPphxQlRgoCPKR+tBadzjAtqseho2tp8xkVBRIp5v8ZDTipNe5qr8HfOVwKzp//bd/3
 9Kj4HaF00tTU29L5lrTC2jQv+yteZDCdaBtveOMMvuGxyN4vpEmUz8V13I5GzaCa2LF/
 Z306Lr9XldQxZZQhc1/g4lRIxRwRRBn380V1wvO1OA4RZI5zJWrW5HOoqYNmA70FjLx2
 KdROXlFp2b0okg2D1e6LF98zBN1OFKMa8NAzbC4Vvnzje1YZvE+7ejFiK/Z7njFcgrVi
 VgIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsIwinGCkbDgDfKghjh3AHNPySdcT0qZR0MSJ4/o045qfQlQeNwN0XlWTX4pgYZUBWnVc7ADOM2vk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEqxZtRXii55CUwBbB0B4G1ih+sdrSK3Vmj+RDkFQ9eaki/qba
 c9+gkZwp9g8E60Yccjp4/K5DuUt6rx99jMYFSWxCyhbnZXn7ut3bbdvzQde62FAVpWRhAY05hrJ
 2QFXlYGh2Mci7HS/INsc/WlC6BWVZKqPh8sjtKLNkjIpbwle28kvyAyJHUs0ZA2ZyMORvNXc=
X-Gm-Gg: ASbGncuEpvlyJgVvAsvMN+T8qJDaZziEKy7fueK55mjv0Ik7UPpHNK1ae4LuzcdCWbz
 BnG7NGlJ2iMv9kKSqbhvr/15nCA/OwMXw80xrQ0zb7cQUV6oaaYaa5rW9t59zUX04tIgL/hf3RQ
 /3yZReLzJ8B5fzZ53dOqRbKuqfEYfx7+vLOOHWCgpDqdy5L5UVnL27UR+KmA50u0ulP6t6BZrHR
 QMGZcATmc4i6rFod+2JiIJ4sbg8gQvXWN5ayjzofOX7jYUF5uO7C+nyOadvAjckYhzBye2YMUCq
 D1NejiKfN/pSxcL8mragf4WcJU5fW2DvEjXydeJ/kXIUaYle3QWQ3DbNPu3PEoQu
X-Received: by 2002:a17:903:fa6:b0:220:c4e8:3b9f with SMTP id
 d9443c01a7336-23f98087878mr6681765ad.0.1753219505431; 
 Tue, 22 Jul 2025 14:25:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFps9jaK7xU+IcaPx+PU7yuB+q3TWSjyxzOi5zTDgaE+nkIXF7XgkGNIc87COjEka46a4qGHw==
X-Received: by 2002:a17:903:fa6:b0:220:c4e8:3b9f with SMTP id
 d9443c01a7336-23f98087878mr6681445ad.0.1753219504988; 
 Tue, 22 Jul 2025 14:25:04 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef82esm82325845ad.209.2025.07.22.14.25.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 14:25:04 -0700 (PDT)
Message-ID: <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 02:54:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -XHGDIkosyOhK-L1zLoY1UB1vWnA4vgr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NSBTYWx0ZWRfXyu2homaiGopR
 2jlHsVueQcxWjeOsMQgPNYJe52b6zhKK89rFFC3yNuRl3eUHxUrpnliWz/cZJ+isShA8pVryRHC
 Bb1AmmkVke6LODTx9C4xEmm0BayRjsDGP/CZbzRq+2eZLJpm5TbIiaR+phayBt5Jnefccj0HBch
 0TysYndk5wuph+s430QNG68fjvXmTPpBK0cr/tEu1owTcSlwAvOeJHViXCM9j7GJzUkXr4VGWIE
 EX196DtjKab9unexfZ0fHZDnu/Rymx5+PzRFrL7pA5P69CIUQzS5XLlb1x2V3hu7MZdr5S9dM/6
 6taJRb9ndha6HBRLjHxgfJHLr4p/B32wJbSE1nSMBBAnpZb4NFSr9ohsBdnJMFXzNqAMpVESoXF
 0lZC/nvmX2r4lO4hmKljbO0FC60p8EBLqKrDml+ct5RPB3oF2GUDulF7Jvlmj30DgV1g+5BE
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=688001b2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=54dI5dBpyKhlXk0ovUwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: -XHGDIkosyOhK-L1zLoY1UB1vWnA4vgr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220185
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

On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
>> Set Keepalive votes at appropriate places to block IFPC power collapse
>> until we access all the required registers. This is required during gpu
>> IRQ handling and also during preemption.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 26 +++++++++++++++++---------
>>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 20 ++++++++++++++++++++
>>  2 files changed, 37 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 8c004fc3abd2896d467a9728b34e99e4ed944dc4..6770f0363e7284e4596b1188637a4615d2c0779b 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1752,8 +1752,6 @@ static void a6xx_cp_hw_err_irq(struct msm_gpu *gpu)
>>  
>>  static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>  {
>> -	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> -	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>  	struct msm_ringbuffer *ring = gpu->funcs->active_ring(gpu);
>>  
>>  	/*
>> @@ -1765,13 +1763,6 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>>  	if (gpu_read(gpu, REG_A6XX_RBBM_STATUS3) & A6XX_RBBM_STATUS3_SMMU_STALLED_ON_FAULT)
>>  		return;
>>  
>> -	/*
>> -	 * Force the GPU to stay on until after we finish
>> -	 * collecting information
>> -	 */
>> -	if (!adreno_has_gmu_wrapper(adreno_gpu))
>> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 1);
>> -
>>  	DRM_DEV_ERROR(&gpu->pdev->dev,
>>  		"gpu fault ring %d fence %x status %8.8X rb %4.4x/%4.4x ib1 %16.16llX/%4.4x ib2 %16.16llX/%4.4x\n",
>>  		ring ? ring->id : -1, ring ? ring->fctx->last_fence : 0,
>> @@ -1810,9 +1801,24 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>>  	}
>>  }
>>  
>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> 
> a6xx_set_keepalive_vote()

static fn! Why do we need prefix here?

-Akhil

> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return;
>> +
>> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, on);
>> +}
>> +
>>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>  {
>>  	struct msm_drm_private *priv = gpu->dev->dev_private;
>> +
>> +	/* Set keepalive vote to avoid power collapse after RBBM_INT_0_STATUS is read */
>> +	set_keepalive_vote(gpu, true);
>> +
>>  	u32 status = gpu_read(gpu, REG_A6XX_RBBM_INT_0_STATUS);
>>  
>>  	gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>> @@ -1849,6 +1855,8 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>  	if (status & A6XX_RBBM_INT_0_MASK_CP_SW)
>>  		a6xx_preempt_irq(gpu);
>>  
>> +	set_keepalive_vote(gpu, false);
>> +
>>  	return IRQ_HANDLED;
>>  }
>>  
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> index 5b0fd510ff58d989ab285f1a2497f6f522a6b187..1c8ec1911010c00a000d195116fc950c4d947cac 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
>> @@ -136,6 +136,21 @@ static void preempt_disable_postamble(struct a6xx_gpu *a6xx_gpu)
>>  	a6xx_gpu->postamble_enabled = false;
>>  }
>>  
>> +/*
>> + * Set preemption keepalive vote. Please note that this vote is different from the one used in
>> + * a6xx_irq()
>> + */
>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> 
> a6xx_set_preempt_keepalive_vote();
> 
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	if (adreno_has_gmu_wrapper(adreno_gpu))
>> +		return;
>> +
>> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_PWR_COL_PREEMPT_KEEPALIVE, on);
>> +}
>> +
>>  void a6xx_preempt_irq(struct msm_gpu *gpu)
>>  {
>>  	uint32_t status;
>> @@ -176,6 +191,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
>>  
>>  	set_preempt_state(a6xx_gpu, PREEMPT_NONE);
>>  
>> +	set_keepalive_vote(gpu, false);
>> +
>>  	trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
>>  
>>  	/*
>> @@ -302,6 +319,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
>>  
>>  	spin_unlock_irqrestore(&ring->preempt_lock, flags);
>>  
>> +	/* Set the keepalive bit to keep the GPU ON until preemption is complete */
>> +	set_keepalive_vote(gpu, true);
>> +
>>  	a6xx_fenced_write(a6xx_gpu,
>>  		REG_A6XX_CP_CONTEXT_SWITCH_SMMU_INFO, a6xx_gpu->preempt_smmu_iova[ring->id],
>>  		BIT(1), true);
>>
>> -- 
>> 2.50.1
>>
> 


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9632C518F6
	for <lists+freedreno@lfdr.de>; Wed, 12 Nov 2025 11:07:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD84810E6DF;
	Wed, 12 Nov 2025 10:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kAGdreiM";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7e17uzZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B10A10E6DF
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:07:49 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AC9ggJg1109094
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:07:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=; b=kAGdreiMYqZZcG2C
 a0uUG51Xyaex5zm8dEzDifgrYM5roPuhPx6kulk58BS+3W4TQOgTjoDq/LETD+5v
 toGP7tnj8cm8v2VOP+Lz/IpXCakCM90iM38mvClvDOeFEsYdpaWGBXd1aHjxLjpp
 AG2iXmEwEz9WwP5KH0yLT47UkP4ZycamLGgCsOVpOXREEsSXGEPofqjIuh1/A6cl
 8LeM5ogKJJzUCQJLJcS3TvjBK/3S3BtpOkBOzEhYPUkaFk6OcMno02VIYZ06WDsx
 ptIuEYHOCgcE0bzK3p9fTf3uJs5R1wFxbW1ukttPz3Fs2uSqO/F6CPSlVCgrZfQs
 ttvkZA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqum03bq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 10:07:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed5ff5e770so1355381cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 12 Nov 2025 02:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762942068; x=1763546868;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
 b=N7e17uzZD46o2mSxNBldlcM8BWFkId0qjCProOFPDCPn6LfJi8IyjpaVys8r2NJ1LZ
 4TRnLxTmtE1+YOYoUCfry4AZGH9gtVK0XKmcgy06VhXYVlBZFY6wY30icaWz+CtF2cMk
 GIeezlnxqJw8XFHTWW9ivwEvFi8kZpQLXUt0eMBh4CoJf+Z9ZtssGxmNOnpGM5y4c6yE
 YAxjmmcCGNPqyPSID01vqmtZ/EGzvrHvrcTi6B+PPq8m/unFony02bb8rSGeEWILCvV5
 GWO1IA0f1q3glYpicwcYeOb63eDi+Dl1u+HM2ktKr1X43yve12GSwQCKuLSn4A0iS5Mw
 zu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762942068; x=1763546868;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5tMUAPHj3MTUC9Ymia6xtrQkXoeMohe0oVZfqEDumFs=;
 b=HKX02buu+oEpqescpkTQe5OScNvqRDi52RUQ8HOmxdQZYmkUjCiXru3vSpKykta+OP
 snfFi7y2g0tq98DoISn4FOiVdwMwFHUdBjsiRhFEOoPeTpbRhrfKvWM44zpGoa+f/eyY
 lx6byPasgGxLqYi5HdCf0bNZsdTWrbCFb0Y6OZgTFO7Rbdj8N48qtJ/Z0EfgIB9HU7Ko
 IIXCCibKhw1i7VRhhbeRuSUcCboL1Y/N5XGH7h4jY8E99IVboa+cgzUaPYiFBHqjR/Pt
 5CmSk7nAV5VWHAMPbIrHUH4tWHoVgHjJJXJM1pSmhMEo5x2yMi4F6Zlv2lkwIV2gKG7V
 be9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0b1UVijE0p5JvLO96XTVJNcHPotyguu1S3LXlDL8zYvk6JIPnhOK2mEbg9rEeryN4NajuAo8nCkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycrsZ2Bs9VkCcjqXgWa0xc9lSKP9CYRVdWi+jWoC2dfZqU4uGW
 I7fYCP9xnKS11isOPs1rLknb8pGvpjxdCuAdkKa9HwAEfpHm9zLu3myT8OHaHRrK0+4JY19NQEj
 kaAtc0CyMVcDqpvp4Hv9ys8+86zC6VBvzlFhe9nBsBMXQ7nWB+LlgKNyynRppq7iOvij03OA=
X-Gm-Gg: ASbGncuC9YS3Cum3y6yLLkORP7AMPvqgGn6Oid1lJmEWtnWP9PyT0vNRZzLmOOvHDMx
 aFW51w+SR4Z0mp+EP2kDqeToaOyRAbH2/LdtCk5wUMvmLiHrdw98mqEsyWk8knEbO0HRZorVM0Y
 7W8o5SLCHJFLqFhtIOXpqEMPDChvAyWIO+Vtc8Y/B+0i5tM8OBB9pS/OtGzvkIVQKWLlIFbA3nt
 vakTgZBJvf9JdnJpdK0gWzwdvtP3N7eu12drAbBUp+naZH7c3uVh/YtmYrIh3yihSKYKb7kiCSq
 NxjWykl3OmBn66RYMLE066Q/mG/ZOOzMFS2GJFQmEE1LlvWJVZ65armVJjEjRfsZ2S3zepAjhuA
 MqCigrdoA09U+A4fc5FM+UGb2DIIs9t/JCOdmUMsakIxnh2xZbaxZ0a0E
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id
 d75a77b69052e-4eddbdad648mr18859891cf.8.1762942068468; 
 Wed, 12 Nov 2025 02:07:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGd6taWWH3kgb8r8uxKAXxyDkXj9rB9AL10HGL6oyqqdNWof71H5ltc/gx7kawJfP1MWxxJCw==
X-Received: by 2002:a05:622a:18a2:b0:4e8:90f4:c3aa with SMTP id
 d75a77b69052e-4eddbdad648mr18859471cf.8.1762942067993; 
 Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72d3baf872sm1427413366b.27.2025.11.12.02.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 02:07:47 -0800 (PST)
Message-ID: <da9e9d31-7745-4eb6-ac24-50905dc2a133@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 11:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/21] drm/msm/a6xx: Flush LRZ cache before PT switch
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
 <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA4MSBTYWx0ZWRfX7UjSU7Oe5bXC
 /4+EIxRq4m8jJdBb+HjVVmDevIiTRgtKDrAVgs63i8hYFA6vDPuQ1OksccNETh0i0Ef/p3nFOnz
 z8+PGBIupC+da3NNmqVhK3NW8UY2QRnRhhVKIE3iZC+6bx4hhFCQtJuYwMEwOy4X6tFqLa7lQjK
 Orp+mgJ8U1Q1R1lRft+bEm8ZL9Bm7N1fiN1PihOXLmYhErKidPYqPZ9xB532TW2XboahsPG7Sbd
 klIvaBIQSiWXSZ8puqpJFqplE7eq8qnvn1sGZ0UwRZfDloEGOQM/LoNS9kPAo/mZQh/ToPRt8jE
 74APmn8iIRBJuQhiHv63sy2z4xyHwzmH3g6fS8fTKHPsm06ozYfmyGXBwkzkIqI5me7Uiobv4KC
 o/okfrMmfqGH8HwVe0Slky+ydb/ayw==
X-Proofpoint-GUID: uu5r2dEk9JQJuwN27it4Gioimv3bZVrS
X-Proofpoint-ORIG-GUID: uu5r2dEk9JQJuwN27it4Gioimv3bZVrS
X-Authority-Analysis: v=2.4 cv=KeTfcAYD c=1 sm=1 tr=0 ts=69145c75 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=FVkm2KtGXHSZZ5XTrLgA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120081
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

On 11/10/25 5:37 PM, Akhil P Oommen wrote:
> As per the recommendation, A7x and newer GPUs should flush the LRZ cache
> before switching the pagetable. Update a6xx_set_pagetable() to do this.
> While we are at it, sync both BV and BR before issuing  a
> CP_RESET_CONTEXT_STATE command, to match the downstream sequence.
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index b8f8ae940b55..6f7ed07670b1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		OUT_RING(ring, submit->seqno - 1);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BOTH);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
>  
>  		/* Reset state used to synchronize BR and BV */
>  		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
> @@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
>  
>  		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> -		OUT_RING(ring, CP_SET_THREAD_BR);
> +		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);

IIUC downstream doesn't sync here since there's a sync after the LRZ
flush, but I don't think that's a meaningful difference.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

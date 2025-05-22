Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C846AC103A
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 17:46:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A60A10E16B;
	Thu, 22 May 2025 15:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i4jD6gdE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D277110E16B
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 15:46:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFGkUD020927
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 15:46:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vWH7onf239ZUhCvBgW9a4VrfEgn51qWDTJhjgDm0SmE=; b=i4jD6gdEJ9HXL739
 s2fI831eZbaqIWgJeZ8VfOl1N4Imau/kqBVFJs3wtBvPrXIeMSNcAY4kb9c+n2K0
 iTuyJnQo4uYtMTNKX32Zlah+oR5Qoj8BS9dukqiXPS7jgClET8r4CrzAFqGVwW5t
 3rp5XEdH9VCa6vfLYis0j9oSapua4WWQ/O5dLPJ84pVFu9gvcLIsNeV7z9JI2IZF
 WjCxU2hqqDozwaYvHPKkF8VSjM6dL+74Q5oB56uG+PJJLrGwO/NpOY7vRpc7nO0D
 8MAOIXQDIyxTPLh0ua2aKhn6sbQtoEhw1ca0l8usADkUOZ4iFey/mr0CpcjjfQ0g
 LkP3Ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf072e4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 15:46:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5466ca3e9so167526285a.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 08:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747928806; x=1748533606;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vWH7onf239ZUhCvBgW9a4VrfEgn51qWDTJhjgDm0SmE=;
 b=f2t6x6A6WWJxNOb+r+NLRGKUdn2cK+VTGpL1zb+CjVYaydhGEfEeRuEHS0hKuMALfd
 eda75RgVisYGH66ULS/M7nM8GA4XhVlJoenbGuTO75Su3cLDhG5tYm7SJ+gNGBNG8zTZ
 eLBIoX0YszkZrNmVucgRcFexIgLCZD8ZhYVNQigF67kroh99Qrbe56x0+9W61Oibu9yx
 9QW4FHUbk78vpdA0dSrI9uLfvJQH1qN8HRJl8pBEC9hukaGN47NAUDZFCNb8hokTlRVN
 HKWRd0J47t8Np1zFWlEMDYvRblTUT6cwqziRLTAuAlPqQsCLZw4qAyN9jspd5mmqrdT/
 2Y+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW80XQwSK9ca8fZb0OsdRShRg37pLEKqJtHhMuyhmFYT2qW4mv/9DyOz3Kg7f6INRB4ksAMNjJPtCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCEkY7UzRj28SOUprMhsC6AhGlQlNk2ApfzMa6vd2ug200Rsp9
 e3p63LpcWgRsZ8ndL9K//I5bDD1HQV5qb3eWcKRqktrGyGuVMOdmbwaR/JfufFxxnVGwA7ARJTj
 aEtosIS/gPqLYu9357M7pq/54Hqyi69orUwglbU+K3JKdKJ7TIq+EMsMxNiiCYHnASYZeS6s=
X-Gm-Gg: ASbGncvXBBizBsOkYHt2vtHss7wucwhgx/jAiqS6wDyOmSQ+oLqTrzff6ZV6xBAn/C8
 kdunw5u9lbP/5KLn8CAUH9t79nncxnmKKoo48kHyehgqKnKCLU6ls4a8BzWOXApV/uljlB27bK0
 bxKupbQWvvmABXuoYAiHVxkP6OZImds+P04SitAgY02Fbgzxh6j9c23INczCezZp0L2p7aYbHpN
 viyQ4SM66mt7vFeA3FEJJ2Gnv2i1x1jh5t8/P07qsqPJ8u0exGnw8lMDAqQsLTLddEmlG7ODMXo
 QCCKJsAKyaV6HcH17tUoICNbX3M+o39Q5i65RUaytmXbhJ/CnSTOCD1bI9gM16LBog==
X-Received: by 2002:a05:620a:6602:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7cd467c4007mr1513813385a.12.1747928805786; 
 Thu, 22 May 2025 08:46:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiKRSbbD41irVGLfYtLkKbe4C9B7uKvwVHMUiBaO4TNnpjcbWsYp9E2jR7CrcfZnNxWdaYfg==
X-Received: by 2002:a05:620a:6602:b0:7c5:8f36:fbeb with SMTP id
 af79cd13be357-7cd467c4007mr1513811485a.12.1747928805416; 
 Thu, 22 May 2025 08:46:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f1c7esm10621613a12.14.2025.05.22.08.46.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 May 2025 08:46:44 -0700 (PDT)
Message-ID: <1d615331-2d60-415b-8f53-0d3a7b5d5fe4@oss.qualcomm.com>
Date: Thu, 22 May 2025 17:46:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a7xx: Call CP_RESET_CONTEXT_STATE
To: Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250520-msm-reset-context-state-v1-0-b738c8b7d0b8@gmail.com>
 <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250520-msm-reset-context-state-v1-2-b738c8b7d0b8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: TvXA7Raokkf4m-2NVmuR4c2_1sGPEtQF
X-Proofpoint-ORIG-GUID: TvXA7Raokkf4m-2NVmuR4c2_1sGPEtQF
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f46e7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=F6mO5DdtRwjxTSMArB8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE2MCBTYWx0ZWRfX07431AN/jp+l
 IeMZLjj1DMfbTrcnQJTO17CCVhCUCiyRg9bERpvj/p/8LrGjuMs1fzmDugDUhKeFskXroPO8xp2
 SHSU/zjHmMfPd4/DK04PEj0T81nMugvUg/rDMx95m/kgVUE9+2FxQE3qMKQOaOQlwB+XwERsGv0
 3XCAeJsnZxgNKDESyWxFphhqkRlGdLZSbRvpwH4bSVGp+SUJtJFk+VydytvErKgpzmwD7baRHzY
 czdChO4uJgOX4tHr561Ak3xyXIN45FZt8VbWsfEtIoS3PI+48bPaXezjUYG/XoQOcx6VsrCgHY7
 kaYKZ3t1L/qJcxP6ivXKnmAmIm1A2NQkIqlowS0SG9oyWIt0jSK+/DmpVVHLqRNs8E2+tYqpTFM
 SL4Z+X/kki9OYEe1GaRF+F9fAo/eYUDHcrNTRbK5sYifnr+3bVgHEPWaJD6jLV3ZSYvRrXGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_07,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220160
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

On 5/21/25 12:28 AM, Connor Abbott wrote:
> Calling this packet is necessary when we switch contexts because there
> are various pieces of state used by userspace to synchronize between BR
> and BV that are persistent across submits and we need to make sure that
> they are in a "safe" state when switching contexts. Otherwise a
> userspace submission in one context could cause another context to
> function incorrectly and hang, effectively a denial of service (although
> without leaking data). This was missed during initial a7xx bringup.
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 06465bc2d0b4b128cddfcfcaf1fe4252632b6777..f776e9ce43a7cdbb4ef769606ec851909b0c4cdd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -130,6 +130,20 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>  		OUT_RING(ring, lower_32_bits(rbmemptr(ring, fence)));
>  		OUT_RING(ring, upper_32_bits(rbmemptr(ring, fence)));
>  		OUT_RING(ring, submit->seqno - 1);
> +
> +		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> +		OUT_RING(ring, CP_SET_THREAD_BOTH);

Downstream does CP_SYNC_THREADS | CP_SET_THREAD_BOTH, fwiw

Konrad

> +
> +		/* Reset state used to synchronize BR and BV */
> +		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
> +		OUT_RING(ring,
> +			 CP_RESET_CONTEXT_STATE_0_CLEAR_ON_CHIP_TS |
> +			 CP_RESET_CONTEXT_STATE_0_CLEAR_RESOURCE_TABLE |
> +			 CP_RESET_CONTEXT_STATE_0_CLEAR_BV_BR_COUNTER |
> +			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
> +
> +		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
> +		OUT_RING(ring, CP_SET_THREAD_BR);
>  	}
>  
>  	if (!sysprof) {
> 

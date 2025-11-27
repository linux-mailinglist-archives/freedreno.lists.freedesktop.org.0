Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF977C8EBC7
	for <lists+freedreno@lfdr.de>; Thu, 27 Nov 2025 15:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A44610E797;
	Thu, 27 Nov 2025 14:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+ED2TXu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sf5lMAIa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF4510E76A
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 14:25:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AR9bD8D785221
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 14:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=; b=O+ED2TXuJmVoFhaU
 km8EVBUOCpZ3HTYumGT5retiXw2EepI2LX/yrhNaaVRUxY69I9/mOjjmUJNXx1I5
 DmxxdYG6q9vWFmPJDM1tNUecRRbYBVY69r5kdRvtMfUzovwJp9WUHLR4V+XVHsdO
 hMxiwJErYI1jtUjj5UGAwUgau62nLd9l8nINhPmpOTLRXeXHOKrhrGNWNoTZJgOr
 ZZQUFzJLnLANgZL1XAfrloxZfRe/TkX078X766fGui+6m8P0+IzmxXJbareqdHP6
 m9wPqr1LgNAstcsOKZS5oFwCNH6nMyWawvheH3KT+3FVg+L/gVZYFyyrELZDRbfI
 /HpfkA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm61rqe5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 14:25:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ee05927208so2552471cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 27 Nov 2025 06:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764253531; x=1764858331;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=;
 b=Sf5lMAIam3rLDntyGziDpC+ycLbHiAUxkNx4RawKLAVHb4+IjwoA/tkism4ep9NrYF
 roBhhVUKS2zRmUNJnDk+3bitUHxVkT9HXCOh/cr6E7op6cBp51LgfWIG7QDtYYVHtQnw
 0sSHBWNEsTx0UKCU+lnAZW/EOujnSZ2goYK+9XXjDnIcZX3gQSkwL0wdWdaF5HtABg9j
 X1r1KZIpPLOQlWG04Qfe0ApBJYjcDbohgSmWrQW3VrdWfAoltEa23UohBR/YJldKvZfX
 5IzgIIyGx16UUgXU4dV5Wko787iHDjCbcLTByNDjezEVipTxvdRPsAdQD/1gcKw1jwJX
 cNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764253531; x=1764858331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lXfQGw9aQcdQsXAqShAhqg7C4NopwvslBYymEWJH4zY=;
 b=eEzsIYxJOxIK9pMlI6jss/TRN+PEM4VW6420BcUxB3M2CgKlOnCD6NxJrwUHwaUTvW
 ioz9nYCeZqekSMcINeiifjs5I/Dj0kH+PQNa7VrGRp88Az7S9ItbWFWuoIBwvh7jQHeZ
 OQj7612kweK058H2/k2ptFEQCmxqfPWzj4yYzp8xmcATFNiTrhZRJpUmZNXleYYgWeBf
 WJ0CiFbX2zqmqiLLF07ttIK0zcFQW+T4sSV/C1hjHunBrZp1YugfEcJMrRhNdjaJavYc
 EOT5OBigeqqvt3Uc6PtD1YkG9EO7c7GeRFGtfdXrsSLqzdMLiu35vjLzOg8ued+e7Jj2
 mk5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVpKycKCu0OXOdFANhS8F/4dLpNQ4k8AOcpdZwU+BLLlLm/1IbWHGTd0iaufs20l1vMXm15iRHBXY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzUNUwwifaaLaahi0OgwqNou0hmvqgZlpGZI6jfEYwUD6DQtBj
 ILL+zkX7VWvjYh5OsdXKkf7BMfoTYw2ZdBNZ99nGAKiClz+VL3VLtv9RcBe1rWC6N9JA9ewe0gW
 NtC1jYt3H8F4vWVad4QaLyX/veUefNiRoXOKlNzinmDGXbr7asK5PzaxkAilVsbylTYUUCwQ=
X-Gm-Gg: ASbGncu1lMSKktxW8jPRv/5yHWvDThAMngh1NrNOHUNicECBy+qXNA6KvBjqpYJPNZR
 zF170u4aWuNB4Z2q48+EfhfuGl5RHPcR2PjamgSxAc5sf16+CtgCqrc8CZx4LrTxnessv1x5jmu
 5r+V9meEZ2YGuRPp/UITBfwWXUx7tjnFLY4y5hk0vtzeUHUTb+X2qc5WOzOfNWF8qrxTOiiThEo
 fpixmt+Iftecl5AHTDsD+XpLxM4RVCaD19embd++CvvicQCVsaXxwFodV1mNlUnfSKJmULTu0CG
 27HxzJyZN58HqWgeZtCk/mH3QNaDmSujt/AjOWhJxNsZD5E/TKYZ2uxjnLAvlUGGD4ppocAUfDw
 TNJEczxACdIp8T/8E2bpaSMyUZtuss/1m7qENOkUD1KI2Ezvl9Jx2EVtCK31rEglLTZs=
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id
 d75a77b69052e-4ee5b6fad57mr245601381cf.5.1764253530911; 
 Thu, 27 Nov 2025 06:25:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1PEAD2AIQg2biuCDwbY2+IKiEBg3avLNdeTwyi+/WMXHOuqe/1V83hpMDDO6bHfXgntzNkw==
X-Received: by 2002:ac8:7f47:0:b0:4ee:1367:8836 with SMTP id
 d75a77b69052e-4ee5b6fad57mr245600931cf.5.1764253530457; 
 Thu, 27 Nov 2025 06:25:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f59a6a67sm172720266b.34.2025.11.27.06.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Nov 2025 06:25:29 -0800 (PST)
Message-ID: <58570d98-f8f1-4e8c-8ae2-5f70a1ced67a@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 15:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JDj8aA8PamHXcwq1blkO3Ya1VATS4yLR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI3MDEwNyBTYWx0ZWRfX9ygpiSJmAYIp
 X95GStATFzvkeJkOk8W6i58qmwuHiAAkJ9542HzliZyBqtwCq3wMcWDpWYvdioolYebUlnwj/3f
 WS8iwbGrPyc2RJW81irf/JpJvcpCIYcaJouKpl/sqJcN+naBR08ye7q76+gYPIBwALlbK11kHq1
 a2CdRVt8a1rhl3DAotzULf5Ozb/8pIeigAIf5l9kwqqlThz9WfIsMa+Y/Z8njhi5YA6x1rJJPLz
 Pl0KJwUR6iuOXNXg16Wu5+FKJ3g1mxSsTK7g74ziM628BPXJL/GgfmqgUITot17huEoVj6DyjKr
 UE0M8IXqXfYhhkABdXzJfmZlf99TFDFTLqt2qTZJFQ1oPCnoo71w3jZVPneh13WSez5Yn7HkYB6
 ikz9N+a0S7UPbHj1kxptEX/LRFQgbw==
X-Proofpoint-ORIG-GUID: JDj8aA8PamHXcwq1blkO3Ya1VATS4yLR
X-Authority-Analysis: v=2.4 cv=IciKmGqa c=1 sm=1 tr=0 ts=69285f5b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=51bRkEKeLUuq6sK2_JkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511270107
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

On 11/27/25 12:46 AM, Anna Maniscalco wrote:
> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
> but it needs to be programmed for both.
> 
> Program both pipes in hw_init and introducea separate reglist for it in
> order to add this register to the dynamic reglist which supports
> restoring registers per pipe.
> 
> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>  4 files changed, 109 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..c8d0b1d59b68 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>  	REG_A6XX_UCHE_MODE_CNTL,
>  	REG_A6XX_RB_NC_MODE_CNTL,
>  	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
> -	REG_A7XX_GRAS_NC_MODE_CNTL,
>  	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>  	REG_A6XX_UCHE_GBIF_GX_CONFIG,
>  	REG_A6XX_UCHE_CLIENT_PF,
> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>  
> +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },

At a glance at kgsl, all gen7 GPUs that support concurrent binning (i.e.
not gen7_3_0/a710? and gen7_14_0/whatever that translates to) need this

Konrad

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B737C8C09F
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 22:34:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C7410E6DC;
	Wed, 26 Nov 2025 21:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dxvIIT0D";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UlHMUq0i";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A66610E6DC
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:34:49 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQJMOPa2388033
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=; b=dxvIIT0D9F1y4XWL
 b0Z8hg0g43gIyEzI1E1v5AHUGy4oE5JKE4XmhDBNbDe+oSJmf2a9CE/rvVnAO+bw
 z46dAjQmBYYjINqPhYczsbyBXTEExVQEIiC1tDiqUtlZqmCFsNENeZC3rFCSNOR0
 vShmG3qo9oyQe8vgIo9GEhuE8S8aK1kfUHEGFPPQDr8LTjGtmLSSqr7obZv8efzY
 6imXw5v9eIl0eTOkzTZYL4ms2M+qUJgnlZPUFcroeKY8yth+j7o/AQJVc7nvTcf/
 CtxcCHtCjrfeLHvu44xAYwbcuS3ErFIfVFi+I0/TuTFAkVeE3+lsvHc7jtkO8bCm
 pfnUdw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap7n8g99g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:34:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7c1df71b076so278232b3a.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 13:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764192888; x=1764797688;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=;
 b=UlHMUq0ilhBixS4NDvZKIQBLGk76U2RCUFkWGavLs1U1vFm6L8pCVKcIp/pGHdnuaY
 u1fHldOb7j7SPkHHyg62BZhLgI1kiq4K/Cw0fxnOD2uKhog8rFtQkpDQvzzhmn6LBqFH
 wEzdhxSoprZpRD/HamacrbCIjm2FBnquxZ0g+vdJ1pC2LOcrgpCSSAVE/jTC/AI4m8ZI
 ThZ+rexgaap57CG7kRdQeUannXa3EqrNyD8No6rrV8hiCQeKZbDqYIMLe1PTpdTGPBX7
 qBJ4Er61fr2sMYjkdlgxsyu8YCWB9f2li6xRMUeaa8xqLW5cYUT1hyZgOpZQrqNZLn0f
 x7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764192888; x=1764797688;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2NwkyEIbP7mfwEd4CBJ0OPJpWw2cL6nZtgf+1stJqQQ=;
 b=qFhF1YhWQ8D805pGjiz1UeHFIAjsVavFRngwzG8LBYpL1PTdAPLo0UoCXAB71NgWNR
 vCNrqVa9fULFj5OKcnwzwLddlV2GRDBBdukoxw58lqt6oYT2QPu1jXZnhIVYVBw+yzno
 pU7kvKhrTbAYOXzs//oZ89372R4YrqSLcfjeKzZ67B/J1V47QzXmTZDT8H3ckQXsVhh/
 yc/hmltecod47knY7hp+8t9HiDw/gMYzxo2Q1qYO7b9XHn1w5UGNJDZ7El5ZMgmX6dvt
 wsffR4c7lhwl1TtE4gm3fllPlwIZLFK39zihFCFBY9Rku+5EwVgqOnvVe+idjyGnKcz0
 qecw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCre+gWc0ZZaMRxALMmUyMe17NaWlqgCzX5n2gsAH/yVAUNKuZr7FmAQOCbCx3+pYzsIthIVzo8L8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7ROHaKe1RVXpwDfrseuE/k0E5amaQKLFbWLsqpSwBoRT/Cy8o
 sgha5f7yI0IfbY6OyPqjk2XcKBKb6FNjA0ZYJb8LsEmF/O3AX/9Xs2G6EwJjai2cAZBXhdq1cFP
 YrQ2YYxlFWO0YYcgWK5Iz4kCNyCBBRxZBi38cU9kQ4huUyiZKXK60yK4bL/4I2138BChK++g=
X-Gm-Gg: ASbGncuLy4UCghr7EGJ2SSq2TZWfLB5kc49zwj8bvFXK3SU1pUPHNjnLRdwbdOpKT5n
 olpheYVJAwFiTXcy/ljPTgIhkVoi8jezYK8pC38O7w94OdWpHirUiX4d1Cc3QVebR2ql7h5etZQ
 neFkT+9AqY7l2smSaDvVZcmSohqGuhQHwU3u7j6HNJg/U4oE0CFhO2iY3R6lF6EhnY4y9LaWrbW
 y9lGinmLiH0w3BJMbFZxVfrXvHV7l4ZNeqys6GEEmDDwMY4bTgKBG4eK4UfTv1mDacYbVdtGy9+
 E59NbrsxPhkdJjDKtNqEWKayV8EcDkKgrGlecJPsGFwiqcM1yLigfbJi15/KXMmpHBwp7KO2Zge
 7mfRM6uKTBVhRbhOoT/d73PNCyfFVsIGX
X-Received: by 2002:a05:6a00:845:b0:7ab:4fce:fa1c with SMTP id
 d2e1a72fcca58-7c58c2ab130mr21776573b3a.1.1764192888301; 
 Wed, 26 Nov 2025 13:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzCt9XSY3gyqFZT1HSKkLzlml71T9rXO2LDSzLEnensoelSRtYNU9rQu4G8n5l1LFmUCIzQw==
X-Received: by 2002:a05:6a00:845:b0:7ab:4fce:fa1c with SMTP id
 d2e1a72fcca58-7c58c2ab130mr21776540b3a.1.1764192887864; 
 Wed, 26 Nov 2025 13:34:47 -0800 (PST)
Received: from [172.20.10.3] ([106.216.204.28])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f0d55b71sm22707890b3a.55.2025.11.26.13.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 13:34:47 -0800 (PST)
Message-ID: <7b6dff80-6e20-43f8-838b-3c5b02338714@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 03:04:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: add PERFCTR_CNTL to ifpc_reglist
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q5z64jpSP_HJxoBV43-Kbj31KFxsRrPj
X-Authority-Analysis: v=2.4 cv=AufjHe9P c=1 sm=1 tr=0 ts=69277278 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=RklEKUTwpnVNyatRsSmyOQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GqK8k8GEXUDarboaZ6YA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: q5z64jpSP_HJxoBV43-Kbj31KFxsRrPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3NSBTYWx0ZWRfXwyj1LZOAIVPO
 XkAHK4u2EF2GomBUuMUVKhpuAJ8KNpzYqQ65QvLs4sygWIXTx9/3e3TAas78awNpXjagFNTbEZc
 OKVKJI3qBYsncJXYMSsaDbjKundJqqU0dNNqvd6VwbD76GiqAOSLaa3DS5FuFvFZEaiynt0rIdG
 j9jxnQo6fh5kNf5KP0eOc6/8BP2o59Jyf9vAHlLKDI8Rf0fOR0vLQQgeBcregh3opL4NNXDunMj
 BKLagOpFVmmzZybREUqyeMH8GtE5P115JDMThnqq8C8zfC51PyzylTemft6y3CoeWw6OuD1lD8d
 fA+YuhZ79tQijNxCa3996x59RLWZ6vEZciTndoUXI5vJy98GOxnQAenixaUGuWYaR+4wCXfPg1k
 HVPJZLRvGjC43rt9paHXxic/Wu9jEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260175
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

On 11/27/2025 3:01 AM, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
> Changes in v2:
> - Added Fixes tag
> - Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..b731491dc522 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
>  	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
>  	REG_A6XX_TPL1_NC_MODE_CNTL,
>  	REG_A6XX_SP_NC_MODE_CNTL,
>  	REG_A6XX_CP_DBG_ECO_CNTL,
> 
> ---
> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
> change-id: 20251126-ifpc_counters-e8d53fa3252e
> 
> Best regards,


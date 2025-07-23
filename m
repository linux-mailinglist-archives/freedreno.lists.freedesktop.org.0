Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D0B0EF97
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C346A10E138;
	Wed, 23 Jul 2025 10:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnAwaWWL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0CC10E138
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:19:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9b1fR011036
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 V17Z+d0hImGw2HvJRpGbhQVJAXUpjz394Odn/ptEGBw=; b=RnAwaWWLrHfE57XP
 nhj6x2QQPoD0TcW84iojwQf4BBA2WEsS5cttmXK2FdIjSA+riCntCZiCKC2vg1Js
 IpksfbZV7Ad6pToZP+t7Mw2fJ6MvMvmZh/BWcwE8yqrp3yanbkkYeNryATXoHcHk
 dfBBeLCnTVuEww5C9k+w2xGmx3sn9YEIyrUJSwilwzEDrwhqthlc7sNRhCe5GWTw
 ZfL0SCHyrQXLXXmd56ZetbyAG0cqU8JcELt2s4jX67XLkIgqWe/T2sv3SqCAg1Pn
 S/59z4TzwKKSUo8n4cn9YWzVxSfth1i2SR32ErWs1bokUchZPyw/6bE1sWhv/gaz
 kaxmeA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482d3htsus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:19:15 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4abdc49ce0dso5025131cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753265955; x=1753870755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V17Z+d0hImGw2HvJRpGbhQVJAXUpjz394Odn/ptEGBw=;
 b=ZZBUGz+3kRVtKtHG1Jn6tVmkXMYAjEHycZ79OU/GXvL8/d3zIAO5EFWGNF7wrDQf6C
 YttRPUmxO2OlAILn6ZGBoTCI8Bh9uXe6valIdqxzXg0efzFQh2WPL9jvMy/Kv3GEDn0R
 gTUnHb6ZKhXj3jskObqt6gngd02xldIDvNRNKUmNoEJCkyHvi53b8XwOGAsvms/m0HUl
 l0SK4ywv4kU0xsdjKQbQKJMY5/v5ffPtQ3vfdObwLAjfHBBRODM7q5Zbd6VabHLlEYfm
 FEQyP1dpZOjVysra56dhSYgXyJBYy2LO+suyQACIllGKTjuaT+yA32Z8YUG6PAD9Vf1I
 mMLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp4aIbVo1TkqZFaDzaKvcVl3lSbqLqr2vjPx5o27wu6eKHRoST08v4FYM+259dK3bHOSK0YIjbWnc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxc6AmuoJdDdTE16oqMyCMhFdDgqBZzjVxM1j6PWlQsQt1p7L5q
 XSU6NrqdPuJEhy2QtoMyZj4ReqZbhcQ084nUPIraG1PpH+2lhCi+aQtsA/ln/5i+Y3mdqOwplJv
 paWYkCdajhGhsI25jNqncP5f8cM925Q6fDJzCAaLNJigqMC5sN8P6CJzUerUQWw0TMZ2f8gY=
X-Gm-Gg: ASbGncvDYhYD1hm4CjMXHWKYpzhGjN7eBUCZD9ImgMsliwDsiDo1DHhHWNAkiL6siF2
 O/Lj7U1+gVme2v0o5bc8hjVsQftvhXbJZ9JMFX9bkhenrD2kFpnpFPoTPDsQyJbVDMmK7d7zL9H
 hf/wePWcjqz8MiRP1vYr30bZwr7ztRpq4G7m0B5Fw4G8Hc0yUqyvFo77bmPnHduK9D1soXas62y
 vFGo8U0thMKp0JFVRkFRzHmatv0YjTe7yU20D+27jlKS5OneRYaV83pKj17OS983sKCIPvtoRXh
 5MdjoLmQWIlFb3ngVF6RTRJzH5UmGYHYuKOX4PSpbwLgcZsBENg4lrsaPcIlYBHOiWePZr44Pce
 EPlMYivAPctjVZJaHNQ==
X-Received: by 2002:ac8:7d13:0:b0:4ab:5d40:6f80 with SMTP id
 d75a77b69052e-4ae6dc82f5cmr14375801cf.0.1753265954966; 
 Wed, 23 Jul 2025 03:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFby7S9+brNY6voLnyjlEtGVWjDtOvm42SqEKk7jFypebfRo0SRww046lz8A9ap0ikYoNWxlg==
X-Received: by 2002:ac8:7d13:0:b0:4ab:5d40:6f80 with SMTP id
 d75a77b69052e-4ae6dc82f5cmr14375521cf.0.1753265954448; 
 Wed, 23 Jul 2025 03:19:14 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c795282sm1025387166b.6.2025.07.23.03.19.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:19:13 -0700 (PDT)
Message-ID: <0a2188e7-3919-48f7-b5c1-8f779f617f28@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:19:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] drm/msm/a6xx: Switch to GMU AO counter
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-9-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G8UcE8k5 c=1 sm=1 tr=0 ts=6880b723 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=oovjfIWShZiszQ5o9iAA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NiBTYWx0ZWRfX1IoYXbbPctP9
 0ck2w2ut/9Sj2g6qcM0psIosSXptWuvqhZ/nJ0AmhYRb/EeWiWA3g4jJQm/e1TWA0DMizJPKY+W
 pLFB5Sg2lax41ugfQsJRPqCIV0ILuAdX0kx6JS0DrtoCEBEe36XtfcUhdTQv+pNmMyv8+o4jN0g
 3xHlcDrR0rVBfJEKj7sd7Jxq86pOZJ5X8GLOggq9SKGJqfbC5LQDjZsnezuguwIY/wXzqkZj+FM
 YIV4d1qkLOT/rXffAk9ELUv++5lirOr4IK67f1B907erTp/y2mMAWvNgv4DkZcqM6iwiKnpC6GF
 rBHaLdWs9pBz+THf86Np2m2jWFUk0JuimOoZGCihNf1/ipLxsewn60WYVc6fY+IHn/YOYSCNEmn
 IW2YB9P9z0Z2Emf49NESXoLFHneNiRLcZoIqpOlPmJvgvi8+7glb5EQuH+zkjmrs1zHeKcuT
X-Proofpoint-GUID: 4qj5W2GC0kQxRmbm74QaSResgbd64nBD
X-Proofpoint-ORIG-GUID: 4qj5W2GC0kQxRmbm74QaSResgbd64nBD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230086
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

On 7/20/25 2:16 PM, Akhil P Oommen wrote:
> CP_ALWAYS_ON counter falls under GX domain which is collapsed during
> IFPC. So switch to GMU_ALWAYS_ON counter for any CPU reads since it is
> not impacted by IFPC. Both counters are clocked by same xo clock source.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 6770f0363e7284e4596b1188637a4615d2c0779b..f000915a4c2698a85b45bd3c92e590f14999d10d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -16,6 +16,19 @@
>  
>  #define GPU_PAS_ID 13
>  
> +static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
> +{
> +	u64 count_hi, count_lo, temp;
> +
> +	do {
> +		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
> +		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +	} while (count_hi != temp);

The original logic is as follows:

static u64 gen7_read_alwayson(struct adreno_device *adreno_dev)
{
        struct kgsl_device *device = KGSL_DEVICE(adreno_dev);
        u32 lo = 0, hi = 0, tmp = 0;

        /* Always use the GMU AO counter when doing a AHB read */
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &hi);
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L, &lo);

        /* Check for overflow */
        gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_H, &tmp);

        if (hi != tmp) {
                gmu_core_regread(device, GEN7_GMU_ALWAYS_ON_COUNTER_L,
                                &lo);
                hi = tmp;
        }

        return (((u64) hi) << 32) | lo;
}

Doing this in a while-loop almost looks like you want a lot of time to
pass - REG_WIDTH(u32?)/19.2 MHz

Konrad

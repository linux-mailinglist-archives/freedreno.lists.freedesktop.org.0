Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BCCC8BF98
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 22:09:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7403610E66D;
	Wed, 26 Nov 2025 21:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrIpD/I9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P0uWMSTd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCF1410E66D
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:09:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQB2pJG2122723
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:09:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=; b=nrIpD/I9+2FOXmOq
 ELLsoK3ZOZ3W7j/fIEAJVJj63CoxME2Pf28rmqCchMZ7FelHfK33niVpo4QM/oI2
 fvqYhCHjLF5KvJK9AUnwRZog+or81U8bwU/a+2ksqb5czcgIuVYrlnxna/+Ov/CJ
 Ev59eYXmyHY+lb/pRR57EfTPIi5A0T44y4QOyX3yitaHwG4SkRIqN4BOWxYNkRtF
 t6z6PHVgVHxfYCtXVDx8DZPCfRLYq+WasDoW5Lvf+psRXlcZ/wj6pJjrHZ7BNmJE
 ZHiClQzbYECzArPrW3+633cT0W4W4UICb26hatHZ9bHVuppdwvggMugZhNgk+V9j
 Zno5Rw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ap0b31kfb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 21:09:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-299d221b749so2900655ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 13:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764191364; x=1764796164;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=;
 b=P0uWMSTdNsNaCHdafNjQtAIBTSUQ9WDUc1eiBDfmIGUYiQo90ob3qvuDGnXYzKUsM/
 PSoR8tNMBYarXhAu6KsfP7tyMZjAHXJ4uI4Q++d1eNaFVGOU6NZ+Jd9isvdrkdBp7+Y2
 WMuYQErlDFdkQg1oi8xFAqOTUpDulk8Jpb3UF5DkxuEjcl7nDv0zjcUqDZTTGu6vS868
 tK2kKeDd8G9fWcIl9PhJksRPbno6MKWS1GsJwSNYZSR05z4eoz2jWuG+555N2iuUJ2d4
 pbDfO89PlvlYg/D9KjTRf8MK6Tma29UY0IvVPeXVqLt+O6oEKV5OXVSz5CCgFCdxzSM5
 b+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764191364; x=1764796164;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yMrBrEupzNG/kjvgWInV+ccqxgsF0dGrNdtRVv00PpE=;
 b=UjV5vPOyb01iohw0l2R6v/8S76v19MDcWM/zWJAtCk2XI/rLCkhYXfa2NMQuggFKoJ
 n9u6/n1lOQLn7RoFgeCLFBl9h+LpqwPGt97o24pAvtBKJTV8W72SEJ6/OE/NsLXrEod1
 4hFj2QEwmJZ5uENENe55mTlbAefXC7V17YGobK9j/SR8VqTgBEPtZ7HVQWDM90u8/ScJ
 WKV1uWxThiGET0B6foe7TnMw2xlW5HudKxp75F38671tCvwOl19m6m5AUj1/53j1tUUg
 gVZ9Rej/rjTDMxulvpIseBlQCjFETh3Q+rsUq4JeTO0GRs6L6UfceupiTdxhZDiKJAq/
 wCmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUm09YXltS7SLA6C6bmXDJfMA5sbKywq2RJiyK/DGewzOvGL7TM/agRyrQCUcvXnrd+u5xX5ejOJh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2L9S854TiOq+N5XqxoQlTEhYfM9G/cUGL4Y1vmKghLofcHz4V
 oAoIN17TFIOsAb/M37gjYJZjRFrEJrWNJO9lr8SkmTlKz0ylgty6AybKpLE4d+obdJhkqAkvICr
 GzlMEUWvpq+BchMm18GVcd99Ky55zw9aAj9qPZ2qy0/h4BFqvKSylQxDHlbI6ZN1NJ+nFKpxj1i
 9UbEo=
X-Gm-Gg: ASbGnct21SDSoxR5VnKcMNPrA4O07U3FckxpZnJmsE1/OeIFKamddI1g+gvpmdAlXto
 Evuwhpk527/HuxTNv0Tiu44XKUiqoA8B9byajj5eSImP7IwGFOfNE4dka9MmK8SwiPUEcRJ5Fqg
 i/4hWkRzgPVr52V4BhPjYQNW2f0RHJNR8ImrEyv/We0XXcDrAXCylforj+qfl3VTtFj4hh1ngkq
 Ty5Ee+SQxh/len3D7WSw9IH+lDLymDp8cyMO/YTvo4uT8Zv+8Z4krCi4MpqdH/LxnbZbw+eNOqI
 BJTvsfHqGQ8uSY42RqigRsiE+q5kOgLX8rSwhJltx1RTcyF5vmCGtcRMQ2biRexlvbWKYymsSi2
 Wl5jQllpo6R8f6sqvQIkQ/dXLUmBjguE9
X-Received: by 2002:a17:903:3204:b0:295:5945:2920 with SMTP id
 d9443c01a7336-29b6c575104mr222681905ad.34.1764191364392; 
 Wed, 26 Nov 2025 13:09:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZw7wRDK5hth2e63vJFBF8A71k9+LuzivqF3PsMUAR04Gv7kXOToy8rbBpWlmX1hZZcRTOjQ==
X-Received: by 2002:a17:903:3204:b0:295:5945:2920 with SMTP id
 d9443c01a7336-29b6c575104mr222681545ad.34.1764191363890; 
 Wed, 26 Nov 2025 13:09:23 -0800 (PST)
Received: from [172.20.10.3] ([106.216.204.28])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b107774sm203797555ad.9.2025.11.26.13.09.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 13:09:23 -0800 (PST)
Message-ID: <71d02a9f-993a-4d61-a95a-cc3a9cbdb435@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 02:39:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: add PERFCTR_CNTL to ifpc_reglist
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+XAZKdl c=1 sm=1 tr=0 ts=69276c85 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=RklEKUTwpnVNyatRsSmyOQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=GqK8k8GEXUDarboaZ6YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE3MSBTYWx0ZWRfX3F6QC8Rk4FSO
 wAGPrrN0bGYCNaIgh/uuF0toKqw4zaLVnwiWTmbWjMBPi3wENiFfmg5Q3GeZQYiNsQIhsK4MHUh
 sPxx2TSrc4Ftvbh0ASzStpnYkW7ca6XW/wC0nS1vekgdK/Zmi7x2XVHqO8VxQ2V67jUhImyoN0P
 VvGQN1zZOjz+MBdFRolOqIKt8hY0S2txEgQ7B6IBC8cQ8EvVWwZWkPQ1KRUds2F2nHZsXWleMRG
 zBLLj8xYPFp1XeYEjErlOeGTs+rvwLHv/cjhH65PioH5brUGthQMJ7C86ZioH0rwx470OuDctvR
 SlMDtgdw1pnyUel1o0lODXZ8Ye8tH6edLV8+aVPddhxpIW7RnRxw6IQ8IwkC98N2RX7OInn27XS
 NxD+ePvHRaKxAiQ4CAQSXnBQjyZ4AQ==
X-Proofpoint-ORIG-GUID: JGVyoCjY_VqeOafyS3lXDM4kOAQNjLMr
X-Proofpoint-GUID: JGVyoCjY_VqeOafyS3lXDM4kOAQNjLMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260171
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

On 11/27/2025 12:36 AM, Anna Maniscalco wrote:
> Previously this register would become 0 after IFPC took place which
> broke all usages of counters.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

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


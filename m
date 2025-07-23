Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5A3B0EF0F
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2932E10E785;
	Wed, 23 Jul 2025 10:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="do/DoECD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3092C10E787
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:01:12 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9IKCN025911
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 02eNwnQSdZOrbqRzgnYfd2i6lrz8eYPVvEuITuHkMEA=; b=do/DoECDOeN90vpB
 KzWf4ibiN6N8XYYoDuyxMYCU5SUsmJVZcS3mPpqQsslsJjjplu5j8q7IRQBnT60P
 KOYIIKqpdpGL6d2hg71FmLCmxC7463Sstr1BHNgmXoQHZlfGLW3Rxf1KZ2ophO+2
 47olr6vATftjGZWXDIsUtTNNCu+qknvwkxbfm6YLpY1aEAjJkbX7mLhjp4DtDUZR
 mTKz2f96lME6KjCHSlkO+Yi7OqICekdFpbhIR2GlcvHPllDazIOBNM4zkCM9Hx1w
 2UZg9XUSGubuX1zWLjrykqkdTf9Z3cYBZHbNNTS7BEUs6XlCFuKBo3+6bUs9/q8O
 mwCCuw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ub8a2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:01:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e344f333beso16244585a.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753264870; x=1753869670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=02eNwnQSdZOrbqRzgnYfd2i6lrz8eYPVvEuITuHkMEA=;
 b=b8pnsdAD15ySUrJeA5BitsXsnHoCFPqrwvs08TfS8HSYqhrDtVHRqqnI04GfExCA59
 e+z6vAxsmqKaqBbSWL32vSk4ISwgEB2EiQZBfkWPupQnsIL5Zj2zAd2LIOM9+pAxzQYn
 fdwXR5swrWkw1SWdMCkMM011cNYMxoXTOxAeK9G5XLfAIz7m0pYCWoCH3lYeLXuTSuTx
 EWDCD5gtkX2UH3hovHK3bl7uNdoYsF4IXrqolFHkJ/N3I2lw3RNS08p7EvLzdb/1AzEo
 WJz+4PL0eQVv6hX3c397ACaJNdGeu2QKhbdRntABeD5KxH1qkWrDl8AxDEBmaF7vU431
 WcNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIWVeauKTl+egRw4AlOPFCxVOdNc9YkmTlzAhtKrJXDdWhWos81ilscaXzba3aRyciYpGvdJ/iM4Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJKYMTiP548QTJzKGucRrhN7Gwk529ntNClPDL3zW5a4rdZ+5v
 skAm/e0ad5aI5hfl/JsmobEIU0WwhD7OScDN0RhDpdoBk4Z01re8iq4KUPvGvs/ZH5k+8lVFIn8
 VatG/32oQGFAor5q4fwTfjoJLGLwTXlHVDPj7IH6QbkZDEK2dnIywz7Qqsy5qTyQsPeHyAPM=
X-Gm-Gg: ASbGncvfgBZYeYYj+y5CNTFXc52EmZyT5hNRxg1LalpVkKyCLJuRl8vCEn2y1SIrGHw
 LZMggWcVQA1C0uJw+BKq159XK1g7ln+au7aqPMwcGdBI63Lyfpk9xpx50/gJACxybvvLnsIN/D3
 uzpAvkBpy0LWhNU0DrzpJmiNqPLyJX6iPPTP3Z+l5mZf6UoseEAAuHoiUyEq7NCEaK/967niuuX
 TasxnmUaRhOPLcd0D1r+4SX4hd8jug0mYMhTI83mBActkZLehTVIrGrVR3Dn8UdRaGL5SC3O0gz
 fmznLssXzGRqEhCxpiKroEaH3nJ1yYqTrxcv1nbqnymkEMc98xED+kDFaDAt2xPWl4CiXtv03L7
 vpNjxhHnWlhKA8Eyh7w==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e62a112c00mr102519485a.7.1753264869957; 
 Wed, 23 Jul 2025 03:01:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpCoJV9xj9Gc/I7a8P3qXIdiRSdG1vduKGp1cHjyO1PBWiyVBdxvbjxKAxdAdhWKfRMhgQ7A==
X-Received: by 2002:a05:620a:9633:b0:7e3:3029:44c with SMTP id
 af79cd13be357-7e62a112c00mr102517085a.7.1753264869322; 
 Wed, 23 Jul 2025 03:01:09 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6ca3005bsm1020602266b.88.2025.07.23.03.01.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:01:08 -0700 (PDT)
Message-ID: <9778efad-e9a8-4934-9b70-b0429bcfe63e@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:01:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
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
 <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=6880b2e7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=45tQodLAf9T1fsO_g0QA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4NCBTYWx0ZWRfX6gEu8RM9H2Ml
 yKU7MscBWOxqUyXZECyd239wkOuGg8oggezBOi/mtfZlD3vmZBcRSnaVAVpr5b2MsXhUac/GPSV
 N4wd5US4MQzVh7ZJ0cY6tO0LXW3p+a1qDrIsFM3gO33kLwVlxi8hUGXVcBgKRFKSyL4XiKwOqjV
 wp38/+YPrdb7jAoQVkAjgrz/7rp/PstQwAA58CRDaipb7xpx8nos25j0LTzkBL5v5RZz4a93f/q
 j3+bWZUWFkTj+c3N4+xEPwupjHOdSh69gcmd5jg2Xq7WL2Bkynsl9OSxXB4HqJCNkqA3yI75EsS
 Jxus+rNPYRT5fsCRMa1OnhFZCrY/QYn6DsEfsifxd/aqghIaRibAcaeo0G4/v0iq50RWV4pUDlj
 tmhVL9fyak5uGdlalogjk0foFywneT38Ccxd+qHO3L+mKgfC/p/175kPo1sb2TWt2AMC6tpX
X-Proofpoint-ORIG-GUID: 7crK_aepgiMtM4HyJwNHlPNePiCu6S2F
X-Proofpoint-GUID: 7crK_aepgiMtM4HyJwNHlPNePiCu6S2F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230084
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
> A7XX_GEN2 generation has additional TCS slots. Poll the respective
> DRV status registers before pm suspend.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>  		val, (val & 1), 100, 10000);
>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>  		val, (val & 1), 100, 1000);
> +
> +	if (!adreno_is_a740_family(adreno_gpu))
> +		return;
> +
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 10000);
> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
> +		val, (val & 1), 100, 1000);

FWIW there are places downstream where it polls for 1 ms
(gen7_gmu_pwrctrl_suspend) / 2 ms (gen7_gmu_power_off) ms (as opposed
to 1 or 10 ms here), but the timeouts are all the same across registers
(unlike TCS3 and TCS9 above)

Ultimately it's a timeout, so a value too big shouldn't matter, but
let's make sure the other threshold is ok

Konrad

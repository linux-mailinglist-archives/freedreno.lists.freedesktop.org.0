Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B1EB80821
	for <lists+freedreno@lfdr.de>; Wed, 17 Sep 2025 17:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA7310E62F;
	Wed, 17 Sep 2025 15:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmYGJNOg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB4010E62F
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 15:25:16 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8Xe0u010820
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 15:25:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 HL0iIHuhrw0+QPXTAS58J7uV9gkk1dnDKaysIWMxgeI=; b=AmYGJNOg7ZI9mNqf
 ohNuYKzbBoNUXLEe1XfqGDT4QPC1lDgzm60HYvILfn8U4Nb2JNLHsmA5N4FM/Gob
 ve1MgvnBFB/mDsoUTMlag1zyMHHND41OJ4NYgFi8UOty8+wxv8JXM1Do4h40WBAv
 gSu5FehDq+UXNv7Ek9dbdUO/rGo/9PBhhIl5qxCIhOMUFTKxV8xKZJnZRtmGDKOZ
 9qOki9ZUjt6ML7mu4WCIiaepLLxHqltbO2n8xiA29SU/hzHmGwcaDd5Pk/Qxa/8z
 GzQT676WCBNS2ho43eiSvKFqtoylv1Tg+uzRd/98I9Nj2fWNvBVZVym7us9PczmG
 eCNGtA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxtvpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 15:25:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2507ae2fa99so125392395ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 17 Sep 2025 08:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758122704; x=1758727504;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HL0iIHuhrw0+QPXTAS58J7uV9gkk1dnDKaysIWMxgeI=;
 b=DOjMGBqE9cK76v3rs9KYDgfkhpvOa7hWmIMmxSKk8FJKe0q8Jt2IouqNbDhceUpEPG
 Z5WDl72JLdmgrJsGFDd8GmBhnIdRpL9ZLwDG2wqZaBrTriCEOK5rSB2ryhZyPpighxF/
 9jN/dmF8umieuRECDSQjjE2QAnHU4yYovRZV4/Cd+RrwmsnJenYwH86rlZ4lWaDLagps
 Qv+0YXRtszNi+ZsdCSNiqgdaJSV8EG21KSz7flvSJWaLuRShz6ffM8cn/AQ/9geCtva/
 pER5XnjXjxIdhn7/nnj0gQnLDyWnCOL9SViy3OsLMt7r1H40NK+mKL0hdoOL/ojqdgpS
 najQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4J2IrroWRtqhyO/bejpyRviSMqaHf0QDxOpvxNbz7h+RV+pMgAkMCzLuap4usUNcZC8tXVy3Y1rU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIdQrnHPfVzKr/lul6GXIPbM59q0Bjh7jl0wkAeg6eyclacphl
 hITkx5Xn9CkT7znzoBGXq2xFRFiuWk2A01nKN8F3z4ykzWbbaPahsVCMXy/zl+YbgIZxx+425Ec
 yO7Q9VcpwOxoPWo7OwLBUFBE2Q06fICBx0S5ixaowvGt+cQuW47VEWHMW4H3f9zJhw/GM7BE=
X-Gm-Gg: ASbGncuaVNtRvJdgq1237B6A5xYi9Yks8R5GiL9i9IhbowugbaE+TPN8nxcSdKQ3QZv
 C+J7lxj28liXT7sRUUC7bj8XPf2aXXu1A77QmQAOeGiMdDJPMPWrWCL5BunC8500MFab/gzqO0U
 8ccwX+vGMEywYZM/mcoWK8GNzDkfH3j7bRUDzDQJ1dBd4ECkt8Nk1NjS17TxCa2DkMPOcS9JbHL
 PuirK+EVrJaB2UqytX7yhFV4fH5YFqPgSziNLY3L5D5CdDkTIZF8NzNSNWmUMh7di8WFYBd9Mst
 mwgoc9dHnPxkVgJU6kDfDwuwxV3ZR/lKTNCMNEhmB+ydXMIqElGag+tVmA5Fcw==
X-Received: by 2002:a17:903:234b:b0:24b:1d30:5b09 with SMTP id
 d9443c01a7336-26811ba45b9mr26940365ad.13.1758122703757; 
 Wed, 17 Sep 2025 08:25:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmORI6sNcePUHDL1ea7LBwUjWJDxDDKVUaaJcRzC/M+TlpMhiORpT2SoIF305qk9daBSB9Zw==
X-Received: by 2002:a17:903:234b:b0:24b:1d30:5b09 with SMTP id
 d9443c01a7336-26811ba45b9mr26940035ad.13.1758122703239; 
 Wed, 17 Sep 2025 08:25:03 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c3a84a80asm193499715ad.90.2025.09.17.08.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 08:25:02 -0700 (PDT)
Message-ID: <16701111-9e8c-42d6-8fac-2f4b9a5e5e5d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 20:54:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/msm/registers: Sync GPU registers from mesa
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com>
 <20250911-preemption_aware_hangcheck-v1-1-974819876819@gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250911-preemption_aware_hangcheck-v1-1-974819876819@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX6jOJWn9Bqd9C
 xnR1iCoJPvAz4wdZR4JWj+vxcB7loRf6bepkdajxindyHb0Kt+v4DxwehCHMm3gteBH+DtlrrHI
 k+A0A60Ri9gZoiZjOTOKwXzMsG0T+oulcs6fcqo/H3sBhBN+QtMcXJJZu0RQtgqVtTZZf/WmLEx
 ReSetGgINt97Q05l8cpYU+D33+5wdRqUc/T36dKDkChoi5TctWuVYcLk9FyR1HG71AUM8Ff0nML
 8QDNpt+9tB7p/TBcnLTH/cAN85sAwva9TjPnwdSrmmrvU5liLJsF+cn/xSU9/i30wj55hmHZIVQ
 9SKwneWbmCCPG+RZp1ISLqe347pnLGvvEqP5V4gebJP5fiB4Heiw1Hae0sxeWhuFD3JMF2GK1Uq
 fyGcBJGB
X-Proofpoint-ORIG-GUID: 7D9WM-jw7ouPGK-4J28yTMy_tYwAhJ50
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cad2d0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=wfxb_XhhgxZQwQkhXVMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7D9WM-jw7ouPGK-4J28yTMy_tYwAhJ50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

On 9/11/2025 10:31 PM, Anna Maniscalco wrote:
> In particular bring in `CP_ALWAYS_ON_CONTEXT`
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> index 9459b603821711a1a7ed44f0f1a567cf989b749b..6ea5479670970cc610ca25e71aa41af5f328f560 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
> @@ -254,6 +254,7 @@ by a particular renderpass/blit.
>  		<bitfield name="CONTEXT" low="4" high="5"/>
>  	</bitset>
>  	<reg64 offset="0x0980" name="CP_ALWAYS_ON_COUNTER"/>
> +	<reg64 offset="0x0982" name="CP_ALWAYS_ON_CONTEXT"/>
>  	<reg32 offset="0x098D" name="CP_AHB_CNTL"/>
>  	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" variants="A6XX"/>
>  	<reg32 offset="0x0A00" name="CP_APERTURE_CNTL_HOST" type="a7xx_aperture_cntl" variants="A7XX-"/>
> 

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80EB0DB82
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 15:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9CF010E687;
	Tue, 22 Jul 2025 13:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ix42LYcP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C43910E694
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:50:30 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M83q4D010552
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=7oqjF5MC0Hy5JGq0yn/Rg4yv
 Ty+q3NvX6dPRW/kHnLY=; b=ix42LYcP8E5Pht/0iwXaYs+xrWcU+zW9wPtggSO6
 h63UIPkl0QcoaMtO0SUkrK8OvjWzP9xr1Kbb8fWWMQg2ojSXpntOE0D2XReKNe0V
 CP2veRtOFsdVXuFQFNmFa4l5/0ZLa9rQxp2aZEcnEzNY4un/9UxPe7pp/Y19LfWW
 MiMO+NibsZJhTW+MoIq+ZNV30BlEWE7f9/49+T2CJALY/JBIXAVGWf9fPzGSadnq
 BL9ksGZj+Z6Yl4YkExSJm6J80UTGI9owO/m3jYn3aOsdeCZM9NSKU0O2WwAhGejA
 uniajui6/Fe8J0p9gZQnXt81nxGIZVgOLSjsgFKXqjSPqw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t18ysw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 13:50:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e4ca52aedaso248570385a.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 06:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753192229; x=1753797029;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7oqjF5MC0Hy5JGq0yn/Rg4yvTy+q3NvX6dPRW/kHnLY=;
 b=nKS7q0iRwzW39lct1+K+WbY1dn6Nt6L+JHsPgNfB46j5StHpRwM2GJVIjtnmNXuG9I
 FfYI0Dgk3CJ+cbdTvBAke7YXBY6GSV6ihw/91V0K+DtB9+ZczWLklv4vGI/8tSdtHzvj
 7zJ0s7dDG785aAzUPJONWizWAvE5aldTRZmh6urGrRu2g1ti1ZCWbNJ2kSPfdZjec/UN
 TowCr32wOi/sTREh9Z0cCzhItNj+vy0iLOrilac+A3lXHVZvYVbrAxbcS4tT0L76V08l
 rCHXmZgTna3H5bsYJ7HKJERB/uITxtRS2STbFNbwVv61OwOWi1tSZphNzC8akEHaxpSn
 E2EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBDPnY1TVwse+yrKePiTB2+isLWbWTXQ607D3WH+2tpWX69YD+NqFN6If4vI/HWzJpPi/o4K0U9oE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmmItcoOtl+BJlVlsjavzonIePZgF/gfE4Iwzhm9ZHO18gVqWu
 zZNfb+VTRvXNxox/x/UpoFizN95VzttUDbk1rGjWjuysRiJlOIK/E/JPi6tYlx92C0NlM+otduk
 RwmxxUHSorD5pHRFiDWtxXP8xJHMniLKS0Ld9QHyNCkgc/OIcwAAA2f1o8BtcvWBMatr+kC0=
X-Gm-Gg: ASbGncuj9TPEXJn/0/GtUdTsH4FhtKjtVEgibkES2poA/Xqe53bGj4g0BBsVtG7BIpV
 z9aqp855lgF1ShssXMlCNerELVKUaQFV8ry75/9OofOiV1aUYDUJYEqv6hKCYkn5jvbFpYhJ+aK
 0RUPesdvgu+JKPfePcofyKjTolfHmqIfyhxnTXO1fl4wR8G1sk1LVk6UcXMLM+OCd+vK3jyPuqg
 ic6mE0kTKxR/PmcFk//lzN3LG1gCDk0CA7By3ewpbDViIiJyIJu4OmMk/3dnnc5V4YMU5ntqN8A
 iWh8qBHwH50QAsJwzjT0uz7+eyFcLDQxYOGpYCuwWgIycqErziz6hWHPea0hAHM6r7RBIrC3fKh
 S8iTQjWOaZSa6up4/wOIOx+Pubpx9N7xelCPttVVtkbkXyL8E07Vb
X-Received: by 2002:a05:620a:470a:b0:7e3:4283:e9fe with SMTP id
 af79cd13be357-7e342b8a298mr2785852485a.50.1753192228775; 
 Tue, 22 Jul 2025 06:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzoLA1jXenC0NKgRvJhDeIPSOC85lNKUs27uryhYpwh2Gr5qB128g74mtSw4KV/STcGN9WhA==
X-Received: by 2002:a05:620a:470a:b0:7e3:4283:e9fe with SMTP id
 af79cd13be357-7e342b8a298mr2785848085a.50.1753192228272; 
 Tue, 22 Jul 2025 06:50:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f1fe5sm18015331fa.104.2025.07.22.06.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 06:50:27 -0700 (PDT)
Date: Tue, 22 Jul 2025 16:50:26 +0300
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
Subject: Re: [PATCH 12/17] drm/msm: Skip devfreq IDLE when possible
Message-ID: <vng6tut4sv3zfbwogsb74omqsbqutpeskqdnezbs4ftsanqyb4@nv35r7mqmcva>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-ifpc-support-v1-12-9347aa5bcbd6@oss.qualcomm.com>
X-Proofpoint-GUID: _qJt-DJujbzyXQTTM16Zb8o7W9pIPsOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDExMiBTYWx0ZWRfX/HQIrmBsYmf+
 HN0WqtRZP/r45UzWnYdf4N/X71SEYLHtDZecX21V6em6ppasAf1C3J9BfPm2s/HBX1/RoiTIcjH
 CeNqi8dA4CBadINjqQW7WyRGlx6F2UUTjYuxxbGO5b/sui181FqPbVPnGtBeaQ98Z0g0TLsww4n
 Juc0H7J+KsZMSEmOsoJl+SnXXKOdGViTCz8UJHs5EIa8BFbxuiShYITyX8plobBY1Bc5hMM1r0z
 GTBp4IMj00bbleLeVcGNaEZzOuVbKbUNAwhycJlzuT4oPpL9m9iFPm4RUjtKJhJBQZRNWmNZEoN
 CtJHS7CrXJZ0eaCFs1fYTo6RafjryZUQ/J2V9uHQeDjfGKIJvbgWmkcWOvI1eGfbgmtKdU6Lawq
 3SYOzvQdddkbsFN4FhXq5LZNi9ZLltZ2basitOmQjCNT0Yrhz93pkc2/l2iabLHCClkwa0uX
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=687f9725 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=lzCaEFjWca4eqRuaUDUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _qJt-DJujbzyXQTTM16Zb8o7W9pIPsOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

On Sun, Jul 20, 2025 at 05:46:13PM +0530, Akhil P Oommen wrote:
> When IFPC is supported, devfreq idling is redundant and adds
> unnecessary pm suspend/wake latency. So skip it when IFPC is
> supported.

With this in place we have a dummy devfreq instance which does nothing.
Wouldn't it be better to skip registering devfreq if IFPC is supported
on the platform?

> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 2e1d5c3432728cde15d91f69da22bb915588fe86..53ef2add5047e7d6b6371af949cab36ce8409372 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -4,6 +4,7 @@
>   * Author: Rob Clark <robdclark@gmail.com>
>   */
>  
> +#include "adreno/adreno_gpu.h"
>  #include "msm_gpu.h"
>  #include "msm_gpu_trace.h"
>  
> @@ -300,6 +301,8 @@ void msm_devfreq_active(struct msm_gpu *gpu)
>  	if (!has_devfreq(gpu))
>  		return;
>  
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return;
>  	/*
>  	 * Cancel any pending transition to idle frequency:
>  	 */
> @@ -370,6 +373,9 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
>  	if (!has_devfreq(gpu))
>  		return;
>  
> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
> +		return;
> +
>  	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
>  			       HRTIMER_MODE_REL);
>  }
> 
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

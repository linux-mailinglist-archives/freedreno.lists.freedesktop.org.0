Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552AFB522E1
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 22:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D5D10E9E1;
	Wed, 10 Sep 2025 20:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8F4g2wH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89B910E9E1
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:50:43 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgNp4013144
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SPob3xHolBsWwjw80JPpgSx8g/7DdiQrQAaQRydH9WY=; b=V8F4g2wHOl6fj7hm
 4qkm0WgSAHE/uy+VoHAMy+ROcydNcqBvT4x+C9Yh72Xffie0sm184uN4Ug9ByPKp
 w49V8bDrrPxsfEU5i56Y5TvWozYh5TPB27EH6liK2hxR7g5mAg+v5aZduW736bYI
 wIr/qsEkvVLwS8Mz+RSCOGY74+lYogsyqgQe4bjb0v/FEjiJlij3EvHA3kgJcJz+
 2YFK4fRYHUUl9JbnfqlTIa2qZR47WODt6IUbd1s455yVK5fO2zNMv9Szhb0hs+UD
 mOSy7gByFmK08M8G2bI8khzQWVmwiP1iL3C6kUD9wr5J+OV6/mKoL9fQY8DgYWRr
 5WaBfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ad7c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:50:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32d4e8fe166so8004458a91.2
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 13:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537442; x=1758142242;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SPob3xHolBsWwjw80JPpgSx8g/7DdiQrQAaQRydH9WY=;
 b=qBGfjHW00q2xbhkVk2c25WjMRoKosWCEO2eXq6zYxxvMJV9sJdG0GuEuIwJy8HdiHX
 YVUeGcwp3vuIRg1mkG+oC1ngbVmm41eJIM31aIqepYLFP5CO0v1K2feqUW5wPDeoR7Ve
 9ZnSXjYaOLaw17KGls5nC4dWyI3IBhKMbtqArZw36NApxzeq9ZK6vqfRWt1cJ5c4i1sT
 F5ojbzDxHs2DxIe+D55z86+S0MQvptKpZ6XHaA0C8fWwQy9KIp+CjpO5lp2vaSjgm6IG
 WQr0izlhUdfbxiMaEllYt8PjoJ+K5NTqc/okDqtKm6snBsvc8WZ/0uGKbLdt7sSxiYiP
 s5Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzARbQQxAInDzQLCWInyUjfG59X29JfjcrTirJwoYJ6AJHcp/ybHDZJEevOGl1KuyjMQ8MZcSNbOg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7lAUwHdMx5TLieeOnamzP5I5HIsOX52pRKiWYT50LyqkKjKjP
 pcpOpIbXKOoQdyL6oDo2/i7exv59dtq5eC7Lu1qmxfsk82Phbb+BRmpUBgHRV1nW6lw0BneJeyp
 6uTntub1cuuGXzFeCx6xvNI/sEUtJ0+qXI46u/MOCRcFY6NuR74Zf9hfalQ5UDbJTB+ZiQFY=
X-Gm-Gg: ASbGncuUEz9e13NyULlznGGkr7SMH4CtlGNqRHEf4LF9/f/uRqQ8FdwekfJp5VRcjid
 E11eGaSQtZqRX7FqaG8rWccrFUZH4qOsfJFtc69sfRL2JMLcC/6uXEh/X9ez0NlRF0b5LRF+yww
 +FPSD0YQgnyzb7rdxTKF1fYKIyA14cciA4NLxUaNmvrpm7pWwUGZ201s1ggkUjFL/QF4iwIyr+L
 +FaKf8WARDUjFamSdJw32mhuTXV/sO7EpkW3QxDsbvlBNN4Yxy4kJGzuToJA5jurRn+0AJFAPhP
 LcFcGeNOFVV7OIt2wYPHtRwKpa7vzK8MfCR2TYSpRoxgEmB3cqnqW9azSyz2hVtA
X-Received: by 2002:a17:90b:5584:b0:32b:cb05:849a with SMTP id
 98e67ed59e1d1-32d43f936fbmr20933676a91.29.1757537440765; 
 Wed, 10 Sep 2025 13:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgJXUpYTL8I7hHNV60o5NvlVmaX9wyglwKhRnYCLq0zaPYXXiRus2xum9n0Qgv2GWgeXlXqQ==
X-Received: by 2002:a17:90b:5584:b0:32b:cb05:849a with SMTP id
 98e67ed59e1d1-32d43f936fbmr20933645a91.29.1757537440323; 
 Wed, 10 Sep 2025 13:50:40 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.234.137])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd62b59ffsm45380a91.7.2025.09.10.13.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 13:50:39 -0700 (PDT)
Message-ID: <69af97f2-75bb-494f-a081-cd967c442c15@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:20:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/msm: Assorted fixes and changes
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c1e4a3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Cna2H39EMVpDwGpHkUETmA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6_OwgA1yP801watpjiAA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: EI_ARWcIM6efO77x6O1ciScIU_6ixZ-o
X-Proofpoint-ORIG-GUID: EI_ARWcIM6efO77x6O1ciScIU_6ixZ-o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX1mA3biWXwu8b
 CJNJCx8ISkpS/FB1R84zLADnG/zSEjka5GKleecikImfqzJIVXYvZpYxKOxbA6Lblfsv+dUOQh6
 pfRnZdibg9eZZKVhxCTckpq7z4rvS4NvQMQMYvxwwsn1/WMbY8fR5dTIk2ImSE1bYgeXsKVdqOS
 cTBzIA8Gffbbui1Qsqcv3fmO3vhOTCkftEtNuMlAc1iQUm5c25BKlkuiJ0b+lziP8SyzMzj9q3o
 R3HSjzqNqKFg+/5bg4vd71fPjGDbyeWQVijdjdI+AB712AeJBKQCaY8W5fllS2L4VxcU3clYDUd
 bzmemFXCTsrT2mIW83P3wdJZRV1mFcWdnLBqsSH2lZjEUZ4kThCmk2Byn4q4qysgFB39qQXKaB/
 ICaxLaEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

On 9/11/2025 2:14 AM, Akhil P Oommen wrote:
> A few changes and fixes that were lying in my stack.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Oops, sent it too soon before updating the changelog:

Changes in v2:
- Update the documentation for DRM_GEM_GPUVA flag (Rob)
- Use parenthesis in Macro definition (Konrad)
- Reworded the comment in acd_probe() (Rob)

-Akhil.

> - Link to v1: https://lore.kernel.org/r/20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com
> 
> ---
> Akhil P Oommen (4):
>       drm/msm: Fix bootup splat with separate_gpu_drm modparam
>       drm/msm/a6xx: Fix GMU firmware parser
>       drm/msm/adreno: Add a modparam to skip GPU
>       drm/msm/a6xx: Add a comment to acd_probe()
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  9 ++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c              |  1 +
>  include/drm/drm_drv.h                      |  3 ++-
>  4 files changed, 24 insertions(+), 2 deletions(-)
> ---
> base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
> change-id: 20250901-assorted-sept-1-5556f15236b8
> 
> Best regards,




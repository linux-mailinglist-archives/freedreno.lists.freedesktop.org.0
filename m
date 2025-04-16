Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C82A90F78
	for <lists+freedreno@lfdr.de>; Thu, 17 Apr 2025 01:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDCF410E9E3;
	Wed, 16 Apr 2025 23:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CsqrQAXT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090710E086
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:20:55 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GLGRkJ029868
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:20:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=O+bay3u8UkUVUh3z4kt+jJUd
 J2Y3Kg04YyWU0gm+6Mc=; b=CsqrQAXTNSS7hFeXDgqLDm2NwS456itAL6Lf+0FU
 H1+oESwd+4CmlAEVCkNpbdgtB1Qmr9ndpC/wx0H+sw49/ak4SN9ISyPwTy9JyQei
 ToVBZqQoqvnS+MIvLrxETEiNhtSCjw+ZqnnNWxfM9u2w6d2Y34uRC5h0BL4Ru8zV
 a0549cC8O3REmpKAFZspuvMBEEMoUk8x61DFoHXMk11Sbp2iwohsxpchydXxp/DO
 u3xnw+9mhp1rgscNr5z1KMXoY7CNcbGxyh0b59xGgbILfvIfSDbthbmTAxlGRMKy
 usikbt+TUAW3gmO94+t2jRNYfK/MXKm7YzSSb4S8LkpScg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk4xdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 23:20:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e91b1ddb51so4968746d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 16 Apr 2025 16:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744845654; x=1745450454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O+bay3u8UkUVUh3z4kt+jJUdJ2Y3Kg04YyWU0gm+6Mc=;
 b=nJBJFUHkOHI6bHpD//6TDxGaTbJqZM/berdF+PA6VzeTT02cuqLWSq0/AoEK6L8oOl
 iDK0LuyIARTQd727rgONDkE3PYmJenryLed6MZBHSeon8d+X2yUmh6Xx3NmWmHNrMVbY
 dT0ocdaHxUd7sfIevDREVbEaHweE0ad2oqx4Qe66/mI4gUxD1wFRfAMyI+rDWEWV2DCY
 hWdJKg84ziTSuM1yksYWgmtCHk8cA9KtWiqP1Sze3Ies7W1WWTFIzP+0OJU3eqtRIuCE
 EJJUif02IbGv3zuLEedTaCYdryMooOsVS08q/4S3pJqPv6nhLQFAmSqC9rkhtK7YetOG
 4szg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZyXNfI5eG9+HwEDUW7Uf/jaMzGfHhdboaX78937032/pErbEI9y4h8KlQuZ2wHVJ6qcTIU/HJcoA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLi1wWcMHGN3ZMd0m67wbnaSFaFl2qBBVTRji5PenQgPfCJF3K
 5I3U21eKHKPCKy3IARKq11zx3vN35FN2ERHm8KN2KDPDMKpLMkftMTbj1d9RKxwYVuiuXPIJ1j2
 XffhJ+ovxNZgm7jg0EIMrPKI5+ZcvUyblwxAnHz8gvNW4qcCZLqR47v36oVVOnC9bLjI=
X-Gm-Gg: ASbGncsOOxi4Si3wBIqKOmL4GwST/m0F3AWqFTnmZF3VvYGqTwds0maOOZwTAM2orm8
 TJMWzShkKT8mZOlW0ABGOiD74ibPW5CKCDshyHo60oVVH1nECMDNgvi3a33d5ve63xc1lnWhlJ1
 /IetA7ziwYYDJ/9RZgsT8qWOGph9yEm9gROyfGGnTysa4ra3g28FM8V1JlhkJWTJJDHeTbEVP1A
 KlNmVGTn3kccmq4TMxmjLhBUY8zFkMS7n4coHlo5FLjpTHxqzSJU95V9S+g9SupZbORdqOeub37
 P46v/wQpEqzk/BYjE+ld/sbEwUzXyyvTfbMd9dn2esEmSsLKUtOnb4dWKNTzT8Si0TVtt1zU/ZI
 =
X-Received: by 2002:a05:6214:20a2:b0:6e8:f65a:67bd with SMTP id
 6a1803df08f44-6f2b2f3e4ffmr54592296d6.11.1744845654044; 
 Wed, 16 Apr 2025 16:20:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBAA9vrfbsRJNy3z4MIqCYUoUGx8TD8fWhZnK3l2Nt2B+kFTS0IhIbhX4Oxt4YB0i74q0tEA==
X-Received: by 2002:a05:6214:20a2:b0:6e8:f65a:67bd with SMTP id
 6a1803df08f44-6f2b2f3e4ffmr54591936d6.11.1744845653574; 
 Wed, 16 Apr 2025 16:20:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d520389sm1784976e87.251.2025.04.16.16.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 16:20:51 -0700 (PDT)
Date: Thu, 17 Apr 2025 02:20:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/34] drm/msm: Remove vram carveout support
Message-ID: <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-9-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319145425.51935-9-robdclark@gmail.com>
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=68003b57 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=cm27Pg_UAAAA:8 a=9D-VRocS9j12M_ZVpNYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: zTnImpZTsUcdHdIAId9mjnukqndpxlW2
X-Proofpoint-ORIG-GUID: zTnImpZTsUcdHdIAId9mjnukqndpxlW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160187
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

On Wed, Mar 19, 2025 at 07:52:20AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> It is standing in the way of drm_gpuvm / VM_BIND support.  Not to
> mention frequently broken and rarely tested.  And I think only needed
> for a 10yr old not quite upstream SoC (msm8974).

Well... MSM8974 is quite upstream, but anyway, let's drop it. Maybe
somebody will write an IOMMU driver.

> 
> Maybe we can add support back in later, but I'm doubtful.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |   6 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  13 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  13 +-
>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 -
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   1 -
>  drivers/gpu/drm/msm/msm_drv.c              | 117 +-----------------
>  drivers/gpu/drm/msm/msm_drv.h              |  11 --
>  drivers/gpu/drm/msm/msm_gem.c              | 131 ++-------------------
>  drivers/gpu/drm/msm/msm_gem.h              |   5 -
>  drivers/gpu/drm/msm/msm_gem_submit.c       |   5 -
>  10 files changed, 19 insertions(+), 287 deletions(-)

-- 
With best wishes
Dmitry

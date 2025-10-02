Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1168FBB2325
	for <lists+freedreno@lfdr.de>; Thu, 02 Oct 2025 03:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0DA10E74E;
	Thu,  2 Oct 2025 01:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzJAo28G";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B9F10E74E
 for <freedreno@lists.freedesktop.org>; Thu,  2 Oct 2025 01:01:50 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591Ic76q005598
 for <freedreno@lists.freedesktop.org>; Thu, 2 Oct 2025 01:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=+uuV+cAEUShNKUExukS8Sgyd
 D6777ETGVMv3jAdKCJQ=; b=pzJAo28GyVqZx1sMk+eBu2npT920kGL71Izeb9ie
 5Sv1dzeXKseKZQpR6MRLHAUdZTQhn9lZI1VA2Tr1CG/guG4ptPbv/EqNjdbZ3lBI
 YS2+vGtRN/g1FHQ8A4vvoHJVpYXOo6BWE5NE3Cpq/joefc9THzWLWwERRU4TzW+O
 aU3+Qqn1/Ww3pk6dJoz1LNFZ/b+SrxJEhks3p3a/vxYFJqGXT/5ARVCMZBk+WTeP
 Hmt2YUjhWVZDtdpfjHfbcwsEvCQyHDsUncpSkhBSRjpcee/3ZFTVM4QGPyksrPOI
 9RUUmlmKcRQakxMFYTFiIG9oNgZG035AY3j1TEyNGLCeYg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851paqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 02 Oct 2025 01:01:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4dfe8dafd18so21065301cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 01 Oct 2025 18:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759366908; x=1759971708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+uuV+cAEUShNKUExukS8SgydD6777ETGVMv3jAdKCJQ=;
 b=cC4vdgkF5F3rRYm8YON9Zfox1cXb3RG+umannVqTaBzxHxDeedozbVfbn0S7Ckey0t
 l77+CVJt4BvgzP9gk3+jtVXrJ4/4Wywvow7vsHpcCtVjE79SGqaadAH+P94mmwybBAn1
 jGI2CfQuNAjHBhBiQdt4tKeKKsJbnZDowh46eBhCFKWos6O31qlnV/OYIiOFz7wbgdAn
 yACpDZmxTD4bK1XwL6fyDjxIkS5metC1HeyquDJxRGkDfUb5CLFhHIt4UvgfR8vWCcBb
 xgsTG/bFuHqU6FjBoTCpSlfo+MilPzoixcAwv1mMKa9AH+UleekzRlMr1nDl3kbPNmFd
 nQ5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiNHVrZcl2Ue1dsRmGA76WvukTsuomzhBtWVjoP9K8iG/hBS16JPmf54Cxcpa1PzlDssz+RhNn6PY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWe2PtswpmwTsNMtk1yCn/j3DhkJS7MyeXaA1iQDq8GgT5mDAz
 zzX0YLXZNvs7krcrkAPz8v3d2Dq/zRdqBOjvn4OLg1oM/tpMJgovdUpZNKrKYZWJaCLjKBEBJVr
 dgBRrALUrCxbII8yuVOeCKTwJyA67FpvDwKXR0tA6a1shlx3iUZY5aqCxLqrqiFDj3lMuM6Y=
X-Gm-Gg: ASbGncu8CXmORKNFGLkrB/w26GlwWRa6hSyxxl6rFLS84WUvwziK6HhLjboRVL7OOKk
 zAxT1oYXlamcy8XsNItfEwMm5VmTL9RG7h8mWHBjVMRVTTm72nhXhlzLQjpCAln7ScjSjlCrLyX
 dWa2/nJwPH/bmJIRH7SW/LBHL/ts1wJJ11yULD7UUKqr9d/W0uWvTfjAdRK6DVqLcxoIC8VwE0y
 Mpm0zNucgpIdEbmiQZoLfEgwtjkeBr9PDeaROq//B90IglO3R6CkTW7tXBHoOEPay+dydN4KdJP
 xxgHOOEDG5L1vrQDDTDx+eZSoOlgSCaLj0KVA7eLBx1n4NJclcjJOvO1yp7Au0F4WoqEI8NmHzJ
 UIJhPlkDxkjDBWWiNX2zIE8ZnjuKTRS0BUauqkuJheInFINNfwOLzAaxOng==
X-Received: by 2002:a05:622a:7c0d:b0:4e5:c50:54c9 with SMTP id
 d75a77b69052e-4e50c505d71mr35071751cf.14.1759366908158; 
 Wed, 01 Oct 2025 18:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn+cgowdIyCiT+tSd84oPTNAKVxBzdxq8x33fvDr8hPGJVsiMB7AsHFEUbdO1IdCvcYvE2oQ==
X-Received: by 2002:a05:622a:7c0d:b0:4e5:c50:54c9 with SMTP id
 d75a77b69052e-4e50c505d71mr35071211cf.14.1759366907553; 
 Wed, 01 Oct 2025 18:01:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0113f3ddsm344791e87.52.2025.10.01.18.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 18:01:45 -0700 (PDT)
Date: Thu, 2 Oct 2025 04:01:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 06/17] drm/msm/adreno: Move adreno_gpu_func to catalogue
Message-ID: <edfc7ke5ktoah7ftjbwk7dzihsgh2mq7tatfy6a5oxbn6yt7d6@yf6nz7b7jrmx>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-6-73530b0700ed@oss.qualcomm.com>
 <cp7djnezyp4whhfqcnsfpes5kxfbyvqvc2ceimdrnrl7s7agyk@z7ozx6oihezd>
 <82cd8782-b2ee-46ce-9964-e564ab6a0199@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82cd8782-b2ee-46ce-9964-e564ab6a0199@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68ddcefd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=RvmDfw1ThOOzoc4muVMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX6WEtiHNM174T
 37u5aAXnaANEx65TmBRvw1OthcF7hzMS29hkbUJ/8kwt3/HTUqrXR9SWJUj9KFiaAKNYsycYLox
 lEoWIfthP2dQfdbeDPKJOI2ZYFpktWtK8PgqSvEZB3piK6Y3xuPziug00eA6jptj7abjFSvmb1D
 o9XjXiSwID+U7SUdkZVpT6qS9u0sSDBq5x8zfxX9p676Clji8i/GHjY0aitG1tSZCAWTnhvsDKE
 7TGf4ruw4wQC7Di9SLpzK+HGvQSrIDy5KJG7uxGKbtiGetyBu982NKX0fmYgzi8yZn711Y3ANmW
 dzbqsYTupw5DXBJCfYkxI5FYpWcg7C7ngR3Mmwq4ShHYn+CTmix30eFgocn1vOhbxMRjd6iYfrc
 HIGQAs1gQQPEKCmVP+tqnqLnnsnsgQ==
X-Proofpoint-ORIG-GUID: EhHsfUaCi0aY-kTunpDzabNKTaKFKAQl
X-Proofpoint-GUID: EhHsfUaCi0aY-kTunpDzabNKTaKFKAQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_07,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270032
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

On Thu, Oct 02, 2025 at 01:24:36AM +0530, Akhil P Oommen wrote:
> On 9/30/2025 12:39 PM, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 11:18:11AM +0530, Akhil P Oommen wrote:
> >> In A6x family (which is a pretty big one), there are separate
> >> adreno_func definitions for each sub-generations. To streamline the
> >> identification of the correct struct for a gpu, move it to the
> >> catalogue and move the gpu_init routine to struct adreno_gpu_funcs.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   8 +-
> >>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  50 +++----
> >>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |  14 +-
> >>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  52 +++----
> >>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   8 +-
> >>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  54 ++++----
> >>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  18 +--
> >>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c      |  61 ++++-----
> >>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  50 +++----
> >>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 209 ++++++++++++++---------------
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
> >>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  11 +-
> >>  12 files changed, 275 insertions(+), 262 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> >> index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..af3e4cceadd11d4e0ec4ba75f75e405af276cb7e 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
> >> @@ -8,6 +8,8 @@
> >>  
> >>  #include "adreno_gpu.h"
> >>  
> >> +extern const struct adreno_gpu_funcs a2xx_gpu_funcs;
> > 
> > Please move these definitions to aNxx_gpu.h (a2xx_gpu.h, etc). LGTM
> > otherwise.
> 
> This is a special case. These symbols needs to be visible only here.

Why? They also need to be visible at the point of the actual definition.
As such, I think they should be a part of the common gen-specific
header.

-- 
With best wishes
Dmitry

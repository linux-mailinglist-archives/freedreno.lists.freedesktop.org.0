Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C0BABCD8
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2785910E289;
	Tue, 30 Sep 2025 07:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hshRb6I+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2D510E289
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:23:58 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HONm014790
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=n9P8C3EgLujC+SyMjcSHJMVn
 TiYYgF5ShDLErcRG4l8=; b=hshRb6I+JHtIlOsVBCil9QBuCchiZ2SvX49aR691
 j4cL9/QnIkuDfSpqQfv3+WCgl/DPub0oI/kSe4TthzAOFULW+uiCdcogm52iRZQT
 ZJZMdP9SO4crLjRvGAKOwb8uPNXgd7fEbD0GWG/Dy4X0ITKMT83EHGCT01XV5xWt
 v0FyH5XcS92EFEQ2jA5VleBvCdiKss+wqWZsuoMPqfd+fXQEoo8AZI4ejb2ings/
 i83BZxxS1ABWC/x2xWYdwe5BqWPAxA5t6rGFisSQg6B9zYc/1EougHlhZ0oINwMM
 cpA1JPQ23+P2stdnT5+A/9rV6lpQ0hvJ45owHmpF6LB7Pw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr0210-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:23:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-828bd08624aso1095316685a.1
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759217036; x=1759821836;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n9P8C3EgLujC+SyMjcSHJMVnTiYYgF5ShDLErcRG4l8=;
 b=d9LWUOhZ5YwWRv99dfU9ToM+tpUjF/0Y6QOtJ+zfuY37LVA6UFKGQvPX7hUksrJBKP
 oce1OzVRaJaXw4UAZvmF3ucJzjv8qlp+kBOcAHav7MpF6qm2QIV2Ntt9brxLjJpIdxPZ
 0HE+AUC4iA/9PFueg8mWvEvr8EaySJHx8n2ysljrEfzGif7vMtWMm5o57bOcFYr+zd3+
 xyeXtc9zrPz1sLbDGquJYPf++THDvtoPUomu4Q0rwdXHWZEr5f8oEjkm7wlcXWtG8pfv
 OjSH9YHRCvvt6wHRXRPIPQBAiA4lbSB323r6BWe6UngJPcO5QEaL62g26DUYNYbwpKGM
 arlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbzj0V5ZJ3cPDOC60TkZJ49wjZ23LLi3rtOqhA3KI7fZxJ39i4tsEkVoWWG5Q33/JAnreXdxr2yn8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw/ZJJl0Qcg3qdx7nCX0PMW2DC7dZOfcM4R+9Hw5d5al117v3a
 cTnD5mmwJIy2J8BxtinaVzMWt3XgzU7Hv6MpqQuoUR0HsSNDfn4Ej5auIKgna/YHpzXMfL3qPme
 FBhpGWysakEOpB3ItG/Tljr8LoZaoq3XWHrS46HXA7PK3RQbbXY3CBXCjipJggYrJ08KEJYI=
X-Gm-Gg: ASbGncuG/E2pzkF5M3RY/Bwy+F3ZodWW54MLfYTdGgF5EYOiD/uxtKqWRsIjNHrlSzP
 4d5MUIZty4hr5e0K4Xhfjx2Zn1Ro2KW04hEdqeJhZ7aSXOPDNsmnNywM+9eiqu8JmlWYSjkbFxC
 dQm8wRqS6POLhvne346BGukKJeCZA536fB7EekCyVVKLfWcQq1ywlQ+I2+dvPYxbkzuFnuQ6oFu
 +PfenkRMiLH1Ou5r+H7+XniyajWlBaRckhNImT4b9lLM84UjbbJU0WV5dGraohFI4zCDRPID4BK
 wjrzz13FAyPGquTRgnmkeATwoM6UDeteDsjmhvcpaOycGcLI/9PbgESUT/xt3eBkxQs+Zj84e/l
 cCXK+3KcHccyVpeAmhKVKGBeSaNtcJrQDdeMAf6NdvBcElt/bp/WfNMJ29A==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id
 af79cd13be357-85ae033ce46mr2294501085a.30.1759217036297; 
 Tue, 30 Sep 2025 00:23:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtokqh05kg7AoFYMORm7EciWzypwxfanES3STHoDORc8Badi06y8IJ5mTLaRxU8ZjwP/+wMA==
X-Received: by 2002:a05:620a:298b:b0:82b:3bb5:5e03 with SMTP id
 af79cd13be357-85ae033ce46mr2294499785a.30.1759217035829; 
 Tue, 30 Sep 2025 00:23:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb771023esm31994681fa.41.2025.09.30.00.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:23:54 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:23:52 +0300
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
Subject: Re: [PATCH 10/17] drm/msm/a6xx: Rebase GMU register offsets
Message-ID: <s4no2wy3yskk6l6igtx7h4vopaupc3wkmu7nhpnocv3bbs4hqi@uhie6j7xr2pt>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-10-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-GUID: IuSNK4onNJne2ALQpv-3p-phRazrjNuA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXyZSVOWi9XtKh
 lxJ+i3YJlsrDKup3k0+n6GOVM5MjXz89jbEHnDi84MKekxDah3nYKo+gg599eSHQ8hxdHbdd/je
 XUEeRiynIpLNW+1S8P4AQ8aSpv46cc8EL1diJNHNugdpt7B1WJKqcIHO2+f5fFwCbr/fc3p7dV4
 k6JiU2Z990hBnDHjhZKef49XhsvqPmuSgn8JlAFvUiGUIMxkGOwQ4VCSXAwlKaLQc2+2SCPYhUp
 Pgjh1yEYS+mER8JAPHWbwbRPh+m7kUgb0jY+I0X7Y+muhPy88nLgIqYsrhxnHcRxwrQcD+WOAMa
 lXBaCpthw+smHX9upalVQQxVLd9A77AvvMmwQ9VC42ZZcM+g5gamCTW3GmEZ8cUM3dTh7qds806
 t5eRI1/Lq23nEG0ChK1knSLxtiU6DA==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68db858e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=xSz5tX2VPR3T1CvqFR4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IuSNK4onNJne2ALQpv-3p-phRazrjNuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
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

On Tue, Sep 30, 2025 at 11:18:15AM +0530, Akhil P Oommen wrote:
> GMU registers are always at a fixed offset from the GPU base address,
> a consistency maintained at least within a given architecture generation.
> In A8x family, the base address of the GMU has changed, but the offsets
> of the gmu registers remain largely the same. To enable reuse of the gmu

I understand the code, but I think I'd very much prefer to see it in the
catalog file (with the note on how to calculate it). Reading resources
for two different devices sounds too strange to be nice. This way you
can keep the offsets for a6xx / a7xx untouched and just add the non-zero
offset for a8xx.

> code for A8x chipsets, update the gmu register offsets to be relative
> to the GPU's base address instead of GMU's.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             |  44 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |  20 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 248 +++++++++++-----------
>  3 files changed, 172 insertions(+), 140 deletions(-)

-- 
With best wishes
Dmitry

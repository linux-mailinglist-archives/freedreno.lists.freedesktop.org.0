Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F316DBABC3B
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE86A10E503;
	Tue, 30 Sep 2025 07:11:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bWBKbjC8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A4210E501
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:11:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4IVSx002323
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kCgcpA/KH22QIJWR6lWCGCo8
 yAwGEj9Grr0AmK4duj8=; b=bWBKbjC8XOLZUBjxlVMArnVyMUk7L/cho3IZ8cAF
 EL5Nz+r54Fs8LIgnnKp8AbYGTg3br1F/XM8U2PrL7PYLnaxGDaTD0JL2uFUtfV50
 V3wAHWQYP4dEKJhvFclfk5q0U3mD6yu3gGTK1NwkDJEx6D9m0AqyNnA+V4M69j26
 PGzcRT+HCKxiNgdXHcMizv+fZtvCp8dSRx/J50S00rvzJlBE10zqROhY4ZkYNuFV
 3V2jA27AXp0UmNXViOWhJ/Dao3UhjAdPPKDHy7dVBl88m4i4xmnbI83xk4iHMjm1
 93jlCRiUpvFuiZjBZj3/BNHnHDUFO6ciosLCHqIIJjqCeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fppr3g27-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:11:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-859e412f2c9so1015700585a.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759216286; x=1759821086;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kCgcpA/KH22QIJWR6lWCGCo8yAwGEj9Grr0AmK4duj8=;
 b=GtZjaYrE9vy0nFI5fRGf7p3vBCwgn/x0qxgd5vCjs+EBf6fS8Tk73pqPdK1UJrR3BN
 tV4BufUWxzGBAWOp3eSYbdz/6AUwxZjZ+wE3ZnchbjtxyyvgM31/R4nAOiI4EPU9YB9d
 nJPRu5kJhBDMESQ29ZHAg+Wn5z/FmnKRE8qcUNx17KqeYCCVJ409M40nYnn1a4oPyyeL
 Akoc08Eny9bFSNsmvTvyrC9VSnUtU283JdD4OLk+QGyhrbYUiWfQHfveJ04lj9J0U+ge
 K907Lifuq/ErOZL56DgegdapEFebnqgserlwheRqBLUVaR7NoFY1/iAhbe9N+K9lBsC7
 fTIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXTpGb07jCmtZrTXLVPea0bP8bCV9Bozg2jmDT5zcx1hciky366UtqXFAINi2DSyh+BuncySKMDSY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9cHsj9mFSEJDNIfVAD7Noz7OruWlcss8z6FzK+lvZVgEyQ4XF
 EV98HCwXNaKyD9O9QsaJuFm/W0ymY1dR7bebZCMHgyFjkKg18jgf2RWYXWaJT00m8wMlYvGZWKi
 SUzr8izLiUYhw8iEFB/e+cLHVFcPhhdlNJnsbGrj8E/BG4rKUMIn/oPYiMvcRXgUFWXfOWGk=
X-Gm-Gg: ASbGncvy8vGB9lNUDui0TQO9IrzbxF+f50meJKSvkghj65RdFQlFCW6u55v8hD18O6X
 R88JKhxwhAaxwOsHsjRgtwA+3eJF6IyzcPfYzqBZLNWA39cAlOcWjq0dHJ5NN1ZsumpiGyygdm/
 pkH/Dm0Bzzf+s73NgES1MakIiOYstdRp8PGvvpWuMF/3K7hTRQI/WjtUwZuWEYgzQg77/+IjQtr
 EunjAKn8AEs1wmONAHXIahPMeM6hhLULtaM48Rwv82RiATygAZQlZ+GKgz1Nmo0KZEgjtiWalTQ
 +cTvTnfPdmd3EqvExvKnn7OTGmuZUrzszTjjSPeDgjbPMJvQ7AfvtuFChGNsUIN7w6WwpC+255M
 7JefEIElKIzgOW2Fws0z3+F1J6vPCIbQ2sW/90AbTUJd4GdPnZ2jJfpQwzA==
X-Received: by 2002:a05:620a:1a26:b0:858:64c:22cd with SMTP id
 af79cd13be357-85ae94c6f9emr2830950785a.72.1759216286502; 
 Tue, 30 Sep 2025 00:11:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYRbssu3zrykdvcozSbij6HKAxVNsfP55t5zEwTHN2XSjTz6lWJykcsj3kQZuHoluEGfqVDA==
X-Received: by 2002:a05:620a:1a26:b0:858:64c:22cd with SMTP id
 af79cd13be357-85ae94c6f9emr2830948585a.72.1759216286049; 
 Tue, 30 Sep 2025 00:11:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-36fb4772cb8sm31868951fa.10.2025.09.30.00.11.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:11:25 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:11:23 +0300
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
Subject: Re: [PATCH 07/17] drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
Message-ID: <x7segnx2v4id3qw2zna6vxxbomfcyogib734ggifggynyfsp4h@7zs7savbiz7a>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-7-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-7-73530b0700ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDA4MiBTYWx0ZWRfX5KeIaZL2AHxh
 lG1KkuuUvjaREzdNMz9iH6P+ukgbZ6vDunpQChV45qT8JNYlVMIfaZ42VOwO+c9ym1g2BOaj6Bn
 7hO1xCqVYFc/vLj5tyS24dwVaAOelV5eOPwFsMuZ9IbtOT7PzhlALAQKIs7KyGcBDKZtsHbN05n
 xNnsZPEkwrAY1NKVvZpqSQCbdTcOyzr5VMWGt9H+VfjWsH6BsgpNrw6wN3xLnE5XzUhlbNBEqzw
 LSeyJLDvDcehM1c7cGYixoNKqr2EwvJvOHe5b63kiBAdPYLT+4vl0xiiE9Egi+KZOSufPhgSYpB
 1M1XOjjUDit5zLWREFA+TIDgxYlrv9cnV4h5yzDlInu6noCWoxbrb3DZLJZL2TqXLaQiZsKPtIB
 DFQJm5X+Q/zaNMeQ2wm5tOyhVabWgg==
X-Proofpoint-ORIG-GUID: XFljUCpx53kfRVLEubVAGwJRUWJePZLJ
X-Authority-Analysis: v=2.4 cv=GLoF0+NK c=1 sm=1 tr=0 ts=68db829f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=scbeE0iXsUk0x8BJeo8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XFljUCpx53kfRVLEubVAGwJRUWJePZLJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509290082
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

On Tue, Sep 30, 2025 at 11:18:12AM +0530, Akhil P Oommen wrote:
> Move the gbif halt fn to adreno_gpu_func so that we can call different
> implementation from common code. This will come handy when we implement
> A8x layer.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 4 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 7 +++++--
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

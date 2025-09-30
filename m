Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563F7BABCFC
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 09:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3089610E506;
	Tue, 30 Sep 2025 07:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="emTznH3e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C010A10E506
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:25:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HX9h027458
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=geMF67s9lK2e1WUJdGTKamsD
 rkDJzWkQ4J1/vFsh4MY=; b=emTznH3ez3asNBmGW+AXo+80/eVD9rTybYFwZcg2
 ts9ACxZQR37p41NlYT55EjyOJhRAHavX2BiBFPHDQsJcD7H+ENH/w1/x6puGBB0w
 sBfNaHAii2RLUAeLz8lS8fUB+Fbf36NbOk8tZ1NnIF3/2F5xB1HP+xW6G8fGXWyB
 BmQUgrs0JdGiqNhgBfHoF++3COil3V/aguBgKHGrVpNAk+RoUj3M+e+5U0zba0cO
 kvzGZI8AmCfNx1OJah+khh0Bd1l9fQrB2ggTVxgF8dQW4ITzr7A/SBHbVlVUA9Yv
 UbF3C7sYepsLZ56hGJW/x/ZqkxoJtbiyhgRX27XPf8n54g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e851fycq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 07:25:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4de36c623f6so100676221cf.3
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 00:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759217136; x=1759821936;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=geMF67s9lK2e1WUJdGTKamsDrkDJzWkQ4J1/vFsh4MY=;
 b=G1AQhdzYLGyn6d/0EFD91SoWDE80BjebQiwAm+tPz2rfshMmQZj1C/HDEMithl4B9o
 DoFzQmnHYwOzYyP9WGvJ88PO1dM/fFEXgWBQCImIeVlg/ENn6jzk6JLIIl7qlOJM7EPZ
 Ne07b5FFTC9YkNTM4kVYIZQfb1i14DbdrqL1dIKaTaJuxATi+GY3xsRSZ329dv7wXqMb
 oGLL/N0nqEt7xOp5NHlXQJ2VCdmsf33REVyPwoRWQoWso5nBycFsqjyK9vqBCi2wWoJ6
 7f4NeIMxPDNhJ7fK+c9HN4TfTU79XvpjzBO2GMG47kEJdOYEgw7mKPx3AzEQnX3KU4pq
 z19g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjoy+n3Hb06xjriG4V2ZmtBHN6CLcgEhj5jUU2fD5HyKq2wijmt/ZsA/Y4zoE+mKpeKMe1ueV084g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyhhwhF8AyCqKTm/7p6JF1P/mqkOSZNmdQaYuTO2uWhEUR5jMnk
 BpZ++TQmG9FpVncr/sGofj+z5YN/N5rrNgglQ8Bv1TtHyanGhPP+69Bt+uHXvOyDiqPlceEy2GG
 pwCVNcHH4kJrP2l7xdGNFI8nZJ2QlDDqjiyOCU6oeWpqP4fR4QZjAkCuMgRtxj9GIsvUe85s=
X-Gm-Gg: ASbGncugSBKXXLDgSkFzi3wGUJ6ztnv4mYsBpC5spqiE1BVpuWlMPvnZILh0gfWPsHp
 c06eDxqNiF15rl/pr54qWI4MB7zy8QuT6cM309e1IL+s4FtHbEfIa7lDz6yMBlmOO3xAt+pfkwK
 Yw6aAHK04RXT0CoFeRYH0pjjVCcw2tLk+bohKR0WMQQv0pM32te8xy9qGsZz1Crs/BXBYVdRC53
 XlcZv922LGawhs6i2wpuRRhe9c8pjY/hidYKxOqH7OnqK/YeQ6K5s4gqFCAx0IbrMF/xZMLi/B4
 3gQZSh2fVEgXhNKsyoY9OYTlaewEBCMQhnn/lJsRmPnLPSOsPDdOOkNcbUyV3ArH4gV8yQzC1+q
 C7sF6TOm1tuOxWeuI8lbpVCPMWST8XcEcIymLHq2jeoEy229XtYm3IFDfpQ==
X-Received: by 2002:a05:622a:4b14:b0:4d1:ae10:5b1b with SMTP id
 d75a77b69052e-4da4b42cbe4mr262137731cf.50.1759217135814; 
 Tue, 30 Sep 2025 00:25:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFydm8Witpz9fh7gZQkdonO45FlyJzofDOb43m9RJWVluGKuEzZbINbtIf8sGlgSFb0MqlQSQ==
X-Received: by 2002:a05:622a:4b14:b0:4d1:ae10:5b1b with SMTP id
 d75a77b69052e-4da4b42cbe4mr262137431cf.50.1759217135307; 
 Tue, 30 Sep 2025 00:25:35 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58619e6c530sm2504496e87.93.2025.09.30.00.25.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 00:25:34 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:25:32 +0300
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
Subject: Re: [PATCH 11/17] drm/msm/a8xx: Add support for A8x GMU
Message-ID: <thvn5qhq6lhweceoofuj23bzyteesdorjvnhpves3bbszsm7ni@zgvdn5utrafo>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930-kaana-gpu-support-v1-11-73530b0700ed@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OJoqHCaB c=1 sm=1 tr=0 ts=68db85f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Yh7iuwBG_BicX8m7FkYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMiBTYWx0ZWRfX1b2YV9CMCMHp
 /6upROxK5Wsp2gYtE3cIZg2FQ8ikK8w1KSazV4DwDa5eApCDAokLCA1nokZBsKrxseQUY/xM2xw
 AJNGsiEUK68kJI8x+n6CjNGzDE2+rNIhtiE3VPXe7Fj2drHoWu+8wzqDQZtWtr21oV3hFU3LPnO
 RADQ9uYj+OpywptfzqJXHSlngRuDL91/0zpE8d9eTSbAE36JZwLTXeQZJtcthq+ALZYOQ0zpA6a
 EF4Ts7t0BydhyBEQMYs4XaYBPzaudWv1XvaNHlW/qlq0s9KDW57QHJc13dd8QAu7XN4RlvutFNU
 J9/eRAb0Oo06bmTVd9CyIO//s+5iqh+UByitBE/W5Dg6WgWTGg0Gez9vzA1HXAf/o2IVRuxbY3A
 zmki7diBhyMvUMZc85Vp7nbS0Azh9w==
X-Proofpoint-ORIG-GUID: A5N0Sj7JeIw6FOcX2Jznd_-m2eNdaPhW
X-Proofpoint-GUID: A5N0Sj7JeIw6FOcX2Jznd_-m2eNdaPhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
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

On Tue, Sep 30, 2025 at 11:18:16AM +0530, Akhil P Oommen wrote:
> A8x GMU configuration are very similar to A7x. Unfortunately, there are
> minor shuffling in the register offsets in the GMU CX register region.
> Apart from that, there is a new HFI message support to pass table like
> data. This patch adds support for  perf table using this new HFI
> message.

Documentation/process/submitting-patches.rst, look for "This patch"

> 
> Apart from that, there is a minor rework in a6xx_gmu_rpmh_arc_votes_init()
> to simplify handling of MxG to MxA fallback along with the additional
> calculations for the new dependency vote.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 161 +++++++++++++++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h             |   5 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c             |  53 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h             |  17 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h           |   7 +
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  48 +++++--
>  6 files changed, 242 insertions(+), 49 deletions(-)
> 

-- 
With best wishes
Dmitry

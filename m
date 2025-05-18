Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF03ABAEEA
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB2110E16C;
	Sun, 18 May 2025 09:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IX1RZ8in";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BD710E0D1
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:20:02 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7w3JU005507
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XMNoRzvP+dJ2IDW6flXZL2r3
 UaSuQqsk3IYkQeVyCxU=; b=IX1RZ8inQ8q8VUsI/v2YFQcc9kdmPTplfQM01Hjb
 cPad6MO5J0eXzOEx6nVFBWAYs6eJCod9sofTY9NUtS7qEn8bs2AvahcDnUTEqlD0
 zw7tiSviwuDTgeGXh3K7pOeUg2kfOOvTqVoDWzIXKDTyCK2u0s1R8Ceo/IuMbcpx
 MizoGebOi5NdE7/iFHf2OYPFwNGRbbGw/sv6Qoy3ubogee7hrApQy4m/gNxdCrW6
 pzOomQ0Pp+f9BdRAiDGR85tii3XOPb5ycDPsl+KCBk+THYgCLP+u3Ny8OeL+OK/6
 kMdZNgWO5gGh7hvKkViulU9+T1MsDP6SiNPvt056WFb4Ow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsss03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:20:01 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6eeb5e86c5fso36356576d6.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747560000; x=1748164800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XMNoRzvP+dJ2IDW6flXZL2r3UaSuQqsk3IYkQeVyCxU=;
 b=adSYQlgsGvPUNRwUcO4Dl96onkquRGWYYV6WVNxVQIHV9rBJI7PAKW7K48b1iDn1T3
 HlnAejc7RSgnhOpcV4WqeliRMCPPzCVaVH5mhNcJ9nuYtnHe8esJZVTBr30E8o1x8DeM
 aZiqN+dRz/KfMyr17b1zN6Fjm0VU8HH4DnpYDVlWMhNBgtN/pI4xQ26zA7JMSsf1ll8i
 0tSL5qivsikNDrReJi9qyDgOsucNN9+lfDOm+zHq+S0Qzkayw68Z+llH+/l03+in7S9M
 NJh21W0XldA7i2a0DnQSouy6CLFrD2ncCkjyZavpCt0VW7FgzWpkyaUSmc3VUJt4etU9
 IIng==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8DQaJyr2xTjnPgCyYyiYLe1QEMqiktr42/Ykh9BkQbLmzEp9tIi8GJdEr/+jrnet4Bkvih7Lgqa8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE2KS445JggipB1P9U6PH5oZdPHRxX2/ALaNeKbmL8qmb6W3YL
 3sYFSfS1AEBkEC1HN6uZL8cgN9iZQyDD6rPWFlE9Z61yxDC6pMXjxcXVDq1ESLHTEvqDf865B/0
 rDKD4JGzjp9Vpb5FaxN19PpMVds2RHE+84DILsSZwOp/3TD2sZsQrDv2ehvKfH87/TfXvCMc=
X-Gm-Gg: ASbGncv20uBQC6KkLVM1WyGxMYRmUCNJJO75fqZp3dDAMGd8HMMEah8atPsyrU3G/JH
 VI40+NX3Sr5ToCl3kkIhu4H8/t32zOBGQsWuxmwxI+EiNTEUoyU1l/xIjKKFooCQade9LSj/n+O
 Su4mBfPpCiq671EQLR8Y5t6R1SEeIksSB0+U72VZFFvv764qhLo3GFBHqDvWruiyS5L9x+K6M73
 y0LVB3LH99RsCV3G/qc9G1zizgl0rTxfPteM+e9STSamnknYdFjHm+gDsYjYJZz1VX4bM63CQKb
 4KfPRl56NKWhfVm3Kz+i+UIbJY/a9SFAtRCoNnyqfe9wgQwAKWOjZ1tQU8HBLOzMYpqVF+wsR7E
 =
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr91753786d6.5.1747560000354; 
 Sun, 18 May 2025 02:20:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4RAss6MeIbi1hTLUR3LACX5ncJPrM6W25dlFKp7HPzQXdfR4gH1QWUq4qPYEW0IMg9QDf2g==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id
 6a1803df08f44-6f8bfbf5e85mr91753586d6.5.1747559999984; 
 Sun, 18 May 2025 02:19:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084b170esm14076851fa.15.2025.05.18.02.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:19:59 -0700 (PDT)
Date: Sun, 18 May 2025 12:19:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 03/14] drm/msm: Use the central UBWC config database
Message-ID: <bcsoawpz4kxuyjl4e7gvmetqtozchsazpengerm7wmkkundpal@2picdwukiail>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-3-3c8465565f86@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Bh6ZhnnPeY1hCjfwZ6tcd_ptHKHJXJrk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA4NyBTYWx0ZWRfX8+Y+fKY5WvHN
 12hiSaejVkhNestKLx0lAiylkt6S9GXAwZIxEBSHPurGAtGOgXyiHWwMdApzsHK2UCZJwsWSJLq
 4bHYYHGuzXJagR015jJeBwmjfvAS5ObAW1Iptqhid4of+yrXHn41OF7UgVk07DK8GG1zqFnL21i
 WuViFechkIwGwEaBAhY7p3yvmjX5sVS19Zlrxv3I9VLIuzM28cqdpPxJQuNrIXuIc9S5HFJnc3O
 LaqPh2UU9ODAlm7I3MG0yVHFEvTKr67bQAPQZg/mSCpjPEybaJnHsUsBPBzdkXZhJrNupc7Cilt
 Bg66N88nNT4E3x542mr+32oQDi+KyWIfMaa2mstazYE5b24qoXFX0NxT2mo5fZest9oN+QvvQwt
 tfUBf1dP8iyDrueibYTVl8PuSd3J/9fDnQGOwWeMifcqmIDqMO8rRindnuj1cAEvSNKC1RfG
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=6829a641 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=2JnZN4u0TTcLH5SyeT4A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Bh6ZhnnPeY1hCjfwZ6tcd_ptHKHJXJrk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180087
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

On Sat, May 17, 2025 at 07:32:37PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As discussed a lot in the past, the UBWC config must be coherent across
> a number of IP blocks (currently display and GPU, but it also may/will
> concern camera/video as the drivers evolve).
> 
> So far, we've been trying to keep the values reasonable in each of the
> two drivers separately, but it really make sense to do so centrally,
> especially given certain fields (e.g. HBB) may need to be gathered
> dynamically.
> 
> To reduce room for error, move to fetching the config from a central
> source, so that the data programmed into the hardware is consistent
> across all multimedia blocks that request it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Kconfig                 |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |   6 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   4 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |   7 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |   3 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   2 +-
>  drivers/gpu/drm/msm/msm_mdss.c              | 327 +++++-----------------------
>  drivers/gpu/drm/msm/msm_mdss.h              |  28 ---
>  10 files changed, 73 insertions(+), 309 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

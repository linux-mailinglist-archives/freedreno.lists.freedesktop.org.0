Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549BBB5007F
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 17:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFC110E732;
	Tue,  9 Sep 2025 15:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctUGAk9m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2E510E732
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 15:01:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899Lgqv030651
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 15:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u0lgli35YLNS03kPoYJ/ICz4
 vDSP8Kg9w05gBdHJbis=; b=ctUGAk9myr8+w6NoQvAu1jAZqPtUDtOgbSNbw8OB
 I4dHfBkmcwVK+bDv1pP1X1CsFfxO8vtbMbpt+ys57Qszvovc7EBAln/R+q+X+WeY
 ljkKidtjP4Zb5RZOk9g7iPWfXV1gVNZiMpfEfp4jLs9LoXrSAenS4K5G+ZPBdEA0
 YHRCCcljtfjf47vuyu5+AXTBfrnJUqi3Ub3me39B596udqxP9ZRCvi/HzZmj11To
 nPOW1LwPwcrpYVlYPUI2OA/j0w8C5tSuSF8hRm35ROoRZWZwJEHdtzwrt/gNHJP0
 9nrg2R8k46dQDfAwXvmSEtb3Lt8/z+BkBP2XPpg3dWZJSw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j8pgu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 15:01:22 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-52dd8d4dd0fso8403242137.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 08:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757430082; x=1758034882;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u0lgli35YLNS03kPoYJ/ICz4vDSP8Kg9w05gBdHJbis=;
 b=dgmNvVUyyoRLoj0C66okHgPLqKrGzIyigJyT04V73MkG2rkmhfY93EFfbcZhQIB7AX
 I+1po3CEq9yETjI4Cpkzbh1DBLh97e2TSuBYS9sr9nwscXs5/oPNT+PW3/77CfWq8RDv
 OGptNDhFIPjVklNyruh3MDE3DUJqXnuZpWp0xgzSZjMnP4a3KaP9lQDkcOsIKYJ/BFYf
 k0LuPz6lvlfM/VZ/fsrYOseR511rLMngHlvYGqUGkPX2F8lyKRuny4agOfFvEDF4YraF
 pZvHbKTJOvviNNKNxD5gu0bZTWVL+o0jQquR2EXrUxfLVzPT9/8y0fsxYBBm2JzlAzsm
 GGvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhsV00AZAh4Q9aKRHG0I8kGbgNoOR/Odm4k93WGBVMbEQyt5CXf7pP8wSdjjUw3w+fzUkY8awYjbc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOflUNq5RzGGxnZ7+tZwMQjFJKGBs7c27sIHvIvnoMASzzpvs8
 A9yRtgqn92PKWI9XWnUMejKapX862KU1LoA9sQ3m5e/uedglJEztJNklQl9QhJKabrzA7Y6Ckib
 Ir/FTo6JT/Nop9NeJUh87jH3lqpWrR6xpN/VOEWPIKdGwNViYxSbJfpz2/fwRU1nYMcbqJHY=
X-Gm-Gg: ASbGncu9j7+JCrOsPPOogbhYjd5vO3idWB8Qsq0J8+7KwA1TK05IC/KerSN0Efjt6lH
 K9Pp4pVDsDwPDpqTbUOuveMWZ8ic6su+sPffNNL40KpvbBmB6UisLBMhlsNv+1Tk3HfWHUNKTKJ
 ZfUCrd42ER8ZcSYor58gy3HvLBwWecskTKjcMYxuVlVt5cJ2zC5oBKa9w3H+3/jNbOcWB+UUD0W
 bLItMSPf3vkrgRxzf0tRgRyKUbyLeXuNys0vVzarg/mPu7f3imHdAQZVpZmMdWZCJzEIH8XxREg
 xYBcNNl0uIgHnhP4myiq9kGq781qYHSDWoCPix9p2XLIY40+gAXd5z0zV8SYPjsVln9iGrni+93
 sN+4tsgG0IBpt2IJTN29wN6SJJpkFzTM/qku3jSWGD9+6oxomwMGR
X-Received: by 2002:a05:6102:5f04:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-53d1aeacabbmr3520990137.5.1757430079249; 
 Tue, 09 Sep 2025 08:01:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXQrC/3gfSjePsXH8DNK69GxDOTHZaV8vPPCw8jrU6FISo45tmgpgz+khuABN3mbrRzq6IZw==
X-Received: by 2002:a05:6102:5f04:b0:524:4800:77a8 with SMTP id
 ada2fe7eead31-53d1aeacabbmr3520861137.5.1757430078265; 
 Tue, 09 Sep 2025 08:01:18 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5681795d5cbsm561765e87.74.2025.09.09.08.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 08:01:16 -0700 (PDT)
Date: Tue, 9 Sep 2025 18:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE
 an array
Message-ID: <onhosploceq2ksu7vxjh5e6phg7h6lasjdloxkirgps3tbkaqe@7vfqdbojjnts>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
 <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX4DUDs1cIf/61
 Ti86POXrJd2DUbMUvBT6xVq5buj5uhEm6oHeoqChoJS5kkh2mCNJ71PmOXXYg/PX1W8CElOolTC
 F67OMhewWt6GXncz/xDCaJajMukzk++gK73br0HwSJ296qDOnglDy825TYzEf4xb+gCWapuaVRQ
 UZi5pQuQGsFuOuAIPhEY4kNuRyk7L2zB8uWfS8/xAS9nJPj3skKEoeQ0XyLrxzk0R1nX50nsn7t
 Y3uvgjKadeNVipy1ghG4mkjlhf2D6ivZCVJKIlgP048XJqlm8u/0SJuKKY1W2bxoWeqECgGD5UD
 nZMTGDuYeyBn6eO4Gm0t9PQJd+yo9E+/jN9i7Q++s18HKOWbSJCH1CkcTjPY2mhXclmw0yqEdQr
 u71l12Dw
X-Proofpoint-ORIG-GUID: XAbi4dsZpLlFLCLmr9iRvP5fP1039MFY
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68c04142 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sIHAvruKwB1gmBPwbjEA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: XAbi4dsZpLlFLCLmr9iRvP5fP1039MFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022
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

On Mon, Sep 08, 2025 at 12:30:06PM -0700, Rob Clark wrote:
> Synced from mesa commit 77c42c1a5752 ("freedreno/registers: Make
> TPL1_BICUBIC_WEIGHTS_TABLE an array").
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 10 +++++-----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 10 +++++-----
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 18 +++++++-----------
>  3 files changed, 17 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

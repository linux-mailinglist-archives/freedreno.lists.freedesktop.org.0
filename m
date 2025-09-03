Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C8B41A08
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 11:30:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4C210E3CB;
	Wed,  3 Sep 2025 09:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="emsqakHi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71BA610E65F
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 09:30:16 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58327FQb021298
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 09:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=VR2iqlpPGndqBZFzRTnrJAZ1
 ADEc/HrM9Jf0+mHC/Lg=; b=emsqakHi2lzXHfrsTQNrTMRswHsZGuewjNcTD1QV
 2ICTx+HhdBoUYNDVgySPULe+BZ/oZNBBM+6QzAywjXPj5nwqwDjD4ZenKRjqQDBP
 P0EJC9B7LTYdtE+a9sAzLxYcC61a7MT0u9L1Hw4riZGb9oU2YUAgLBe7QwUlNpQA
 lVpbAEQc2iErpMPjUV5MLxJo9ZjGo4Yb3nA6fjLRiqmL8Lj7iHVXIc5/keMxMtkS
 Tjh17+Pqx8ocUTAGOK94lUxjvSRLaazFhIizbqkrm84Cxh7OS4eWV5HuP2HceGVO
 n1Ds7KmD9hIl3v0UaC8nQarf5T+Ybr5CQ5IEBTFqR2Fx7g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s341r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 09:30:15 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-72631c2c2f7so3855296d6.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 02:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756891814; x=1757496614;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VR2iqlpPGndqBZFzRTnrJAZ1ADEc/HrM9Jf0+mHC/Lg=;
 b=mOiUG4NFko9bioWQi+WiyRHG9jCjcT+vJbnUEaz1UjHD6RvghX5DJlEJmVB3Y4Fib3
 kDH+jzWxQBGw+K4j+IhvW1ufK+pR9Urlc+GxDGAWXoj0YwHif9bq6z9AcX0X+IzMyvcR
 GH4D+fK7M6G4P61Y+oCfsAxjcJxxxztSWEHef8Sv4iOHK2pP+1qOgVyxoHiZTIdEdWmT
 zakdoBopD+sVv76oRIIBahL/50hygZewC3dkw9uCkY8VnsKGu/r7hw8s8f4vbutcV9MZ
 OqUKqOZ5IxeZi3eYbC1xWvVTAu0Ve8mNmXOdGJID3cE5ctOH5obfwlW9rKtJBoMVV2le
 tWzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdbnR5OI/mrYFw37yEzjaVVTt2bsI3iJ8ywSffrq5JlWZEOoIsRFHzaALn3KqaWdkCAg0u0zgoQ04=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWPRFAQy8ADiZQovxl8nI78fTbu7Z4yWz6hpTd7zmCbqIDcSMM
 4+8NMPUeI85gn1LnAos/ax0vFq2dPsfBggHqj4DOOce4uPWm/M/urHbKNe829koe8k5u8fJCXzT
 ylhMVm9qhZ344pcx4/cdX0zx928WV3bLat342QSqs3W3moE15q0DDqDI9BIgwoSGpKZNleqs=
X-Gm-Gg: ASbGncvYo5iG+3QqaiMY/P6Vry0QGu7r5flidf6tWOdGp7y/bVy0DhkgXS36UF49X1g
 z4G9NeHGc0V0u4mBszXQbfTXVS2ar+awU8GhYcHen3rCrSexSMm/9FstD/uiZ9M6lLBA6BHcN8I
 rPW6LqKdqycwca0CweHmRcurwC6H1QkgftTHDwPJv0vMstiIJ728dVlT8F3poqzh6cITgQ+XzxE
 j9M3q0DV2uUrOpPCuMP17oOLGLeVmh+fP7+AYNqypS6jVbNCyDlcx/JnyQdgN6kdAPxi4GTHzGt
 Ws6ajmI1hG2gEG04V7Curmj0OI/z/9PqDMiBk5c6EO9WQo8HlFXmj+oH2zCtb3U5dCeoCLyLCe8
 kcK4GyH3oP5zrrcQIEqkj4sCrLb70llOeJupD++SINbuVoWYR/63r
X-Received: by 2002:a05:6214:cc1:b0:71a:a3be:a900 with SMTP id
 6a1803df08f44-71aa3beaf2bmr97801786d6.53.1756891814031; 
 Wed, 03 Sep 2025 02:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpD2N/3qjIowrxvQnC6imiMX7OAFJFGHqei1Jwm2q0yHkKx6yG1SLbJKLYa3X8+eZrl0XbAQ==
X-Received: by 2002:a05:6214:cc1:b0:71a:a3be:a900 with SMTP id
 6a1803df08f44-71aa3beaf2bmr97801396d6.53.1756891813408; 
 Wed, 03 Sep 2025 02:30:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfbfa8sm400984e87.96.2025.09.03.02.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 02:30:12 -0700 (PDT)
Date: Wed, 3 Sep 2025 12:30:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jie Zhang <quic_jiezh@quicinc.com>,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v5 2/5] drm/msm/adreno: Add speedbin data for A623 GPU
Message-ID: <vit4he67rvz2yjihjz6lio4cnkfr3eqydcayspijssn3o3mgqf@6eyxrpkwvfhp>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
 <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903-a623-gpu-support-v5-2-5398585e2981@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX/mipYIuvDbsb
 HzAm5pRT9cH5hy8heKZ580d6FdT/QorGdhcmu4/vddO91jO+XiRWL7mth1FHdoFjMJMLrcqKVUe
 T89ab7v+z8ZhSuA+NPe7+DmKehXwBy3hqKY9qAaNSHVBtOJRGFVmrbCufHrZK3FnwacuUd/QVJ/
 Vm39nnZfo3MSSki4cGvN7ADEvE44tTc5QOcRUuenh9Xe1EoW4wXvJofovHr+oEIEgSKpKiSyucH
 /qM7X5G8DKa0ysXNpFGIXTPq80QOgS2t6tFXdxTFZA88FyGQNNIlSd+UTmsOftpzF2WRKhAQGon
 OM/tw5vAnrQvU26JUmO19HgrtN2pu4/yIV+e9awP5T60CR5MD7pC5l7MJlOo8YHwrPqO9c5MVEq
 M9OaR+yW
X-Proofpoint-GUID: r88ZgajjugmRvDvhVcJpaPi0SSumaEQi
X-Proofpoint-ORIG-GUID: r88ZgajjugmRvDvhVcJpaPi0SSumaEQi
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b80aa7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=fAZFXs4-8VxaQHOqD40A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_05,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On Wed, Sep 03, 2025 at 12:49:53PM +0530, Akhil P Oommen wrote:
> Add the speedbin mappings for Adreno 623 GPU.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

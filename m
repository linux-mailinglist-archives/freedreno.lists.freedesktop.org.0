Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED8B532E0
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 14:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8541210EB20;
	Thu, 11 Sep 2025 12:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOFpioyS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADC110EB23
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:57:28 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BATICL007257
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5F4kfREjeTfa3WqC2b/52lNM
 yv9yD3hosyjF57uJTA8=; b=LOFpioyS9HMKxtSXT1eBG8itb3soeCkkvdviL5y7
 r7k7dvSbrqFumJfMv129e9MLbytCrCNOlkgq/BzGfpKPyQYRXDQfYYsnyhfQ2LzC
 jiFiHMPazPyXNf87ca9RgMd5JlYmblWTs0lIbK7JtevSbJR8Z7XTwpnQI/jZSucv
 CYzI3gpj3CMVywF4txmp9Bo/ZzjqOhO0AhvGbgf83fcSaBLBnI9I1/YT+Up6Y6TP
 PUEG+Lwb/UC6OjzgHy5B4W/pWH4zOSEY4GVR+Gf4t6NDeAcWBOT4ED8XhNLc1Sc3
 il3+Agv3M2bXsMT71eo23InBbrzEKBBlyLkAKgWpuSOylQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8afpay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 12:57:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b5f31ef7dfso33081611cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 05:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757595447; x=1758200247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5F4kfREjeTfa3WqC2b/52lNMyv9yD3hosyjF57uJTA8=;
 b=CbhWB685+X2+B94LQilZC8m3jUjSiUyOT3Ml1EfF/ufVey7c+a6kaapOWquZh03aY0
 PynG4jqCkge9Ufdmt2XL4AfOhH0PsVeCyBng7DVjkn9rJV7XcCLkgT92/U94p2kqj1DT
 2LyXL1NMwmi64SlMyeJwVvmYi8SfGyjJexNr18BiY9U6vj7Izuw8sv4U9X87GMfdLT3/
 df+HrugT07bhPswmnBwA1rO1+Fmx1f09Ji1mGUrlEdXJNpKTin7O8Ts5MIm301hvQ4Qc
 xc9UFbIGj/fHYWux5gdf2daIPpUVJYOkCx5qqmAQS/SmugMAlvgSnvU7XGOHqX0b0iYU
 IcsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/clCKkP2Zp90TzIiSZFKtMilw06dT27AlOiLiUNYJyyh206viSsD4hrDvkMv66Bp1Ly/uWAciFUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/uKQujxVsZtKeH2+5tHF9lotWTbfExuTTy44JPnPIKvLBlEj2
 dENARHHDGwHdBCGNcugfZSG8XcwiKe28AsbpAPOjyHBBdpVyapS8BPbbpd4blfUwWop9g/odVau
 SaLoKsa9IPPugeHOe2sSvwkmuvCgpyG0P24BRZPZ0M4/Xz9p/2GzpV7NPqp6pxizcadxzwGo=
X-Gm-Gg: ASbGncsYD6IVFi4165rhJ2rJtL6tDHCqxU+sxvvEe5Xld4zpYzHY4tz0J1DsrylmpHi
 8ZhejSiBmjhQJv/jKbuh87Cb6mkzVUHzXSalpcUHjRW3vH3UOR/X7BHGYSb1DKbg26SSaSr9+vK
 5+j79sFTbwK689kI0SqTXlOVj2jte3Z77teYSFFLhp5l444PHYO0ncXgBj1IPgS9o99r99p+eYG
 jBZ3SreI0GNwfhd+poIMAxv3kByPDaCWCAwJ2ybzEnLVmLSVJL8f8nXkLmItuLqrfYpqELP5s9k
 iXY9pvW6JsQL3n3WD8nTkmnzECjLS23sVwaU5aAC+VEJyICqWUaWicU7xM8D0Dh9sFVpDrl3muf
 AFH0fyIAqa/w9oM8RE1ej6wpsSUGuNRyTrsQFfTfubO+KF8kUXTbF
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id
 d75a77b69052e-4b6346f39e1mr42311761cf.12.1757595446929; 
 Thu, 11 Sep 2025 05:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmfeR7fqbYQsz/Cx0vhB0h7BtieRzZWfwREik41OqRawcDy0H0xPFZm8LueVdNLZmIIf7boA==
X-Received: by 2002:a05:622a:130d:b0:4b5:6f48:e55a with SMTP id
 d75a77b69052e-4b6346f39e1mr42311341cf.12.1757595446424; 
 Thu, 11 Sep 2025 05:57:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e5c3b5fadsm422254e87.6.2025.09.11.05.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 05:57:25 -0700 (PDT)
Date: Thu, 11 Sep 2025 15:57:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] drm/msm/dpu: Add support for Glymur
Message-ID: <d7his4r3txgmpgptl6ohnjzslm5s3wquxxsi67gli4wcyszlsd@klru2kjlk6i4>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-5-d391a343292e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-glymur-display-v1-5-d391a343292e@linaro.org>
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2c738 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Z5WwtQVXMiuTecYWR00A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: V_jCdmhmBrauXQpLQ_wJfMk1r7WhE2Q2
X-Proofpoint-ORIG-GUID: V_jCdmhmBrauXQpLQ_wJfMk1r7WhE2Q2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX4EL8G0PJ8uBT
 pzg3Th3pbd9nvT2JaFN70Gi0hR6rJ1NxpGFv4XONcTRYS1gTxmYpDz9jDeyR891BrLnqaJMyTnk
 zIiya95wVOgQDEKeaH4ezb1ZcevTwgSGy7oxDniJx3fzrdA8wwxlm1qFx7+RQXlNJWcn2qQlCSc
 +ILEfFKzHxC4zp+8vsOfME2XErZHQWbd+Iaxg8psFADggL+GZtRKZCvimpLXMsFbTVhJL2BePjD
 MlGAL5QzCxVUAfRh0aXfRWqI6qWwzCETR1jfWbuQlT0M63dPaa4i6PL4JMz3vnFpXgiMSlmPNX1
 mbyDmDpvjdbtb7UUnly9G3lHCTmI65lJgZc9dKzL/sNdnD5c02sIBnDm1fvbLWFrQ3IytdsdQLl
 Xqpd+ozF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
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

On Thu, Sep 11, 2025 at 03:28:52PM +0300, Abel Vesa wrote:
> Add DPU version v12.2 support for the Glymur platform.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    | 541 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   6 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  5 files changed, 550 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

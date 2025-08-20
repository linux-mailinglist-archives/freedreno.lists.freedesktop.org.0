Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DC2B2DBA9
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 13:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90AA10E70C;
	Wed, 20 Aug 2025 11:49:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRFmaEMs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB21E10E70F
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:49:38 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K9mtwk011399
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:49:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=eQi7QofWcWU158eHa77hdKaL
 MtA3y2gGZ0Eyw0PH0w4=; b=XRFmaEMslRE5X4uO/ji+OsjfJYFnH5j7tKnrndUM
 jgnyDrwLaMjFnRz/WJDihtq5/NFBqMRvz8soLQa6BPccpTKet3utuvHsCK7FFeTS
 ihb7boZRAiH/eP4PIfDN9naahMao0qhYEch625dtktKtYZQ8OAT5PMV+NtFNM8jI
 flLUW7OapLaVLcyKx+x+paCwMpfDfJxOZpycrTJrRQ2CGrCAwD0GbFwQs3jBGNQj
 WnlJiGrLgfcTEmfBRYP79gjZeIAWkGBD7IzmZm5L4jJy22E8Zl29IBWUy3OHsitq
 aqF4QhbAQJYqoXURUqSltZcDkjaiR6ediEVV8foif/wYKg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bhkqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:49:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109be41a1so279601371cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 04:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755690577; x=1756295377;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eQi7QofWcWU158eHa77hdKaLMtA3y2gGZ0Eyw0PH0w4=;
 b=GpSHMgKSf66GZ/11/RG3cleyJMMmNm7uSX/E+6q7afOMTqSu48We8DFVfBxVmy5vtX
 iOKKHrOmXQTOtb1EKxAFkv5zuU6zaCfNwp9GC5WErxuZed1tONF8TRSgsGJPMGoOFqCo
 mk3WpsTf1mmGLnYuPEOj3LJiWElMU+K/ZyMmlTgUuKg0W7A5Dpj0El+YHDGrQmrtVuq4
 5lqbBflloyXc0etRekpGZ7/IyAT4Gw1HRh3Ywj7Nk6Gg+pzqgTwaEqpZmKGIaE+oaj4w
 q6NQQFn5UMhVybGkmNh8mcI++j+LoPl2vSbehHzZPBaqr4tLnCPdPPmIxSJvHACN3up6
 KGrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUd8NjWEvH+jD67hyjox9xKzmpfyZR30ans4MnWhNqWV8BFsS1o3aGAKoOomIEb/nL1x21X+PwLqeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrZa9XjpwRj0XA/70Cuy+yDHZhpo7DNOY4gC6kq+gH3hSWRs8+
 aR306FEVRxckpIu6ZHWk1cNpIud/Husp5s1UKuBclZN9AaBXpoA5WKnEMxdhj6nPDtriOl/3fO7
 AFW1ITF/DHE4a56UX9RlpSUgfqAzXSOuIjmXj/elU4KPRxzMcA7BcjXtFZvEZQYqs0PiuFuA=
X-Gm-Gg: ASbGncuJ9NmO5hw87thYXbuqSei6LuwpVKUbolpXN9CNHXnBhxsjxJ43hnJKaAsRgEn
 5aSVtep5d9+aVc3d/CEuKbCQNTQoca4BeyzJgd5Rm/Mvo5q0VZA/gnXNaqtF5jJ6BBdfUU+TQcZ
 leg64yBKgb+7B+no6tc18LJSE1//NoroZsv2UfDSxHg/qhqRA41AHLzhFrigDTSsSfVJsVvoNRJ
 P1TIfzrJjSKpSUraS+WKVd+CVtvhRmg9QaV5ufi6V7Po0J2DrykmWjG1321d/gj/wmbnrEfCKlu
 5AaLYaNEb/SMpUvZbMqSkMTa40SX5HZe7MdiZf8NwIDE9Vce+EMk2ih/8uhEdxoZr32ojajE/GJ
 WJ0QUfoUqR6mzO+W4z9PJe6i+fAb8NMOyi3C3S/K8u1EEyWH4w9KH
X-Received: by 2002:a05:6214:20e3:b0:70d:6df4:1b03 with SMTP id
 6a1803df08f44-70d77170c76mr19313226d6.65.1755690576820; 
 Wed, 20 Aug 2025 04:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmrvdHhyhkjHia2f4r6fnsTTnjiCF/kpkKVlmq6+LLt1eyY0mOs8rxItEF+MdJz7nJEs0lug==
X-Received: by 2002:a05:6214:20e3:b0:70d:6df4:1b03 with SMTP id
 6a1803df08f44-70d77170c76mr19312816d6.65.1755690576172; 
 Wed, 20 Aug 2025 04:49:36 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3340a625af7sm27271481fa.60.2025.08.20.04.49.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:49:35 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:49:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 14/14] drm/msm/dp: Add support for lane mapping
 configuration
Message-ID: <wwn24kjpwexl66hd3wufa53lkqojb2bkpdogtxwr3uqotjpf3u@hclfgsv64ajn>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-14-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-14-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyyzzkWyKmgGA
 aXMT5zQ1zbqtvBw6Z84so/s1Xo/tRc22emSmOhJYnA3uejp4pqxMcuaBV5tAxDQl7BQzSMQ8Rxh
 xBQaxDi6dwRFI9U3cxCprnbJSd57f1CduxMydBLWRUIlEELrB6sV0bVHW8y2ZG2jPiZh55jTbft
 PuXP+GpsM+FVSZg5CiOrBrj7kFFm6rUcKSZzuJti4mAdWT/XNzY1ff+bZ2vyWDn43wHZCi/9ZRq
 x45geBjvN0IvjzPvFW8YpiiBg5Gb7TSR48Zn2ondtlRAkCIJzgak9Rg2ThvnJLfEuu8T5bMaouj
 tBjD+JvnJddmvjpiq2A55xQDyKu4G6mnwG/5MPWtlY0wATbhXvj8UiUnjpdPCCCb0ZeMsjgrc+o
 SHn/D9rk+Jr8C2DhHZmf6BIc9x4p3w==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a5b652 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mR71zFEkwuVZQDQknwQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: r8b_nqzthVjw-Q_k7TB4_9GY_3HM4L4L
X-Proofpoint-ORIG-GUID: r8b_nqzthVjw-Q_k7TB4_9GY_3HM4L4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:56PM +0800, Xiangxu Yin wrote:
> Since max_dp_lanes and max_dp_link_rate are link-specific parameters,
> move their parsing from dp_panel to dp_link for better separation
> of concerns.
>
> Add lane mapping configuration for the DisplayPort (DP) controller on
> the QCS615 platform.

Separate patch

> 
> QCS615 platform requires non-default logical-to-physical lane mapping
> due to its unique hardware routing. Unlike the standard mapping sequence
> <0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
> configuration via the data-lanes property in the device tree. This
> ensures correct signal routing between the DP controller and PHY.
> 
> The DP PHY supports polarity inversion (PN swap) but does not support
> lane swapping. Therefore, lane mapping should be handled in the DP
> controller domain using REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c  | 10 ++---
>  drivers/gpu/drm/msm/dp/dp_link.c  | 71 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_link.h  |  5 +++
>  drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
>  drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
>  5 files changed, 90 insertions(+), 77 deletions(-)
> 

-- 
With best wishes
Dmitry

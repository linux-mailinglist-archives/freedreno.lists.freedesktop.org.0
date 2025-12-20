Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B77CD33AD
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 17:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4C10E241;
	Sat, 20 Dec 2025 16:41:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OrpgZ8FN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="buKjl5Sx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B6610E241
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BKBOoPH3762478
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9n4MYAE58jkDIiJiN49z6oJ0
 IHzYogV+Pz5cPxaJhpQ=; b=OrpgZ8FNSTQKfVhsbwrDr9g8J4MU7ld6Suv+Kaj4
 DmN8TWD9oHerAIpIn/Eta3HEA/b4UHFuO4ZChwQ3bY8GYE4jBAwxr5oq/63jcHWM
 FEbWCZSvmJrlTKymzesKUrqfGGehFU5drNzTENHPQe/LHk18x7VBZnfCu4ZRBzzr
 H+Ae1VM5EaMxy5ckkftjeYUKf1SBASBW6IH6q96w4clDft3QpsHzCjCrQoFyqlZ7
 /Sy/dTOV7OuPBi18wq5dvFDM7ckAr5AxaZ0gBvSy4b6bZZGdjLrpOxAx3hMYuZgk
 Iutbvq3P39RduCnVk9Nb1Tae3RhZBotEiVG9+qpIP1VqBg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrt8yeg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 16:41:33 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8824292911cso85472756d6.1
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 08:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766248892; x=1766853692;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9n4MYAE58jkDIiJiN49z6oJ0IHzYogV+Pz5cPxaJhpQ=;
 b=buKjl5SxHjSrq8aNwIKH/sAln9NAUzdH6sxqWPvy8Co7k1X1636WZluf45+HDHJPhe
 KVM752oO+7bRpKL05e/N7NRjXYlsHJpdSMvRVxnQPsSfwuZe6S0uCumcLhtNQLJdi4zs
 MBKg9t2u4+P8AX9HMFhnG3x1xTKbtdIXkBUyX19cFgtlbdnM4Krfx6Os/VRDqQs55e4i
 j2yxrAbSvYrofmlHhESXwy2zruvJXP9ZWVOlTk4/6fIJPNXV7WmuP3rLBv7uDNYfP7Tk
 +gqRT9j/vGKIrVh6PV7H9/yiqesoRLH7pEEk3i7xadHGDSUgJYL6cUlcZelu9BL4MBOi
 n6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766248892; x=1766853692;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9n4MYAE58jkDIiJiN49z6oJ0IHzYogV+Pz5cPxaJhpQ=;
 b=Lu6ApQ8S1i+yy/BJ2k8N6y+VqRMESOhYCpmHagXdT4RL5rCaB7o8SWpZUVmVk46oan
 O0Gi3PSsjp9s486PSsLgWDqEHwwkvBdn3YmQ8sVtlZzeHDuPgkwG1BZVQw6nGYpZkjU/
 LvFQgAwIdIjV+3OQAe+NtUIrSGcoh4PCboIvMsj28EehXQ2M9dIzwre2Ie5CX4nRX3C7
 HxyP1h3Bh6m+ccsY7JxFVszYL9rYrzdWXTC25DGq2QRdOgp3Mbmfbdh+ySCf7G8+4xgG
 jz3WPUqPtsBP+792XwkXbMGzU+saTja81GuQyIvWEA/jAJ2t3Gf4ZmZ8hMgV6LGSO8Uk
 yxMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmCrpmr78PHo1uQlCmQyef8hQuKp4SmPpRcWnNDZUWjnCrT3jWm5lUVhdIX6G8r/KQ9+KpekQhYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJELGjI3HdTghguIlcLwhFhr4ChNApdatR/RtPMPMOzi5rJ6fU
 43+DX3t4AKtrCoOeKCP2N+GqRkvCmWlO3ld40/iUIcihwBRhqWHD6TMkjQf0ymcxng7iR9KbW35
 gW8DksPVj6tens+QZ+T7WfamYf1u3NI/wGB4qDoKkQzsBrQDZdpOgEkCr0hvkYk0OJ4CONP0=
X-Gm-Gg: AY/fxX4d60w1M9t4glc6Y9mkneEvOgK0wlybDwRI8BpnAlisVtkGFCCegZJAmWN0fct
 YSmvUpCJLZ/1jAXG5sFJ9ap4PyEzCJh+mG6rPDEhP/TYL/f/sgNdnWakkuHHq9Z/ADVkmjtY43Y
 4ga2Prtv7mTEajAjSi3zizqWy19u+gDnuvRSy3OqkrUQK8sLOsdwH3go/6THLrGcvXm7L+kdh2S
 wUJ70ymXGfm8Sn144kxdMYeDlVjxRxJ3BVKTxN4XvWiIpw2tpMBXd28f8yf8jNmOhlLumJzTMYE
 ycVgQDdPwJUEmkMDWKZYRPxTYD9ebuU9IVnSYkRj4z9Mu3eZo6nzQpV59WJXI1dW8v0ctdLFekh
 1dgdWCCuzYxzYF4in0B1ucS+mTC36KLf2FLodfqwC4ClhzFJi+7LyKsCy97KpjC6M2oBD6P2MWF
 Ka9YKVLgFXLftjcm5LNoNx0pk=
X-Received: by 2002:a05:6214:766:b0:880:51c6:bee8 with SMTP id
 6a1803df08f44-88d833b774cmr98960576d6.20.1766248892268; 
 Sat, 20 Dec 2025 08:41:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf8fHZBsjJX9dWWuG2BVH9tdn1x3HOl6k2NkGdzZQzHpPUWR4K5EYQP8CT6D7PsfaPoZq05Q==
X-Received: by 2002:a05:6214:766:b0:880:51c6:bee8 with SMTP id
 6a1803df08f44-88d833b774cmr98960176d6.20.1766248891777; 
 Sat, 20 Dec 2025 08:41:31 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812262b391sm12373081fa.29.2025.12.20.08.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 08:41:29 -0800 (PST)
Date: Sat, 20 Dec 2025 18:41:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case"
Message-ID: <6w2a6bgcsrmy3nvawuvy2qgnhrnhcvi5zdnbsxrkmmmf57wbhq@nft4wqtqwgyf>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zt2TVOArmdXLtSnsQ3lfkeM_pzbk2T_L
X-Proofpoint-GUID: zt2TVOArmdXLtSnsQ3lfkeM_pzbk2T_L
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=6946d1bd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=RvzFWoYtHU1D__pwiD8A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDE0NSBTYWx0ZWRfX0km8NiNocI+v
 noPF5lOeMNOHZduuSNt/3RXUx/hfrT2bHrMu7KJnZUj6ezjR/KZppbUSjeRZUUyOrimc5p6lpK+
 mlinoRGxgdmUByHqVoNRG2hU1JeNXbRRJFDRQHjuXJhkh/FEqzaKuMVCwVfM+8VlaxDdRmYrXNl
 aJ6ah5S4AyRAS7otunVt8bGR7APlQ99jC0P2k4/+SWeGXmB20apCmB2+fDzE7n+/Ski87ZaXqbI
 7PLT/OPXQtDLKR+3rXn+QEnECGn+wcBaNEy8ii2hv9jDja53JE1G8q907HJxT6KL5OEEPCYwDt7
 ++q/MwN32xy05PrK/VTHMMqnW6pC6tQFiIT4THVUjd7aZ00+CqgBP87Hbp1hgBWz4UDJMWu1Yu7
 U7Ws9a++oli5ErRxHVUrQKgAQN/WIWht9Xag3TaKcLt2ULgUXT1+wusn9wEv0ZWWWHLZLcL2s+L
 fYpDKGPsBGEliZxtsqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_03,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200145
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

On Fri, Dec 19, 2025 at 12:39:02PM +0200, Abel Vesa wrote:
> This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb.
> 
> The dual-DSI dual-DSC scenario seems to be broken by this commit.
> 
> Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
> Closes: https://lore.kernel.org/r/aUR2b3FOSisTfDFj@SoMainline.org
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++----------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++--------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 33 insertions(+), 35 deletions(-)

Fixes: d7ec9366b15c ("drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

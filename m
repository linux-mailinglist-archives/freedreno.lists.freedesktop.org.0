Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616B0B348AA
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 19:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B411E10E518;
	Mon, 25 Aug 2025 17:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tt3DgFih";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950F10E130
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:30:23 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PHNPMg017266
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=neFHy6pBsQ6WKu78LyU0YORv
 KojYkODY55mUj+tWBZo=; b=Tt3DgFihIWZWpb8M2OycE6c3K9q+17l8lBS2LmWB
 LjYJf25JSmO0wFd9sSymNJRegve8fnxCBe4K8ixVPASR9chvfzHmI8aAg+zjzWhc
 8S22LMYfj9W8ptiA4ZQ8pjkU677sc8ibmJ+XtUAseTTuSAs8crDeMq0rixCww7gG
 KdtULlz8rvKFV4ywGPmZvoCwRoKZZlHooJgladeUP9R9ulnpC87wjBXHMMsoJoZj
 0Q3Pmc6EKeSCgTduueV38xX8h91PC6eC891+vHNGc5Ts5p5CGjkHGkLigdRgc3uy
 vESihqsZM889I8qmIC/Rdvzy7/+re5fUc0JQOFn18LpEoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q615dv7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 17:30:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109bc103bso106599521cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 10:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143022; x=1756747822;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=neFHy6pBsQ6WKu78LyU0YORvKojYkODY55mUj+tWBZo=;
 b=HisvQ7fMpXB9Xt1CL556BSe+iB11dA/uWg/NCwAo86f5+9D4u9rUj1FzRM0VZyToBt
 GdKE/tnD8ntWGq0GtA2A925gu97B2uSqRt9NYdLC69DgKW7VngLuA54HZbV7Vb/I2c0s
 JWe2QI1zl6Sqm75PdqQAy6fMfp60q0qBKr5WSygRtBKKwF/PjZOYE27a3HlWiIZ1/Yej
 M+fnMiZA3wZJB1m4EFPC5YV8HzIVOrBzlx2L/6OhqxuFKqZyUb+QuvenTs6EO+OxL58H
 HcifvuVEVTJouuGOEGf/IzCle+IJDsH4rTFGKM+szRSBrbBtrOznD8yQjPim4cI8sbvl
 wHng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD6LB8M89oUVMtS1ujmWkNai9o9LjsxVgA1BZK5sMshd1rTEOFumB7g2xMrUFvPrM/0yRkfz+09Oc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMz6hkpYel5602oaD8VrTCxLsRNLfXQX/LckBqrXadt4JiMvy8
 iAzySYs0gRHsNpVmNy+9+K3s7gLUgVtG483cy5a5Hb0xlAvhtIaNbLadETV+eP0h1UNNBNhfa9U
 EUZ3jwI4tOFm4jBzbOzM1fc8CJt5z9yOalTTYk4+/SHn1iFOgzvgV+KABzV8kgzvDTmJMIjA=
X-Gm-Gg: ASbGnctDvuPscm5B8zz/iJrILMFZ3DSr4nZ21tiucQLKMvOuP+/k8RGWf5pulPlO/IY
 hTWkLgVNfUYnUwL8YUcP8O2yWffbzrd0fAORJuX8ydz9Dbmr5N80dk+F88fD2byLG0VMVkdXA6d
 Nsv6epnWk1M+GsSoVPKgRueo8pTLGDVink5Bnsw5cztJlVADtvKYhYgxCVMx/9sTkrDpsdOYicV
 84L/3FZ9W1D999US6nw1UO9ecgIzMJ+C/g4Aq3gsdPLmwsANkY2KyMNFJmh1r5WtVfA/nNv8Ady
 hm+u3Zc5TSOJITfTB2/Hok8BB8/LZBi/HvEr2KscDPIr/yDk1c8PxK/6yHQr8XftfItWbSIfQpv
 t6no2G/1O04GEr7Hck2KkpQnPiToRsQABpPzKfKVxn6gkgzzTjflz
X-Received: by 2002:a05:622a:2cc:b0:4b2:e13c:7fee with SMTP id
 d75a77b69052e-4b2e13c80ccmr3483361cf.17.1756143021972; 
 Mon, 25 Aug 2025 10:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELS/2d5+L9lLpB0VeTUT8WkNv8ohXmJEbk9C/iG2W8QoPWz1VZXbRnGVLPIHh5rG8YSI3gDA==
X-Received: by 2002:a05:622a:2cc:b0:4b2:e13c:7fee with SMTP id
 d75a77b69052e-4b2e13c80ccmr3482741cf.17.1756143021326; 
 Mon, 25 Aug 2025 10:30:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f3b946df6sm1466108e87.36.2025.08.25.10.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 10:30:20 -0700 (PDT)
Date: Mon, 25 Aug 2025 20:30:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/38] drm/msm/dp: extract MISC1_MISC0 configuration
 into a separate function
Message-ID: <sxn2uecmqxbfqkmuzj33pythn4qhxzofbweacrpht3muc7djnv@nd5i4zzt3up6>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-6-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-6-01faacfcdedd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNCBTYWx0ZWRfX3ktWyaLGyZT0
 TBDfuXEVcgRLbwnrpe+VTSPU4oHnzMDxNw60G5XDEnKHG8QIQ0xPUFIeBuf/qpgiU/OyxRQvWC8
 8wyM6FFBepE89U6nxhFj2A1ivxhEQBi+RMrSmTggT+ss0Abk48ps9wduseSYDkyBo/NzOhMcaXc
 0xWaix7sXtEgHioP2KPUKx8tBP6dESg98o+ZiOEz7sMD4dWLvrNc7c0/920DkvlFWCHpnnLuRCG
 fJB4q7bEWfcFW6i8hxweW4BY/z/7VsfHcRLXwRCjltjZvi4GMtNkTxETWbDQ8OtdeToPJ0oLBKu
 GAZJbhm4oMu4X9ajajvdfuqfCS/+xe/1EbA49e4AfBGiStY3GAlrqh9WNbvmq31UKB0kUL8BQ91
 Bubgwe8l
X-Proofpoint-GUID: KTTIwMi4BhZs6PZbP3gT_weFppkYWoLc
X-Authority-Analysis: v=2.4 cv=K+AiHzWI c=1 sm=1 tr=0 ts=68ac9daf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=JkHNupl4tvVLzN8DOdMA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: KTTIwMi4BhZs6PZbP3gT_weFppkYWoLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230034
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

On Mon, Aug 25, 2025 at 10:15:52PM +0800, Yongxing Mou wrote:
> The MISC1_MISC0 register contains stream-specific configuration bits.
> To improve code clarity and modularity, this patch refactors the related
> code into a new helper function: msm_dp_ctrl_config_misc1_misc0().
> 
> This separation also prepares the codebase for future MST stream
> programming support.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 

With the commit message fixed (see previous comments, I won't repeat
that again and again):


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

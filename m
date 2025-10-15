Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB8BDBF02
	for <lists+freedreno@lfdr.de>; Wed, 15 Oct 2025 02:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FECF10E6C3;
	Wed, 15 Oct 2025 00:52:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="drvVXABG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C78B10E6C5
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:48 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EKR9Ou013410
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v6jgXJjjhJQgEeLigi3JtVL9
 kgOdixyq/3UnYeX/yA0=; b=drvVXABGVbv/fGc7BU2ZshHr/53UJPRKevbg5dAc
 EJkhc8WPrU3jGgxZg+z/KtLVe3c8EHmm2B20madUway+zu6VRMNC2bFFNAgEM35Q
 XO0LvL3sxnZjcSB785f2Oo8EQFGFkg4LtWBEpmYi3jewqDa8vNfMjQCwkcge+7Jy
 ZnsRxwwfLG1jObcAEAePOz8VB6fFF6JewKsrbD1+X6BelKXIecB87Cpw81rXcL40
 KpOFjvJDKpUru4VLyk3XWGoniTWDxltnsnaZN3D5U40n5QFdrhmuckgAMd4Sxb5/
 ByBlsx/ccKehueVHIaeUraHDMWaXNACleQQqDOS1iFKzdg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd92m6d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 15 Oct 2025 00:52:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8892285b436so1399922985a.0
 for <freedreno@lists.freedesktop.org>; Tue, 14 Oct 2025 17:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760489566; x=1761094366;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6jgXJjjhJQgEeLigi3JtVL9kgOdixyq/3UnYeX/yA0=;
 b=nVOsdrNQ8mQxxdfyhF/1JJeEMtAOBzo7f3zZ+qClc8UV2XuvKGnNELJLEJ0goH96iB
 K2GaDVsNwUtmPZFLAnP32AXbGCMFpZOEk3hsoeqghhZLM+tb04uNVeWD+pnvKchuMEMX
 2MS7pel71io1cFWHSTjwagbUDSp7Ujlxit1D2DFi+3bKTZDHa1wzkiy+zuNJMtplfL3V
 lkeFtt8liueQAA5zX0AMZ3vRO9v3g2HY6IFzNcKdPXO2SRG3Hro7BWHENdBcLOOIAE8d
 8XoVin0wLRK6hzCyfrpCXFOF65vR9cNaF358ay4Qf9MrDXZthEMo4nUMjZ0LeeEMSKjM
 ZrmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgXWZqzg74zy+1tfkZMjWmuiy9TFNvRMcyuJkGCb9rOxTEiLS8Py0MVCH5sNWjsC6WiHakEkeFpng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQMIT8C3OnwrANtajE3/L0PLHNR1e5PVwTcMSrY0P6rxbWvLPD
 wHI3g1kH4J96Vm+AMF8JZVsIs4jR47wgr1yNWNZ8bbsxsRGG8eSiqceYFsOSkc5BD6b5FO96/8t
 dl6+wSoWxcFmOxBqOExKxSUW8q+q0ROQWOdAZtg/U7eaO9dwEJ6BeVGo+O04Oofn8vKM77hY=
X-Gm-Gg: ASbGncsUnYIGuue29e8EAac5Uqw5NZF7vXQVyaaTAvOsjPD5pNJw9swUq0mOA8MjsTn
 V71bHd5l1n43w1jCs4d9D3qk4AlLRyvyK10ZezC7SLqi7HXo2fepxMdGEEQLcC0rMKlVPd9uvlz
 Ir1L40oOPFPUqGj+o5jDAGJUCUuBTaPTpukn72J62jvKvC85BpWV1wn+LL6hYircSsaQ7cJDAXF
 XeNUG28P0HWDQXdiYFCNVYCvaDqQqBzTAWWRW+qyLM61nCWU91RFN9k4qh1sZyj7C7eqq5V37cw
 pM1LmgjqX6m6WxLrychtt6chaSOBfVWBeG+BAo5UoflNSvKv7VodoLndogdS+Pdie1XJCaEdA8/
 PqVfppSQR/M8dBPn9663Hg4OnHrZBVkEpHAp9D9fJvI2Qh6/M5FXB
X-Received: by 2002:a05:622a:490:b0:4b5:781c:8841 with SMTP id
 d75a77b69052e-4e6ead46dc8mr387551141cf.42.1760489566167; 
 Tue, 14 Oct 2025 17:52:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW7m8cRicbOVlOzwtOiVLlN+6jv4dabkaHZG6TVMI+/LbJiygclcG412ZISQ5L9/YyBrt2pg==
X-Received: by 2002:a05:622a:490:b0:4b5:781c:8841 with SMTP id
 d75a77b69052e-4e6ead46dc8mr387550931cf.42.1760489565763; 
 Tue, 14 Oct 2025 17:52:45 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3762e7f7f7fsm44067811fa.27.2025.10.14.17.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 17:52:45 -0700 (PDT)
Date: Wed, 15 Oct 2025 03:52:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 12/16] drm/msm: dpu1: Switch private_obj
 initialization to atomic_create_state
Message-ID: <36y2be6lf2hthjqojovlqsonkd4borz3qh54wup2mqvgktcuca@h4ziajonssoh>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
 <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
X-Proofpoint-ORIG-GUID: rpFb7xlaued7Ou9asOBKM00mPCXJuhI7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX43hEvoQ1UA/G
 bDp3LHIHTunz5jG78PozgUvkUqnPm67+/m9I89bUg4JBpDwkPFXYPGJ/Q/GkIq88hJWYklH1idE
 zJzeSDcFxPRoFfoIZa9dYXnfp9rsW2QQ9c8bOXCkMdxht2xnsQu5yG6XOgYCi1BX8X4vCHtg4cD
 rnALqfWUmzNlD3VhnsI0xX46LnBf1gG6LpxHksHFR67EY5HH1QJp+qQzJAuNJAy+Tr8TO2XKHTI
 vSiPpr+BrvT3F2TcESzsiH8ukSA8LkSujEQ02F7Voz3gabz9G+5iqXrKFbMOnail+ym4WCwDJMG
 saAlwkJIJZe8UA7nVzGgG+rvWy5jgIwZAJmWMfUQmGWB0wMyTGeDNOiRm7+BBsbi2Rvx4h+89SQ
 /MVT24A5uWmn/GY6RsRmxLj0F99DWA==
X-Proofpoint-GUID: rpFb7xlaued7Ou9asOBKM00mPCXJuhI7
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68eef05f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=tVI0ZWmoAAAA:8 a=e5mUnYsNAAAA:8 a=MY5GpsA41Snrp9pqcaIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
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

On Tue, Oct 14, 2025 at 11:31:56AM +0200, Maxime Ripard wrote:
> The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> 
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 42 +++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 20 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

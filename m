Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 170CCB2F579
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 12:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35B210E925;
	Thu, 21 Aug 2025 10:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOwsiioD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DEB10E927
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 10:38:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bDkK015706
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 10:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=r914EYN2oHqG39oPT8nQaNOs
 AXvKl/bytIkZsYAvQVY=; b=DOwsiioDOlsSL104WqMxnj2XV3DqmzE7CeRShTyE
 wDqeftQd3Vz+ACmdeVP4+HwfkhmMH0U9ORUHKNVFrnko+HNulb7/LJpiWofgCspD
 lSgjAqB1LNfXPRLwx1MSKoWCshW+ZDYJ2oNc77x7fuLc7vrK5ZxMUl34yy6zjOqD
 kQscF2TreHZ3msQmxZQJYfThzTCw9H/7BK2r2E6VSp2aUT6dcQPhl70t/gxygUgd
 WWLoDKfB1tbQl3VyEetdumST3BYf4+aPMQsdKkuRmYLh3dIM5BAYuh2Yk42DUBfq
 WGz5lhraaGeHq/FTlarD9ZFn9vXeAfdRfRBWkVk4iPzMPg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529525m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 10:38:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d7c7e9735so41209616d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755772688; x=1756377488;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r914EYN2oHqG39oPT8nQaNOsAXvKl/bytIkZsYAvQVY=;
 b=WcHV7ncV81dIOmIT/8bqP3TUFOPObrQoPlQUQ3vP1Kb2VbCSDLWLrZ2fE3SKCypX/t
 22cXZOhbuyZOHh9PDDSRDnsJooBaVNb3UEaRyNd/50ffaoR1ceBdXgQtoXMO1WuBPTH5
 TvxEKUydiWtix8jW3XLj+2vBXCAw7DXYnYcZVrB5zQy4bUhM3kaqLPK6iZJWAGuilyP1
 eL38chBPjYfTDRPFzntKLkNV6WHXZXSo5rE84VP4UjyEHUA57TNW9N8B0KFTiw+SyJgR
 8O/Njz7aNEPOONVI54U0wF9WN5Jval8rZLIg7UxdiThG/EOzx4zT9BQY4Cpdi7bKrUz0
 hZYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH4G2JfvPyAQELM+nlFB3472oay+CaHKs521CMtkvCk4c9orsddwXVbCUFodbcweAcmNmLm8lSwg4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB5ewgya04gZ5whgbAwwANVdAdOki/8MhO2rfPSZ0p5bHauEwB
 O3fIy+7D1w7M6oBBzFwiZst9RbIE/SmoIgksLsJap2G1KknrmXEMxNPf8TbsU01nodkOy4eH/ns
 OFrtLCsmI1Aqxk7n5pPdsJkYox3HLOqDSxZ0vRUttoplbBvAbTHAA6lHtNzuI5R8bO8zcy7U=
X-Gm-Gg: ASbGncvICGpMAQ+H6RfDxXceWuOJ3hVF7LUIaPtvGeVvb/y8iYUaWCDqm9BOSs9MOIp
 DPCGSrIl4fZCwz90P8l/B8j+LWDoUGrxs15Miwrk6UZ66Z07RrO2SfcGNXk9FK737YYh+a1ZDmx
 3HIog0IwVvzKjFm5oImWkCOY5ytftpdRh++OWh6QLieU4PrvqiuQw240cN0wpsKXUSp6rQyJ3i1
 8fMjjbF4fADCYftVIgyB8bVleKTrN30U+FavQy1MT5GnNi32h9efAorVBk9T67iWiTMi8Zg1ZWu
 RguYc+QFtZjBzIthao98bJuPxde/b/+RHKwAhSuR61JFpnQXpsrYeOM9NFp9kBb1y9hTDm7Nq/Y
 HvOyLOEp3AUMqcBYK/zPrIFggkrpYrbqzU27d3qKGivQBpKg1M1HN
X-Received: by 2002:ad4:5c88:0:b0:706:f753:6b14 with SMTP id
 6a1803df08f44-70d88e3741emr15983726d6.4.1755772688281; 
 Thu, 21 Aug 2025 03:38:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEa7hNzXAx5DgTP1u13ijsgfOsTyYMteNBIqzj5N6IcVZ3PMpHJWc/EQSHJlepAFEYsq9ykw==
X-Received: by 2002:ad4:5c88:0:b0:706:f753:6b14 with SMTP id
 6a1803df08f44-70d88e3741emr15983356d6.4.1755772687617; 
 Thu, 21 Aug 2025 03:38:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef368d34sm2973505e87.58.2025.08.21.03.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 03:38:06 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:38:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 "open list:DRM DRIVER for Qualcomm display hardware"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm display hardware"
 <freedreno@lists.freedesktop.org>, 
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/mdp4: remove the use of dev_err_probe()
Message-ID: <kefrdoyd5dr4rjvz4lmtznxw552wzuspk3pdse63zm2kmtnpvi@wzzddue2acrm>
References: <20250820131300.499727-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820131300.499727-1-liaoyuanhong@vivo.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a6f711 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8
 a=i0mAgyhDueMVXABGR-YA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: o_dFifAhMq0EJwet-XDeTig0GSRAi120
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyJ3xxfv1Gy0x
 pcbDoQhhrjLcNOrAUsb9EXIyIfIlVtsLJbTdoRh0SJ33Dl39SLooqnlJOQw9O7ls2HQb5SSGA9D
 /n5Y9vZZ0eewrKp4ttb2l8jRhQch3UisikBTAQgTU9T3V4vyEkzNrotBCBNWmRwDqqud1SyDAfM
 pZL767llUdJauaWO9meqmgQYYpWMTbZRr+9Z90IbLFY0EhEvSAk6pexKc6gOVPMpn1gqH3PLUPt
 L1MSS98II3w0RlcsZ6FG8HXWNDs4ycDibvY8jld5S4VkI8bz+gxIdpOxQYpQP/97hFT4yFGPrm3
 TGVeefwFunS4ttgTRW67D63ZrVGk8wvOgK5m9uoGvs9lN8XsTff60356s6UTCx7RqLJEvhNoIxZ
 rEntQP7pz5D9Z7ilLWIqYDTRWQIzhg==
X-Proofpoint-GUID: o_dFifAhMq0EJwet-XDeTig0GSRAi120
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 09:12:56PM +0800, Liao Yuanhong wrote:
> Logging messages that show some type of "out of memory" error are generally
> unnecessary as there is a generic message and a stack dump done by the
> memory subsystem. These messages generally increase kernel size without
> much added value[1].
> 
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value
> instead.
> 
> [1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

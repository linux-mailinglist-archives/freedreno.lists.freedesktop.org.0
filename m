Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A8B3ADEA
	for <lists+freedreno@lfdr.de>; Fri, 29 Aug 2025 00:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F0D10EAF2;
	Thu, 28 Aug 2025 22:58:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pD0HUXKx";
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOwsiioD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 951A710EAF2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:58:07 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWZ36024741
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:list-id:list-subscribe
 :list-unsubscribe:message-id:mime-version:references:resent-date
 :resent-from:resent-message-id:resent-to:subject:to; s=
 qcppdkim1; bh=r914EYN2oHqG39oPT8nQaNOsAXvKl/bytIkZsYAvQVY=; b=pD
 0HUXKxpdMbDigEtV+S7/BKbnv9H9xXuAoEFfa5oefI45+M2qGHyKe97wY54MTLfG
 anzTKxduyJ3QWw02fH0pW+hMnTopWH2Z5rAc7vCltnIxOMSMgbKkR+ObZV7uky5a
 AMhDJWE5u1gAgYIChT5DMjDLLS1x9HKDOlVm2ZtexjFh29usRbUVlVWWN5DSGXYP
 QIYSysl/QFAQwcCEPca6ZCvv5LCR9lINFJvusF7FekVKBaYdcSUEVLWlM0EWknc3
 7CjzGy20sJyb1F+BIsAPedQAEjQMX1wheUFbnMLwS6HBULGr2To4y9VkDLd/qFDg
 8jLclIZhZJC5ycBafaqg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5up1vvh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 22:58:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70ddb4037b2so41625716d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Aug 2025 15:58:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756421885; x=1757026685;
 h=in-reply-to:content-disposition:mime-version:list-unsubscribe
 :list-subscribe:list-id:precedence:references:message-id:subject:cc
 :to:from:date:dkim-signature:resent-to:resent-message-id:resent-date
 :resent-from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r914EYN2oHqG39oPT8nQaNOsAXvKl/bytIkZsYAvQVY=;
 b=Enc1Ni8C4+B8XOO7TrYmm8e5e5D8QWORiayA6JB/ylyhS1jZHMnK47kxBdhRDEjm2b
 SV71gdNtEQ02m0pfxnw/5mIDIXO9kI+AW6FVg/BpuvBikrS0IpXiJmKkUmaqIhC7So3Z
 oRGcD+aKK1PIv55sWh7zWbUKF5eSraabFVJpuGKzWT3jBzg90zbmwghmsaXBCz56aSst
 FOTbWoKBspwjElEpn7Ejr+Twpu9nyLxu+DstuDU+4yc32zxRG3Gk7aoHCAbb9f+4qhLf
 W1rva+G/72miA+8MAUpQ657zhJCHkZcOlg3HWAczcsSbaj+dzkntLOTXrbO4ZQi5Qrxc
 ZeXw==
X-Forwarded-Encrypted: i=2;
 AJvYcCVL+JPALO1SJk6VDEotXZBfswRSrpcTzHto543lD6u5rFmMriT+CUQ+tmrp3pGIohdAiTjiTCx2e+U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywIVRXQ1VBq0TGHupiNnMJK8Va8q2nLm6xOvvDWtzm5ursLviW
 PnwHqaw5mvNNH6z5veUCAUyHqpH4yn29ndrYd+2Mrb1b/OhOgRNIpxr091oT6UfKhJ/XyNbX1R/
 QIVQn0w3TORHwcNsD97c5l+gPuPLVXR0Rql+29hwiH+my5f3XGf2nBbVnnznV/LtfPYdV7w6X20
 F5EOM=
X-Gm-Gg: ASbGncs6eD/+TD3aTOFssB+XsIqEsbo/JBPlO6UYlFvO0rsFLBuMqKI7jzWK/as0XC8
 Hpq7/831tEnFux0nNEcym1GsMPVCfMy2FGSSKQ1PIou9o3zkBR8WqI4AkLrVqzazcFWuSmYG8yV
 HqnniExQtYygMdJRR7XK+VC8C3ANsElGtU6cdJPGj74f+aFMoesM7iSxgdA++6xTKsb8OPCa3mQ
 nhCm+c64G/KGn4ALMdtuNp4YiRlryhRz7wnua9teujI5lGXZnRdUTe64MpmHFQHB5+xYWd64jt7
 JblFS64g67ebhK3YdPIJJXNzqVVPhqxSZc2jybFe1rf00xSN78/RGA8cMaa01SpSFqZYQvAmpNI
 ZvMA6GTGdfbiV9LPAEkH3NP+u5g2XWBY0ib9vabznrFyqn1EXLkeR
X-Received: by 2002:a05:6214:dc2:b0:70d:fda9:8117 with SMTP id
 6a1803df08f44-70dfda990d5mr27595236d6.29.1756421885504; 
 Thu, 28 Aug 2025 15:58:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjYmOyC14tS+Z4/S/1Yv8M02OttA6F+9rCkuE+vd9lX3hiJLVQWrcJJ4nhZjmd4YqnWVF4Fw==
X-Received: by 2002:a05:6214:dc2:b0:70d:fda9:8117 with SMTP id
 6a1803df08f44-70dfda990d5mr27595056d6.29.1756421884884; 
 Thu, 28 Aug 2025 15:58:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336b468a054sm1368891fa.21.2025.08.28.15.58.01
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 15:58:02 -0700 (PDT)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Resent-Date: Fri, 29 Aug 2025 01:57:59 +0300
Resent-Message-ID: <5qhn35awfuyffbzrt67j5gyrjwclqcai23gpc7ahr7som3cjm6@a7tpnphpowo6>
Resent-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C43054ED
 for <linux-kernel@vger.kernel.org>; Thu, 21 Aug 2025 10:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
 arc=none smtp.client-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
 t=1755772692; cv=none;
 b=N2Pb1cf8Dzr+LiCrHJUizSGy4CGdLRjGdfZdaio/3avprjf+8hLMFBlQ3CEUsyGQm+6jd9TbhYWjPeU1w3l7kHcsXPbTh1mj5INJw9QgNz95RUld7mlS58aLeJAPP8xGUiLmVJ0MWBBuAh2PDl4k5e1kWduAWYI2corwXc0hXJA=
ARC-Message-Signature: i=1; a=rsa-sha256; d=subspace.kernel.org;
 s=arc-20240116; t=1755772692; c=relaxed/simple;
 bh=6B2gofMQeXaFIxttJOCL+Zl7gixeHkUQAMPgca1dQAc=;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
 Content-Type:Content-Disposition:In-Reply-To;
 b=tP2iOAIDhJOIBR9ANQPd/R/JXto39ugfeM56LWv37JNYaRwBUgfadmn0h4vRE7rG5M1rI/gk0iIRhs6U2rE5t8hTI+or8bgJkZHBwVk6fjU4dNxEQ6I8HRpGeFXpFqTHaIwykBiOCFosTcQaZA8R4vQQKzigrZIppge5bDMMgNg=
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.b=DOwsiioD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org;
 dmarc=pass (p=reject dis=none)
 header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.b="DOwsiioD"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bIOH013281
 for <linux-kernel@vger.kernel.org>; Thu, 21 Aug 2025 10:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=r914EYN2oHqG39oPT8nQaNOs
 AXvKl/bytIkZsYAvQVY=; b=DOwsiioDOlsSL104WqMxnj2XV3DqmzE7CeRShTyE
 wDqeftQd3Vz+ACmdeVP4+HwfkhmMH0U9ORUHKNVFrnko+HNulb7/LJpiWofgCspD
 lSgjAqB1LNfXPRLwx1MSKoWCshW+ZDYJ2oNc77x7fuLc7vrK5ZxMUl34yy6zjOqD
 kQscF2TreHZ3msQmxZQJYfThzTCw9H/7BK2r2E6VSp2aUT6dcQPhl70t/gxygUgd
 WWLoDKfB1tbQl3VyEetdumST3BYf4+aPMQsdKkuRmYLh3dIM5BAYuh2Yk42DUBfq
 WGz5lhraaGeHq/FTlarD9ZFn9vXeAfdRfRBWkVk4iPzMPg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dn18y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-kernel@vger.kernel.org>; Thu, 21 Aug 2025 10:38:09 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a88de1e26so26603386d6.0
 for <linux-kernel@vger.kernel.org>; Thu, 21 Aug 2025 03:38:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWk1O59hnYSJYFTgwYgHsgo3dcThCWCXuHKTQUyZn5GZv7hVxoS6G/m1t8LPz8AxFXBPnCWRaA33hPeQQM=@vger.kernel.org
X-Received: by 2002:ad4:5c88:0:b0:706:f753:6b14 with SMTP id
 6a1803df08f44-70d88e3741emr15983666d6.4.1755772688275; 
 Thu, 21 Aug 2025 03:38:08 -0700 (PDT)
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820131300.499727-1-liaoyuanhong@vivo.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-Proofpoint-GUID: HEEw5Kh3UocW9yCq7KEAWCFE955PJHbP
X-Proofpoint-ORIG-GUID: HEEw5Kh3UocW9yCq7KEAWCFE955PJHbP
X-Authority-Analysis: v=2.4 cv=JJo7s9Kb c=1 sm=1 tr=0 ts=68b0defe cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=uX6r2L1qC19fvkj5lx7ojA==:17
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=68fdCqVM_EMA:10
 a=SKaEv8EmnvEA:10 a=VwQbUJbxAAAA:8 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8
 a=i0mAgyhDueMVXABGR-YA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMSBTYWx0ZWRfXx/zOukcc3ott
 tPae/vPStCK/bzAPhMPbQdipHwyZXwAWZNnezFP47ueWWnqurK9O7FKFwjR6LTg915GAsNq4nb8
 0qFLF+njUOVsrFf2MtCEMk7+X98aZnQ8kKQltpIV771mXV6b1fHLHHRT+/yTdzBt5e6nR4oN8Il
 dSz3BTGU+UMrArWom9tl4keWWtbWSQDt60U6QV1MSyamKNS6nqn+6xG8VoYLV9AY5YjmAVWgJsr
 66a313UyiJN5fL2K3MhTGf2YQg9cPnL2VbdmgqXIuESy8bD9fSkSRFhXtZVIUaXggA16RbeExRw
 8pkrS9X/9KOHRmlIZdbASYjyvrBXeUq3DEGJ+3FM7ZquEUC4rSCY/AIAg0Q3ymusmRGhXglZPRe
 NmS2hI5y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230031
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

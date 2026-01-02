Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B405CEF7FA
	for <lists+freedreno@lfdr.de>; Sat, 03 Jan 2026 00:53:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4268210E22D;
	Fri,  2 Jan 2026 23:53:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ikl6QsGW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qe059CkP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0E610E22D
 for <freedreno@lists.freedesktop.org>; Fri,  2 Jan 2026 23:53:34 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 602KStFL1977823
 for <freedreno@lists.freedesktop.org>; Fri, 2 Jan 2026 23:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/TOfMpFCdBGiMultyyH3RUnh
 JuRXi4s3p8mFm8Vl96E=; b=Ikl6QsGWiemAUO70+A/3KIr9DMMvpyEKzg9CJW0o
 jgz02hyxChW/KMBq/5PADp+08GUB6iubThTwg0Ys9UjmIV5oid5tCGnTVwyNa76W
 b5lMprAvWSuEdDn9LQpjKv4lT6yphUCw0YyLaT7ggO5/6KOBCawjmfloDJe4ik8k
 dQ4BioWSv54vEHfYiPNZtB8w/xoTdUzNAKwJQG0AcHdF1BxiSD0SzElhl9M7/f9u
 FevOlLbS4LzboEZo3qGSE+IgieZ/jPumeTWJXuwc5aPZC6HoHYk8vLDWqeWoaEM7
 BM0KvC4hZ2Uwu1zg7kycko/m8kNnWk+7v80KEmgq2KimzA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ben3fr8vp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 02 Jan 2026 23:53:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f35f31000cso170809031cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 02 Jan 2026 15:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767398013; x=1768002813;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/TOfMpFCdBGiMultyyH3RUnhJuRXi4s3p8mFm8Vl96E=;
 b=Qe059CkPyyvseiG4b5poVnAvn6V5eJa2fvDl8YxsoVxLzgu2yu25xAXv2xKsdCpFvC
 KXsbqyF0PBNJKXQhU97EeJlV4wEr+M61g88iH7/z/Oyjb/Jx3C4Ta5LUnWNdvggzBpBb
 y/6ODUwP4P+64Axqz8KBbm4Pc4ZCrzLqxTL3bDYTDAppzh3SKl2pHLexK4Q6M3HhwSE8
 NrGSIoVewQu88oS5ZUAmiAPhWVj84q/7Y7PT791es7T0aNjyyBs1+Pesr/Iawyz1//+u
 1cdPgSJdiFPzENn6AJ3Tbat/g2/gjmcuO/PibaXDK3+b51g3/SjEFgRQ/L40K9JoTCK/
 pXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767398013; x=1768002813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TOfMpFCdBGiMultyyH3RUnhJuRXi4s3p8mFm8Vl96E=;
 b=Vi+2FeBgCFAF2tEpLu1sGs8nB7/I7180jSoGYDUQNGAICWTCrifNodFRqiAKoIQP8H
 LU0EhmbOwRssuLxSALBZgcNosiF3QuySXsDaBL73tIaNSTglhHVpXhpvhCFNRe3HTxzr
 lNIDmuTv4xoBS1pE6zS+M+JYEcFzyMCxZUEups2iFQQTVyKZWyieTFAfjRWZjJyrVae8
 ahBt6/BaZ0hEYLrMtQua1FlDMTRG/WQR6S+yBNHe/jA7W/IY7FZQrkN4BSkPxSsIwEGp
 U2tujIEjhe/n1AR+nq4V4+zd+wGH8/FlNJN2r5DOzKZ2YHPNxZNgYQbaYPI223o2VnbM
 RLeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU01NDIg5M7gzJ5lQOz0Ec2gKioWa8WvBDfdlz69gtj6sQGSYw67dy0eR06WZ/5jIt7lR7t5N340M0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTYUh7Neh+D9eqp4ojXlC8FtqJzeuSizc86rPtvFsNptI0iyXs
 nKokD0WFC4MBO7x8u1Ee2LdsQb6xYXqsfljQKUqpn2g+y7sgBx1byOvyn1aH4iAbUo7LSeev/xp
 ZOhP7lE6Hlk85jETGKaG49htEYhNzPFedt1HRStdIoXfzbvbwJ6doP/OHBNE+G6bduzIxNDI=
X-Gm-Gg: AY/fxX4J+slMcsnmGoP+V2uaAMnsdfidUEy5ugpwo2bRBuXfxVCUcAvhf3FgsOngXD1
 98mZRkrECpIj6MAvhO9sA9laAM87Jsov46S4uQknYPnpZmBUjii/OnVAy3lYqcLJ+O9kgcH+UhD
 PZ6tFeffezxDPjeAFOlo5ahRxMQMP4+K4+NnghZgF8Wgk4R+Lcqu4sXHTTgP0d8NuTE7WAoErpD
 S1blZ66k8mBF+0L/TX/ZnmuqDhI0Je9NCsHA1jd1/DzYS5wMEjtL0H6dgqAwmGJb5RCxL9UP2kq
 8mCjlVpzl6ABDSusANWjrdo2VrtaztcXNpJqTQ8WM4NogHcjKjCkX7m2Apj8+GXZmnEzcKIadwK
 lUCDK2NjM7N/xKP/Mvzp4/fERk+waKPhDkqcvzQFQolLSpL00lnghL/+pb0DiaBOH39FZs6aXaD
 bA441urD6m1JZywvDRjbpj/yQ=
X-Received: by 2002:a05:622a:5812:b0:4ee:1e28:acd2 with SMTP id
 d75a77b69052e-4f4abdb46e1mr659769811cf.70.1767398012556; 
 Fri, 02 Jan 2026 15:53:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0QH812ZIfQAgtd1QpMNOObOzz6T3l1UmMcjcdbYOeSWMWVdOtYvBSjohvx5B1nzJfyW6ibA==
X-Received: by 2002:a05:622a:5812:b0:4ee:1e28:acd2 with SMTP id
 d75a77b69052e-4f4abdb46e1mr659769571cf.70.1767398012135; 
 Fri, 02 Jan 2026 15:53:32 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251b2b0sm123294051fa.18.2026.01.02.15.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 15:53:30 -0800 (PST)
Date: Sat, 3 Jan 2026 01:53:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/disp/dpu: add merge3d support for sc7280
Message-ID: <nao4o76zlvkmak6t47ubcqjnkfe3bdkdounixwdpgox26yfmg2@ltpayjaow6h5>
References: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260101-4k-v2-1-712ae3c1f816@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDIxNSBTYWx0ZWRfXyOgAc8zCL1Kg
 XbDWZ5Woi4Ew6V5kw51EAZgtmlNHan9a7XbivQ5dPgGsAsUfFBodkPixANLUaVwcuGv4BbUThZr
 /oDAzG+KR0ThqmAkDKKlcTrzoDb/CY7bW1iuzYP2TFc/P9dvhPjHt3WDaVZU1Yrkh8qQPxK7MD5
 EvPok+zOdGjSNRxbk6Xi57b4Cdetl8s/Tx/mtmv77LdxxJBLe8xuB7FMqDDU3OZPJ7lkwZepjJk
 2cxEUUgsIy21Doprsls7l+KhFT4LblhlZru7g/2sGXWdDPNENu2zJxOK5Ah4XTs627n6+HXb7sh
 qbHvmVwMc+AmFpX0rWMHrxsLoGOpi2rUF3NvFP8tpcZgEbFjmW2QyuuZVu9vJ5mo2ioFLBqDMWp
 q43kNvC33PbB/ngB9tsH+yXAyTb3j8QPXH9x5TyhyFZ0g4KIQXo/lEnMZvJsg8Yy5U3xdosytUt
 eavHkBdoUgas3Yl9ReQ==
X-Proofpoint-GUID: OLqQlRaofSYFcQr-BvUQZ_1vkEjU4rKo
X-Proofpoint-ORIG-GUID: OLqQlRaofSYFcQr-BvUQZ_1vkEjU4rKo
X-Authority-Analysis: v=2.4 cv=GrtPO01C c=1 sm=1 tr=0 ts=69585a7d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dt2VdzyfSrB95En7lnYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020215
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

On Thu, Jan 01, 2026 at 10:34:38AM +0530, Mahadevan P wrote:
> On SC7280 targets, display modes with a width greater than the
> max_mixer_width (2400) are rejected during mode validation when
> merge3d is disabled. This limitation exists because, without a
> 3D merge block, two layer mixers cannot be combined(non-DSC interface),
> preventing large layers from being split across mixers. As a result,
> higher resolution modes cannot be supported.
> 
> Enable merge3d support on SC7280 to allow combining streams from
> two layer mixers into a single non-DSC interface. This capability
> removes the width restriction and enables buffer sizes beyond the
> 2400-pixel limit.
> 
> Fixes: 591e34a091d1 ("drm/msm/disp/dpu1: add support for display for SC7280 target")
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
> Changes in v2:
>   - Updated commit message for clarity (Dmitry).
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

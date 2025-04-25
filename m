Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682E9A9C32C
	for <lists+freedreno@lfdr.de>; Fri, 25 Apr 2025 11:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A621710E0C1;
	Fri, 25 Apr 2025 09:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aF6ClIpQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D8C10E0C1
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:20:20 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TE7U007503
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=rMDIsHdsOYkyViUAsU0t/ePU
 SWOO0YxJOUX3cKyNhU4=; b=aF6ClIpQAYUrCzDnHYfaXzQmwyNulXHEBtEuHA7R
 oLdXml4MEUGZlFN1bhGbAzin8xp9PNjxOPvY8fm55P73h6zozQXKjFnu4d1bWK87
 p78nCwPMoecpSxRcDOvQ3qhzklOP6kTXISooEg9LjB3ABMJPHIAOiS7FOdKWqB4h
 4/wbqslrMQzCgnNDdUOgHQvIwZJBbPdBM4nBFkfSFILproO7iO6dVzLE230AKuqv
 NrmDDfIYzWprXypPDQwo/rVqsxldkAUsGMnoJWX5mx5m2qu2kY8nGW3PER0ss5d3
 Wo53ym5H/ep/vbCkOevCqO8F/JK+l+J4GZcF/4S1QK7WTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0rc1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 09:20:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c572339444so328762385a.3
 for <freedreno@lists.freedesktop.org>; Fri, 25 Apr 2025 02:20:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745572819; x=1746177619;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMDIsHdsOYkyViUAsU0t/ePUSWOO0YxJOUX3cKyNhU4=;
 b=bdXhtoYIIfndGo65UYCBptSRAUUIhpGPBiw4EkL3UQXUqPAnfFRU4dIM8Gm1taMlfS
 DSrFd/wfPxzz4LTEHNGrmNX3hxb2gNvIMYcTEduVhdOU8yGmanC44tnVW0D46t8nHixy
 16u9FNY9FDSXhVgIu0jj6h7rzx7TCoVdCDzEXLgHbe0xArbTJ6hVQXqsQ+byYfc6dflo
 VFTJC/pMEycS44FCNGqQ7Avfpiv9J29fAVarM+mwHv1s0jLqC57yr7AEWnp6m4pyYBoU
 Dq60BkgsrpXasXutuNc59r+kBGVGaTgejkvuvlmiABUDQmNOMy0/xSvnzUlCsEU5OWkd
 4bxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW42u1kVmqbsWxOP4W5bbw6ZnqPKVLKtLHsp1xBCb1tzrCqrmU8VIbSKjLLtUl4zXG6uHlxhVD0Edc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLAwcOFVO5maxO44G69PXZLbiFMU/ZHXmHhAriw7od9LJSUC2a
 0RVymu9T/Ogj3KlP19Lpz9HhoER0gk0sH7JVeKx2YN6fi/IgXKqRBTnfxog5JeBQ/02F4LUPca9
 93TCdK4ltSOdCiBvbS5vQuRHaovW0olOCAOE38vtVBslkXHOm47MWjWBV/gO8lAoGQfU=
X-Gm-Gg: ASbGnctBvUFgPwZlGMZ83M3UAQCMrfYHf5wtbF4PDnH5mwbYWrBv73NBRef3i+Pjjgd
 zvMu3nKtWryHvjmHC348pUqLZqlGSgfmgxjpumlkH6zyCGOQMEk/ZlkvwoINGH45CdyJHXzVM9F
 IPeMgymCqfisKaQdmvH0D8/qFyToTsbe8OVFWvd0zVoHXobr79Sl2AAr8Sc/2xuW6ltrcaUxIcG
 uSm/tX+MzNY2VaSgjojoFfmBEoHfg/DIWTZY/GoIRw7Pm8hkt2Q76Y7cR9fs4Dit3ZM3jiuiKiz
 teuYLK2EohzoyJ4ERLlJuPEbpByjRgMrxZvMVD0r5dDwWmkX0fr28hgii2l8//tyKSN0PcDRpAY
 =
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id
 af79cd13be357-7c9607aa0d9mr312339485a.54.1745572818814; 
 Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfBCKqtUoVTfxHiMTz/laWIXb+vyHohQFKZ/KaREmisUEpTMfrdz3hYOCR3l6/Jaa+ylyp/A==
X-Received: by 2002:a05:620a:2801:b0:7c5:3b52:517d with SMTP id
 af79cd13be357-7c9607aa0d9mr312336985a.54.1745572818522; 
 Fri, 25 Apr 2025 02:20:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b96d45sm6445631fa.94.2025.04.25.02.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:20:17 -0700 (PDT)
Date: Fri, 25 Apr 2025 12:20:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
Subject: Re: [PATCH v3 2/4] drm/msm/dp: Account for LTTPRs capabilities
Message-ID: <jdeuodvsnlezbnxoucihd75rwlrigskvessdt3n3ufuppw7qov@ujjgimndcdkp>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <20250417021349.148911-3-alex.vinarskis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417021349.148911-3-alex.vinarskis@gmail.com>
X-Proofpoint-ORIG-GUID: 4b3WmVO21CpAnFu6EwxV8YalpFjIzMuT
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b53d3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QaToclHOt1NPS2V0eqsA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 4b3WmVO21CpAnFu6EwxV8YalpFjIzMuT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2NiBTYWx0ZWRfX5G9Arzazvohm
 IB+P/mSdzqizWJBnPXo/B2h3DBU7YWhLN/5wjJO1D4dCBaQTYgGLTbUVSqqJskUNghwwXmrmnjT
 WlnTNLJsVNXfjp1Aq6eykvscVM9VumlIlSInr6ab4fr9aoOlqenQ9vE7hWAY0RPOfpqJbvwsfnI
 uOHt0xpvbD/8Wdn2z/2nOew7WilcFHP5QtobYjzowb43/UAHYunn6uUlOemKvEca/7kkL9e/LP0
 NSNBnoBmRTYqOdlRZcw4BxIS3bP8za9RChbD+yFHj9GhysPiCHClSeiv6AQ1DmJIns20V222/yY
 iARW931Msgs7jfYknyaeHzajEJE0Rh+lkBNvZc87daq3S5nhXSh6b45O98zDMokc5XyFxwrT5nm
 KHw3uwU/RCq78qk8ORGSevEOcSS6SlGcdL6k5FxhcAY/+IAJtmh8UGeafWyuVM/9uwDByqwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=789 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250066
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

On Thu, Apr 17, 2025 at 04:10:33AM +0200, Aleksandrs Vinarskis wrote:
> Take into account LTTPR capabilities when selecting maximum allowed
> link rate, number of data lines.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  5 ++---
>  drivers/gpu/drm/msm/dp/dp_link.h    |  3 +++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++++-
>  3 files changed, 16 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

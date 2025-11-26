Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546DC8795C
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 01:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609EE10E062;
	Wed, 26 Nov 2025 00:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="b7sF07ll";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu87IMab";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F4F10E062
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:25:41 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APE0XRU3706627
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5d2Twl82X5Ayvh+7UIeHN6bw
 AGRYFoh6iqVO8BoTiBA=; b=b7sF07lldsah+AE/bFv2zwvwlkm5K4/xA7Qskvh0
 hPJpgCAYiFy5Dvkwq+tvODejTa6UDL04p+fWpK0pqE47L1M0idCCF+HUCa12xcfN
 Tz3yCC91EhPcJBZl7lkGn/pDEhIwoMOOf4qedobnhXca7hGIR9OvsLmTzzdSCW2H
 6PVdN3NpxNXsVYNZt+IwaqJfC/HsLT8ji2ONVTkqVe9Ljo6zU4OffNDpnWWBwSrq
 QGS7d/Wi9vuiZ6u4PjFTN/DWVHNaNE8V+OC65zqCJjgz8ca92m83Ya5iaLTyB0Rl
 9DTAEx5ruMxGoZEAuWxa3E1x4YmE3D+DJLYo0u+8+AjPVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufsjw0-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 00:25:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b26bc4984bso2327400585a.1
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 16:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764116739; x=1764721539;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5d2Twl82X5Ayvh+7UIeHN6bwAGRYFoh6iqVO8BoTiBA=;
 b=cu87IMabkGCbDp86AyuA3Sdtv/MS6Nize5PqtVZHj3NAP9M3lSbC0BIzPTF6D+YWNp
 lr/YJK/SbTJeT5gTl2LB/AZ1WsSf9l0lhhRCgHLQcbP6Y5TKEcbq6PUY1Op/kS/4ZB76
 j5HljSC8VlLtUIBOnNnuq5YaGpbc7wDLdfxMcypXoH6S/KVKK6Wpmz0eW49OJnHGPAY6
 Mqfhw4q6OnHRbhRz7zdECqYJGUsyPoeIZSO6kF70D4UjOIf9RLZ0Am0JGU6x/OKaAclm
 0S6KBy1ITvelakzvMgn1rH5+fzKGUvShsWtC6i7bja8ZvbzY2OjZYBAKDmuVf2KdcgLU
 VeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764116739; x=1764721539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5d2Twl82X5Ayvh+7UIeHN6bwAGRYFoh6iqVO8BoTiBA=;
 b=XgQYXDHH06CQG9jRqLrpBPk/QHgiclp42+P83M5ih4t07tVYgs0zR0cakZs1p6JgZg
 qDdSVnfnRFnaxffPWM7MPNQ55R/I/Q1WGVPMgvAIpVspjDo0QEaYbFEn/k8jJwalOMdX
 KpVhD75QUZmB2egBVoYHqDf8oeojXWNmkqiNC5xZ+PlyHbgkvj4E6RzjGM5vsI2MUfmS
 clzz0aF6r8RWLJP/A/nJ+hH464y4TXcL3Hk0uQtKpGfz001ncGhb3lgnO8JVfOCRwbxD
 /C3DsLwPhGhE3EBMytDzN35W+sRsqDZd9W9YkPNuuxesI/qX/fiJZkGbS7tHqUsoJ8Iw
 VxbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXorYI17iYBeBxWiWG4y2+Uj/J7LlRg1E5nIUTw/QRZ3wNWMAzHoFrY1QRv4Lj9AJW6K29aR40+LUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkX1mMdddmHxQmSvY11Pbhy7XERyHol5SYTSpFZvSNpy9S5NJ3
 vGcE8Uw/hDQ3XpzuOxhIZMkMSwHyDMIK9wE25uGI+msQikpbbQroSyw7aw97IjiIFQ/Y/L4+Xy3
 qBZNQc5zZinDnAF58jF9IIVey8l9U0pRjJF5114loDvpJP79NiccTcQLEOIEMXfFwO428m4Y=
X-Gm-Gg: ASbGncsm8PRien+x3cVWJLPEfcYQjQ46sE9wLm8wZvzEiTbJf++a0Gw9hEyzEAJSsOx
 iAYhqIby37GfYQfGpy7WHuP9TI7RQ9h8I6FUfYcCZNl2L2YTKDqvsi+mz6u8hv4luYQ/QCHKR1z
 +UujvewGqCxUrOWxxWL2Y3kihm8EnNbJ0/d+8ecq/mDtTMzHDXGQ2dCraKeE98C9kr7BzkFMCXU
 a2rNDb0s+ec2BCVI/80Onpi3UHiUR7DWEsUENlTbcP2MaI9pswpK8PiEweDSEyFmX2KrfGPhwpw
 RkINxcFgp+Zvc1ZrBdZdRfWwhmVPE97EEUmU/GpugajICzjMPDVODPMRNJtPnIHFH5rktlCKOxx
 PWpKyz4B0zodXYBAig6PUICwIpiTWzmI1/1V6tun6IhIIC3YBQBNmtRbH0RixUV/+yJwSC9753v
 45WQKcTkIL3fI7k5ppyUpN/dE=
X-Received: by 2002:a05:620a:4613:b0:8b2:edf1:7c4a with SMTP id
 af79cd13be357-8b33d253d67mr2508839385a.39.1764116739400; 
 Tue, 25 Nov 2025 16:25:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEvbrXdwT54hjBQEGfllxVr3ihkFARzZblVNPmDey2OxPwwIOmJzCrtTxhBTl+4NNXy/fGGgg==
X-Received: by 2002:a05:620a:4613:b0:8b2:edf1:7c4a with SMTP id
 af79cd13be357-8b33d253d67mr2508837085a.39.1764116738858; 
 Tue, 25 Nov 2025 16:25:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbc5bf7sm5446600e87.77.2025.11.25.16.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 16:25:38 -0800 (PST)
Date: Wed, 26 Nov 2025 02:25:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy_7nm: fix rounding error in recalc_rate
Message-ID: <bpiqx2ouerihm4jvrt6cv4yhd7d2pthryn22debqjeg4suz2x4@eod5ibcj54ld>
References: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-msm-dsi-phy-7nm-clk-rate-v1-1-17141806e3a0@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=69264904 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vAqZcY3_g_uuhliy_rEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAwMiBTYWx0ZWRfXxwx5+6z3bxLt
 pTnuknLT1eWImTtFzKSnoxr3OqPtO4FKvzVHxnYuKNDWWu/4Nu6qBKex5xD2F0IV3IzvJNPgWQF
 S9/9xoL2ylQWma/AXs5BSaoBa82ZIXvx0c8D37oNcdZtvJCyriH8J5gGpNKl+6gAGWF7x1z5XjV
 ptKOsm2+psvJDDILnEvJqW+JT6Rc4B6r3ITRozFFH6QpZTwXJtUzV3SFFWTkvzJ14rqf+2rDFdZ
 Wn9iGBdFDPTfsHClrjvBmli2hiGTo8phNPG50iKm8Ar2pkMeHu/lTS2cfWyW6TGb4DznxitBiWV
 XbbPeFx3b2YGjvfxGmtd47coymva/T5S5IDDs4OFfme8EuFOktvibLbx44YM2QNHM5VUG3/2Ldg
 8Fve8gNCAQY6LpQB59XMco9aNkIF5Q==
X-Proofpoint-ORIG-GUID: XKzzw_A9hMzIHyjyA7_sDZjFKE5EP7du
X-Proofpoint-GUID: XKzzw_A9hMzIHyjyA7_sDZjFKE5EP7du
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260002
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

On Tue, Nov 25, 2025 at 08:55:07PM +0530, Prahlad Valluru wrote:
> Required vco rate is set by programming decimal and fraction
> from 64 bit calculation. This programmed rate is not exactly
> matching the requested rate and corresponding recalc_rate is
> having rounding error due to this delta.
> 
> When setting byte_clk and byte_intf_clk from this pll,
> set_rate on byte_intf_clk resulting in dividers getting
> reprogrammed, which are already set from byte_clk.
> Convert this recalc_rate to KHz and back to Hz to round up
> this delta in calculation.

Should the same fix be applied to other generations too?

> 
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 32f06edd21a9..00f20c5a7c73 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -598,6 +598,12 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>  	pll_freq += div_u64(tmp64, multiplier);
>  
>  	vco_rate = pll_freq;
> +	/*
> +	 * Recalculating the rate from dec and frac doesn't end up the rate
> +	 * we originally set. Convert the freq to KHz, round it up and
> +	 * convert it back to Hz.
> +	 */
> +	vco_rate = DIV_ROUND_UP_ULL(vco_rate, 1000) * 1000;
>  	pll_7nm->vco_current_rate = vco_rate;
>  
>  	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
> 
> ---
> base-commit: 63c971af40365ee706c7e24f6a7900d693518f09
> change-id: 20251125-msm-dsi-phy-7nm-clk-rate-26723a3b686c
> 
> Best regards,
> -- 
> Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4306B4FF3B
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 16:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6836C10E72A;
	Tue,  9 Sep 2025 14:23:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YbFniPHI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1603A10E72A
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 14:23:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899LVo7031532
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 14:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=h2X4u/C0hT0ZnsZtZ5WLCYHT
 XPjaXvBzP3cbcDi/Cho=; b=YbFniPHIo9davfYh/UqJaVAPE3OtZ3Tmf1oVQHjl
 8XHy2m84sdYjmVEqBiN+4A/chC1w40DaU3jMIxVZAjmpEfoUCX1xEAB6k1kLq7Qa
 R3eLZB8jCXjDcaoGWeWHY4imbBdWc6a+bXjX3LtiWsMZvdjOVIo0t4DfZrVGqg8Y
 SiWlU928L5tuqx+8zu7MA9kmOeRTZ86zSG/yZLz+hBsoAKKDeTeVgizt4XnIkqT8
 eabIomDAS8PW64huugCjt0r//isipB0vOvPQO6AzdZshMnD1OrT5X0qtfOTwWfwX
 IHu2D0qeD4f59RMScc+eY0UD2+9d2/Vwo5/W0oaGsyu/0Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws8m81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 14:23:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-720408622e2so120050076d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 07:23:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757427784; x=1758032584;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h2X4u/C0hT0ZnsZtZ5WLCYHTXPjaXvBzP3cbcDi/Cho=;
 b=gJ/ZOh73Q+qvQEDwJ9+LwQs48JTYiWHlAOe91WjX5/u7OcIaaohN2eKSSO0bV1FFqi
 RSxtFH15w2+ecsiK26h4km3/XFh8TKkIENQndSinjtuBGygQAcn6QVuPEkjM/ftgYqVT
 D4V0bn0q9ERWOvL92ARl1GUfOKdLPwmP00OgZO/TMhjc23ZPHoxW5jj/w9wDVUulb51q
 iJ14wWlOdzwbtTvJ5MkX5ou69L4bgv/WftU7TEH9Wbeccz8cUOfy+NH3/bD4ZmIBaqkq
 iF3lDpNuQSKHpY4JG7jnUxWR6EK+irZDyGxzc9+qc04z1AweLJxgbdvXjD2AhEwZSXi1
 qkZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3Y6Asd2BJwKLUQi/X3JgntfNIR/yh+Zc9C5E22jiEdqJ2oD5HR3nHxvtYZGgjlA+VsXoE6dC07zY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEuS5ouRieTdNmgxhrH5HWF+O6zaX1SVMwWcyk611XZ1Y5M0Oe
 N3gbO5qqeCPc+po4iSI+Q/axwlg7yD+QXp0Ol0G6CIj2Ah0vG9VzWJKO456AZAIp0kM3cpgWPlU
 zB4uRUZeIbvr/+xI5WsTpCL8MSqkZ6iwqEkLPyKvQx3w/UVylw075Jj9iSAubX3LON8HL2Xs=
X-Gm-Gg: ASbGncsPsTGIJ45y3MS+pZ9cX/NrrJEpjHg5YFRNADVF3rEz0uuhnxfsXdoDImgxalv
 yoMy+eBm5qeDuL493ohbj6iFa+tMsDBcWd18B8/D5FP/feEqTPI0lCE8O4PIwTjVDWuhNiLaNYd
 SWJrywClxv3/p4pHaIDfp3it0YEbYTZdWt3lG6bS8Ww+LT0bMmNIRqucruIqYB5+qDSK1Zxd50i
 eAHDFsWg1qdruFLuF2aHPjFG85922fnCoTn7wv2qwyY7u2yXg65CwwBh+wmUmwYUx8+oDp1wRJ9
 KVr8wNBlk6GYFOPibvenN3wVO4Zd//oMeMPj4EpPod2MSUmN7BPfc04vNDvnp3leksYSxx09DGQ
 XA/OQCljvwnqJJRU6xErKsacWPBS08UFKu4NY0RUUyacJAKExBLDf
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id
 6a1803df08f44-73941de3724mr124936726d6.49.1757427783954; 
 Tue, 09 Sep 2025 07:23:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+8if6eNbTpzHKsyNkm+8kJ+WHyQl9Ap4iWvgtn+1Z4Nqh0b/WPPZlhr5A1An/PL5BbFnfIA==
X-Received: by 2002:a05:6214:f63:b0:70e:d82:703c with SMTP id
 6a1803df08f44-73941de3724mr124936256d6.49.1757427783207; 
 Tue, 09 Sep 2025 07:23:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f4c934besm39228031fa.24.2025.09.09.07.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 07:23:01 -0700 (PDT)
Date: Tue, 9 Sep 2025 17:23:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
Message-ID: <xkzlobhynrw3ylelnzwh7u5chigtytizy6vyc7gp4un5du4lcb@nssqq3f5pv7s>
References: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: 7VNeyHUcNU9BW29L_ZFcTkW-ebY0nWU1
X-Proofpoint-GUID: 7VNeyHUcNU9BW29L_ZFcTkW-ebY0nWU1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX8lWUd9bEAMnD
 1hQYn+rcGLWpzaQgvPjue4oEG375//Kh0PC/rLVgQWeC2fSTfjmaqBm4lQZa6AYbhH1lIMRM9MQ
 tyBhA+XK1L0saqkDN7oHqGS+JZxXz1IIaUnTkakTd+wWVEZVKA+9ZLvyTT78xEV9kCj0/FeH0Gv
 GDmVtV3Lr1Arx72ASMV/xSTX+5OHldK1niUuWSVCvsHoUb4TlgAhnrO9Rscc47yZQ1+gve5dWVA
 ljyLqPxHMhpcPkCaLE3ZSAEhPSgfFKeC+z6WTuAmyKX0fuHOct56Jj6ZnJs+bgsQmVGEGxCdOQd
 Ykj6mt5aEM6uBe98JHn1iKMyECDDbXR0lDOelBifteM8I0hYX9ayqlFCmPcvFvtU8W+YPMOfMw7
 GtYEHuUM
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c03849 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=p65op6kECmbMoyNqUPAA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018
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

On Mon, Sep 08, 2025 at 11:49:51AM +0200, Krzysztof Kozlowski wrote:
> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
> were called on unprepared PLL, driver read values of zero leading to all
> sort of further troubles, like failing to set pixel and byte clock
> rates.
> 
> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
> corresponding dsi_pll_disable_pll_bias()) which are called through the
> code, including from PLL .prepare() and .unprepare() callbacks.
> 
> The .set_rate() and .recalc_rate() can be called almost anytime from
> external users including times when PLL is or is not prepared, thus
> driver should not interfere with the prepare status.
> 
> Implement simple reference counting for the PLL bias, so
> set_rate/recalc_rate will not change the status of prepared PLL.
> 
> Issue of reading 0 in .recalc_rate() did not show up on existing
> devices, but only after re-ordering the code for SM8750.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Continuing changelog from "drm/msm: Add support for SM8750" where this
> was part of.
> 
> Changes in v7:
> - Rebase
> - I did not remove ndelay(250) as discussed with Dmitry, because:
>   1. Indeed the HPG does not mention any delay needed, unlike PHY 10 nm.
>   2. However downstream source code for PHY 3+4+5 nm has exactly these
>      delays. This could be copy-paste or could be intentional workaround
>      for some issue about which I have no clue. Timings are tricky and
>      I don't think I should be introducing changes without actually
>      knowing them.
> - Add Rb tags
> - Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org
> 
> Changes in v6:
> 1. Print error on pll bias enable/disable imbalance refcnt
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 53 +++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

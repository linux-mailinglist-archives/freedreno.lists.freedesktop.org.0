Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF32B06281
	for <lists+freedreno@lfdr.de>; Tue, 15 Jul 2025 17:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C4110E5ED;
	Tue, 15 Jul 2025 15:12:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElfxlvT0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE3310E5F3
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:12:18 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FBCZkr004458
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=/8/GQmYozt0hkVdJKNP3dY4c
 27MmXYLwdf8DyqAf4/8=; b=ElfxlvT0VzYDBYqLPcqcx5u7gpdJm/0FYmMwnBnG
 y+B4eho5GQ38s7gyWa5V2do3XLCADnVdKyNIdYEaRxCT0C1n6voidTAPb/dJ8PNM
 cQjD55+s9FTC8E0DR8gaP1UR/8u1e6FZJsdhUG9oFq65KyWJvm1FKx/OIVGZhCDY
 GqP34VrlblGX7kQjhS4nxUIVXBXKFZ9NLggE072UbjrSEaUUDqK9bPvusCTM1sc8
 TYWch1G+ETibhGOgFvTa8N8/FWEZDaZpp8bAT7BoxZ0ifVXNJ6WcBNJaKwt99/uv
 EPvODnurcR0dUiYP2bhTrorQpVZq/UucSCwyWS482wIFPA==
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca203c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:12:17 +0000 (GMT)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3ddd5cd020dso114495875ab.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 08:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752592337; x=1753197137;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/8/GQmYozt0hkVdJKNP3dY4c27MmXYLwdf8DyqAf4/8=;
 b=ktu3r8BO0eBF1EZpbTZgicrtyS2unlUObqZmmOcZsV0D7qUNzL8IjgM019CU7hZK/v
 IXsXYSDV6jpWuovRncNcPMqLoOn6b91qqu0yLg0Yvn/PzPYTJevrehaJYdAby1RWFTi+
 TFpu4lw7YaG2YTOmqPgs1p8Qix1IKm2pveTuosSca5o3zcg3+HKPwacUBtu+VhbOeXLb
 kJ3CwR83Ope7Nn+o2q1Hn4rF7wb9pJNOemANCLGi3K+X5bnI32bcBNQG+G6oUAb7LCaC
 BjHqtv1Dsgt6F+PvW5eip4H01zOYc5Bwh4VnRRZgpJ+eWq4UFfjXH62uX3O3+DAGJR/7
 rqog==
X-Forwarded-Encrypted: i=1;
 AJvYcCVdGZ3v6oX8pEacPKA6OEr+g78h+nU2Q25z2bjmyTwkFKE95Vo1XVluUK8GguMcKTIH+Trm7Z0/tWE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk0JsPsiFkBl75fPRjZcbBSvDTKNYBAuwB2DKVaCQxRuUi532Y
 +8uZx6QJ3bndhHC566fVq29OXLkj2lgnrIskL7u7IOQgxi9hoBlCWGk3EFnD0fSTS95yqamcNgj
 36TNf3NTlrsN/gpVkRVXJDY20Su05tuaaLip3P6D3GsOQxnDlxMB/JQtuJRBNEk/C5HzQJZE=
X-Gm-Gg: ASbGnctaOxqo7CiPjD3Tyu242g4zqDO2U7nVKaJCY/0SsZGWwX85PzRodj7Dyr9+J22
 p52TVbsAFLwVbWz7rEEr/uYMWOCIY8IZ/641WCHALawiazVvQ+bhBTPlzRiHt2mRq3dFcoERb5m
 B36ISv4yvmJ8rXdHnDHv7HXdLRpQmVuLKCeWxraPXT6LCASh8c3KIj3yG9G0GA5A3ZjHP2en7Td
 8cZTmGlxVI+VYU0bLTq/lliiOEc1i2jmr+/wuHz88Iep5qUao0abjYeMQOCBmWOl1FcSl55ts16
 OGPmh3VSOn7s2hqWD+KiDUVuCX1G+G57vTySIe1dG0rsQoMp+Q6g787iQmiLIzMnLUdE72E9EOw
 b3mf6awR5XaPfQOtTlWA4QzwV7EYGwV55EUurKkKL3Up/7jl6t9lA
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id
 e9e14a558f8ab-3e253317f2fmr190550575ab.14.1752592336600; 
 Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuCcHGzu/NV0coaNVvZvnyxMM3fWdvavBShiCcBGZwVBVkpyKA9SgxNyTJ8HCuKA2VAmYM7Q==
X-Received: by 2002:a05:6e02:b23:b0:3e0:5042:6a0e with SMTP id
 e9e14a558f8ab-3e253317f2fmr190549775ab.14.1752592336031; 
 Tue, 15 Jul 2025 08:12:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c7f380dsm2345658e87.83.2025.07.15.08.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 08:12:15 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:12:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Message-ID: <tkqu2zt5yulnngwvda462fhmkmtmtjnwieruel6lfjr475h7ld@47goit7jldgk>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfX1Z5f5p4fAr6i
 dd53aFeVxVO/1ZKcRekYVkVeXZg1UTk4G/l5vvgvrwV/2fYrHIvleqVEu0PgmfPwE6h99YJ9fH1
 V3KaNUrwRIWSC81Hr7eJ5aWoxr3hxcq9PDpx936PjarAPGEDN9NqZxt/hWWQyGx3wl5axGZSbKi
 v2gFWVu1zk01fQdJqhoYqCxGH9nwm2WB4/ibVrnD2xmAXF5QNdNAiZ73ozCb3M1QkjmxuQxF6J+
 oY40IMIdKphs6uVLtb/AQ4dOk1GCdWXXPLUmemAE7U6HWINtd/tFtGoJc9Kd+WgkC8o/VlVYcW7
 mQzmZCzRqSQjZMUB7mgVk+hyzfkkMQV+MCWv17LR7EsKGHPUJks3NofB5NKt2QYHDJAyT/QgBvY
 JcixKeViqkiOb6YoFiBDN9BfCFmHsNadSchlHjmQcfoZdkhZLAcO1bSt+VZqcaq5aur9aY7q
X-Proofpoint-GUID: 2uoA7V934LTHBkDzx6l_5QDQo2pBQzs_
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68766fd1 cx=c_pps
 a=5fI0PjkolUL5rJELGcJ+0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=HaQ4K6lYObfyUnnIi04v:22
X-Proofpoint-ORIG-GUID: 2uoA7V934LTHBkDzx6l_5QDQo2pBQzs_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=978 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150139
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

On Thu, Jul 10, 2025 at 01:43:04PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry

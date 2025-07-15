Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08697B06254
	for <lists+freedreno@lfdr.de>; Tue, 15 Jul 2025 17:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7690C10E5E3;
	Tue, 15 Jul 2025 15:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kms4CHhK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CA410E5EB
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:07:45 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56FBIGVt005532
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:07:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UFE3yd+yxu1P9RbRQyZIroNt
 ei5T0YAfVddPN3zIsz4=; b=kms4CHhKguztPZrh6aMbRBtnl6d9uGu4uOFm50lw
 iMEm3Hk1vAypjt53Ce3yleNqozyM/XTTCxr+e4G/uDCfYHbXQAg9h5hQNPK9y3I2
 udYhwnexMqZsF9/inyxAfUZ76hBWYT3td4TY3OazGAs+vHQuinCcwiorjzrk+l0g
 1Za2lALAmOj85o6c8rScrhk/vR+IhdCd7eBxxr3eg9cgxubjapge0iJaHFWolH36
 PYJa/KbYNYKjmbLO0zdUTqedsIENjxR/LKLsuUc3U4b4zj/FX1nbUJwrZnhLZ3fE
 bV+7Tw6R8Bs9zY0xs7ikJuxKj8mBvjo/d/+R4DU3M38Xdg==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca1yhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 15:07:44 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-2d9ea524aa6so5728183fac.0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Jul 2025 08:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752592063; x=1753196863;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFE3yd+yxu1P9RbRQyZIroNtei5T0YAfVddPN3zIsz4=;
 b=uLIRf33SDlFMqcYtpjZCcagqXnSy6pwXDQ5H1VG/L7cby/nd1rRyaE9bI1TcL0+cLE
 rQuxIQ8Zx8VrK48oDrMzPOEMSXhzgentRWRwLXeTW5FB1hRsfr5xqbLTlLoqljywYnfs
 dYQjr7m19SATA1SIrVBuY2ABvK6KVuJkiQHFSjGW9QPsZgSap2NRfUl+srae3f9LeVtq
 1EyO6uw26n+g5UIg5jCYaXmxDrxIBPJHsp3vOcBxcrJpV/RgVThUN9wTxWzq1c+ovq3g
 XB5QT/1mLkw7I0XT2DpDY50rpjk7LBPKqu6Q+dV53uCquCPBaPoEd3D0Oq4S2TAEtq5f
 uXIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAruMFNFJWkIZn5D+1MO5Lw5EkBm2Rjm89WKRFXgfdLzbCBhK7w28TAGmzDR9c2uthjZs7CVzh71Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6j7EVwrq6FAH49vcLZEa74FaAIHXtA4D2MFvfqZ2TMc2SfH8I
 XfJ7sQjDl9Gjg9y5+whxrFLTeIpcQmb4s0wgFDCINZzCN9IqLVvQ8OS5w/HwhFl3bHssMKtgmjL
 WZksENcADpdamwC0rS1duZYIGZ4fCLeA1GP0i36Gz22X4R5Scs2qcn6T73yY4svhkRU2NYbE=
X-Gm-Gg: ASbGncuubHIAW+2TK+acVTNIK/1sB1AbMzYWNwGSWtvFtZtgEJ9xhQx7QaEG+w6lloD
 IzThjGH4UhT3BLc6ZiB8bo75NPUvMzFjy+kIfXOBR3wBaeCVPu1FExZtbEmAZJY4lwNytO4f3J6
 WOh85RO+/kJL6UEhRRWMLx8+lvYxhCOyfx+vigjzimanWlEszCmBJnPr/60LZbH69P1d1BfuG34
 Tt5fmaGFBjSyb7LbGdn5Fsl97nM+VDpNDX06d5I+0olz2Ea1UMaAQSEBiWQ/YnntWjjOFvjSg4E
 sHzBGBLvp7jZrLPuUTRsp1EToX+NTjzM8CTlI16L5QMSRS0D0zfKAA63q+z8dZHeW4pbiM4cy/N
 XsKISYE0yp+0l1FRrJ4GqIZG+HAVUO2lcs/YKGZzk1eMA8y6wEZPT
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id
 586e51a60fabf-2ff8f899b18mr3018615fac.11.1752592063022; 
 Tue, 15 Jul 2025 08:07:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzt/a91mT3BodYIFDMVy8jVt1HoRKIa+1bUOyQbH9aZS0Ib97nHGb4Ty6uV5H10BORptHD0g==
X-Received: by 2002:a05:6870:5b96:b0:2ff:8f89:950d with SMTP id
 586e51a60fabf-2ff8f899b18mr3018555fac.11.1752592062451; 
 Tue, 15 Jul 2025 08:07:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5593c9d092csm2317122e87.114.2025.07.15.08.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 08:07:41 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:07:39 +0300
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
Subject: Re: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Message-ID: <qk4v2znryznnvg2vcye2m7taurfhoozjjdtye3fmk4fgawm5jq@2qlqgg4htfnl>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDEzOSBTYWx0ZWRfXzqqsuia5zoia
 IVm1zeEWglzKcbFpEqjtCVchRyaaxsP0kc/YeRMNfIx9gNZSyyWAUNpwEfdz69glForUoxPuUtN
 jPO1NdsFrexdbMfW5L7kDh/JjVRDBznlzzmWlDWWSp0tjOa1WByKVO1VTeYsGdY4GaoIvV0ypIN
 oZSu+XqrSxDKEwLwvRvO8ZqMTJDH98/aK7s6q6lTH3OJ3kp7RtC13qeXYEX2vL98JdMa5KAhK/e
 h4glq00aEotSIWJ4251rt7YlB1d8hFjNz3jEf9LiuzRPruuJlulNXGCZrOAh8sTkXl6s1nlp/4M
 H9FHn5fao7SeoEC5xQfbR/8ntz33sKS2tzq2WHrNfEY5u0r08iovE5HYLoTjIjC5/ykucKDYQV1
 DtC3+ZXeMdISlnIGNnx2Tw8bKBukkLZupGuzpxfQN09oRpc9Q7sB0U0Lqkj0+wqVa5y9wz2R
X-Proofpoint-GUID: _r0DN6F2g2i0BonxzOMWWh_bm_Dh1VcR
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68766ec0 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=oBXrOfH6mq4iYN50PBoA:9
 a=CjuIK1q_8ugA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: _r0DN6F2g2i0BonxzOMWWh_bm_Dh1VcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-15_04,2025-07-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=847 impostorscore=0 clxscore=1015 adultscore=0
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

On Thu, Jul 10, 2025 at 01:43:05PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Please take this via the drm-misc tree (I assume the rest is going to be
merged that way).

-- 
With best wishes
Dmitry

Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DADADED6A
	for <lists+freedreno@lfdr.de>; Wed, 18 Jun 2025 15:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A007F10E823;
	Wed, 18 Jun 2025 13:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpzzW+kk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ADFD10E825
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 13:07:15 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I9uenL013595
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 13:07:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pEB3IBW7SqwbHALnm+Lx2xPg
 ZbrkAM8vQD8no4c94Fw=; b=JpzzW+kkQNR0fR0arMeveU/sDhXQsfV581HTRMzV
 mLM1WtZudsBRSdUIZWCGv45SWcAfzVNdigRnJsYy4XwFMm4m73c/V1kA/QC7vhwz
 vqf03ZIuucfAXSPWYTG7O3hdDKwmu0zZth14mPTJzRIYd3sN4TLNfMLk3p7EgEXE
 bS7MvaUP28bhmnwZIlGVsWvRAUYF/MOaHKzMNAItg2ARAW7mrtFF4b6voNIYkV4a
 Opzl2BFa4ZYDwsqrYdKs+bAr4SVp2B36YBrZkK1MQtMCXYTv6N2nU7TvdsQgpXpL
 JbPmL2bscma82A0kQk5NGb+cstfNykXj9BpRoX2dz0JmnA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47b9akunda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 13:07:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so176625985a.1
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 06:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750252033; x=1750856833;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pEB3IBW7SqwbHALnm+Lx2xPgZbrkAM8vQD8no4c94Fw=;
 b=lrEM9ECZf4JxTDt7K/7DzIJtW3+1JBICqFE3SE8S+wpC99fOLGKkFXFDWPEJ/lau9g
 KhakMmix1Obw4bbPAT9/Q7qQTTv2mpgC6Koe0RLVyOdzc/QmsYmThSqnY1Y1XEAz3y3i
 1SmLJaRItVY5dxLgQuazIsdtdHwUdjs68wngCaV5hICp8puyn2yiBDg9lPwVItX6wlJP
 o1ebUtJYAh+BrOT/WD+TgjWXk3X+o7DN6efht3N4w9wYrPvfCgEGU1DOTaTben2vCHcs
 qphN7nRPo0RYaSoPkIfmC729FepwOPlqMjVqdIMJDTpEA/WOzqcqjTbqVqd3izeuFEM2
 /qyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+G3c+0N1AjK6BkSVv4wCXP2Ny+QPUtSfVvVhCJa5GN6qeaMbjiopJvAaF6o06W88jFFNo78myl20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzW65qMAH90EaLlYLN29KrZ7Z20DRB5xT0+0fv3GtlHBQJyUdkR
 DymsIxxFahDAgjjrk8k6gNGhNKzn1+uF5wEqcmEtXTwD80HX7pEL7cJHRUcqnXk1E/3+5pTOKTk
 jPPEZztiMHZNg/D43gD9FPNzPcXBA8Cb45a1eqKnGSsrrTaY1XE3qobU97R0d1v4ae/WsZ6Q=
X-Gm-Gg: ASbGncu61nCqMEPupKsvbl4cNoOGwE0tJE8r6plImyUbLLRttYKHvChemU7qTlZ3CMo
 20w4kL8sczw48oeKtAl/JzXlUMjvF9jf9pYgmO8Lj5KDwLbOtNDzD+hDoYPuUOfPRQj0NTpw9fr
 jxDYqQ0Gnj8XAF0h2nQqUgDkwGWSOITNDfdVsl1A8r2CEgi8fVexCCB0UwiZ9atwlUR5FCUB4Ls
 DNxDbi91LtJElIgaJOdaFcELp5WONdTLSLZcI6aw+rAwO+jaICKYJU6RP6JhD+mhFYfkEn5Y8BX
 via3sTuqmHbzX0Di6Yo1zv5EQza+SUP0F3fqiV6pvLKCicPUvuJA3S2tdjPNSdUbXDRWm6DE+6f
 /xRhjpOFVFV30KgR08p7WW/kFdrXzvQCiqFo=
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id
 af79cd13be357-7d3c6b7b64bmr2416844185a.0.1750252033140; 
 Wed, 18 Jun 2025 06:07:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZYFBBGQhXUBuLVOvJiO43P1f2KVUStUccmAa1uQee7HeLw+oTe/UnhxWImacqUUL4x3Tnww==
X-Received: by 2002:a05:620a:3186:b0:7d0:9e8c:6fef with SMTP id
 af79cd13be357-7d3c6b7b64bmr2416838585a.0.1750252032534; 
 Wed, 18 Jun 2025 06:07:12 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553cdef7fdasm529978e87.245.2025.06.18.06.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 06:07:11 -0700 (PDT)
Date: Wed, 18 Jun 2025 16:07:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
Message-ID: <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
X-Proofpoint-ORIG-GUID: 2CZIgNVfK3mpVJT4lyntRXZ4n48q3mAs
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6852ba02 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=uvfCOV_WgLjuMeome0MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExMSBTYWx0ZWRfX4qRakagXcfjB
 aYTBSyLhI1qy/NR7ThywYOoLXZn1vkDcNkEaxgvY/KfQXKOl1Y7gw4mJQGFRng4O6X1dLjkQmMq
 eorRknEky19vX/9mkYnPKut+AbBb8XcgI5vIVFEopvHMNmwiiXsQF1P2ZjiUCsI9fzxKQN3Q1e+
 DKdgp4HE6heQ8Jic4CoWi/9ahMEZjRkXkJxNNS0NHjqJeh0+5Q6d7gRRUG9K8fw9uQHwXWyI4ex
 90IV+RPR6cbeaWuoU2E4W3vpCcOMsy+Ai9g17aj0Redw7KoYVIfWZb+/lCDZbZLNk5H6Vh2tPI1
 gR9owymer/dHIuw7yo/A9jdJOE/sLlzVNS9P3qdQMm/CLY498d7gKHbXQPtahGwCdjiTVBneFUa
 GpBh0MONyqOaqfWeQ0tIpoLsrxXIWsgjNNu7sYh5J3OWS83MrMgxvfsVlbj1tz4Ga/Z233bT
X-Proofpoint-GUID: 2CZIgNVfK3mpVJT4lyntRXZ4n48q3mAs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=698 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180111
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

On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
> > On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> >> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
> >>>>   
> >>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
> >>>>   
> >>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
> >>>>   {
> >>>> +	unsigned long flags;
> >>>>   	u32 data;
> >>>>   
> >>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> >>>> +	--pll->pll_enable_cnt;
> >>>> +	if (pll->pll_enable_cnt < 0) {
> >>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
> >>>> +					  "bug: imbalance in disabling PLL bias\n");
> >>>> +		return;
> >>>> +	} else if (pll->pll_enable_cnt > 0) {
> >>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>> +		return;
> >>>> +	} /* else: == 0 */
> >>>> +
> >>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> >>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
> >>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> >>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> >>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> >>>>   	ndelay(250);
> >>>
> >>> What is this ndelay protecting? Is is to let the hardware to wind down
> >>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
> >>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
> >>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
> >>> without any delay between them.
> >>>
> >>
> >> Great question, but why do you ask me? The code was there already and
> >> MSM DRM drivers are not something I know and could provide context about.
> > 
> > Because it's you who are changing the code as you've faced the issue 
> > with recalc_rate.
> > 
> Heh, the answer is then: I don't know. I think authors of the code could
> know.

The 10nm HPG documents a 250ns interval between enabling PLL bias and
and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
delay between disabling the PLL, disabling FIFO and remobing PLL bias.
Please adjust the code for 7nm and 10nm PHYs accordingly.


-- 
With best wishes
Dmitry

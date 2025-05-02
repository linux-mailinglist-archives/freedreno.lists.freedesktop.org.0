Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25B9AA7C5C
	for <lists+freedreno@lfdr.de>; Sat,  3 May 2025 00:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB6FF10E970;
	Fri,  2 May 2025 22:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7AK8ydC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E9E10E299
 for <freedreno@lists.freedesktop.org>; Fri,  2 May 2025 22:44:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542KAo5h015721
 for <freedreno@lists.freedesktop.org>; Fri, 2 May 2025 22:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=WRrq+JvjCchJkzjakhXCAMug
 ssdkhskj9a7C56XZN6Q=; b=N7AK8ydCrs0QV7SJMozTnUh7yXQ1rJagdVIATUlD
 mzufpYOVzBMTjUONZ1D1ZUzVhGTUM/rrXCya3jcB3DeHWYW8y0uDQsr8CpcMvbl4
 K1wwaA996PT0Jx0iM9xQXiilZdifyqOV8k4LREj9ZutVXpIABGavdOZ250ySw0eF
 MKXpp8JIfkzxRrNGyn2M2UyfaG/RigUbY+NF3BQ/sCxpNsz5zq48Nur3XNNBTlmK
 796BRf956tr1Ea1yufLhJkgwGMhnLVYngWlR7IfIonP5o007Qt5+ThREIbNb997v
 yFw/rNoBiIo/hV5VAOEV88X2j6ml4lfsy2Y2t+DnW3x8kw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u79jy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 22:44:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c92425a8b1so457891985a.1
 for <freedreno@lists.freedesktop.org>; Fri, 02 May 2025 15:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746225878; x=1746830678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WRrq+JvjCchJkzjakhXCAMugssdkhskj9a7C56XZN6Q=;
 b=DsNYKJRTtdAuLXfa1IXlrQqkllQUYK2HFGr9bJr9VR4ZGqt53ofX5d1nvlN1rR58fY
 CF1Ld3hzdAwo3vTlK5HbrXsiUgf0tqg2LTcd8ajObPru9TPzIqSPMC+FHoNoLwAv8upA
 rHu91ONCsNI0XdtxBUX9eq5oGMCzwl5rVZhg7r1Y6o6awZnyB9aPZXLdBzcaZyK+0uC5
 CsFrx1JJgcmliCGBVvg6X31lO0zlbNcRK0r7fQj2C2Dqte28Iv2aYBysTVQc567iAT7y
 K1mmMv8VR5ea7+tyvfh/bQAA6zK4FssUTH1R2VQrlx8L/NzDq7qF9pzPfMeNeXOLEsWd
 e6Fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoo7bnyHfoBW/p0grHz9EaNyIZSAoUZ4/J662gsrZtSJu5Rjm12iAjItFqxe1RMzb7pe4g/CrgMtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/mbgsAIWdPE8Zliqq5G2ovH4tEQ8+ji6vQKk4u7L8JLEGT45X
 qYU4fnjNB5gf6wByR8sSnzKsi4tzVG94Z+WL03Y3B2Y0aa9gE4fJy8cNL8Pg9z7FN+AnowVRUDj
 Qm1clXnpuAyP9LMY1w2tiLTZ3XsfDLFE7VFmaC+7Le6TeJ/PJR81vXhlNfjzIAcRL968=
X-Gm-Gg: ASbGnct3GUPtmQOE9Opk4vDsaBF/R2Td5i2tWit4E+qEu2uoyPYxVo+E1SNj9KvVh6D
 2oW1aoh3Gq2E3dLiitM6V46cJSG1lv0e1XjqY0qbX7s8Jj5x+jdUwmSN7dx9cJzWsGysUXITRtd
 ldiqFHblvwPn/2EnQGGdLUXj6gJmC/H6R8WB3J0MTPD4YekYUnYQFZacHjSxLXfAS0wwVX4d9TI
 6gcVtnDuEOgmhS+i9MvUsDNlSfgdjuCrihrdS3BZ7WXs9Vh3/vJ3lfSy0LaNJ4FoxBgnZeqmPME
 TYVSZGya0SujjnSEXab4rz0wTRFBXsh1Z85yA5VB6Dnt5Lw9Lb0aDc63Fgp1zZ4W7FCyTG2eKIQ
 =
X-Received: by 2002:a05:620a:bce:b0:7c9:230f:904a with SMTP id
 af79cd13be357-7cace9d3466mr1299523585a.14.1746225878458; 
 Fri, 02 May 2025 15:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR9ei7jxgp/PS8onB87Q7/5GSY//ByuX9fCpmi6JJqZKrf2d98eQeCqXYOG1RoePQHCor2Jg==
X-Received: by 2002:a05:620a:bce:b0:7c9:230f:904a with SMTP id
 af79cd13be357-7cace9d3466mr1299518985a.14.1746225878099; 
 Fri, 02 May 2025 15:44:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94c5541sm521277e87.77.2025.05.02.15.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 15:44:36 -0700 (PDT)
Date: Sat, 3 May 2025 01:44:34 +0300
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
Message-ID: <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDE4NiBTYWx0ZWRfX8/MHYhZMQIV3
 ghb49CZDYIg/R7Aw3HKng7++rfTpmU1qLVI8DbWon8EECvitB/bhUuyGSrU5E7707abZuH21Yna
 gkgBBNat19w+PkKp5cjdQVkYVMipdbFNgn7DQFcjCsb5kfO1IEupfGPD1QFbJH/upiT+FHyYLkR
 Pysa07g7yTanM4o0viZWrRGMVDm1iOju/vc1UoP4cIirkHNnIw7kE300lc45QjWTLyUCNRI8LbM
 mkWfX57uj4Ij1uezrFFeKTxy8vNORqtwVnRnV+lQJUohVY4sZUZ2cH6+7E89LcQi4iRXw8Timnz
 fpFamIYJVpDVKfzEXg15ZLcTHoGaLYxA/oNelVXbmz+VVVrQ02mell+1W5BhJMyd1eh97t2J57X
 n8bilWS+o2Va1OPbf4Fei0uf2ZKGFxICK3o3kU8ZlRZB9xQ893eMN2lwhYJJ3geFNTu2oEJE
X-Proofpoint-GUID: Bi_VRRgcW-lBYfMBpI6DCHw9qDVaJ98P
X-Proofpoint-ORIG-GUID: Bi_VRRgcW-lBYfMBpI6DCHw9qDVaJ98P
X-Authority-Analysis: v=2.4 cv=b6Wy4sGx c=1 sm=1 tr=0 ts=68154ad7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=KKAkSRfTAAAA:8 a=kpr1jEbMLSdAOIkivb4A:9
 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020186
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

On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
> masks and shifts and make the code a bit more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>  2 files changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>  static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>  {
>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);

This (and several following functions) should be triggering a warning
regarding empty line after variable declaration block.

> +	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  
>  	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	ndelay(250);
>  }
>  
>  static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>  {
>  	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
> -	writel(data | BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>  	ndelay(250);
>  }
> @@ -996,7 +998,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>  	}
>  
>  	/* de-assert digital and pll power down */
> -	data = BIT(6) | BIT(5);
> +	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
> +	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>  
>  	/* Assert PLL core reset */
> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> index d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367..d49122b88d14896ef3e87b783a1691f85b61aa9c 100644
> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
> @@ -22,7 +22,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x00018" name="GLBL_CTRL"/>
>  	<reg32 offset="0x0001c" name="RBUF_CTRL"/>
>  	<reg32 offset="0x00020" name="VREG_CTRL_0"/>
> -	<reg32 offset="0x00024" name="CTRL_0"/>
> +	<reg32 offset="0x00024" name="CTRL_0">
> +		<bitfield name="CLKSL_SHUTDOWNB" pos="7" type="boolean"/>
> +		<bitfield name="DIGTOP_PWRDN_B" pos="6" type="boolean"/>
> +		<bitfield name="PLL_SHUTDOWNB" pos="5" type="boolean"/>
> +		<bitfield name="DLN3_SHUTDOWNB" pos="4" type="boolean"/>
> +		<bitfield name="DLN2_SHUTDOWNB" pos="3" type="boolean"/>
> +		<bitfield name="CLK_SHUTDOWNB" pos="2" type="boolean"/>
> +		<bitfield name="DLN1_SHUTDOWNB" pos="1" type="boolean"/>
> +		<bitfield name="DLN0_SHUTDOWNB" pos="0" type="boolean"/>
> +	</reg32>
>  	<reg32 offset="0x00028" name="CTRL_1"/>
>  	<reg32 offset="0x0002c" name="CTRL_2"/>
>  	<reg32 offset="0x00030" name="CTRL_3"/>
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

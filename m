Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483DA57AFC
	for <lists+freedreno@lfdr.de>; Sat,  8 Mar 2025 15:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1810E1BC;
	Sat,  8 Mar 2025 14:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoxtfEpz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F1310E1BC
 for <freedreno@lists.freedesktop.org>; Sat,  8 Mar 2025 14:17:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 528Axx1o024375
 for <freedreno@lists.freedesktop.org>; Sat, 8 Mar 2025 14:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 D1//V6hw7ZeJCpBe534PNy3XxpjNRBUsFUM+ImnjOdk=; b=IoxtfEpzYKF+eVbu
 g/Up9NSNM3H0qu2+btdGjoL3d3q6dfAswAlRe64+JUfRwPPKCF15lAjCS7H3eCp0
 VRT87TWNlZzejd3XV0gGfUxLVVW2X9D1PwWmCphVTFwWKLAXID3DAzYgyEbXvoZd
 1UL6Lhm+DTq9Co8FYVe0Gf1bH2YESK+lS9O0Aq7dDPm+/9WxS4okIWkMekqpbr0A
 Smmz1kKpPOrO5NKkTaoPt0fPm7OCTSP9KTQQdEY+luYYKu94ABSZdmVADwRiMHzD
 gz4iir8+Jjl+B3FE7AkMfuHvtUg4sI8qRrnKnsLHWKPRfl1Q2RM2NbTukxFIHOzN
 Ytgknw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458eyp8nx4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 08 Mar 2025 14:17:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e4546f8c47so7329966d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 08 Mar 2025 06:17:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741443450; x=1742048250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D1//V6hw7ZeJCpBe534PNy3XxpjNRBUsFUM+ImnjOdk=;
 b=Hxuvob6y1pnK+GG/ysCr2K9uuTi0giYpXz5qIqLBnudu5qKL0S8xGShhR10Ov8JZ1d
 M7X/5INUkHkO6FOcl7alei4mEnXt7kK/jbozHKng8KqdmwLF4JNjMVoLwa7zbGFeZwkv
 TV2A1q9PwzAjyaTbuD5wrcGmxDllUnpA0MsK79q2TgPnUuQ+p5CM3Ahki6fYipbeiPC/
 eNYQFdYMx6xRi5DYbKC3SGl1NJjBatImRZHFWGP5BzbRJsJUSi62w6x+d9qdkeJ+TbfQ
 Jj2WDF/6GyYThnK0DCmRFuASMxl8CTc6dy1W5hNznGfkI+2GW4yzXdyZxpZ5Et2H/W25
 XCag==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjWqMUA1uCX6ecq4BZHgnLCAFAzcuidCS5Uvh5zryhfWMuWcX8wHCFN+g7cV+8uwiTP1/Ad9+LOxg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6j+OP4dmWo8iF1n4qdf1nomywhFZ0YpXNv+LwoZOIPNEDCIsQ
 /cOqYwZgY25Paj38Mk0fGnlUm61UCqvL774sOTF9NaeIfLIA3lX4SHeQdW3z0fchbsn2GFkMcFg
 L6qquySYnlFgbaLIN6G99NKVIWUYLJd9RjbbYoip+isDvp1FQonw7f71LHj6xPeCsYic=
X-Gm-Gg: ASbGncvpX28NHn7yh+3COtf5d0UeTm/eN+5Y921jXkV6QYBuxvJN11FYhXhhk/ycsz8
 Cp/QN0rxXKxoiY/QpnbJbwnTYYOQYi2G3ZuO3WtcFYAoIDMJ0zFyYkiDkSuk9c5crJr0uSBhbcO
 ZO/96GKQrvW0d6g8YFHvZ/hHZBGg7YfemQpigGlLilfgME0UkMbJb+xjzYpkFMzKLcOjFru0wgY
 a/zMOd/VVfoibXxBIBopTXn4A8kmF3fkv3M2M2quQaCt0v90ZpS8VRn0ZssC6Od5nXAILiOksar
 8QYBQy9nfapFm+2ONE6KJAZTONP9EmS6RAmNyQnBLyC1D30k76a/6q1As09bojQBEqpYXg==
X-Received: by 2002:ad4:5d63:0:b0:6e8:9c91:227a with SMTP id
 6a1803df08f44-6e908a8299emr17047726d6.0.1741443449934; 
 Sat, 08 Mar 2025 06:17:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFn+apy78yObNDX132VCgoB+/Ws3nmpk1YJl8IUzHLq1owpnyugCLpRkOWW986ipasi3vQVoA==
X-Received: by 2002:ad4:5d63:0:b0:6e8:9c91:227a with SMTP id
 6a1803df08f44-6e908a8299emr17047406d6.0.1741443449547; 
 Sat, 08 Mar 2025 06:17:29 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23973810csm439279366b.118.2025.03.08.06.17.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Mar 2025 06:17:29 -0800 (PST)
Message-ID: <53c3d2c3-2bfb-43f9-ad25-0d1fdd96f19f@oss.qualcomm.com>
Date: Sat, 8 Mar 2025 15:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] drm/msm/dsi/phy: add configuration for SAR2130P
To: Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250308-sar2130p-display-v1-0-1d4c30f43822@linaro.org>
 <20250308-sar2130p-display-v1-7-1d4c30f43822@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250308-sar2130p-display-v1-7-1d4c30f43822@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=A9yWP7WG c=1 sm=1 tr=0 ts=67cc518a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=WWvJJprN3eueWNfT7O0A:9
 a=QEXdDO2ut3YA:10
 a=jpH7HpYVSZo6v3SV3j0F:22 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZQohF1mQgzGTne_YgTVY_6X6M7ZwE3j-
X-Proofpoint-GUID: ZQohF1mQgzGTne_YgTVY_6X6M7ZwE3j-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-08_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503080107
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

On 8.03.2025 2:42 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Qualcomm SAR2130P requires slightly different setup for the DSI PHY. It
> is a 5nm PHY (like SM8450), so supplies are the same, but the rest of
> the configuration is the same as SM8550 DSI PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
>  3 files changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index c0bcc68289633fd7506ce4f1f963655d862e8f08..a58bafe9fe8635730cb82e8c82ec1ded394988cd 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -581,6 +581,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  	  .data = &dsi_phy_7nm_cfgs },
>  	{ .compatible = "qcom,dsi-phy-7nm-8150",
>  	  .data = &dsi_phy_7nm_8150_cfgs },
> +	{ .compatible = "qcom,sar2130p-dsi-phy-5nm",
> +	  .data = &dsi_phy_5nm_sar2130p_cfgs },
>  	{ .compatible = "qcom,sc7280-dsi-phy-7nm",
>  	  .data = &dsi_phy_7nm_7280_cfgs },
>  	{ .compatible = "qcom,sm6375-dsi-phy-7nm",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 1925418d9999a24263d6621299cae78f1fb9455c..1ed08b56e056094bc0096d07d4470b89d9824060 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -59,6 +59,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_7nm_8150_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_7nm_7280_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
>  
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index a92decbee5b5433853ed973747f7705d9079068d..cad55702746b8d35949d22090796cca60f03b9e1 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -1289,6 +1289,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs = {
>  	.quirks = DSI_PHY_7NM_QUIRK_V4_3,
>  };
>  
> +const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_7nm_97800uA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_97800uA_regulators),
> +	.ops = {
> +		.enable = dsi_7nm_phy_enable,
> +		.disable = dsi_7nm_phy_disable,
> +		.pll_init = dsi_pll_7nm_init,
> +		.save_pll_state = dsi_7nm_pll_save_state,
> +		.restore_pll_state = dsi_7nm_pll_restore_state,
> +		.set_continuous_clock = dsi_7nm_set_continuous_clock,
> +	},
> +	.min_pll_rate = 600000000UL,
> +#ifdef CONFIG_64BIT
> +	.max_pll_rate = 5000000000UL,
> +#else
> +	.max_pll_rate = ULONG_MAX,
> +#endif
> +	.io_start = { 0xae95000, 0xae97000 },
> +	.num_dsi_phy = 2,
> +	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
> +};

I'm squinting very very hard and can't tell how this is different from
dsi_phy_4nm_8550_cfgs

Konrad

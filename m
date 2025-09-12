Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C788B548F2
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 12:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3145210E187;
	Fri, 12 Sep 2025 10:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="luaYgYh3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE8610E187
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:13:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fOYf010915
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=kzdgJd2b55rTyRioSKAWB5pd
 PujDg59niQbpGU1S8ro=; b=luaYgYh3uK34XTUXmCZbepDVtB5vMp+tJK+jhD7C
 KiuE0FuytV4hkOUj6v1NSkmWwqsYgPpLMhxK6mm7v0zY1x/xePA8WdOmQafzNAoV
 nyvZfWfcaHBvZd512V6E6TRWo0oxQeQsCEFLs1gicPtD+PRQ+Kp8jJpGlVBIR6aF
 iddw8xmH94pO2Dw/XlR/qMuouXXbp171rWQB+XqnQ1LWNim1DAd2/ekmIlAeEnQR
 qVxAKcbkydvUyoejufcs0TY/kwcfhJFhBvQMwdNnYLdsAN3rdcPR5l2ZCSoK/Ifk
 XgZ6o5LlYszSVwSzpoFR5vTI2wUvuEVErLfG7U09wEta8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4maygh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 10:13:02 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b6019b13b2so64453361cf.3
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 03:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757671981; x=1758276781;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzdgJd2b55rTyRioSKAWB5pdPujDg59niQbpGU1S8ro=;
 b=oY4viKHlGXvaKFWJXDBcZacrxrLxUs3UC5LHw5j9eFruKTM5moyB12FwfdicBxUL/F
 JoiYySe+D8nVMXAhqBpE69BRhZOnZpxjFjcMOVrDh8FY6vnQkDNCF3UJFwFtt86SWYqO
 1vFLR1dZ7aJ6PxcQgUGoiCgbxJUdnMOTAOCE33jyqDtYIh8A9msHfdlxACLdFvRs05/D
 GiowEmYfe5hfC8BWU1XPti/VrBLF0Y7FM5oWERECtuAn6txuOTPvy1w04LFyeMloKd1D
 EDNJ6q6OAJlJ2XdoqY/REoNejF7iU/GijPhIIArZLFbGzUEt6M5pf6JnOwMiopCtYRXx
 nfzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeXxTTDSQwI2cJlOYZ2tl6ZUUmT8aAT/5mlTsUEWuh5UwNaxwZ127+WZQJ2Po0z4ImQyw77HlQ//o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7e8mDUR37kklraRdhBVt0nNktbBZvLrlcqGwuRA3s2gj07oUo
 tudujLP77f5N+sJjtE88azl6uRlR/Aa02EeZmiGVCj8O1TVaeMSbhe5OSXBlFe34fCJMjydqFOh
 mUdJxP4ATqJNck3uo7i2fgt3X/LDRk0iNmSscozbKrcrfyKiCOBVYbLF8hKepkx4haS3PrMw=
X-Gm-Gg: ASbGncsqghXsuqzePxs9BWx+02gSilg1+cfteYCoQdUolSXvCisALOEH+nEeUw2RL1b
 vVkYq5yDBLoU2sGMH77aiVomwMUBMKIQVw9iADLvAX/4dm1Zl8A9PrNCF+S0yq2/W0IflzA59ca
 hwcoc9+G3NM46e13kI8bcK1KaQ1bqI8VKz4wRcr8nPfUJaQDwfqsF7dVhWCdnl2WafIVXnKnymg
 DzTUHAWRlw9lW3B0HkV2aL6yFMxOUlUpShToTj8oWldhObxrIW7VKkjDwzoqMjR5v7AGfg41kR1
 XA4J2DiBjFjzRfNNHso6GxGXbGRMzcejbfCebMCUAwezdOs5w4NiO06YrFx8ywFxtqz28na3wHk
 Jr34HBlq2bllFypsy0/Y1LC/PSa4m2muuis2vjM7w8a3IwFZB6mh0
X-Received: by 2002:a05:622a:10:b0:4b5:d5fc:8c87 with SMTP id
 d75a77b69052e-4b77d0427ffmr22256461cf.26.1757671980925; 
 Fri, 12 Sep 2025 03:13:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoJukqMxUtcrDD1bS99KAwsD+FA7UYyzb5QtFfnxCg2OfyWX9XReIqdCFCIcthvMKAFFNBuQ==
X-Received: by 2002:a05:622a:10:b0:4b5:d5fc:8c87 with SMTP id
 d75a77b69052e-4b77d0427ffmr22256011cf.26.1757671980281; 
 Fri, 12 Sep 2025 03:13:00 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-571a0fd0825sm108277e87.125.2025.09.12.03.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 03:12:59 -0700 (PDT)
Date: Fri, 12 Sep 2025 13:12:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 07/13] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <sy4kyh3kd6s4nr75unt5r6gxnyeqq6bfjj4tizwiw2fvbw4ala@i3theqmwiv3d>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-7-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-7-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX2Qht83430+xg
 zXr0kAx49a5WfR+0F2HhxirHrOzlaWaErfYDdayMs0XcLw5U9k58t8tTUpptjcZ5u6U+7E9p08A
 oEulE5IlsVoifGGpj26SzOvYDTCsUzPdsTZbMoPrvSyfX1pMY7ORVNvLZnOL7fogG+xFjgObCDI
 MC24uI3nPT6W7N5afWKuJSXy2EF8MwHC+h3jh9GvLlNFDA8sz3XCsKKX+oZjVXyNInPsT2fA8K3
 Fod3AbrHOhuiarhBasNKc96qxOtnow5uN4iPrcWidpqgILF1GV6GuCI3yLFFZaEp10hP0012nW0
 MgYuElBusG5Ds+Iyn3xe5yKSTFPa5AT+JeZZNpHUh8YACt0IvYMtupaT0Jrdv1enfn2ounACH54
 xOZAE4ci
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3f22e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MUPAedP9neNk1PPBOv8A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: qW8hXMzZ9xzQkQk6EaSgaZwBaATshvtv
X-Proofpoint-ORIG-GUID: qW8hXMzZ9xzQkQk6EaSgaZwBaATshvtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 10:55:04PM +0800, Xiangxu Yin wrote:
> Introduce DisplayPort PHY configuration routines for QCS615, including
> aux channel setup, lane control, voltage swing tuning, clock config and
> calibration. These callbacks are registered via qmp_phy_cfg to enable DP
> mode on USB/DP switchable Type-C PHYs.
> 
> Add register define for QMP_DP_PHY_V2 series.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h |  21 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c      | 251 ++++++++++++++++++++++++++
>  2 files changed, 272 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..8b9572d3cdebb70a0f3811f129a40aa78e184638
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2017, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef QCOM_PHY_QMP_DP_PHY_V2_H_
> +#define QCOM_PHY_QMP_DP_PHY_V2_H_
> +
> +// /* Only for QMP V2 PHY - DP PHY registers */
> +#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK		0x048
> +#define QSERDES_V2_DP_PHY_AUX_INTERRUPT_CLEAR		0x04c
> +#define QSERDES_V2_DP_PHY_AUX_BIST_CFG			0x050
> +
> +#define QSERDES_V2_DP_PHY_VCO_DIV			0x068
> +#define QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL		0x06c
> +#define QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL		0x088
> +
> +#define QSERDES_V2_DP_PHY_SPARE0			0x0ac
> +#define QSERDES_V2_DP_PHY_STATUS			0x0c0
> +
> +#endif
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 663024b8c09124f2991b8e0537a9feb60baaa686..7b2b47320cbb2d16e4f316b0f52fdc1bd09fe656 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -28,6 +28,9 @@
>  #include "phy-qcom-qmp.h"
>  #include "phy-qcom-qmp-pcs-misc-v3.h"
>  
> +#include "phy-qcom-qmp-dp-phy.h"
> +#include "phy-qcom-qmp-dp-phy-v2.h"
> +
>  #define PHY_INIT_COMPLETE_TIMEOUT		10000
>  
>  /* set of registers with offsets different per-PHY */
> @@ -619,6 +622,11 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>  };
>  
> +static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp);
> +static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp);
> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp);
> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp);
> +
>  static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
>  	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
>  
> @@ -666,6 +674,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>  	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>  	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
>  
> +	.dp_aux_init		= qcs615_qmp_dp_aux_init,
> +	.configure_dp_tx	= qcs615_qmp_configure_dp_tx,
> +	.configure_dp_phy	= qcs615_qmp_configure_dp_phy,
> +	.calibrate_dp_phy	= qcs615_qmp_calibrate_dp_phy,
> +
>  	.reset_list		= usb3dpphy_reset_l,
>  	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
>  	.vreg_list		= qmp_phy_qcs615_vreg_l,
> @@ -736,6 +749,244 @@ static int qmp_usbc_com_exit(struct phy *phy)
>  	return 0;
>  }
>  
> +static void qcs615_qmp_dp_aux_init(struct qmp_usbc *qmp)

Please rename the functions according to their intention. Are they
common to all USBC PHYs, are they specific to v2 (or v3) PHYs or are
they specific to QCS615? At least this is the approach that has been
used inside combo and eDP PHY drivers.

> +{
> +	writel(DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN,
> +	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +	writel(DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	       DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN |
> +	       DP_PHY_PD_CTL_PLL_PWRDN,
> +	       qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG0);
> +	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> +	writel(0x00, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG3);
> +	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG4);
> +	writel(0x26, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG5);
> +	writel(0x0a, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG6);
> +	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG7);
> +	writel(0xbb, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG8);
> +	writel(0x03, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG9);
> +	qmp->dp_aux_cfg = 0;
> +
> +	writel(PHY_AUX_STOP_ERR_MASK | PHY_AUX_DEC_ERR_MASK |
> +	       PHY_AUX_SYNC_ERR_MASK | PHY_AUX_ALIGN_ERR_MASK |
> +	       PHY_AUX_REQ_ERR_MASK,
> +	       qmp->dp_dp_phy + QSERDES_V2_DP_PHY_AUX_INTERRUPT_MASK);
> +}
> +
> +static int qcs615_qmp_configure_dp_swing(struct qmp_usbc *qmp)
> +{
> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> +	void __iomem *tx = qmp->dp_tx;
> +	void __iomem *tx2 = qmp->dp_tx2;
> +	unsigned int v_level = 0, p_level = 0;
> +	u8 voltage_swing_cfg, pre_emphasis_cfg;
> +	int i;
> +
> +	if (dp_opts->lanes > 4) {
> +		dev_err(qmp->dev, "Invalid lane_num(%d)\n", dp_opts->lanes);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < dp_opts->lanes; i++) {
> +		v_level = max(v_level, dp_opts->voltage[i]);
> +		p_level = max(p_level, dp_opts->pre[i]);
> +	}
> +
> +	if (v_level > 4 || p_level > 4) {
> +		dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
> +			v_level, p_level);
> +		return -EINVAL;
> +	}
> +
> +	voltage_swing_cfg = (*cfg->swing_tbl)[v_level][p_level];
> +	pre_emphasis_cfg = (*cfg->pre_emphasis_tbl)[v_level][p_level];
> +
> +	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
> +	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
> +
> +	if (voltage_swing_cfg == 0xff && pre_emphasis_cfg == 0xff)
> +		return -EINVAL;
> +
> +	writel(voltage_swing_cfg, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(pre_emphasis_cfg, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(voltage_swing_cfg, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(pre_emphasis_cfg, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);

If QCS615 is a V2 PHY, why are you using V3 registers here?

> +
> +	return 0;
> +}
> +
> +static void qmp_usbc_configure_dp_mode(struct qmp_usbc *qmp)
> +{
> +	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
> +	u32 val;
> +
> +	val = DP_PHY_PD_CTL_PWRDN | DP_PHY_PD_CTL_AUX_PWRDN |
> +	      DP_PHY_PD_CTL_PLL_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN | DP_PHY_PD_CTL_LANE_2_3_PWRDN;
> +
> +	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
> +
> +	if (reverse)
> +		writel(0xc9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> +	else
> +		writel(0xd9, qmp->dp_dp_phy + QSERDES_DP_PHY_MODE);
> +}
> +
> +static int qmp_usbc_configure_dp_clocks(struct qmp_usbc *qmp)
> +{
> +	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
> +	u32 phy_vco_div;
> +	unsigned long pixel_freq;
> +
> +	switch (dp_opts->link_rate) {
> +	case 1620:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 1620000000UL / 2;
> +		break;
> +	case 2700:
> +		phy_vco_div = 0x1;
> +		pixel_freq = 2700000000UL / 2;
> +		break;
> +	case 5400:
> +		phy_vco_div = 0x2;
> +		pixel_freq = 5400000000UL / 4;
> +		break;
> +	default:
> +		dev_err(qmp->dev, "link rate:%d not supported\n", dp_opts->link_rate);
> +		return -EINVAL;
> +	}
> +	writel(phy_vco_div, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_VCO_DIV);
> +
> +	clk_set_rate(qmp->dp_link_hw.clk, dp_opts->link_rate * 100000);
> +	clk_set_rate(qmp->dp_pixel_hw.clk, pixel_freq);
> +
> +	return 0;
> +}
> +
> +static void qcs615_qmp_configure_dp_tx(struct qmp_usbc *qmp)
> +{
> +	void __iomem *tx = qmp->dp_tx;
> +	void __iomem *tx2 = qmp->dp_tx2;
> +
> +	/* program default setting first */
> +	writel(0x2a, tx + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(0x20, tx + QSERDES_V3_TX_TX_EMP_POST1_LVL);
> +	writel(0x2a, tx2 + QSERDES_V3_TX_TX_DRV_LVL);
> +	writel(0x20, tx2 + QSERDES_V3_TX_TX_EMP_POST1_LVL);

Same question here.

> +
> +	qcs615_qmp_configure_dp_swing(qmp);
> +}
> +
> +static int qcs615_qmp_configure_dp_phy(struct qmp_usbc *qmp)
> +{
> +	u32 status;
> +	int ret;
> +
> +	qmp_usbc_configure_dp_mode(qmp);
> +
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX0_TX1_LANE_CTL);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_V2_DP_PHY_TX2_TX3_LANE_CTL);
> +
> +	ret = qmp_usbc_configure_dp_clocks(qmp);
> +	if (ret)
> +		return ret;
> +
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	writel(0x20, qmp->dp_serdes + QSERDES_COM_RESETSM_CNTRL);
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_C_READY_STATUS,
> +			       status,
> +			       ((status & BIT(0)) > 0),
> +			       500,
> +			       10000)) {
> +		dev_err(qmp->dev, "C_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
> +			       status,
> +			       ((status & BIT(0)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "FREQ_DONE not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (readl_poll_timeout(qmp->dp_serdes + QSERDES_COM_CMN_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PLL_LOCKED not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(0)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "TSYNC_DONE not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel(0x3f, qmp->dp_tx + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx + QSERDES_V3_TX_TX_POL_INV);
> +	writel(0x3f, qmp->dp_tx2 + QSERDES_V3_TX_TRANSCEIVER_BIAS_EN);
> +	writel(0x10, qmp->dp_tx2 + QSERDES_V3_TX_HIGHZ_DRVR_EN);
> +	writel(0x0a, qmp->dp_tx2 + QSERDES_V3_TX_TX_POL_INV);

And here

> +
> +	writel(0x18, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> +
> +	if (readl_poll_timeout(qmp->dp_dp_phy + QSERDES_V2_DP_PHY_STATUS,
> +			       status,
> +			       ((status & BIT(1)) > 0),
> +			       500,
> +			       10000)){
> +		dev_err(qmp->dev, "PHY_READY not ready\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int qcs615_qmp_calibrate_dp_phy(struct qmp_usbc *qmp)
> +{
> +	static const u8 cfg1_settings[] = {0x13, 0x23, 0x1d};

Are these the actual values or is it a C&P from the combo PHY?

> +	u8 val;
> +
> +	qmp->dp_aux_cfg++;
> +	qmp->dp_aux_cfg %= ARRAY_SIZE(cfg1_settings);
> +	val = cfg1_settings[qmp->dp_aux_cfg];
> +
> +	writel(val, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
> +
> +	return 0;
> +}
> +
>  static int qmp_usbc_usb_power_on(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

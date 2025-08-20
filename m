Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE2DB2DADE
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 13:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B84F10E6F6;
	Wed, 20 Aug 2025 11:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="deKVPfql";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EB610E255
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:25:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAGVOq001993
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pM3IqereRYgkro22T8SG9mTJ
 LbTJvmRyFErAXFuHomc=; b=deKVPfqlLNdOJrVI6aCZh1L26hLIpF8gcwwC9Qz+
 lOXkzdJYZ6zMe27WebkL/uZOy1/7IAYyR4VO6yiBUYEFTgvTQMi0NB4yPsy69VRc
 wwz+HJnyMC+WmcmYZJZWW9R5iuJTxJRNRTTJRl3fBCFNfz97cCqlz6prbv/epetS
 DN6L9R+Etzrth5KJqP3SoUbYIoI9W9olRSEq2S3htNqkOAb/MipAz7XUJeJ2ez/k
 eXCtKSbUdckGiUuMta1kaW1pgivmSkmuk65dR6MFwWet5N41vQLyYyda1LwzmjLk
 vuAmGJxbr17EgZOZ3kDoglBWPUgu400DHNmNwX8cKk3Q5A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n528sg7w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 11:25:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a9f55eb56so144700896d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 04:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755689125; x=1756293925;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pM3IqereRYgkro22T8SG9mTJLbTJvmRyFErAXFuHomc=;
 b=JG7T+dsJzhVI/yjhE78Q/arL60Mo8lAvfM1Lv3wf8T7QgcE4NyF3+0JrhE74MMYebV
 ykiqJ+RV0sb6zRafRoEttvY2+sSqCgfsSTUbSYKGD7ZW+DrKdUYQBNct8isu0RAI6oLp
 9syyNbK9eFCX75cwofxlNBabAXcMhnyfwFqefMPielpbKHZ8rJNcRwFs3oqyKoop/ttR
 wsXDuU4k3I9ICNkScHMR7Vw5pCwLqhQw8tjBihkUgXnHuPz0euTLOtcmLg4C/RLWW6Ml
 boeWeGfFAMYjCxxjmAuPfmMOG7SEanZXDahoumP3CuT1yuQ9gnwjyIIIA8e2+LbuVelA
 4dIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW04Ietmiz9FAwkIeE18JiSGqjLnXnUUSbU7m0HNSG4jqhXekREcf+GSrDoXi6cnxLJRHEQBDLHgOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr+YV7dj7j2bUZqEFEdIp1H9aHuYQnbV8Enw9XbPc7o6dhqYkx
 kZJYMJ1ghTIehumc0gY0PSUrBm87nr46F3/qKebzmy+Yu++BetZWWr7pNFnR7ON7Oocnc1MiaCL
 NbNQ/K3bbNSh31/6UFM/R3kv4jf+81ta6gOxv/Skuwvz3m9F41avhot3+bMtIASQ8/Ufm6fs=
X-Gm-Gg: ASbGncsZ8/18EctTOmjanYgPk/SHZS/2z+RErN44/HbAlDiGNZRXSG/CDs/Pi52rzOj
 bMQZDHHnWKup6782iluAWB2kPcfkWDi/TeMTBoAaN6ODAs1YfVpfq8b0H557bqnM7fMJD3hAfkt
 vaCT5QLqmhcVFgWK5QTU9NzTWgzWICl2TVj0oi2NXUjHttFiFmnZ9uchh7DYa1H+x7L68hRsSTj
 qmb4J4N7tmmcGFSCaxT2IdphwjqYpCL+wo62zf98ukZxkywL6Z9fIKZPKwqDR/uUH3pK/md83Ck
 03S0IjPmM7X2DBg0+C44YmJ/Twi2c/ozxBKaoEj2zdauVIKKS8ksjB7l5Uu6+v+46PM199q7kMQ
 thrSAzboHjawwEzN4bTRfVlWOnhBYGcHPqExXOPO/amgS/0Oe4HNO
X-Received: by 2002:a05:6214:2304:b0:707:4d17:e280 with SMTP id
 6a1803df08f44-70d76fe844cmr28308606d6.28.1755689124571; 
 Wed, 20 Aug 2025 04:25:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo3x0vG5bWavr75XQbzze8op4sOboUWHZRciWylwkkn+WCE6mKciGuth4WwgeOOu0+W+czaQ==
X-Received: by 2002:a05:6214:2304:b0:707:4d17:e280 with SMTP id
 6a1803df08f44-70d76fe844cmr28307826d6.28.1755689123788; 
 Wed, 20 Aug 2025 04:25:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3f3568sm2520633e87.117.2025.08.20.04.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:25:21 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:25:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 06/14] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
Message-ID: <bx3cumx7ej7taour6zhqufrzjdxuhvlx23ga3vmvokrlekayem@e5rfjbcwle2r>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-6-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-6-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a5b0a5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=w_ydXb1fH3eDB4nJsVwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: NkqYHnOjfLdxj6of-cgBaiPyHhWc6-Qa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyycb7uv7+GXm
 nZKG251svamTdIAdFMBdOXCAQEohIhfIO3GgZW0zCxKEfJU6WJqd7oFF4wxbuS1HIiWabjquxfc
 xOkaZSIOGHMMARVx8WBcBkmxVOvXCuN7KDKH0zdzqCXNCKrT5WDBwVH63KVRCtMNumZQnSiolgc
 pK4EuUUvyui3Opf+nFnfcplAjyRZ8Jw7R1XCJI2aDDSKlFckS244VMOvTtfULmLTyKh19tVLHfJ
 /WX9RyrS+7kT0hjEAl1h/lKOIKkgpnJ0f4SHrqNYaBJMTHqKL29GUThqtCoaWQq7hlmBiwrYflu
 tKbQ8alXg/kSP3QDGgphOBO+aM8xNSTLsvgzWCn7+NM+t32ke7KIxhfZu+X4C2MsY+91IPvdPSR
 AT6Yrje7iNptkg4T/a3mvBWHPm/CTg==
X-Proofpoint-ORIG-GUID: NkqYHnOjfLdxj6of-cgBaiPyHhWc6-Qa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:48PM +0800, Xiangxu Yin wrote:
> Introduce QCS615 hardware-specific configuration for DP PHY mode,
> including register offsets, initialization tables, voltage swing
> and pre-emphasis settings.

This will trigger unused warnings. Please squash this into the patch
adding compat string to the driver.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 139 +++++++++++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index 6b0e86ec43ded3d850f68f248a74c39f74ecb5bb..61128d606238321d1b573655b3b987226aa2d594 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -284,6 +284,86 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>  };
>  
> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x37),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x0e),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_CTRL, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x08),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x05),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x02),
> +};
> +
> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_rbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc6),
> +};
> +
> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x24),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x3f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x38),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
> +};
> +
> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr2[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x20),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x8c),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0a),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x7f),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x70),
> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
> +};
> +
> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_tx_tbl[] = {
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x2b),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x2f),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
> +};
> +
>  enum qmp_phy_usbc_type {
>  	QMP_PHY_USBC_USB3_ONLY,
>  	QMP_PHY_USBC_USB3_DP,
> @@ -449,6 +529,34 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
>  	.rx2		= 0x800,
>  };
>  
> +static const struct qmp_usbc_offsets qmp_usbc_usb3dp_offsets_qcs615 = {
> +	.serdes		= 0x0,
> +	.pcs		= 0xc00,
> +	.pcs_misc	= 0xa00,
> +	.tx		= 0x200,
> +	.rx		= 0x400,
> +	.tx2		= 0x600,
> +	.rx2		= 0x800,
> +	.dp_serdes	= 0x1c00,
> +	.dp_txa		= 0x1400,
> +	.dp_txb		= 0x1800,
> +	.dp_dp_phy	= 0x1000,
> +};
> +
> +static const u8 qmp_dp_pre_emphasis_hbr2_rbr[4][4] = {
> +	{0x00, 0x0b, 0x12, 0xff},
> +	{0x00, 0x0a, 0x12, 0xff},
> +	{0x00, 0x0c, 0xff, 0xff},
> +	{0xff, 0xff, 0xff, 0xff}
> +};
> +
> +static const u8 qmp_dp_voltage_swing_hbr2_rbr[4][4] = {
> +	{0x07, 0x0f, 0x14, 0xff},
> +	{0x11, 0x1d, 0x1f, 0xff},
> +	{0x18, 0x1f, 0xff, 0xff},
> +	{0xff, 0xff, 0xff, 0xff}
> +};
> +
>  static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>  	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
>  	.type			= QMP_PHY_USBC_USB3_ONLY,
> @@ -500,6 +608,37 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>  };
>  
> +static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
> +	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
> +	.type			= QMP_PHY_USBC_USB3_DP,
> +
> +	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
> +	.tx_tbl			= qcm2290_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
> +	.rx_tbl			= qcm2290_usb3_rx_tbl,
> +	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
> +	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
> +	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
> +
> +	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
> +
> +	.dp_serdes_tbl		= qcs615_qmp_dp_serdes_tbl,
> +	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl),
> +	.dp_tx_tbl		= qcs615_qmp_dp_tx_tbl,
> +	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_qmp_dp_tx_tbl),
> +
> +	.serdes_tbl_rbr		= qcs615_qmp_dp_serdes_tbl_rbr,
> +	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_rbr),
> +	.serdes_tbl_hbr		= qcs615_qmp_dp_serdes_tbl_hbr,
> +	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr),
> +	.serdes_tbl_hbr2	= qcs615_qmp_dp_serdes_tbl_hbr2,
> +	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr2),
> +
> +	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
> +	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
> +};
> +
>  static int qmp_usbc_com_init(struct phy *phy)
>  {
>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

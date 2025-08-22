Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F6B31027
	for <lists+freedreno@lfdr.de>; Fri, 22 Aug 2025 09:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDE810E07E;
	Fri, 22 Aug 2025 07:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvgaS3E/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A14610E07E
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 07:21:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M6uRl6027729
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 07:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ImGhpDuxFOdCpj6FL5zsXgN4VeAkZyyrarFsrBei76o=; b=KvgaS3E/Lt9MS3O6
 7hWVXSobYXDo6BGn3yNaVXBPV9vzEUghgSp9HItmLap8Ntt43iPvglHC/5Q1kCXt
 7DCZfk7aIGfR14asnQzHXZWj94DQ3wIyIAKd1DfQq/KitAy+RjY3QYQLZoUOCGtT
 l3Uueb5hRaBmapCAD82Tpk/2S8+VFQhD2NI0yFGGa5kyCCi0dRf4sFNe/lT1icAn
 oCbiEOcqiQXCMQUG76HzjXGiqicHkQ0Z1/8qiNfdflzsRFXnlacqt4G+bskQ9H1m
 iSAycp3cXTysWszTi8vYjB0wKb27Vfk4de0oDc+356d2ilV1aHYwAcKrZgybUAbG
 EgwhzQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cr74e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 07:21:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-324e2b90636so600830a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 22 Aug 2025 00:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755847267; x=1756452067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ImGhpDuxFOdCpj6FL5zsXgN4VeAkZyyrarFsrBei76o=;
 b=ZaB5dqnBdrRTK7f24spORdsAZpo6dufjcoitPljYrpouNhyzbKGI6hRM2d1BXex1w8
 8Wx2U1vV+OuQbBvwEHaRwv5J6Fz536FDu7iqZOYw42EFHKZ/qgWRglNuZHu668ol1pbP
 sal95AFhvpas4nZgUDuJ3P567EcSpyoDPsy1TuoZH4OGr4sMOwp/8NWMM2cnAUbL/YOk
 VEuKFvx6NtJuDEBsdstxFBl2rjI1zeGE1BImDQ+jGhKBYfl86qgsy8Xg7T2KmmAYrZIN
 8StRbrgldy3irr7j20b7LcnTfJ/MjbJuFwMRrNp7rRGusq2Iyo5sJbwYytvhgJ/X1MsI
 UCmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1aSQjPZcHDTmMuYlQkkA7yAAMH1YPGWr942kSM1ZX8beksTR5NtSrjD+eJV489yu45c0GwMdhaTw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2XaMyqmJWQwdTNNbWWyQvBC+0PPxXsxRQoM6r2/3QA8z7ZG0T
 tKleELFfaFi4N7J0ZAa+iggqfmIHiPko6XvIE3mM7K57U/lJ1Hqu9jZXhesF7w7ERaU9HHHv/at
 58+gCg6/YMgMAuY6ph7OBqUnhjEv6HPvlWBGMGMTDt22zXJRTbid4XcJbyqc0tvxCHKfQxGY=
X-Gm-Gg: ASbGncs727KrgabU0LxjnLfCzbU2fo+vvsMAoL0B5fPkbWKa176rNM9WvDuYMX1jFDD
 b963fB4l/7WRZlieuv4N/jI2EhU2AQKbC4XyjWZSBFbLBrecK8g03K1PtempKi0AUuLhIL6+dxc
 JeAbYyAByD/lQclQLi/69ZhOVWctzwy2j0PdbEo66njyL4Z8FGCLFER1cYwd1SNV4J0XdYF3vvj
 Cz245CyGWcBcHLTppTtYWIkK5hYXC/SNtWRSY9YdM9nLAewXhSJQLgMWeKf+X3V2D1CzudtDIyR
 /ZmtSXB+dWTy0NIi5o96hM/v5t5Ia6qyym7gYBWNbpp3OgNT9/dwF9DYGMw1EsGp2JMKTrVCwDb
 KmZrk5kHKj7YU42Fa33FIE8LGWvl7eA==
X-Received: by 2002:a17:902:cec3:b0:246:4df9:f63b with SMTP id
 d9443c01a7336-2464dfa1134mr2105695ad.8.1755847266998; 
 Fri, 22 Aug 2025 00:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSWdZW0zZ6t/zVxusBsVUXuEAw3kOdKb6PHoaWrR1AfwMdSJKy4A+BerChkkW0gKyQEhOJRA==
X-Received: by 2002:a17:902:cec3:b0:246:4df9:f63b with SMTP id
 d9443c01a7336-2464dfa1134mr2105365ad.8.1755847266468; 
 Fri, 22 Aug 2025 00:21:06 -0700 (PDT)
Received: from [10.133.33.119] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed53e94esm74784355ad.162.2025.08.22.00.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 00:21:06 -0700 (PDT)
Message-ID: <1a2c38c6-0d49-4c47-9cc2-014b71e1e81e@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 15:20:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/14] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-6-a43bd25ec39c@oss.qualcomm.com>
 <bx3cumx7ej7taour6zhqufrzjdxuhvlx23ga3vmvokrlekayem@e5rfjbcwle2r>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <bx3cumx7ej7taour6zhqufrzjdxuhvlx23ga3vmvokrlekayem@e5rfjbcwle2r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qHQz5rUPWGky1f1SWGsrKN819Y7wxLhf
X-Proofpoint-ORIG-GUID: qHQz5rUPWGky1f1SWGsrKN819Y7wxLhf
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a81a64 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=sVqeHFWDZcW2eLg-V-AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1u8d1tzcuJ0J
 PXrxt0XqZNIF90DXOpyFe2Qx2uZRhUx1jTFNlqZHemgN5OTBkaGpg6oN7KlvhrVCNrvKbref9Bm
 Y0JG+frQsZNVrPQSMwYmWJSlYoeFWikcKJZtVvZMDN9St/4fB8hWIopbQNEODZ8vlqf4vAfoN5m
 VyEMFoR+XDq5y8iUf1LpIOfPoDUgPehzUzYqoZ04cNsyw9kr/xkK/HnJvD76adPrOY8A0ml849x
 0oWZMmt6xdO9WcOzG3kW2I+JfadMF9rPZ26Qg1LdmJrDkq+9YdhkjbQ9cPji6zBnm/yJV/MV7ag
 SxnjC9SgtxHKaa7Nms7ve+ds8/jIL6Xf2Tj0vdOfuPfeGmU9Rsb91b4VsmBsJu997WGRJOZz9sE
 GtQ0QS1fXiDjLsL4PUHyEDxAH+meYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
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


On 8/20/2025 7:25 PM, Dmitry Baryshkov wrote:
> On Wed, Aug 20, 2025 at 05:34:48PM +0800, Xiangxu Yin wrote:
>> Introduce QCS615 hardware-specific configuration for DP PHY mode,
>> including register offsets, initialization tables, voltage swing
>> and pre-emphasis settings.
> This will trigger unused warnings. Please squash this into the patch
> adding compat string to the driver.


Ok,

Will squash the compatible string addition into this patch, 

as the following callback functions would also trigger similar unused warnings.


>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 139 +++++++++++++++++++++++++++++++
>>  1 file changed, 139 insertions(+)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> index 6b0e86ec43ded3d850f68f248a74c39f74ecb5bb..61128d606238321d1b573655b3b987226aa2d594 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
>> @@ -284,6 +284,86 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>>  };
>>  
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x37),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x0e),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_CTRL, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x40),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x08),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x05),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x02),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_rbr[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc6),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x24),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x3f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x38),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr2[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x20),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x8c),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0a),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x7f),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x70),
>> +	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
>> +};
>> +
>> +static const struct qmp_phy_init_tbl qcs615_qmp_dp_tx_tbl[] = {
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x2b),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x2f),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
>> +	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
>> +};
>> +
>>  enum qmp_phy_usbc_type {
>>  	QMP_PHY_USBC_USB3_ONLY,
>>  	QMP_PHY_USBC_USB3_DP,
>> @@ -449,6 +529,34 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
>>  	.rx2		= 0x800,
>>  };
>>  
>> +static const struct qmp_usbc_offsets qmp_usbc_usb3dp_offsets_qcs615 = {
>> +	.serdes		= 0x0,
>> +	.pcs		= 0xc00,
>> +	.pcs_misc	= 0xa00,
>> +	.tx		= 0x200,
>> +	.rx		= 0x400,
>> +	.tx2		= 0x600,
>> +	.rx2		= 0x800,
>> +	.dp_serdes	= 0x1c00,
>> +	.dp_txa		= 0x1400,
>> +	.dp_txb		= 0x1800,
>> +	.dp_dp_phy	= 0x1000,
>> +};
>> +
>> +static const u8 qmp_dp_pre_emphasis_hbr2_rbr[4][4] = {
>> +	{0x00, 0x0b, 0x12, 0xff},
>> +	{0x00, 0x0a, 0x12, 0xff},
>> +	{0x00, 0x0c, 0xff, 0xff},
>> +	{0xff, 0xff, 0xff, 0xff}
>> +};
>> +
>> +static const u8 qmp_dp_voltage_swing_hbr2_rbr[4][4] = {
>> +	{0x07, 0x0f, 0x14, 0xff},
>> +	{0x11, 0x1d, 0x1f, 0xff},
>> +	{0x18, 0x1f, 0xff, 0xff},
>> +	{0xff, 0xff, 0xff, 0xff}
>> +};
>> +
>>  static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
>>  	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
>>  	.type			= QMP_PHY_USBC_USB3_ONLY,
>> @@ -500,6 +608,37 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
>>  	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>>  };
>>  
>> +static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
>> +	.offsets		= &qmp_usbc_usb3dp_offsets_qcs615,
>> +	.type			= QMP_PHY_USBC_USB3_DP,
>> +
>> +	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
>> +	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
>> +	.tx_tbl			= qcm2290_usb3_tx_tbl,
>> +	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
>> +	.rx_tbl			= qcm2290_usb3_rx_tbl,
>> +	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
>> +	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
>> +	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
>> +
>> +	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
>> +
>> +	.dp_serdes_tbl		= qcs615_qmp_dp_serdes_tbl,
>> +	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl),
>> +	.dp_tx_tbl		= qcs615_qmp_dp_tx_tbl,
>> +	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_qmp_dp_tx_tbl),
>> +
>> +	.serdes_tbl_rbr		= qcs615_qmp_dp_serdes_tbl_rbr,
>> +	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_rbr),
>> +	.serdes_tbl_hbr		= qcs615_qmp_dp_serdes_tbl_hbr,
>> +	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr),
>> +	.serdes_tbl_hbr2	= qcs615_qmp_dp_serdes_tbl_hbr2,
>> +	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr2),
>> +
>> +	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
>> +	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
>> +};
>> +
>>  static int qmp_usbc_com_init(struct phy *phy)
>>  {
>>  	struct qmp_usbc *qmp = phy_get_drvdata(phy);
>>
>> -- 
>> 2.34.1
>>

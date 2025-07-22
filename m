Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5280B0D2A5
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 09:23:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC52610E5F5;
	Tue, 22 Jul 2025 07:23:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lzj58o4q";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E9F10E5F9
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M2brYM029352
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2G0T0WOtKiIKh+NEO4I9svxY1jp+Mn9eSha/YD/ULrM=; b=lzj58o4qSN3Bvcja
 5CK/7ha4r9D51wHIQcg9jocmNQgDkmnONq9rhYvhnRgynWdOhL9fHJGl5n+kTn75
 MW0vsI8S7giPC5ec75BrDP1ddGZmIvxllx3mwDhLBi0mLqBDFa1UGU7NcmcAIFNs
 JkeWpil+kw1Vc0FDdjeBozZ2wUuEYJ1HgW/1G79XlLRqJ5jSqwnJAvQrkRZlJFey
 xq71ZNtpb1RNRi2NeLWtyXGqh3GiH5STv1+M5LWBniacht5cf2X4MoBQqwG2b3jI
 q006IKzfb/KSJRw12aNHGuaajFi5NVmVEMOTh9gFOBaN147m6dg8s/i7h9AGIDUt
 pktAgw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tgecj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:13 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-311d5fe941eso1624472a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753168992; x=1753773792;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2G0T0WOtKiIKh+NEO4I9svxY1jp+Mn9eSha/YD/ULrM=;
 b=VIZD/eNiSc1K10pwMmv7zHJUj60wpsRUfyH9Af/sMs7UsFw1lrbmdhizHSlxXPQwWH
 PCuadLOFJ4A/8faWmYhUjrK6oSpkukehqIchksIuvPJegTJoma7i+XdfaNxq6NVWzVVP
 XMd20TMlLCdl5aith06QlaMc9k0bnDK676qRKCeOiIGVITXSmzLhIEQrWSP8QmQXRQ6T
 OKXBr7wbdG98Ip64ezVbr+rZLQZzXQ4Jda9UdJouBADQDA7h8scVwo55Y/JqFDugSew0
 uzyJJOaSbssTpMWDZ4UuVDMZastJVCWXN9gDAI9hL0XQOcFXYZF3yj07yg0tMdFbfOkV
 pskQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBo9tOYh9/X/UWgJ8eNeq3/DyM/6+Go0QqOZd4sxa+yKfltAneXV6I9px1aqgAJtKWUwpm7Nd0PBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlDPDSzBCFpxTEVvgROPwqWB4pUs0teVZWj6LjbVLKT4KwMzzT
 huRtWcWrFEsC6f9gSk3eVfK9t8DUoqxuPQMlqZb02x/fbJZ1Nukft6OYXWrwtqr+0CGxKH4Afgt
 rPcAOrohywZA0/+99ZOboIGNY33mJfcVfPsz3OHaGQ3zfFFzNhIFfk1FzlxrAXDf/C615IAM=
X-Gm-Gg: ASbGncvAVzIhkyDdh6TuB+lywEPSfy6XSlN5IvKPRJfQznxCkikofxkhfgtOkkijcUc
 cXrIvE1ATYAcMw0+5yATjmbr2qxLGf3jc2ELTQHrBDjO+HMLXGXs27KwDToYDDBr+fXmFJU2M4N
 9+6ARdcMnmbu5exgRB5z2Or1x1eRoHqT7P9XzZjMIEV6UMogbxkmvFCL1VqTEFV/IYoM4s3PCqB
 P+WGsPKnz5Pjzdm7SxXw6b7g+H+jqyHovi8ixEalkLlus1lRFXNEo076FzvnM6/v3rH5zpiui1J
 czHmaJpcG3kf2yauB+fUJU77suGlQ6ZcYUSU5zz9hTEWyOulIMXKDuiRxPOriYa4W2xB33h9soa
 RlqQHpbj/BkvUpMdj18txjzgX1cam3FP0e4YxbbaOHX4eQ4ka0nqGeBkO
X-Received: by 2002:a17:90b:520a:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-31c9e6ec82dmr13017110a91.2.1753168992107; 
 Tue, 22 Jul 2025 00:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoj4lcyXjswUxdZF8/u2FWJg6raQtP1rmh1s3qmXvAnSh709kLnNrV1BVHUQMrwWxUCjwP+A==
X-Received: by 2002:a17:90b:520a:b0:312:25dd:1c8b with SMTP id
 98e67ed59e1d1-31c9e6ec82dmr13017083a91.2.1753168991511; 
 Tue, 22 Jul 2025 00:23:11 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:11 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:08 +0800
Subject: [PATCH v2 07/13] phy: qcom: qmp-usbc: Add QCS615 DP PHY
 configuration and init data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-7-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=8758;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=qNbe8OPGDdUMep/3XWLUqrKYp08jEHqdWv1AWzkSpPk=;
 b=mAlLNDIHo3v5PwuFwQE2/GRlhiiojVXyQZfsqkeI6HBKPdhdxnMxMIzZ3+JUuNGv3PXoDhjGY
 VF+cFQcDTtGCEBmuYvuqsYjDSCI83TjF/Hc8HP27QQGsVMlbY4lAF+A
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX6Qy43n5uO4eJ
 8K8CkrI4YZBQpzjd1yp7QcL7Br4DaqCbRFc0uunMlk1RosJ2hCT8J3S8xo2sZaF6bZjk1S/HHnB
 9bYarkw7Rxw/IauSZ0p5yRsTOiT1J92au+ILDXuO65Q7e12PW24fq4zpVev0JjHTXGpHzdNWF0U
 vWE4he93H0dryG3/D9G1RFXD9AWbXgVbagnDGrIKjNVMhDJ00PdwsHveQQPrwqnxj1Qdy7KAvJJ
 P0DrLYweSGLhdrSkpkIKpVxuNlzqRwWaHuzhU5+AnxYtobapu1xFa1KeF0xBlykw8jaflO6Sbcz
 4pRt4aeF2LGf60qX5hK5QFLT6Bg4iJg823ak7OJM9A3bfA25zYFpRrSbsz6MWDFMTsTEQfR2X1h
 gdYqB4Nh7nFga/K9TXq25gFybsIZRRTffZcNQyd9tz8A0083tD3g2Zytf6AfYps7eSz/JlX1
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687f3c61 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=LsK-adbuWOzvq-IKUcoA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: IGmQrGzwpI_mbLyBCqqmbsL0LuOLoGK4
X-Proofpoint-ORIG-GUID: IGmQrGzwpI_mbLyBCqqmbsL0LuOLoGK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059
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

Introduce QCS615 hardware-specific configuration for DP PHY mode,
including register offsets, initialization tables, voltage swing
and pre-emphasis settings, and regulator definitions.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 148 +++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index bc0eaa7dba9cb84b54c7c5a264aac613f888cb99..aefcc520ee0bb3dd116e58222e5e035d1d750714 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -28,6 +28,9 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
+#include "phy-qcom-qmp-dp-phy.h"
+#include "phy-qcom-qmp-dp-phy-v3.h"
+
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define SW_PORTSELECT_VAL			BIT(0)
 #define SW_PORTSELECT_MUX			BIT(1)
@@ -286,6 +289,86 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_SVS_MODE_CLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_EN_SEL, 0x37),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYS_CLK_CTRL, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BIAS_EN_CLKBUFLR_EN, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_ENABLE1, 0x0e),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_CTRL, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_SYSCLK_BUF_ENABLE, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CLK_SELECT, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_CCTRL_MODE0, 0x28),
+	QMP_PHY_INIT_CFG(QSERDES_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CP_CTRL_MODE0, 0x0b),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN0_MODE0, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_COM_INTEGLOOP_GAIN1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_MAP, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_BG_TIMER, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORECLK_DIV, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_VCO_TUNE_CTRL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CORE_CLK_EN, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_CMN_CONFIG, 0x02),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_rbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x2c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0xbf),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x21),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc6),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x69),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x38),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_serdes_tbl_hbr2[] = {
+	QMP_PHY_INIT_CFG(QSERDES_COM_HSCLK_SEL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DEC_START_MODE0, 0x8c),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START1_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_COM_DIV_FRAC_START3_MODE0, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP1_MODE0, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP2_MODE0, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_COM_LOCK_CMP3_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_LANE_MODE_1, 0xc4),
+};
+
+static const struct qmp_phy_init_tbl qcs615_qmp_dp_tx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRANSCEIVER_BIAS_EN, 0x1a),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_VMODE_CTRL1, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PRE_STALL_LDO_BOOST_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_INTERFACE_SELECT, 0x3d),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_CLKBUF_ENABLE, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RESET_TSYNC_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TRAN_DRVR_EMP_EN, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_PARRATE_REC_DETECT_IDLE_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_INTERFACE_MODE, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_DRV_LVL, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_TX_BAND, 0x4),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_TX, 0x12),
+	QMP_PHY_INIT_CFG(QSERDES_V3_TX_RES_CODE_LANE_OFFSET_RX, 0x12),
+};
+
 enum qmp_phy_usbc_type {
 	QMP_PHY_USBC_USB,
 	QMP_PHY_USBC_DP,
@@ -469,11 +552,20 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
+static const char * const dpphy_reset_l[] = {
+	"phy",
+};
+
 /* list of regulators */
 static const char * const qmp_phy_usb_vreg_l[] = {
 	"vdda-phy", "vdda-pll",
 };
 
+static struct qmp_regulator_data qmp_phy_dp_vreg_l[] = {
+	{ .name = "vdda-phy", .enable_load = 21800 },
+	{ .name = "vdda-pll", .enable_load = 36000 },
+};
+
 static const struct qmp_usbc_usb_offsets qmp_usbc_usb_offsets_v3_qcm2290 = {
 	.serdes		= 0x0,
 	.pcs		= 0xc00,
@@ -484,6 +576,27 @@ static const struct qmp_usbc_usb_offsets qmp_usbc_usb_offsets_v3_qcm2290 = {
 	.rx2		= 0x800,
 };
 
+static const struct qmp_usbc_dp_offsets qmp_usbc_dp_offsets_qcs615 = {
+	.dp_serdes	= 0x0c00,
+	.dp_txa		= 0x0400,
+	.dp_txb		= 0x0800,
+	.dp_phy		= 0x0000,
+};
+
+static const u8 qmp_dp_pre_emphasis_hbr2_rbr[4][4] = {
+	{0x00, 0x0b, 0x12, 0xff},
+	{0x00, 0x0a, 0x12, 0xff},
+	{0x00, 0x0c, 0xff, 0xff},
+	{0xff, 0xff, 0xff, 0xff}
+};
+
+static const u8 qmp_dp_voltage_swing_hbr2_rbr[4][4] = {
+	{0x07, 0x0f, 0x14, 0xff},
+	{0x11, 0x1d, 0x1f, 0xff},
+	{0x18, 0x1f, 0xff, 0xff},
+	{0xff, 0xff, 0xff, 0xff}
+};
+
 static const struct qmp_phy_usb_cfg msm8998_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_usb_offsets_v3_qcm2290,
 
@@ -532,6 +645,28 @@ static const struct qmp_phy_usb_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static const struct qmp_phy_dp_cfg qcs615_dpphy_cfg = {
+	.offsets		= &qmp_usbc_dp_offsets_qcs615,
+
+	.dp_serdes_tbl		= qcs615_qmp_dp_serdes_tbl,
+	.dp_serdes_tbl_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl),
+	.dp_tx_tbl		= qcs615_qmp_dp_tx_tbl,
+	.dp_tx_tbl_num		= ARRAY_SIZE(qcs615_qmp_dp_tx_tbl),
+
+	.serdes_tbl_rbr		= qcs615_qmp_dp_serdes_tbl_rbr,
+	.serdes_tbl_rbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_rbr),
+	.serdes_tbl_hbr		= qcs615_qmp_dp_serdes_tbl_hbr,
+	.serdes_tbl_hbr_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr),
+	.serdes_tbl_hbr2	= qcs615_qmp_dp_serdes_tbl_hbr2,
+	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qcs615_qmp_dp_serdes_tbl_hbr2),
+
+	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
+	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
+
+	.vreg_list		= qmp_phy_dp_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_dp_vreg_l),
+};
+
 static const struct qmp_phy_cfg msm8998_phy_usb3_cfg = {
 	.type = QMP_PHY_USBC_USB,
 	.cfg = &msm8998_usb3phy_cfg,
@@ -565,6 +700,10 @@ static int qmp_usbc_generic_init(struct phy *phy)
 
 		num_vregs = cfg->num_vregs;
 		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
+	} else {
+		struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+
+		num_vregs = cfg->num_vregs;
 	}
 
 	ret = regulator_bulk_enable(num_vregs, qmp->vregs);
@@ -599,6 +738,9 @@ static int qmp_usbc_generic_init(struct phy *phy)
 
 		qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
 		writel(val, layout->pcs_misc);
+	} else {
+		if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+			regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 1);
 	}
 
 	return 0;
@@ -624,6 +766,12 @@ static int qmp_usbc_generic_exit(struct phy *phy)
 		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 
 		num_vregs = cfg->num_vregs;
+	} else {
+		struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+
+		num_vregs = cfg->num_vregs;
+		if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+			regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, 0);
 	}
 	regulator_bulk_disable(num_vregs, qmp->vregs);
 

-- 
2.34.1


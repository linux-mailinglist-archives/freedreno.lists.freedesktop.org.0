Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1558DB89E84
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 16:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1133110EA04;
	Fri, 19 Sep 2025 14:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="khaP++Er";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13B810EA11
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JDs6ee029526
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=; b=khaP++Er38sTrdaC
 a25QtnMmySG6jlbQzmbJPk9nvq8JUfUhtCu/p3VLfk0YA7FtM9oEN8s97ZnX5L1Z
 gnTjOdD7MtBAA2TeEWdbFO896ubNLF28BA4dxSc9ycdT9AwS9IBbzF4nrLA0hUZz
 zPty+mSFjpL2QHY9ENQPEnMwmPemM/tElkwKNgUF3FN5FMu6dGqPqdSpNeIILVvF
 gbskIgLEIDJW47aOensImQFZr1quulM+nEwqS9NJMHSuxcnVIj6KdotAuHRq5w8B
 QjSveBb6h3w8hYOsDXC13Zq5sik0CXxBfkW9nKcV5IKI7Bton3mEIg7ymC/0J7kk
 XZLwEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy12pgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-269b2d8af0cso2825625ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 07:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291925; x=1758896725;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=;
 b=D8U/oUfgssC4nQWdrpfN1dRURUZOH9vZud4xqP07cp90KmeMl3VpWjsYrY4LmpkA6V
 4/OcKH4TYVBcae1Kc7SKCOcwSQAoYzVGudeeuLQT6m7CKM8tz6pMnuKimPBtm5qeJ/Dq
 TEP7T9JDiJ2kfZw3AMWkxqOw4SoOGGVSPDLDC0zd1Clkh7s1thFwo8x82o2HOXRPSpFp
 JDy1rgam6MofVVgzQug5AbeNftQouOenfCZvcPEV+NbWC3ax4XhV11Chikb93+CkD1FS
 +CfOfzKViUvd0YI2FCVFM5mTUxgLFCYhHfxhLtB5BTTNA4ro1CNOTKF11v7Qrjmpl97H
 bzhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmxahgyTpkrkEXd8Id4I7Tbrl7YZfVOLuUV/O3KnFg/M/G2WthXiU8EyEBP5gZ3qXI9Z9RvvInjH4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywdc8jzl80mXJgcXKoN/0eFhncSBp8jGauJZbHMBiWiYFwF+Izq
 axfbq9KmCw404AGKXyJ9ssbmbgb6PV9bavaKJ0+FR/krwk6eP6jLdz0raNCt8SPtL0ne89HBOky
 LVxZd+f0qAEmtpwzF9VjYzTROozPUm30qzOU4UXVLJ35lpAengb7Xx5MLOYoZZg6jgcKTzCs=
X-Gm-Gg: ASbGncuU40QF4HQxGZWBffdNbDLhIJ/DJwZpD+ETB3MNqKSmFVpBWs5+ihCVsDiywvZ
 K9Sq7qTcqmnfcKCOgY0tDkIXz6QovWQWZwSKT1iTJezi0hIVILxTfyxmNzRTr6Box45+F5S8O5w
 t9UYvo39SqzokbguR2D04Dqbbm5SGuybhR2RHAhhgZVL3q1h6evPqkrRrBupqYsQyvdn70Jbh4x
 FiNVK9pzK0IAtvo59o4sSEeixbXJVYrJsGOrbkqKKgkFKTRUmqNgZb/tkExU5j14YJFRVjbizId
 fdOmECvB7nxptSzhSscEQHy2DWKnmRRBXxUBOzyfZafip3I2smnvhNCUPYBuEfAc6zkdFh3m3yr
 QJpa2iXCjI5LX0w==
X-Received: by 2002:a17:902:f68e:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-269ba2611c1mr28869575ad.0.1758291925144; 
 Fri, 19 Sep 2025 07:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBIBS4AXXrSudYOMfmAwfNi+JdtzGlXQtukko475U4cFxag3zIVrNAiD2nbk1f8DLKq0tYqA==
X-Received: by 2002:a17:902:f68e:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-269ba2611c1mr28869165ad.0.1758291924517; 
 Fri, 19 Sep 2025 07:25:24 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:25:24 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:20 +0800
Subject: [PATCH v5 03/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-3-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291893; l=3979;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=V+bmwYjKfMRV9O7yUHq5omi3q3vjjg0Qz8GTgu2JE4Q=;
 b=D+YumCGLZ9Fv17diaosjhiV66oYGcYAUQpxt2JXYY0XK8mFV9R6yRnGH0JVEsEsiIQs6Zzfex
 tbHbYNLSINAA4p/JbPECyhUigU1ZdJjQj/ZzXsCwtg6fIlUQ4UP5k2H
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 0xDNx29ILSxXfYo3mFKp_ZoUBvgbrp2Q
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd67d6 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jm3WsR2aq1IkTfYpOVcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0xDNx29ILSxXfYo3mFKp_ZoUBvgbrp2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX1dyCPgTJgwX6
 NniRKIgCH+QIkVXPu/j+Fnq1f4OE4U2rmZye5KG9t/8om02KLGtJbwukRSxWdOulb9uIFgLbVSj
 Q0hYxzPlxnDhwFCQnCIWLDxmphJ2P4DM3jAh8fG2GmAogPSC9rSQk9DRxFgD/Bv8G8Qa2EHJBwZ
 Y80yXFJGbunUN5zGvOOYPEwkzsSJP3HSzUlnwwCHjAHSlD//meXGls406Pf4p7MjPO++TFt6DZi
 C3+NCWYWnuxIJEUj64K7jmKPhU4hetjZ11DXQcJpME8rUX0vvFA1AcWP80eZTcUIzSic/65dhrT
 a4NJVEnP/4xOM83MMcoxc9/yqDRQMkCSNUiObd89q+rr6jYbUntbxJefj9Bcib7k1katEq+W1Nw
 70iSpUfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 adultscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
including register offsets, init tables, and callback hooks. Also
update qmp_usbc struct to track DP-related resources and state.
This enables support for USB/DP switchable Type-C PHYs that operate
in either mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 54 +++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 62920dd2aed39bbfddd54ba2682e3d45d65a09c8..de28c3464a40ea97740e16fe78cba4b927911d92 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -293,13 +293,18 @@ struct qmp_usbc_offsets {
 	/* for PHYs with >= 2 lanes */
 	u16 tx2;
 	u16 rx2;
+
+	u16 dp_serdes;
+	u16 dp_txa;
+	u16 dp_txb;
+	u16 dp_dp_phy;
 };
 
-/* struct qmp_phy_cfg - per-PHY initialization config */
+struct qmp_usbc;
 struct qmp_phy_cfg {
 	const struct qmp_usbc_offsets *offsets;
 
-	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
+	/* Init sequence for USB PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
 	const struct qmp_phy_init_tbl *tx_tbl;
@@ -309,6 +314,27 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_tbl;
 	int pcs_tbl_num;
 
+	/* Init sequence for DP PHY blocks - serdes, tx, rbr, hbr, hbr2 */
+	const struct qmp_phy_init_tbl *dp_serdes_tbl;
+	int dp_serdes_tbl_num;
+	const struct qmp_phy_init_tbl *dp_tx_tbl;
+	int dp_tx_tbl_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
+	int serdes_tbl_rbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
+	int serdes_tbl_hbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
+	int serdes_tbl_hbr2_num;
+
+	const u8 (*swing_tbl)[4][4];
+	const u8 (*pre_emphasis_tbl)[4][4];
+
+	/* DP PHY callbacks */
+	void (*dp_aux_init)(struct qmp_usbc *qmp);
+	void (*configure_dp_tx)(struct qmp_usbc *qmp);
+	int (*configure_dp_phy)(struct qmp_usbc *qmp);
+	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
+
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -329,24 +355,36 @@ struct qmp_usbc {
 	void __iomem *rx;
 	void __iomem *tx2;
 	void __iomem *rx2;
-
-	struct regmap *tcsr_map;
-	u32 vls_clamp_reg;
+	void __iomem *dp_dp_phy;
+	void __iomem *dp_tx;
+	void __iomem *dp_tx2;
+	void __iomem *dp_serdes;
 
 	struct clk *pipe_clk;
+	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct clk_hw dp_link_hw;
+	struct clk_hw dp_pixel_hw;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
+	struct regmap *tcsr_map;
+	u32 vls_clamp_reg;
+	u32 dp_phy_mode_reg;
+
 	struct mutex phy_mutex;
 
 	struct phy *usb_phy;
 	enum phy_mode mode;
 	unsigned int usb_init_count;
 
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct phy *dp_phy;
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	unsigned int dp_init_count;
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
@@ -689,7 +727,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -709,7 +747,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1


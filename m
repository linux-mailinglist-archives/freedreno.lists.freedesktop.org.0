Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15900B2D863
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 11:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E141910E6D0;
	Wed, 20 Aug 2025 09:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="juNQQfhT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B3910E6D0
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1ow9d004061
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 q/mDTFOIBfnjK0/QWv8mS9Heh1eZA9DtQCHcxaFK4YU=; b=juNQQfhTNwAb4i/a
 pvwQBYAdQBg35H5+GR989itO9/u4n0djC/teKOK7C30aUISyvB6VXbHXsZTl4TqS
 9bNqt7WFV0lDcSZTcxk0eIV9RPXPEVDCOI7l8EZIp2XyCmjFVszmLuZit6lwdP+y
 4rY/sX27TXwZxHnRKaQxWrOd9a8UwBQsJU2py4/yxU/RYp/f/oEjAT1k4Fys3nYq
 xJjPh1DboCGTdw6Mk4iXGcrIjZIttmhMODGkVh90cqmqXThd9p0orphx9RgLNM8a
 h0QeC8ts/rbSD9HC1e3qzKncOwlcwgLIxVyLy29EnAAPYrorsu+xnN99hycd7N+S
 aldR7w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ah6wf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-244582b92c1so9835645ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 02:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682573; x=1756287373;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q/mDTFOIBfnjK0/QWv8mS9Heh1eZA9DtQCHcxaFK4YU=;
 b=TqiLIqHJL5qmNHOa/FM4gz31zDAsEDlZtcUwKc62jf3eZ6faM67e85neHmA08fTMZb
 PJiK+pnBl1OkRZVzJRETJFMIUtr3HcWZuAiDaoBSK7glzfVZmi3cFZU9jfvnfS3XYt5E
 pxnwsWFoAWjhbiCAN74gE3FQrBh8EMqAagHonaoXQLqlRO11aKohwl54mZ4izma4goK1
 pSJYxyJQsndRh4MLSHnaEq/eIjDdrkCk0uM+qLbrgiA8EYcMKyShQo0vIr4nU/r9s0zL
 2dHuR3/BCfLbNW6swMgOUB9pcMLcZMTuCC0UH713SyrAjhkpmJww+rqd6uvk+gTWn7o0
 QmTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1VhqOU91f5wv3a4AQSPQJiY+bg4EJTpwXEYpTYSQX5w8pWlZLZa0qt6+LDOhbQvXYX+Fe3UCKP38=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTtayhEIoDyIQxlPKiD4krjxsZLTb4FyPDtTdejqHjw9vwr6fS
 5Jo+I+OJ6PivP2Qlk6+dFJT/TkVjC1XTnakZysrij7JA6b/bX8Hl+lqPBc0UDHdsvFkRYYmemAV
 5NOPnAbAFvws3DeIbkKDL/E/HkBAWkWxC66H9hmpKBkTrTI7pR5Q8zuyxfCFffOi1OiYKFnM=
X-Gm-Gg: ASbGncsgc4XtIaU3Vd+ke31oPvsTZsv48IHJIkaydOm8qI95UXHI5Hwea4dgUBvZBz3
 METXauO2stjwVLzuKyR9h+1rZcwvqf9qZ88BPUK1F5W0obU/PCemtvsiSolH887ylXB4Fat9cod
 4PrCy0vxl3lRHh7hstZDwAvM+mqTocv0mDiZy2/tX4zGoop4A8zk5/OpcfxvcGmWS3QhPlvhftS
 BGHvw2M0LjKfoG4MNlq21t35wVPebGiIzlYVZ/gBakxdyu2m+O9D51XeaYeUpeRY27/ctxAYG5n
 2AZMWqQsrOcpZ8rYigdhTa62lqAhirTfZBuPYAtKBR7+dkayqDQaNYo/E/H6TuKCK0Y4A8xhxAG
 vcKHpGfJLLEJn+qCdTesarXbtT37KGYuEcotVNMqRIrOfT/Su9L3OWkqr
X-Received: by 2002:a17:902:e551:b0:240:9dcd:94c0 with SMTP id
 d9443c01a7336-245ef123cd0mr17110525ad.2.1755682572882; 
 Wed, 20 Aug 2025 02:36:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFr5m4HcTwWZPAOoecbawpyhYHDUllDq6+ukQ6cUhIwHAD8BWGnSUwZ2VPd7LwCejx/fQpbQ==
X-Received: by 2002:a17:902:e551:b0:240:9dcd:94c0 with SMTP id
 d9443c01a7336-245ef123cd0mr17110145ad.2.1755682572403; 
 Wed, 20 Aug 2025 02:36:12 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:36:12 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:47 +0800
Subject: [PATCH v3 05/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
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
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=5029;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=+D2W3NfynpV/SfSgoeJCsCvAzKK6I/PsNqYUvcuv6H4=;
 b=4lFjTOWftHjW2zqh1eIVnt7FHUTiuexIuwistrIwlrOBtB/BNArQWy8l/WtK1lH3j70pwZYO6
 zZkaS7TuSDNA34sBahjCmd4/9HzautzjvqgKpngfrozp0wt7FgbpGBf
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: WD_s1cDpm5JSjvrG5OOGjZGSIlu6Imwc
X-Proofpoint-ORIG-GUID: WD_s1cDpm5JSjvrG5OOGjZGSIlu6Imwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4d2nQpJ8sAVE
 nVJCxc/6FVVi8lyrTRErODf4dU6EEj5EqTH8sVHmKFhB9sGOZ0MT5OzVDRIcxWpjgMmLI2tBgWj
 EEUFuZBOZhEVxXERM2S10QADOtwxSsuVK2DnrPQ5ElKM1MNeTMoTyJHIGYYO2psSNzn+9hBjRPF
 92mnPG1BCvgIVcz0xosr90h1Od7WmCylTuuANoD+uaOuPFqyRkNUx8JKBsl9E6Oi9EaMW3OXX0R
 KJ7vx7shSM1Wir0REYYPNrFLB2pK6pEJg3mhQigA+EvXC60SuR3g2QJrIURVghuvu577vW1JWjX
 R3vs2yNCHWSVs5a8qt1gJr0W/XEqiWX4mNEBIbKX6IpNU4jXk/wGam3Xwyg/V0q3+Udg8kxEPaQ
 RLd+ZqpDjKmAcU/K83U/jgaymTBGzQ==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a5970e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=SsgZ0hFHHArN88CrCc0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 73 ++++++++++++++++++++++++--------
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5afe090b546977a11265bbffa7c355feb8c72dfa..6b0e86ec43ded3d850f68f248a74c39f74ecb5bb 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -298,14 +298,19 @@ struct qmp_usbc_offsets {
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
 	const enum qmp_phy_usbc_type type;
 
-	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
+	/* Init sequence for USB PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
 	const struct qmp_phy_init_tbl *tx_tbl;
@@ -315,6 +320,27 @@ struct qmp_phy_cfg {
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
@@ -335,25 +361,36 @@ struct qmp_usbc {
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
 
+	struct phy *usb_phy;
 	enum phy_mode mode;
 	unsigned int usb_init_count;
 
-	struct phy *phy;
-
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct phy *dp_phy;
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	unsigned int dp_init_count;
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
@@ -699,7 +736,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -719,7 +756,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -874,11 +911,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->usb_init_count) {
-		qmp_usbc_usb_power_off(qmp->phy);
-		qmp_usbc_com_exit(qmp->phy);
+		qmp_usbc_usb_power_off(qmp->usb_phy);
+		qmp_usbc_com_exit(qmp->usb_phy);
 
-		qmp_usbc_com_init(qmp->phy);
-		qmp_usbc_usb_power_on(qmp->phy);
+		qmp_usbc_com_init(qmp->usb_phy);
+		qmp_usbc_usb_power_on(qmp->usb_phy);
 	}
 
 	mutex_unlock(&qmp->phy_mutex);
@@ -1106,14 +1143,14 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
-	if (IS_ERR(qmp->phy)) {
-		ret = PTR_ERR(qmp->phy);
+	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
+	if (IS_ERR(qmp->usb_phy)) {
+		ret = PTR_ERR(qmp->usb_phy);
 		dev_err(dev, "failed to create PHY: %d\n", ret);
 		goto err_node_put;
 	}
 
-	phy_set_drvdata(qmp->phy, qmp);
+	phy_set_drvdata(qmp->usb_phy, qmp);
 
 	of_node_put(np);
 

-- 
2.34.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82246B53674
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06E10E391;
	Thu, 11 Sep 2025 14:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dwnw78Tq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2D410E37E
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:57 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBgUhA026420
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yj6L58xwnl408i85N6AVkTYY2VfPx4sT2ZTdfwp/cHg=; b=Dwnw78TqB3/qxMr7
 2xvh+jOzRYgF2B3/DPw+zjLr8JSvUmEeCSmOhHYbdN1KwWoUeFPP5H24rEeGNtFk
 CObYPmlCGoPIAhQsyAtFtaxjF2Vc5qtOATmW5klZgqQc5YShIZ4XBxhSiH5oG4bP
 5jUmUs6363VUCTOrCMa0Zm8uJFrcdEwnu3IFpw4T3EN9/RxxNsHSq4bzGeGcXRDe
 ZGsPxZfa+GaBvfMui/jyOYZLK9BoM1Bxhavt5TI2OCggwPJx5i+3DdmfD/U0bO2V
 Dh/Y4BG9KshXILbiPmWlyllyZI4ksk1siFVZ7Si0Izk5d6guXJhL0RGc9Oi/Lsu+
 Vbd+dg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj10424-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32b51631ea5so235424a91.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602555; x=1758207355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yj6L58xwnl408i85N6AVkTYY2VfPx4sT2ZTdfwp/cHg=;
 b=crxPB0BlZe74ZaEBtVMLXKglOpYBmGyP/MX2gwOJbDdA+gWhIUdABn/fiNZAZVX6hD
 4PpR/6ukQjRuUsBhToLNMOqdwvYIg1PXAwaTm9xLcM1EAEeq1AiBg7r7Qb1Rt7o+leco
 dr5/JrSEzHTcKlw1M+gpBN5GZGPBxjqXobb7nlFjtmKYDM+IR78eDrNUqhxItWc5q0hj
 Rnad6DtjeeIbFpWNlOSYNZIQcBVnvNHFGTwaUU8YtF/eUl3lWYov2VwxU+PVHS9tuqfK
 rQpaCN6PEqxab4GpzJ/yBTUAKkJw0XsVCwCdspcu/MtAO00WwdDkVjNeZVjXnrfqLARI
 1NPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoM5o33idAfTGPCNaEZVFYioeTqc+oj2ZBwu3qdVazvLTlpvv+wKigfCKg24QTBiV+O11cqUr1QJI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzouvxskNIAuvUtBr/EV1dH1KZBC5dUawN5l5DDL/s0WOAP7TRf
 XamZ3ji1+fuypdtkPhkM7CuM81xIzML3c7fEVXUcroomPwZfrkFKuhPkcTQAzw3rHRkHpp7N1OX
 IwT2NHiewOH6hyVrqbJV+zrtgW1nCSsRwep6Iyb7ZF7OVOH5ShS8Wsiyt0F3oHMHyIqyTicA=
X-Gm-Gg: ASbGncuZUwD9ijdo+0+O0bh/ANHgKp0w0bE1hYdWcThggSHvvc/MPY/9stxcfpXStlv
 1ZFc+wVPumNcXuP1izh0LQb8uMPIXbpQTZo04vAfLZESvaUkX8rsneV2tV9QHLCsABvI4l8AN9u
 9XUHSR44k/GoABulgOxEEXjfVP8HIjQuT3BmuXz3HtI2jnf90UVBhU728VTQKpuQWkulFcTRCoe
 dctYfFYSey+Z5Tuf8GBQv5oI+8T3d+0jIgI6EjHf4d5YbyF4LUsmICSq4LcD8K58YX27kC8FbgV
 W0/4K+oEIi3QKLRCsCnxb67Bmia1opg6w3rWHLdxxpFdF0hWHu0LTPPvHBrRXNQ7vD+QhePTJTs
 4z3YtnMWQD6SaovhSSKyQgRuZKIq3QVzGsbzz5wotRDTbpnTPQZdB0d85
X-Received: by 2002:a17:90b:17d1:b0:32b:4c51:628a with SMTP id
 98e67ed59e1d1-32d43fb18dfmr13671109a91.8.1757602554879; 
 Thu, 11 Sep 2025 07:55:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSF0u95PMC40wmGcQT8D474kYHcmFyGjeWgeP2uLbuzJLRPPy3g0ruE1l/NyUdy9AtHv34Ng==
X-Received: by 2002:a17:90b:17d1:b0:32b:4c51:628a with SMTP id
 98e67ed59e1d1-32d43fb18dfmr13671091a91.8.1757602554372; 
 Thu, 11 Sep 2025 07:55:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:55:54 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:00 +0800
Subject: [PATCH v4 03/13] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-3-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=3912;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=7+KyniYQTJ+9G3oqOiRpqeMGFIBrJBIyusIP4VdRaxk=;
 b=DZMpi5unXPCafzFW8cKQEPg+NAoZ8HMSlQCoFHZsiNctl7mZcEIdfdbbHbFCF5e3h1hXNi3T2
 NRHO3m64nqfAuLqIKQUqrMS3KA18+vrmGif51fpbuOmGYa6QEJtix5+
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: twdjf-EMxxPr-uHjYsWDFG1GueAWowPy
X-Proofpoint-GUID: twdjf-EMxxPr-uHjYsWDFG1GueAWowPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX8v7w6xdGAa1x
 up48CQFGWpSaZKHqu0aUWJCZTSp4SKjjHHBpgQOLuJ+54EfJNFaI5TkhMmZZx++TDphmuJB4Wiv
 T9aMaY5sTqd+oWTtIe7qOwp0EculBLcRfBdGParJx7DZjMzcRqUDZDXbUCVLBe0ETInuq+v8ABF
 CbOjJVH19ewiq/xkiCqMSnX6rNgWX3X+Iq2QbTPvRMwMmO1Zd9FYJ98x1mj/LDyndaKA5DTZbj9
 nyLjqQ1BXtM6rfwDxdTy+lBNdLBoI+mNsTEYc6AEpo+3wgD/cQVz6L4Yzxyx7UBTtlnLsY8TGwD
 IVbKQUC4QMkdlocTlBirKgBnO6mDjtnFpt2NZLmU3FKT0jBZlMF3A6HeOMzNFpsneyAH5sNGsJk
 K7lnna5t
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2e2fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jm3WsR2aq1IkTfYpOVcA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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


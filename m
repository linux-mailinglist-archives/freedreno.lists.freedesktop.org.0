Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC8AB5367B
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:56:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF15010E390;
	Thu, 11 Sep 2025 14:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jN8hU3Ga";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B25F10E390
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAl7ii032588
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CAnh39HSsou7guKP6/W0eKgu+3fgE+UqRuEA8rEgyiA=; b=jN8hU3Ga6Ly7uEfS
 0PzCS+XAAwH29rZM14zUuIWeWRyXh56YntI05tJEXl+PLkWR5p8wRsuK/giRrq/g
 HoDSYFNoD00sFyq8fq8ZRLUC8IFdC5oRgkDnAKERaU/buDzjJFvOaKJ75rbb4eZi
 F/+rT+OcgwAIcZ4p3MBc8mWzqYuRox0UwzeyT0QAZ/zFnb3cgm2hqiU049T/J5cL
 YbsgL+c+3V5rxKTyKtLtHopS0CKjkj/eNNpa6G3ls8F6og3u0ThW5zAv93efKk0g
 2sOaC4MqDN6SpW3QJKkM04oueNGf4ylqX+9JBm19PCiVnqUEMAwaQ+YM/mFAwjvd
 sSXAyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7xmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-24ce66b9b3dso2176115ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602575; x=1758207375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAnh39HSsou7guKP6/W0eKgu+3fgE+UqRuEA8rEgyiA=;
 b=Pls0NrkqWKmsBpnFC/NnJPYsO1NsvvQnWl/PwrGUB1CTNxg+W9i+/PXuFiz25K1xX6
 zsI5FGk1OCv1rjsQSnB4so0yP38YOdY7Z4nDYQBIEDH2V/E7byH5R1j855YmZG80w0wE
 7azn8t3EAa8domgBYUjIAkhSeCbbVvgGWt1AXyS5k9aygjGbxX+efygVrsZtYofTyGXI
 TRTvKLCyHLbz8kl97kKNswuAW3FkD1UtSqUuEep6XyFqTaZMTtFp4kzuInB7LUJ++sHr
 vmboG9rddmFea7s/fz9VYoN+nH6/iVyqVX2VktbXSmj2GaGhyJqtAss2Wn0reUvCKVro
 4S2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnSgUB5e95qI/scvzXHVMyThC5D28tcoSK58lq1ULbpBvah+hh+7ODFGBG2X1bYePnKLl2IuCd4tI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoRzjp3OwUjdQNb4Ur9g4cX/4c/se9bNYJ0veulGosGvFpGAy8
 tbw50yT2U3M70LdZteKGH3yvvyF8UTeNIIlHreJzh0L+4OLM3vRu5aw2/eHbxqGEjGAGtkB+Mkm
 osWzP/pTk11RuuANPTeICCkZU9ZRLpbztLMvojw1sLoE72Zthkdb4aqtq/Ddsg744vW9VMCM=
X-Gm-Gg: ASbGncutdzfBV4ugLhybdZS1w4dnpleevyPQiQw0d7CjwgcLUtD94mTUeKWH/NB/7cv
 NEf1nIVc0tXbyv6z9mPovj6wEgVVYfAiEqf+nTgUVhTJIVmnePgYucj42CSo6oF3l0jJwlAm9gw
 OmqljLA1HUbChGHYv+8+3fzybf7gO9oQhWApwStg4fAwZoukmEIItWjmGqPKflA3T9TRbYbgu4x
 8NCHv2jogJUPRS4y1D4aeMGvyb/HwwrkdBf3Kz+xDd0qScGZ62SJjVXCG/iUr3h0evEoKchLswu
 uxxdJT4B/whn2FFU96q9B6S5Z3AWzipxHa/q3J4Cz+eJ/KMuP99T+TLDIJX745ZXUf/aZPBCcFU
 2kR1TejeCEGdJQqqOZ8tdzXxtB+axeK6WkTTW897a+CK2ESwKfsLmIk15
X-Received: by 2002:a17:902:c40b:b0:243:589d:148e with SMTP id
 d9443c01a7336-2516f23de24mr133000285ad.5.1757602574670; 
 Thu, 11 Sep 2025 07:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUFTTFMQ2rdWbNsDbWngOPJ2WH+IaqettH8JeXlHbxDgg3kXL8d6vzlVpeg48nFbm+O4tliw==
X-Received: by 2002:a17:902:c40b:b0:243:589d:148e with SMTP id
 d9443c01a7336-2516f23de24mr132999835ad.5.1757602574070; 
 Thu, 11 Sep 2025 07:56:14 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:56:13 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:03 +0800
Subject: [PATCH v4 06/13] phy: qcom: qmp-usbc: Move reset config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=6897;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=OWt9kB48mzxxvjrBaY3xyKfETt0QdvzjmmLgaJWlQh0=;
 b=KGI7fDuTXIC9M5EO9nZ+gm6xulQkGDTUo93FCzKvlUkt4ubvrY9zrKkv3xs4QtYBJf8NpMz5f
 eFtIBPbiNe9ALJDF8q8xE0SgYadPXCNSw8IxQZmqKrapSxh2WAtFU61
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: _D18CVAQ5JWVe_Fw_rFz4c4kl1We1o3d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX0cprtDX+eEA6
 nbYLQ5sF3TccfcoPnaAo7vW3MgiMVkwWSPM5IRUxomQP13Y9WTr6O++FfcTkSKzUzYfAvICPeIq
 Ypqf6UWTzi6PfM4z2Cst26EFt3ZrqFIxqcNI4oxaznpRgS3CsXAKFouS7jNwRDCWfI7MFUCFX4F
 6EAedkcnpQ447FASQjjcALOKn9+yqy0qBx6j4iZlYy28LYrzkSkRB0q79TffCZ0/roJVgoxyxa9
 uNWlz3GoO1hC0RVTubjVflHQec17tqy/YbAad11Sw6Qis8U44C1LgBcPjdXj6II0ca2EQE/F57W
 pZkCdvkXDqpJfHEiTctNNOqgrRTSCxdNvXVYuNuXdViRMP1ipsyckcqCwQuQ10tVxY/ZBLg6aIn
 0LOxKIMI
X-Proofpoint-GUID: _D18CVAQ5JWVe_Fw_rFz4c4kl1We1o3d
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2e30f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=-_sGn0fMRN9O-kufMFcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

Move reset configuration to be managed via qmp_phy_cfg instead of
hardcoded lists. This enables per-PHY customization and simplifies
initialization logic for USB-only and USB/DP switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 56 ++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 23a0efa7fc4418f379ac4c02fd92080c7755dead..663024b8c09124f2991b8e0537a9feb60baaa686 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -415,7 +415,8 @@ struct qmp_phy_cfg {
 	int (*configure_dp_phy)(struct qmp_usbc *qmp);
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
-	/* regulators to be requested */
+	const char * const *reset_list;
+	int num_resets;
 	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
@@ -447,7 +448,6 @@ struct qmp_usbc {
 	struct clk_hw dp_pixel_hw;
 	struct clk_bulk_data *clks;
 	int num_clks;
-	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -508,6 +508,10 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
+static const char * const usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -572,6 +576,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list              = qmp_phy_msm8998_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
@@ -588,6 +594,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_sm2290_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -604,6 +612,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_msm8998_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -620,6 +630,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -653,6 +665,9 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 
 	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
 	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
+
+	.reset_list		= usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
@@ -671,13 +686,13 @@ static int qmp_usbc_com_init(struct phy *phy)
 		return ret;
 	}
 
-	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset assert failed\n");
 		goto err_disable_regulators;
 	}
 
-	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset deassert failed\n");
 		goto err_disable_regulators;
@@ -700,7 +715,7 @@ static int qmp_usbc_com_init(struct phy *phy)
 	return 0;
 
 err_assert_reset:
-	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -712,7 +727,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
@@ -939,25 +954,22 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 			   qmp_usbc_runtime_resume, NULL)
 };
 
-static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
-			      const char *const *reset_list,
-			      int num_resets)
+static int qmp_usbc_reset_init(struct qmp_usbc *qmp)
 {
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
 	struct device *dev = qmp->dev;
 	int i;
 	int ret;
 
-	qmp->resets = devm_kcalloc(dev, num_resets,
+	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
 				   sizeof(*qmp->resets), GFP_KERNEL);
 	if (!qmp->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < num_resets; i++)
-		qmp->resets[i].id = reset_list[i];
+	for (i = 0; i < cfg->num_resets; i++)
+		qmp->resets[i].id = cfg->reset_list[i];
 
-	qmp->num_resets = num_resets;
-
-	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get resets\n");
 
@@ -1147,11 +1159,6 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
 
 	qmp->num_clks = ret;
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
-				 ARRAY_SIZE(usb3phy_legacy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -1191,11 +1198,6 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 				     "failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -1246,6 +1248,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
+	ret = qmp_usbc_reset_init(qmp);
+	if (ret)
+		return ret;
+
 	ret = devm_regulator_bulk_get_const(qmp->dev, qmp->cfg->num_vregs,
 					 qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)

-- 
2.34.1


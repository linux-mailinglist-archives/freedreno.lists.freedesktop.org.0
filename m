Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E84DB53678
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E2B10E395;
	Thu, 11 Sep 2025 14:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHffhLmg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467EE10E391
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:10 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BAYU0N027365
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Qf33+rpkqechNWLDM2iiocmjqpmdnUS1R/bV4PaBr7I=; b=IHffhLmg2Kp2S1GF
 7NUgB/aDIyENtgUzLBLy8UoNfDSsBtPFix49uLYfl6TVmX/cHQf0YsRk3X73Lhz1
 vcv/Ep/kjrtWH2iT/mUGrjm9LwrbSnjXsrftCu7HtCblXHGjoUHm0UHN/ciuWde8
 CMlON4E42Rz8WJFdB/ZrszPDwJ5LGpOox+3gVo/gPKPUCSQ/GywSj92C2rHaVJfB
 /evQ1AM+dOT5rdzFm8HoUwrLxjaOJDB+VEpBjJ1VylR6vaExAJbwCn3vR2ewTRdY
 HTF7gSyZYah0cR12KyO9S191LjFqkbYyvKo8QH4gs+kM8HBb9JrsU/bNlR7hrhCy
 XuWrZQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h351c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471740236dso36611a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602568; x=1758207368;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qf33+rpkqechNWLDM2iiocmjqpmdnUS1R/bV4PaBr7I=;
 b=GlPd4y1Fdl7whKv8kpT0weCSRkfytAwDmCQw4QESUCB+ltcJ+fnY9HZbDQJrMdMhDN
 OBP4lHXjQdNZbYM3iUnWLHYWD4zUBARpDK1fvqETkyE/qY+KqGtBwHh+gGsa+kQ351C/
 iAxcFLnwR+IA09lVY+ofh+cEjRc0EpPrHNe1YleDIoRyaKlxLe1+z3Pj1gL5aNeoOv9G
 Ji4EthqWgjt4o7a7TE3UkDH8zxQ7nMUbmka3200QmBLwAN/1VIZuciO8yhio50A4hBbu
 CXSIzgY+D/AbdYzSDFMLnP6vIWikNVtFu5E6SBAmAS5C+YjmiEZKIr1FBzFxi2LQ3tcU
 ywMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvicBy+FIwKRaOaugePN01lLdUjOog0/HY3Cu53+dwSGMvPFeH5C/d7nY/OH2nn0bTLFiP8YxDOjc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybp0whc1GCHWepg+/OyWr0dPSTO1qjQhzKzvGQqRO+rLVbmhpT
 1R0ghA0SWlG0pAv2MfdzMQAmyjD7/MCHoWlixveXqngiL8CvX0+8KLt2xIbX2w0LDrWWOqALKuH
 23tVrBczZgEL8o7EXAshbVv3lIjlkYw0yN4yYsAQdZyvrGQI8Db9EqqD749iLLUlR6iy8XDs=
X-Gm-Gg: ASbGncv+OczfXdxXSJUZpyeW3VDUV0gSfrJ179h4oJ0Y28JJrQ8t1AStVJjNuhV17eq
 j/FyX6roA6mO/n21moTFIq4sQWEyTSEpBsxEIGPYnlyH+w9pcDS5H+cS6fqW0i/VZCSYQx1FUHa
 I0TzkLXJKtSTxvZV1JtKBJinkUyxJIR6F5RuB5/2qgA2K1srV2sj9tKhBlS4vxBU6NK2eWnCybf
 36ub5mxzagJmpzhF1y8mf88qE0XRBG2m63+7qYqEZn5w2W+ZEomg5JqbD+Xu0BeES08dojtMfPY
 o+fR1pjaFxAZ6rVk0LjmAT9fFXGpd8a8kXV+UZ6D0/KskhfBxwFBhr4IdmPGX1m31BqrUsFJxhl
 7pQGph+Tc+yVHDci7K6EgmKSYM+8I6r5VWsetKqmsZmNuQ08cpfWgaecV
X-Received: by 2002:a05:6a20:3c8e:b0:249:ba7b:e358 with SMTP id
 adf61e73a8af0-253466f7f0dmr16784915637.7.1757602568318; 
 Thu, 11 Sep 2025 07:56:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzOKHmMadDOEhXme38l/SgVEjQSf03G6ln8D6mZepsc9zXZZEmfprR+eGiQM7vxndfPtt00Q==
X-Received: by 2002:a05:6a20:3c8e:b0:249:ba7b:e358 with SMTP id
 adf61e73a8af0-253466f7f0dmr16784879637.7.1757602567620; 
 Thu, 11 Sep 2025 07:56:07 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:56:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:02 +0800
Subject: [PATCH v4 05/13] phy: qcom: qmp-usbc: Add regulator init_load support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-5-2702bdda14ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=5710;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=Ka68iZ0YAPLqx39F2bkX9DO9L1BfCDXGkrO3CFDr1Y4=;
 b=/ZWVMXETRYCmYdA8o6t2MnLwpgwvcWgvtvLKQLXtulERXXssTrM8ZB2ekpiJCe6sF3eIQ5bs8
 k1596YGMfx3AcWiYQkCCQAZUjlVIOjpNMsbccZosgJojGzZ/aSeLQ9J
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 3JKHsvlHEDHetXteb2w-pPElC1PgBdq7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXyYV+vMe7d3Mj
 2OWYkMrnNgjSY7krobfvkWopiI+0prL68KUZXM1oheyH5mLxqMkjRM5E66Nho+undw/crgLkbXD
 al3/na7+oP/CyvZ0ugBIudx5kIAwJtt2p7c+m7iS/WUCeZ2A4XOr18LSkuNkr+CaBDSbfMrsaba
 FTBsA0CMw3dsb8fUDEtJC+kdHssQEax3uUh33qnEql3p/ZMatj5xRVs6bfVhU0OVywvrH+g9bdo
 W7YmbCV4CCZxhuaemWZLnCxB61p/7T1NWTCMfcpVYD5t9D96vT2BrCeUlaWqU4ttZ+9HoWVYpSG
 rEdkV1b0MxOMIxQX1k6kjyQrw8tDF9zJeOFNoxwOPbjjwGqLc4Z93TjGBra2j0evuKnO1eI/E4R
 u2uEfZmS
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c2e309 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RNflNDmReaz8n2eeux8A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 3JKHsvlHEDHetXteb2w-pPElC1PgBdq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

QMP USBC PHY drivers previously did not set init_load_uA for regulators,
which could result in incorrect vote levels. This patch introduces
regulator definitions with proper init_load_uA values based on each
chip's power grid design.

QCS615 USB3 PHY was previously reusing qcm2290_usb3phy_cfg, but its
regulator requirements differ. A new qcs615_usb3phy_cfg is added to
reflect the correct settings.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 70 +++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 791c7d86c51769bc9c7c5e1c73603c87fc71a820..23a0efa7fc4418f379ac4c02fd92080c7755dead 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -416,7 +416,7 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
 	/* regulators to be requested */
-	const char * const *vreg_list;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -508,9 +508,19 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 68600 },
+	{ .supply = "vdda-pll", .init_load_uA = 14200 },
+};
+
+static const struct regulator_bulk_data qmp_phy_sm2290_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 66100 },
+	{ .supply = "vdda-pll", .init_load_uA = 13300 },
+};
+
+static const struct regulator_bulk_data qmp_phy_qcs615_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 50000 },
+	{ .supply = "vdda-pll", .init_load_uA = 20000 },
 };
 
 static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
@@ -562,8 +572,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.vreg_list              = qmp_phy_vreg_l,
-	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list              = qmp_phy_msm8998_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
@@ -578,8 +588,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_sm2290_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -594,8 +604,24 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.vreg_list		= qmp_phy_msm8998_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
+	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
+};
+
+static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
+	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+
+	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
+	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
+	.tx_tbl			= qcm2290_usb3_tx_tbl,
+	.tx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_tx_tbl),
+	.rx_tbl			= qcm2290_usb3_rx_tbl,
+	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
+	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
+	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -627,6 +653,8 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 
 	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
 	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
+	.vreg_list		= qmp_phy_qcs615_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 };
 
 static int qmp_usbc_com_init(struct phy *phy)
@@ -911,23 +939,6 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 			   qmp_usbc_runtime_resume, NULL)
 };
 
-static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
-{
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
-	int i;
-
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
-
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
-}
-
 static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
 			      const char *const *reset_list,
 			      int num_resets)
@@ -1235,7 +1246,8 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qmp_usbc_vreg_init(qmp);
+	ret = devm_regulator_bulk_get_const(qmp->dev, qmp->cfg->num_vregs,
+					 qmp->cfg->vreg_list, &qmp->vregs);
 	if (ret)
 		return ret;
 
@@ -1304,7 +1316,7 @@ static const struct of_device_id qmp_usbc_of_match_table[] = {
 		.data =  &qcs615_usb3dp_phy_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcs615_usb3phy_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
 		.data = &sdm660_usb3phy_cfg,

-- 
2.34.1


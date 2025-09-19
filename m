Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A79B89E71
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 16:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F2410EA07;
	Fri, 19 Sep 2025 14:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VD2udnOh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B88C10EA0B
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:19 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J7RO43029494
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 LDnnPZbDY0CeogNvXqz1T50BX7PocujidnNTMym7C0k=; b=VD2udnOhvv6eemCS
 OcFB1cZWR8WOYzZO3UPBnY6beD0dzmf3/08mP/P1uKg2wXrpccRFX3J3TAhuW727
 zRelRX8IpgvZdARCCJheg8B3m/EexcACQdmwgW9MfFdPmYX+7R7iJ0pUAmq7+IiT
 WfmXR8zbc3NHh6NmmNsS5cd3n9AO/T37OEzZhah6M4zr/nZjzhaAT007DcVkmlGv
 psnrEmEFJYVuHE3j05Xi2uuqOMnFPp26OBKa13/9ELdgzTgAUXidIzieEs8ojbQb
 kKtECC1T65OKuumGuGJD4TaXamEwGzTsRT2TUMhg9CgXmChni/A9dD4L6iTMLQjJ
 V7kLHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy12pfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-26b7fc4b7e3so1744725ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 07:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291918; x=1758896718;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LDnnPZbDY0CeogNvXqz1T50BX7PocujidnNTMym7C0k=;
 b=t/M69zN0SpyFpGlYFF1mTrUMBQMildpvkx4GkYb21qRWKL8bjxgKXP0uh8Rxdt1kke
 H0u5IlXpNIiSAKTsofu4QA5HM7KTyiShB7+KlWl03x7gEiCmFveied6irbB8Q0JoLmes
 7037+Wy7wY3auXw5RqwQNogo+x4CWkylFiI6/b79aWvmwhSx8CZycGaIRPPWEq9GjEvU
 lHW8KO7bxvfoBBzLfJBuZeyX77u0gDqJ0AfyETYqYFKeX9n4V0knwPO6aBUS/GL9HScM
 6Dh0ge9Ddtl8muFcQnUQ2hsBu+P3gWmunWYWUxvvhWYN8S5J67TogXKqLhtfU+Z1R1n4
 qciw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2q91UcXszrqCkdY1sIYbDNPPZcRzbpw8GFRwbaZQKru5y6/NB+HRNhCU4RXW396irLF8nF0UECZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzc5NEqzoEsvqoOdvicWuRKA/C6X9eDasJiP3A8qSS+WmKhXEPY
 DW9AR9Mlq2E87YXGMNx1c/VTp9OXetjBV1Rk5WvP3yn7moUxws/h/ABg0pYrhLE2mkoxIwq+ID2
 h33LgxetED49YCdxDdIrKqZkDKuzkJjosbrBgsisdpYCG6tOh1G1hLjABereRJEmqG9Pdev8=
X-Gm-Gg: ASbGncsclmuhhXiEGFJ+SinbpS4W9IsxApOJqyBR6TuO3DVqZVkAxWwAZ6JnRu+kCyP
 Q1QL5lBz6ydKyjAxgFtXmpL4mtQqx2Z/ZcnLeo6nofa1KYedIdPdBuSJMyw0X6Y2l/vP//Mo8CD
 rZBp5O8KmEEYEL8TKc04oFgJZo6+j+k33T7RWBKdGKUWNi/6k8xxRtGjj4Pfb83rKIQQ9dGuIcK
 z1q9Gx56wZk+gDC46Uc3lFkEHjg17oZ4l7DHJ5YBL8bRrurh6zOSawScBpG++myqdz757aCTB+i
 8jeeJO2qcliEeZXNkzEIf0RCOUO11JwGisN1GbpNlxknu/cZmj3p3UgAYqMWgT9qBws3HxGIkiu
 j9rV5+5saFMkx1w==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id
 d9443c01a7336-269ba5443fbmr17909265ad.10.1758291917833; 
 Fri, 19 Sep 2025 07:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhYXF8gNayfDtVMAZtu5Cj2ejeBC3UGhLNP/r+xkffm7Fj8xDpKbRIE8ZT/eufoKRWOwTbqQ==
X-Received: by 2002:a17:903:338c:b0:267:af07:652f with SMTP id
 d9443c01a7336-269ba5443fbmr17908955ad.10.1758291917325; 
 Fri, 19 Sep 2025 07:25:17 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:25:17 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:19 +0800
Subject: [PATCH v5 02/14] phy: qcom: qmp-usbc: Rename USB-specific ops to
 prepare for DP support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-2-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291893; l=5530;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=0c1kjfygm3Igs/lmvv1odqP5mBi6xk6AIpYhTadaHr0=;
 b=iEaixY+Ne5VldK2dSyyOJobPiv4QW8bTGDhzcVkwAPKnBFpxI/jJqkimVCIMCkzCIFn3oJdjs
 ZtHVYnVVWq9DnPasRPjImBrckaYYIsNEg5FRPT2sP9N61+lXZMKQmSO
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: nRtoh38tkZgHGkDDnfGOYZXf5C4COrms
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd67ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=TrVKeqC-PG4e-vJ_ulQA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: nRtoh38tkZgHGkDDnfGOYZXf5C4COrms
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7DEVYZbeLu9p
 MygGTNJUGLo/PDD3rIF/bP/4h7LRIIP33zuq8/88BByNb3ULZD3d55UATSAiwINyJgnoU+9scXF
 P+Zq/qZQklPRhcMdQNUve0B9ootzdPh5CwOdNMGWwIV370CPy9nQ3sAje7Q9BEuPOWGulBMF/W7
 Ehnxpw4juSZs8k0++nNFmNsXo44GyeFGjc1PqKAOCpbJb+dCRSa6KzOxW0iNPvqch/0b0YGz3EY
 r6PPy6MC/dQxg3yctXqSXIGZgbNyrhm2tzn5E/6JoGQTUX3DgWiSEjerZyOznyGktCjAfvWLoG4
 e8EC8xcd3nOy/gUS89EM1K2UEOUb/svV+MiZLmJ4FBoAb7FEFCkUwHIxXlCoJ8fKD+PbM5AuCvb
 gU3X4lEm
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

To support following DisplayPort (DP) mode over the Type-C PHY, rename
USB-specific functions and ops to clearly separate them from common or
DP-related logic.

This is a preparatory cleanup to enable USB + DP dual mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 55 ++++++++++++++++----------------
 1 file changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 5e7fcb26744a4401c3076960df9c0dcbec7fdef7..62920dd2aed39bbfddd54ba2682e3d45d65a09c8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -342,11 +342,10 @@ struct qmp_usbc {
 
 	struct mutex phy_mutex;
 
+	struct phy *usb_phy;
 	enum phy_mode mode;
 	unsigned int usb_init_count;
 
-	struct phy *phy;
-
 	struct clk_fixed_rate pipe_clk_fixed;
 
 	struct typec_switch_dev *sw;
@@ -454,7 +453,7 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
-static int qmp_usbc_init(struct phy *phy)
+static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -504,7 +503,7 @@ static int qmp_usbc_init(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_exit(struct phy *phy)
+static int qmp_usbc_com_exit(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -518,7 +517,7 @@ static int qmp_usbc_exit(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_power_on(struct phy *phy)
+static int qmp_usbc_usb_power_on(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -566,7 +565,7 @@ static int qmp_usbc_power_on(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_power_off(struct phy *phy)
+static int qmp_usbc_usb_power_off(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -587,20 +586,20 @@ static int qmp_usbc_power_off(struct phy *phy)
 	return 0;
 }
 
-static int qmp_usbc_enable(struct phy *phy)
+static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	mutex_lock(&qmp->phy_mutex);
 
-	ret = qmp_usbc_init(phy);
+	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
 
-	ret = qmp_usbc_power_on(phy);
+	ret = qmp_usbc_usb_power_on(phy);
 	if (ret) {
-		qmp_usbc_exit(phy);
+		qmp_usbc_com_exit(phy);
 		goto out_unlock;
 	}
 
@@ -611,19 +610,19 @@ static int qmp_usbc_enable(struct phy *phy)
 	return ret;
 }
 
-static int qmp_usbc_disable(struct phy *phy)
+static int qmp_usbc_usb_disable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	int ret;
 
 	qmp->usb_init_count--;
-	ret = qmp_usbc_power_off(phy);
+	ret = qmp_usbc_usb_power_off(phy);
 	if (ret)
 		return ret;
-	return qmp_usbc_exit(phy);
+	return qmp_usbc_com_exit(phy);
 }
 
-static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
+static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 
@@ -632,10 +631,10 @@ static int qmp_usbc_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 	return 0;
 }
 
-static const struct phy_ops qmp_usbc_phy_ops = {
-	.init		= qmp_usbc_enable,
-	.exit		= qmp_usbc_disable,
-	.set_mode	= qmp_usbc_set_mode,
+static const struct phy_ops qmp_usbc_usb_phy_ops = {
+	.init		= qmp_usbc_usb_enable,
+	.exit		= qmp_usbc_usb_disable,
+	.set_mode	= qmp_usbc_usb_set_mode,
 	.owner		= THIS_MODULE,
 };
 
@@ -690,7 +689,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -710,7 +709,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->phy->init_count) {
+	if (!qmp->usb_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -865,11 +864,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 	qmp->orientation = orientation;
 
 	if (qmp->usb_init_count) {
-		qmp_usbc_power_off(qmp->phy);
-		qmp_usbc_exit(qmp->phy);
+		qmp_usbc_usb_power_off(qmp->usb_phy);
+		qmp_usbc_com_exit(qmp->usb_phy);
 
-		qmp_usbc_init(qmp->phy);
-		qmp_usbc_power_on(qmp->phy);
+		qmp_usbc_com_init(qmp->usb_phy);
+		qmp_usbc_usb_power_on(qmp->usb_phy);
 	}
 
 	mutex_unlock(&qmp->phy_mutex);
@@ -1097,14 +1096,14 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_node_put;
 
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_phy_ops);
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


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBE2B89E9F
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 16:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF0A10EA0D;
	Fri, 19 Sep 2025 14:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYoNGJBs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436BE10EA04
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J6jWDZ029503
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s8Gat07gp3MRVOt4L/O159z0k7jLmrjqvCt4T7tTz2A=; b=kYoNGJBsNNDc+8ib
 pPKFA6X9HZyMwtM90sOBw4APhI9lfXd4YL9+1TZY71KnolX35ZqJxVcsAWaPogA0
 0j9x9ZjdwYot1Pd1T7OE7xJZNjJnobc4pMH6JY8VzaVhxb8pEnnFnMk8kn8XbZwy
 yQY6t/SYQJN7llRf6NntbdnMfdhQvI99oqoVfSHqdrm6d67zuEhhvOhZTZA2eXXF
 bBe+TosxQdo6HpyR/eDoftakW7g5UcTjL9puKV8arBk8vMxIbQvYMRs2WsEtV3t5
 MGtpB2sk/kX06MNRSnsN4fADMUTNFQ9ek5VqGNS6H/eTD8aaWnvP+yAEtoKo5+lK
 Fawmnw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy12pj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:25:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-267b2ecda65so5435645ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 07:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291939; x=1758896739;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8Gat07gp3MRVOt4L/O159z0k7jLmrjqvCt4T7tTz2A=;
 b=Ea5yM31PQp0x/bb6wLMeMI7twXgvxJsXTx1EczwSOTn949H7+GqDjK88zUu6CnLJTK
 9ROAob04W8gsJ+Fa2qfuNqUdod78BIZvfASgrjonC9VEiFoew1XuI5DJCYAko/b/ew0d
 vyRpXxO2m3FAQ/mV+w2WbpBFcWuY2UQJ7fmCNVtHzhPtxOqEq8wPSyfqGfrWURs5AfQZ
 f1REq1bBHn77l5hQ2r1WDNykR0AlWPQ3twWZp256Tl49qdXSKt5wvPdbXzWsamhw9k5H
 o3nYIIiynH0KO0hMWc/S1Dw8l677G2oV7cHDbuYNDUqCsyd004Yg2HOMo3qWIqgYcLZS
 KaOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbnWrS2SaziGArQnrWoTi/Acr2hmHpPnt5EJrx5CUobjzAI5c8y4iMXyxf9VIYb1bts/JVSU4Rqnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuHLZUUHc03Ah6R9IrJvkdqx7o0GJxuoHlKUatMr/fA4uBcR4S
 XIopZ3roMgredTs597DS3XivTsAu7qmAFV6Oga20MdU1TEGJL3Rrd+EFBCR86Iv4b6XLTCZ1I0m
 QY61Xp2v3M918Wsc5rYDkhPXt0UzgYxDsiw9bBxeG98erfFwhfghhyO6K+NGW1CttHbGoG2g=
X-Gm-Gg: ASbGncufl0dq1vSv+M6UFpLS7A+UvuwDPnlU2PbbCS7lzQv0MicvUk1if3rDxynY+I+
 OWCeXacWcEL5rovwPEDf7lxrSFqHk7eVKcm9/S63y2wux46zm63JR3uXmCMmoAONZyi9V77+BzV
 UYinoyrUnHCH7kxiK0bnDZEZuQuInYsAPyfyGadq3oU2NEIIdxvGVAMNjL+JydhaiwfUQUe520z
 zofOQZORUsQHSvT5irC9oMuYe31zZYUi1QFEn6OkKrBLUoVZ06Sz7ZwEL9g1bETiIFVNpdUE8SC
 L8MVQNjgt/vkbV02sVfU7S9fuj356qo+T42GC2wO+F70y7f1cRgA65shwtDBITnlVAUTn3u3/wr
 lFdzp39ZvCIF7uA==
X-Received: by 2002:a17:902:e783:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-269ba524fcamr23697585ad.6.1758291939374; 
 Fri, 19 Sep 2025 07:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1kN5CdBbgtNitx8qEDVbtTkUx50Cb0tShRZ+81fS8AlMsoBbd1UoYI7x3OsJPQoi2b5RSdQ==
X-Received: by 2002:a17:902:e783:b0:264:cda8:7fd3 with SMTP id
 d9443c01a7336-269ba524fcamr23697235ad.6.1758291938856; 
 Fri, 19 Sep 2025 07:25:38 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:25:38 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:22 +0800
Subject: [PATCH v5 05/14] phy: qcom: qmp-usbc: Move reset config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-5-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291894; l=3439;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=u9wOAKxkjnamI2H2q1squA5Lj0dD2o8MZknhelsq6I0=;
 b=EpbxVqfS5D6TBeLH+5VJDRNxVNdHBlYL1HJL3hVzX00jjVkBmU6I99OLKvT9n5mef4nA5F7SY
 q2yh4lEpjsFChCZm6w6UcLrKNnVneXfAfMOtixmvqW4eKiMpIvPd7MI
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 7H1e5fF-zs3S572QXEBVcTB2sgAR9KxA
X-Authority-Analysis: v=2.4 cv=btZMBFai c=1 sm=1 tr=0 ts=68cd67e4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RqUhitWEW_Btmly2q4YA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 7H1e5fF-zs3S572QXEBVcTB2sgAR9KxA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2RiTkFutdvoZ
 FwDWtru0cNlHs39ZorTafkL6dyElUo84+HNL16ISByVJfPzpO/rM3Narfbt/xb5rOeXd2LDPpZ6
 jN0Ivf41z2D3hwKrV7TRnyvL5sii7aHBbV1L5C8eD0MGHQZ0l2Yj4n3IC1Ppca03utyNvXJvtOi
 b84LHIB+tB7c8HVIfmg3y/x4Cszx7fZXVt9JrcRWD61sWtKUcWWn0v/wpQdQfuLUN/UQ0kS2uNN
 xgsBDu2SwDRr6px5JpBBIw3wOrUK7V0b7sFQOJ8AtoZu9BXNW4WFpyPdDRqQpTSAUcqpATCsPnm
 gN6HRUsKANF3TrIZC4TBXkkzly4t4D8QaydusxzXX6vwA03L2sDoxpGTumg4IWD/HtViwkVCTWR
 FUOw1XKM
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

Move resets to qmp_phy_cfg for per-PHY customization. Keep legacy DT
path on the old hardcoded list; non-legacy path uses cfg->reset_list.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..3d228db9ef0882eb76e7ab9e82f8122fa9cfe314 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -335,7 +335,8 @@ struct qmp_phy_cfg {
 	int (*configure_dp_phy)(struct qmp_usbc *qmp);
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
-	/* regulators to be requested */
+	const char * const *reset_list;
+	int num_resets;
 	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
@@ -428,6 +429,10 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
+static const char * const usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy",
+};
+
 static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {
 	{ .supply = "vdda-phy", .init_load_uA = 68600 },
 	{ .supply = "vdda-pll", .init_load_uA = 14200 },
@@ -464,6 +469,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list              = qmp_phy_msm8998_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
@@ -480,6 +487,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_sm2290_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -496,6 +505,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_msm8998_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -512,6 +523,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -1051,8 +1064,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 				     "failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
+	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
 	if (ret)
 		return ret;
 

-- 
2.34.1


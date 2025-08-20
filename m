Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B33AB2D861
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 11:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451AC10E6CC;
	Wed, 20 Aug 2025 09:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cXgMSf3f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2F610E6CC
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oeSO010207
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AWgj+1YIpaMRY/yWhK0hs1P4y4VfFaoAvgfjBAJlkCg=; b=cXgMSf3fnD8zorX8
 JopNHWRQEAlnni3NWHN+ivR8Ct+zyyPUQ03LPJBqJZdjbLLkyUnX+F7knHd5WmYe
 GAYyIuu96X5M/MBcsZaoCNmsksAic8cf15FxNNpmMvy8aJGY7E6IWFoYwu13I2ym
 BJ8eBQ8PemGMtbAVxM3SAHSgtkxYKxkcAILQS3PDdiV3EApxYMWFeGaIWJdYlxV/
 vYWE7jvdhJ6+pdvq0BKm+SGoZupaEC0Bs1ofiEimBUOzhc5/tEztdVB0uDTVOYSB
 Es6p+iBbaLK8Ae2fGBZsH8qRP2Rs/2RqB9Oo8Gw91JKYDZKvdQxmyTnMw0B/Nolg
 7VCySw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52bh7pc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 09:36:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-244582e9d17so16141735ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 02:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755682564; x=1756287364;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AWgj+1YIpaMRY/yWhK0hs1P4y4VfFaoAvgfjBAJlkCg=;
 b=X3Qt9AnFIQHil6eFwA7OnHJzZ8SAEYoB3amg2PEBbr+ey3/TrlnKw1JZSY12MgjFpu
 x480pfkhhfRkRVOl8bMtVQfy0aD3WLn0LZuYJmC9jdRfkax87oB0U6fJiC9aoBL0eyPr
 WVxfjqkk3TUEJGGDAP3M8KmhTeHWtq8l3wfuipMABygpZMSMI0caXF+sPpzC0JFGN7Sq
 OowwRDBoD2n5BjwNxzQRduBHa2fVSSMRGj3iMJVv37VJrRBV5S950IQBTWDw99C88+zU
 aUQZXtnLssJfOWmSW6CHm71J5y8rdwErwaAVPi+CEhCF91g4O1YQJsqApP3UZ0nHQxPz
 nrvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNWZZZ00ffc2gqELrN+Kj9awkR4WPabywKygwsz1TFJ5G0D4mIeNH6ufJzTS9RghZlmh+yXmicL+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeBPmlwRWU8oheVXBWEypPUigW1L4PQmwF+Nsm5YrFLDolzECy
 RZ+hV1MuDL+kAlxks+bcMIlUU4x67JbwCKcfbVJVBxhncVhy6MCb3Pzw2DZL+xO9EEz4t+Zai0O
 4Nl0+bB1nLHHq/tCvgNIErJUb/23q3G/KxD/4vSWiCx3zwgfOQzq3TrLAKlqm8fNxTtSV6XA=
X-Gm-Gg: ASbGncvdLgw4igYZLTztRo2o0j0E8rK6MLk5lgOCxcVL7V8qgyAtqnkuPJG+MeIzCMH
 s96sDArHG74KTycv6mPwtS35/hY/LR5mFbWMfMId2oWLG3kE/Kz/7KJcQyqayVFnISKiVfLo+ro
 oyuQnALIxek39/3ewl2YPdXwhfccMOgfskZsiwwJTtn7v2EewoEe/08cLrsuRxS8mXHxxeAjUs1
 zw+LYzyLS1UAlKBy3DvuTbHE/ixJy822Zqtt50vx7+w+pA3nXxiZMH38LlJtqTIqCNHqEpjjpth
 RxegDd8XqB/g3U/6JmQ1UhwZyX7M3rdLUCHoUUVpl72wvoDICecPl1S4mHmnTnmRyvSOVd5h3lw
 H6c5a0VyNRiUBr8jdByDoHiJFf1f30Pc/u3fIsAN5qAC3py9IpxisKIvQ
X-Received: by 2002:a17:902:f68e:b0:245:f771:4241 with SMTP id
 d9443c01a7336-245f771442amr2583675ad.7.1755682563896; 
 Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9IDMLLuCizqDn1Eie9iwbgkWU+1zGOnXJZGc8mc4IQjEGtB2REIhr9sTL5kOXEZ1CIGViEw==
X-Received: by 2002:a17:902:f68e:b0:245:f771:4241 with SMTP id
 d9443c01a7336-245f771442amr2583365ad.7.1755682563442; 
 Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.35.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 02:36:03 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:46 +0800
Subject: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=2215;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=L77RPub4GUYm5+EpcE6zsdJ8e7TcjMW6KL61o2Mo0ZI=;
 b=DQ0gW20v1QwVf9ZNCC8n6LW3iHDlR0KstZhA7x5Lbvq9mjFrBMw+JkSg2jH/jW3XPqEVnFNMs
 VC00FmcL4nJCkp/c5mYGZ58jPMhHMU8LWEPS3yPwz4BZVLeNkt6MXYj
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX5Qr0Ej+u1LRm
 CXYL9L9Isgi5RO0Qyj5to0pu6J2nHUGnltpPFWT1jsVUZMb+RM/I1G6b0UWIEDXiSetlqOZMWoS
 UQdEfrDFvtsofztFJ6EV7/MY4wyxRliXImNpwCpqBoX9BgRyZTf0kPmFXKxfGXOgH05hLaE4odn
 br+lo2oFl1igvGILIhdgugA6L9bGhnS44yxCkiOOlQQvxIhczCeNxRbAoigSpWgIUmETQiY+4u6
 4QD05lOTEYt7b6gcuqrsaQd6p5YP9E9Cxz+Cl6MFBOOuCwhTEnLfc7mP9jygRRc3/Imt6gO3Qsq
 j0vMs9NexnxC0ZFYJsS61scc7OH04aFh+Ledv27dpzoo/B326//UVEP4lONfYmuuOvckaEfoyjA
 jXFKhPupD8Q/GFRfUo5TK8Vqdbi6GA==
X-Authority-Analysis: v=2.4 cv=cr3CU14i c=1 sm=1 tr=0 ts=68a59704 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FzSNxF14YNJ6EpJegcUA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: PMVhVgt8Tmj-Wp9r55GAEG_b6xaWyX4O
X-Proofpoint-ORIG-GUID: PMVhVgt8Tmj-Wp9r55GAEG_b6xaWyX4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
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

Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
differentiate between USB-only PHYs and USB/DP switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+enum qmp_phy_usbc_type {
+	QMP_PHY_USBC_USB3_ONLY,
+	QMP_PHY_USBC_USB3_DP,
+};
+
 struct qmp_usbc_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -298,6 +303,7 @@ struct qmp_usbc_offsets {
 /* struct qmp_phy_cfg - per-PHY initialization config */
 struct qmp_phy_cfg {
 	const struct qmp_usbc_offsets *offsets;
+	const enum qmp_phy_usbc_type type;
 
 	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
@@ -408,6 +414,7 @@ static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
 
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl             = msm8998_usb3_serdes_tbl,
 	.serdes_tbl_num         = ARRAY_SIZE(msm8998_usb3_serdes_tbl),
@@ -424,6 +431,7 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 
 static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),
@@ -440,6 +448,7 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 
 static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.offsets		= &qmp_usbc_offsets_v3_qcm2290,
+	.type			= QMP_PHY_USBC_USB3_ONLY,
 
 	.serdes_tbl		= qcm2290_usb3_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(qcm2290_usb3_serdes_tbl),

-- 
2.34.1


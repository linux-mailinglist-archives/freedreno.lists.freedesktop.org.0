Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 390DDB9DC33
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 09:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B6A10E857;
	Thu, 25 Sep 2025 07:06:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h7wC7Db8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA82710E858
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:56 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Wn8W020144
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GrguMAXW+fsIhAkyrPq5HAaKMZ1Mc4h2NG633gQkApg=; b=h7wC7Db8Qy9+pqRg
 27cIvsmRzrzh77Y7Oni14zgKZ1z9R5KMU7kktkrm4RTLreYWhbJX9YwFFW3xpkw3
 X33ZSCuAtnjH+m2Gcmx0t4+agws4INoC9r0A7uqOfAFLfU+sb3gtwZnodkNFKTz2
 gMCqV5B2WHBcHQJVCHGChQ0lSglrVKZVyPoOGpkIVEIF2mmMZdtblruMcHvwO7kE
 XyjgCMTcp994DuWkv/2gqRaDao92xMk04VcKL8yCZ6Csaxh23OvKckYaVfpdFJyQ
 mLs20y/PXl0yOvtFDe2l4/k6vv5yD1kep4XiCmIDE+HRZ9svAGSymsxt5H3sRBNF
 j1dUaQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpe0c0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:05:55 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3308c669152so189384a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 00:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783955; x=1759388755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GrguMAXW+fsIhAkyrPq5HAaKMZ1Mc4h2NG633gQkApg=;
 b=HHae0i/+SAKGxw1kDGdqVnUgtyKxMhaisWbtke+3rHCFjgqCXqWOtEHmMBDDANz3ys
 Mj+NuWYmivGB3hS6e+IdWGpccXnNheu3gycKK0A0Ycc/bmyj4lDhfU1QXQmBLOkmK6/n
 k4cGaVqwO18RiXBZp20xoSalUmGf8V/isWn6caWTmGYxHYWZ+vT2ffUtZdu14cfUrs8+
 +DpJUJyuFmkGEr71ENunLr9ZVg6WrK4Kmi6/iDYKqoZq16FojqSPPjI1efvQbMjaXHOS
 YOL9OGbGtGwmR3mIQi7L/BUL0OGU1Y81fMneVx6LvI78KwLXQToLd1HUTzEOT5wl0jc5
 ItWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAQAj/GvpPWVue1QFQRG9HEfB/0cmKzfApTJpu550zhzSdQULqnnJxvhui7FJjOp+zoyxq0++gGvI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxCH4KUpEc/8g52NpXqdIdmyGlakOQzvqsJrHiuPe32OA0ZsV7q
 RNmmotVjsPzQoPc7vIhWqEjRrY31W4pvA+DIq5uVqalu8K3Q2ckHovkMc84H4Y18oIlYkKkrDPZ
 3cfv7+TTPzyiawRR/VbNvZ9i9ZXdNXJiS2nrfECdf+OINJV8V3gNOvAEPiMlrX/D4Vy4jbIM=
X-Gm-Gg: ASbGnctCCLg2q5gsLLIY35cN7NPORdO6OYc93U85YJ5/qWLF2IroYwqT4/RGVlNgJle
 3MNNM7lPcRyjhhOUAJuUiiwtUQtcC15bwtlq/X/Bj/hK7b6M5zukhrol7PloVmJPdbN8+kmcxNr
 kv1OZSvjFfXf0oecAbuUMUuUHgueSNLYC0ONgUAO5W6AtYhn1yrP1OIAeaArOKajL+reMVtAdHT
 PzaXfWWQdMA4n9PFaNQeBqMfuHVKv/NaVzOdM0np0O3n667s5AQbw80MJjlj9MZQHcEnbTsfszf
 Tt2QlU0LVu665hC5vaFMqnvZwwjC9UAfrCirw7aK/KKQul725W42UYt5oDf9XdGDHdsfOELXbfa
 /pEv8gf5/GjEcXXIeKOhjceGOkhvBUNpHNYJ7mqGfTdht3NnzW0GeDwcF
X-Received: by 2002:a17:90b:4b87:b0:32e:8c14:5cfb with SMTP id
 98e67ed59e1d1-3342a22be84mr1423263a91.1.1758783954706; 
 Thu, 25 Sep 2025 00:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiGLGl2UMupnuQtpEa9ZZfBh6eqEqcbNFWWTUDdSOwpa28BBCD0SysDLrBKUXsdg4C53UiFQ==
X-Received: by 2002:a17:90b:4b87:b0:32e:8c14:5cfb with SMTP id
 98e67ed59e1d1-3342a22be84mr1423240a91.1.1758783954248; 
 Thu, 25 Sep 2025 00:05:54 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:05:53 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:51 +0800
Subject: [PATCH v6 05/14] phy: qcom: qmp-usbc: Move reset config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-5-419fe5963819@oss.qualcomm.com>
References: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
In-Reply-To: <20250925-add-displayport-support-for-qcs615-platform-v6-0-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783909; l=3308;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=xkXgNM4liwYFuSUu6liFsyLgM/OZQSJZDsJNBIKnRJI=;
 b=J0gdvfqjAFOidyttJubhcvzBjqP1Zm2wCBXo2NSulNdAolL4liaYtKEaBz9IcvDS151zoaVyg
 bqAqIBWVTU1C4VROc9+fi0LDhH2w5lPAT/FoB4VT18AwGr6Q8XpxwWx
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: HO5nWik1q6lznAiqCYeNIlcGNh2eqH98
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d4e9d3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zr9GHpnC6WUyfWqp_BsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: HO5nWik1q6lznAiqCYeNIlcGNh2eqH98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfXzMbwSHaF8NKb
 yf0nj1ydq9XN4F6V0xfkkzvlf34+/g+vIzVykbQzBzuGZj2sriLU2Kk4Y7G+MqPNV2a7Q/hGrVE
 yiSBHDbAA3KjtJ7QEG6m4ailkdQPkC3ytlXQSYaTIrPx8JdIEZTE5yUEa65tEUxvIC9iw4k77Og
 glyKyOHpeibKyBAsaYpHkrOpF8O//ajahFlskk4HmKvK4lHFRqigTUnRU/SLpqIV/rpYJIPdV+/
 J3gslf5DK1/srPbe+PHSrAcH1vaYplE0MitoQ4n6UKCI7lWypIcuCWwcDuXWTEM2Xz7sfbwozIK
 h3pAnplWIQDMRDYlPtPabiz5U7zgNt9nWznhheA2u5oHVCPjWp1WH1bxtwl/rjRb2jGb/n/cdNs
 2esKfoBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020
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

The original reset list only works for USB-only PHYs. USB3DP PHYs require
different reset names such as "dp_phy", so they need a separate list.

Moving reset configuration into qmp_phy_cfg allows per-PHY customization
without adding special-case logic in DT parsing. The legacy DT path keeps
using the old hardcoded list, while non-legacy paths use cfg->reset_list.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3b48c69f9c3cb7daec495ebc281b83fe34e56881..f9e20f43435c050e33e9490343a4693a339d692a 100644
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
 
@@ -464,6 +465,8 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list              = qmp_phy_msm8998_vreg_l,
 	.num_vregs              = ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
@@ -480,6 +483,8 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_sm2290_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_sm2290_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -496,6 +501,8 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_msm8998_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_msm8998_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -512,6 +519,8 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
 	.vreg_list		= qmp_phy_qcs615_vreg_l,
 	.num_vregs		= ARRAY_SIZE(qmp_phy_qcs615_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
@@ -1051,8 +1060,7 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 				     "failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
+	ret = qmp_usbc_reset_init(qmp, cfg->reset_list, cfg->num_resets);
 	if (ret)
 		return ret;
 

-- 
2.34.1


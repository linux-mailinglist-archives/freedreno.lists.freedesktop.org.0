Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E89BA2B71
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 09:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DED10E9E2;
	Fri, 26 Sep 2025 07:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Am2o/AMX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2986510E9DB
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:49 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6wbZX011330
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 psRlzFRQmGXeUGSfcVjnYNDBFIL2wBL8tNvEcKPV1ss=; b=Am2o/AMXBkDOuFFj
 BN0xG6G7ndAIzTRIHxAE36OEiTYgcM1VU8HPwWUq78Ip1cVhmPlC6GD7FLsngtG5
 L/tZDjrIxOIUpVd0LVxZ0w9yLI+SDdsT24k20+VGXTA2TleoODYzrhjm2uINyXFf
 ZiWzyR4PucPH7V770vC9Sr9LT/Ine0VUnMF5iU2XJGQe404VH3Ghd7g/XZ+dNasA
 IejgBMNV7XNTSn3TNBlQnsmbTQczcuRvV9DFkfrdD5Cq14vTg3UgmRuyGP5NkDk1
 cnjP+YNvxyfByuS91zl9Y65E1QPvjSr/utupNvDqAgKThWBsUq88H3NZ7L6X/kbw
 GDWs9g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1w2h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:26:48 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b551016556eso429663a12.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 00:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871608; x=1759476408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=psRlzFRQmGXeUGSfcVjnYNDBFIL2wBL8tNvEcKPV1ss=;
 b=w7psLPwmPJTf4YEQKeluVQtd11qZkUd0exGInX/S+cQTlf+JYLjVSJHdZIF4QYvjoC
 oThsVZGtLYKkO7OjefHrwzJ701jnTfN5i96y5SQ3BBJKyKJpSYRJyGbCapOnX7XRxCeo
 V1tD90VtnD+m4VOcf5DYz2kX+Nlwt/5S7dERY3Iu7N1wABrP66ZfaEC00bzCA1sD2yYQ
 hk7w0/vW4aL7+Toly7Mqq0znZzBCAMSkqfcZBSLaHRwK+4IYquCe0HEEpx0D6HytGAoJ
 dGQgXzMa0w8VT+99FaoCJGvYIuHJsUWrtVsVkNQL3TOfu/WY338dZA/snJ5CyGdRAkfr
 +QFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZIHtGwsZo9SH0k1ebEg9HtPKsw5Z28dF6lj4PoE0C0iPjO76cYS41aNWUCsfxREvT6lAExyMrVj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtF1Zs4Lu3GixX1+BZ5YqeBH4JCEv4i/rgo0QbTyiF/kJm1Hte
 Td5X8LbbhDhj7KtfzgtDJjOXHj7//8Z0u+ttHdU0zTUZdAN1G4BSLit6Q+OmmlIn33xj03H9jhq
 HdiZqse00d/Rp6dgGzqTWzvK1ZaBTlyVyuPRL5UcuHcZ3Pt5eA012V4dmmSPWGXd9/r3MMkw=
X-Gm-Gg: ASbGnctNWvlXWgu2pP1hHMkVon3hYKoqs8AOWYkd2MTetqClYuUU9c+HcVmADIH2P7H
 hZUV1Evsm2myLbUuoMRPTgilJde+OW+yIw/HCL0i2Jwv8ic50hySAYK09A2jw837Ay8jlgAuTtR
 0UQtIwr/PwfvlleMoOj8/7F615+xrHqbN+FH826YAgLgeXkUCRmu8xukKRheu57sLQspGN9qmr+
 tErxPEdG6+2jJW9ZMh8aVJ2/sG8ZruVpDVLD5M0uJw9Pa/tffACDPqDcQXZTPBPVULZzlAXU2sT
 XkcOi2JMWrplNkk+mn2wue1X+vMXecZ25pi7l8EuQCCSNV8cgiW4Bz2RBRAtx18lVidEG1lPFTY
 IRnBvm3lTmqx7I7hBMD0XVTPEC4SYIgHkXgBkzWTaindTsrQHM+MXcydV
X-Received: by 2002:a17:902:a507:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-27ed49d5fedmr27989865ad.4.1758871607676; 
 Fri, 26 Sep 2025 00:26:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxSAyhiw2MTcI/NmqZ98HAKqPc0hfqQBjKkbuKjAc9epuCdvKvreEt1D4+pSfhH0QsIo9TKw==
X-Received: by 2002:a17:902:a507:b0:25a:4437:dbb7 with SMTP id
 d9443c01a7336-27ed49d5fedmr27989565ad.4.1758871607181; 
 Fri, 26 Sep 2025 00:26:47 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:26:46 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:41 +0800
Subject: [PATCH v7 05/14] phy: qcom: qmp-usbc: Move reset config into PHY cfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-5-dc5edaac6c2b@oss.qualcomm.com>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871563; l=3375;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ELWG8LiwmiYEyfPeDUlMXNqM8qMgGsCS4xblAlTbEJQ=;
 b=zmaVB07r32HmpVtcC+B5C54IYIVDvs8vEclG5sjAMe5L1XwWEnY4ERzGLG5jFl4Ib+AzZzwOO
 Eh2N5d9F6fcDBHXUGGh9YHirwHvVYYYGpwjrhJLv5FPRK30pA0p4H6/
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: iTCuIATznp10-HPotnEsiVxoh-yVETFL
X-Proofpoint-GUID: iTCuIATznp10-HPotnEsiVxoh-yVETFL
X-Authority-Analysis: v=2.4 cv=aZhsXBot c=1 sm=1 tr=0 ts=68d64038 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=zr9GHpnC6WUyfWqp_BsA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXz7NNvkR+4iPf
 JCDEnGC0bW0yUk0qw++oALkJei+x8R+7637mq14t66hzPHAACzfcfC7aUTrXK6plLd2GdPWqToj
 Ja1WYhnDjiyXv6e0iOTlggPH0lR+mqYxOeq234xfycyGV10kS/DhcmJelrduTF8SHv5luPBTUcI
 eBrle8wuH1M8zTMtR8fnM1b4hZ4d9zxGrNVJg9fDBfLbQg5fskK8LBZt7xjEXnhurWc79EchQG1
 ubgujsMtpvAONQxCEW8teYJ84X84XqhCXS2W0iprxDqWouIXLuxHdWcBW9fArAILZeWtI+TnFi/
 Ewur2guOEKda/6InxWbNNNGjLKGGfMwGqM4fEpLRRiWyAGC4/k++oxjI4ZO8dmp1YA5ojauL/xu
 Jyc3/7ehvb0jRVzLUHb78GXXDd0tqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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


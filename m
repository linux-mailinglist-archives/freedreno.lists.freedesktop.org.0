Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA46B9DC54
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 09:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0966010E851;
	Thu, 25 Sep 2025 07:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SS7SHXn1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E0210E857
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1J9XA029706
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lBHyWqd8iRjW0Q2gzYVRQmCW7nBgory1hKdsYJUUAsI=; b=SS7SHXn1fvLzykEc
 0Ap2j9m9oYum/DQncO9UNXAEJD+XnI8xthQmRUxhYA8MI/G1KRyT9T5yebI7Wkg9
 +p+eu/Qy2UCSbsJa/wV1IPn3hTm1bWxGXtB6gds2zxxgOcfA+a0tZ61AW7/3C/3E
 QDxGceboO6T0JtHL+vM3Nje/7xq0mnPXmTp4MIIbQf1EficzJXOaCNjRrXzN6uL8
 ckR8qAZg4uY8F1W++kctB5BJA/vxN1LgMQuY5O2YvPsIwF26lH3INn6WW1TMc8/q
 KHxZIXWyWx0hCkgKhdqabpgPeumN67GNOLLkeGvzDLYxIq5q6X7WCbEzeNp9UIHR
 Pyx4Kg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fq14h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-32eddb7bad7so188757a91.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783975; x=1759388775;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBHyWqd8iRjW0Q2gzYVRQmCW7nBgory1hKdsYJUUAsI=;
 b=htBJAhrlVFMnIi2osCmHg6wPKse23LPbNqIs/SH/NpDxMFdHMvilIqh8pfnFStppS5
 ws7aConkdELIX/emBz4u4duNMapPTBTBQiR0DEAd7mqqJ5BtvlEedC6zDLDDVIb+1ZG6
 QmPXsSP6t6YkRosCnRRjWmhoQsTQ+qyNiFNCbe4F1NB0TvoTSosaSaid+4+l3qKRrJa0
 Nm8ycFRqpVIz+VfTuzyEXnFJIjJt9YM99seaDLy0ECbmG0KRjaRR9kM+VmfJOWzFuhmH
 uUHSlhXdGMefCFKMoYUS6/7hF0apzZzUtarQFtON43fT/BN5XUU9Nk2mahjTu1PKHuR2
 7l/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB0B+O+IhYxCWODep/N35jF1auOkQUSsnIxxWdZrsSKvsGvbSr/6DhmKSyXYpdI7gY5+UOdCZuvDo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxmpzr71SI6dDddXLNR8kyuv8JBmLcZjDpxJ737FLnqxHQd3gvi
 uClGZ2FFxyXINSjzXyDT/Doaw5NrE3pwqJW77/Q/vfadlNL/ovZrQp6c+N5+nTDtYZKNQ30I3h+
 Nak8K4pZHyxpx7o8kcyvRrU2sJvVRn95qD4qvuj2hX6YKJVGb1FFPeXJxrAKBwnPmjZzZEcY=
X-Gm-Gg: ASbGncuenpz5mUv+VqM3HzwbBHLIJX0ysnl/HYH0p4lsg/o+3wxMi+BrG8kzWxW0Hr2
 ynTlIBJvOhX243ukNV7ghGmMG3owMvddBIYYI8s/Pv8SJqQMnMg8uQ2mizDdlP8XV0Us+jOt7Ny
 WFKsORJ3IHfBYkiSETwEQ0qJ48w+MeC4RHMDmYPbVSaJgOrEVsSdHFBhr/mL5ErWkBFeD8CBfcm
 Ko+w5bBl0tuyOKGny6GoLp+xtd9XQa4E3X1l+SRTA3Nyh9758L1IKRY2lyq05K+QWpwZ8IPauEx
 w7EktoXI9VO4JZKsmXped5qsbAeyk3XRyOVG7Lddqjt/VcZ7hTIMOT0j9ZgqapkOdObGBjyJPbB
 Kqsxuh+/gI/R0wPIKRplNukdPSUBm7+ZE8dSlnxV5YEZlY6FN5t1TsDme
X-Received: by 2002:a17:90b:3891:b0:32e:1c10:74b with SMTP id
 98e67ed59e1d1-3342a2c1f8cmr1565036a91.4.1758783975041; 
 Thu, 25 Sep 2025 00:06:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9PP9NRgLLd7lkeJWMJjxqz7UqXV5q8QhfzEDlDV91GJHtJb969F2hLbbATzfgyQE8+9DfTw==
X-Received: by 2002:a17:90b:3891:b0:32e:1c10:74b with SMTP id
 98e67ed59e1d1-3342a2c1f8cmr1565019a91.4.1758783974615; 
 Thu, 25 Sep 2025 00:06:14 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:14 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:54 +0800
Subject: [PATCH v6 08/14] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-8-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783910; l=2826;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=oQp9DwFQdYQWDdvU1iDKEeRn3mcSQ7RLuxSrcgehlKo=;
 b=Rzq0VxNC+esKB+p27CQHdyn1Ug8EFPjuJyL9kqeUF17gLpHRcSFrh6YDcOvfKUy9wHgBIeChD
 AxWN8YO+ZkFAygzyS7hlykxV3YItns9IThiwlgZGxMb1LAihWPB/rjt
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 2zyGhbh-zbOoRFek1zM9UO7KLkANIqEd
X-Proofpoint-GUID: 2zyGhbh-zbOoRFek1zM9UO7KLkANIqEd
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4e9e8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NTL_5ILWjaOn02JYBUkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX++f5ldCyYWMA
 oJIJNaH64Rn5BYC+AXs6VdDdN9VliH6b2U4fYEPHVcuO6XZv993p6M/wfJg5YaPWMuF8XMoqJaS
 6z2l3b8rhllQz97rEd0bnUZY5pHOvIB70z4KnIKCGmBC7uVpiGg7DfevYCOktqPIZcaUVQgmHKX
 mk9ALal4urpNo95LVjCQU7C2d442N9SUv2/AfbU1kj1EVPgwRGigmh9iuWULQbPFstU9dz/hprl
 Njm8Sk6sWU7oYaiJp3+cc0ZEhsri5BbQFabRlkU6x8IsO3toBLXrOTWZa6Uw798VzXzlSbeZc1V
 dzb5hz6GjK7jYRJa1TvNHIaxSKLxy3ow/+7n5DevV1sIV9Vjh6wQy3L85QozmTm/mC/dmDwDp0m
 CtDtM3VP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037
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

Extend TCSR parsing to read optional dp_phy_mode_reg and add
qmp_usbc_set_phy_mode() to switch between USB and DP modes when
supported.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index a971bdc3e767727e69ea07b14d9a036347d365f4..fab6ccc4a5f12a4096e9a71f066f8ccec73adad2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -529,6 +529,12 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static void qmp_usbc_set_phy_mode(struct qmp_usbc *qmp, bool is_dp)
+{
+	if (qmp->tcsr_map && qmp->dp_phy_mode_reg)
+		regmap_write(qmp->tcsr_map, qmp->dp_phy_mode_reg, is_dp);
+}
+
 static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -669,6 +675,8 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 	if (ret)
 		goto out_unlock;
 
+	qmp_usbc_set_phy_mode(qmp, false);
+
 	ret = qmp_usbc_usb_power_on(phy);
 	if (ret) {
 		qmp_usbc_com_exit(phy);
@@ -1113,6 +1121,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 		qmp_usbc_com_exit(qmp->usb_phy);
 
 		qmp_usbc_com_init(qmp->usb_phy);
+		qmp_usbc_set_phy_mode(qmp, false);
 		qmp_usbc_usb_power_on(qmp->usb_phy);
 	}
 
@@ -1263,15 +1272,16 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
 {
 	struct of_phandle_args tcsr_args;
 	struct device *dev = qmp->dev;
-	int ret;
+	int ret, args_count;
 
-	/*  for backwards compatibility ignore if there is no property */
-	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
-					       &tcsr_args);
+	args_count = of_property_count_u32_elems(dev->of_node, "qcom,tcsr-reg");
+	args_count = args_count - 1;
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg",
+					       args_count, 0, &tcsr_args);
 	if (ret == -ENOENT)
 		return 0;
 	else if (ret < 0)
@@ -1284,6 +1294,9 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 
 	qmp->vls_clamp_reg = tcsr_args.args[0];
 
+	if (args_count > 1)
+		qmp->dp_phy_mode_reg = tcsr_args.args[1];
+
 	return 0;
 }
 
@@ -1319,7 +1332,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qmp_usbc_parse_vls_clamp(qmp);
+	ret = qmp_usbc_parse_tcsr(qmp);
 	if (ret)
 		return ret;
 

-- 
2.34.1


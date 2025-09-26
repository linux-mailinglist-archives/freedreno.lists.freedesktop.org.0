Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F02BA2C19
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 09:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A87310E9F7;
	Fri, 26 Sep 2025 07:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZrHsPoM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2189A10E9EF
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6nmWJ027878
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BBnKAQHtJIUzOuuf/k4xFN6GQiHRN0JpTaejw5fAgk8=; b=MZrHsPoMJRf4Qv7t
 g/gyESw15cUBoBQ0NM7U0rvmGcaabIU1i9HsyOExSPgwZ1Y0OFNx93A0GNbAvuaR
 C7ahVwfEwmv2FxHxBhTza2NEKZ3uHzYqJbf5qOdFRcvu/q2y1nvr3qI6sf4T8paD
 JbYZyLtyU2abpbrfU292PyoBMkzcplJedsbXatYBZYPWY0qpN6CG8DuPmfJ60YNR
 ZybP9POnattamOTLDX53KBNx5nOEz6POTf2oG9L4xDuBoBiLkOv3RQt8OsAi9/N3
 KL/OyY1vw9KzgcIJrDLIOltl5Ksz5Yj6fThvRDApV3cfj20RFODrTIDLe9EjJLVL
 FFx2NA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u1vtc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2696ab1bc16so4925895ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 00:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871643; x=1759476443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BBnKAQHtJIUzOuuf/k4xFN6GQiHRN0JpTaejw5fAgk8=;
 b=il4qqzpHq+8g/3/WamrnKnBvblPUoCP91Yc4ABclwrD5fMpczY9CSt9M+alI7HrrmG
 B3Jn/rk922CY2CCxeobXUhxUVHaJBOx3lvhTw48K9u53Z1jf4oP0GsPp/JeF3mgdkqeA
 Zh+S4M5cxbzoDRuaX1N63oqyvgxLYqsb35Dr7htZ7LnvVRR5S83RsW9w6zjktEeQqN2C
 vZ+agyjeZPz60xNNECAJj5u5RtMWglyscleIs87fU7wdwhTozkp9nhObulx82QmUBYsl
 hkcKyUfgfsL5fHi+B6sXWTIQvrzqYFKi1Z5z7xJpQqOj1M5CT8qm+8qXtvhYIn2lMXCi
 +kfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnfSAoeUE6hnxnUBZayFgDo4tEHlotajtpdWhiHd+kimUTrUH85MuIiiB0fvhdr9bgo1/YbfMEEjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYj7z4K3i/SSpBsYjjLxF2lgDzYr8tskXO+d43qf2iPFuyFmqB
 kEXA5fA/3HwWbuG5Uli7S+3g8DJWlrSbPqNJMC8C506zaKGUy2NgAOLytjNsiaoi1z/lGqQHjsy
 z/EPuEcETeB5dLoCprlhRPufbGUJ4MkPu5EAbRIr41eMMacsyYVUGeKbxxj/oooBykwPCdj4=
X-Gm-Gg: ASbGncsYH9LFM9puVLDkKg4ItDp3HtB1i+BDh34Mn6sjt4lRQDXFZO/FT0vw0NSyFS+
 GlX9Y2DslH15tGU1F8MopmGq5e9MKNVbMHh5i/bt/rnjW3bsqtJxmY8XJF58yAmG385N0WTXRXP
 ZujViyWuPkwJe8zSQ7hIdLMHPXiLRlqPB+6meVZ4W+R2XlyKCZZ8JRW5jabApe53Cbc0TUUzrFn
 6BqUER+mwAoYkdDjl7cMsF+6uFWiyEDeWswOHWyYdSfZVpF8u2C/ssF2CL3p1kOzmCvK/tHJO+g
 6+3hGgr84W3SK7qVVXRrD17QIPo7iz9ji73tLcjIbhjgkNPT2/He4Cm7OfdcliuQCw0a0HZ/rJe
 6c+yqQJUQ6kuKf5zeSi2Wqln1b6XFepN+OyElbQfE4/vOdIYHrbV35m6e
X-Received: by 2002:a17:902:db11:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-27ed49df69fmr43571355ad.5.1758871642881; 
 Fri, 26 Sep 2025 00:27:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTX2igDAbPEs0gasTbZkRY3PEKRg6iD3OO1BbSDu+8oSgdmgCgwl1nIHEcronmpOxG6BZOag==
X-Received: by 2002:a17:902:db11:b0:26b:1871:1f70 with SMTP id
 d9443c01a7336-27ed49df69fmr43571025ad.5.1758871642379; 
 Fri, 26 Sep 2025 00:27:22 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:27:21 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:46 +0800
Subject: [PATCH v7 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-10-dc5edaac6c2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871564; l=1933;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=DPKLxEacqPPVPld/3Cw3ossBUvxFPG/ElRs6jI9aG+g=;
 b=LKwRqi1oGH1DuHLM7E16LiWfNw5DOeR+8o8s9eF6SZvkMm3iSdaWji+J524cD6f83xQZU7P4x
 jx9iHVmnqEvCOsMZMAFLUJLwoQrBPzoPBnQelsJeE52ZLRbP7VKfXfm
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: 8HVG8JdTWiMpMaEIHzABndEZHpH0nTgR
X-Proofpoint-GUID: 8HVG8JdTWiMpMaEIHzABndEZHpH0nTgR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX1bhzn1rPgtFh
 um/CZQtsCwP94YK+BWiv5rzjoQzJD2gPcEfCNaLUT5Ys655EhGwqo9pQjay/4mxqASxLUXOOjEk
 kC1yH0p8di+0mkr40ZUj036uxT6ZhDPCLD2G/YdPwDuXpIyHaJcajFgpYB1um1dfRmLFYWhLW28
 IDdJPnHy+6XMG2dBtlFFbU3qwUK4sxl/T7BtO1HYsVW7Y+HiYNzmhLsZPdHOykAA8mRl/GEfA+f
 /rzVyI6PvezEnqPEuTzMs/+VpV6o3d9L4TRqLJZzCE0jeUmDYXYH6gE4967suwaIQkwBwIN0av3
 EPhQ/Sc/cvEyVFyrCUppWB3YZsCZ/PCWFc7HYpIJl1hUvepJX+p0WUlezcCDZ62+1nMTQ3OykOm
 VsfMGhmSj/Rf+GETGFvItY0434Od1w==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d6405c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RloG_8Ug8mropJZ47ewA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
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

When both USB and DP PHY modes are enabled simultaneously on the same
QMP USBC PHY, it can lead to hardware misconfiguration and undefined
behavior. This happens because the PHY resources are not designed to
operate in both modes at the same time.

To prevent this, introduce a mutual exclusion check between USB and DP
PHY modes.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 3580c19fd62e02aa373cec42e9f53143f39214df..d84bf68940043bce13565503bb34796e653adbb7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -666,6 +666,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_usbc_check_phy_status(struct qmp_usbc *qmp, bool is_dp)
+{
+	if ((is_dp && qmp->usb_init_count) ||
+	    (!is_dp && qmp->dp_init_count)) {
+		dev_err(qmp->dev,
+			"PHY is configured for %s, can not enable %s\n",
+			is_dp ? "USB" : "DP", is_dp ? "DP" : "USB");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -673,6 +686,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, false);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -726,6 +743,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, true);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto dp_init_unlock;

-- 
2.34.1


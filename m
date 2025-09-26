Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C23BA2B95
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 09:27:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2870710E9E9;
	Fri, 26 Sep 2025 07:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lkDAmd/c";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621A310E9EF
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:11 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q6YQcC004260
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lBHyWqd8iRjW0Q2gzYVRQmCW7nBgory1hKdsYJUUAsI=; b=lkDAmd/c+gItPHky
 MG1ymVUnjm+C75EZKgwjM5cRBYektJOe3+J6v1OM4GtT0pXLwPknTxX/z+kehlpS
 1qpPRhY35bCN7Nz4JtSGWSK1+xNdS3+PzAKJGeSm+kOtqaIiUhoRLOs1hykqfXua
 XEryZK/0xKFyjhI1iv70tJ8UTgTi+1HvmsZ3H5dLjQajMPTr9elVEou+W6PM0UEi
 CScAFHYyQoUcpYtxcq6rFJWBc9A/GT+nCfnwYBx3oLh1XfcSkyiJ+TLi+Xj+jzm8
 Aq2TL+pPUyTM5P3DHqhKOZavvkRIXAq6caHglKort7bfbvrrOt5ngkkIrv405vEi
 VCqykA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u1vy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 07:27:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2680b3acdf0so4403005ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 00:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758871629; x=1759476429;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lBHyWqd8iRjW0Q2gzYVRQmCW7nBgory1hKdsYJUUAsI=;
 b=Oxzeugn4UlVJxfCTTFTQ4PLSVoW1p7DgOadr4oseIqo5G8IEmCjs3I3q+W7DXarELs
 LmDmu/Ir3r3efkKQaKGHzBT/FNiGGvW1y+YCw70s2MSVqua11dKflwCOi7aXqAGrEcw4
 LNeeSi4NOid2VPKrBkOe7p92G579b+VZ33DGg8F35/IXEZl41WWLcpsh/4dlmD0DbF3o
 8jCSv+UZpbtNfzfF6RNCJvLack1zgurH63pSA7GVmxDZReAsy91tzY7Qv6GLKBjmlhzn
 InmQqKo9HWQYx7QMVCXiX8dT7Yi4yVR2WhNXaJHkZxyZctNT9Gc32bzYnE5a++RGGFZ8
 Hulg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGy5NRI4IsqqaHlmW7fXjKQtYNr6IzKntymDSfbc5Ov2yQAZ79G2FUfhjADsuSkBUJD4db2P4StrE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2+kVU7qg3xIvditDRAFYmvxxvzSmxFXKUOfaQ2IfYqcjIjKcE
 LegiMo6RGbWBpCfEBU7+OVoOxPsFwUJGlyKl0ZcMvf2x3A9j4Nl34Jd//95vWOVosymdk6QTy/w
 gjCRVuc3TpVJqDkRnsgKQ2HY+jtzfIY+MTbeUJTfWlKgnrok1CC5Tm4850rddiQCdo9iSlEA=
X-Gm-Gg: ASbGncuuNRxlUF2fDtaQ4nl0LLmJKILVFuYKJYsS5ElDoWpoxZJlV2jbPUL0f13u5Zb
 qaT3FiEWjf41UtZlTCW6+4Ze6kglZQ1Ydl3PDiSZoyxkwd/LvJR3rYppVHTDwgFiy+LPQKLZ2+w
 IqJFmQN8onC0nwimRT9S8sU1CaMolUT0ZDWXBDHlX8sHMj7QF5YvF1LjUUswqaTrGQNUTi3Md+v
 uUGjQXuTUc2FaZpj2kkJBqDvGqYHxF2tM/bKtwJIoSqm7b08xXvotbhtRxekQd/EfyTALKLPgtu
 yOgRK2lilE+6RK6e1bkff6YusdUzsqj+K9kipDXzzEvvzLkYkclY+hcFgehNNQc288ifK3j0CjU
 +VUyvlPvHyqRSl2Stfm0H/bWiHpq8vUlTSSiu8eXdwnSy5gxspstpOrEs
X-Received: by 2002:a17:902:f551:b0:25c:b66e:9c2a with SMTP id
 d9443c01a7336-27ed4a36409mr41153695ad.6.1758871628846; 
 Fri, 26 Sep 2025 00:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+O099xujjC/yO29xVuYREkkBiX2GXu9s5RriPjceCnhs9oR7nstztkgV9IiUszESNtEahwA==
X-Received: by 2002:a17:902:f551:b0:25c:b66e:9c2a with SMTP id
 d9443c01a7336-27ed4a36409mr41153415ad.6.1758871628393; 
 Fri, 26 Sep 2025 00:27:08 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed671d8a2sm45117985ad.55.2025.09.26.00.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 00:27:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:25:44 +0800
Subject: [PATCH v7 08/14] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-add-displayport-support-for-qcs615-platform-v7-8-dc5edaac6c2b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758871564; l=2826;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=oQp9DwFQdYQWDdvU1iDKEeRn3mcSQ7RLuxSrcgehlKo=;
 b=5At+q9+DnToGjvm7JMgfhDG/u1O0nUC5yiheYa8olWBceN5UNjNGS0ctGUNJs5yiRruaCRpoW
 Ug2K5mb7goTClU9tN6MRx+HQIYAxz5hnlhHOMwLEuoKL+Cz9JMOcGUo
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: Okv_b2dA7goPfVslLrFJ1Pz62Mszw652
X-Authority-Analysis: v=2.4 cv=PYXyRyhd c=1 sm=1 tr=0 ts=68d6404e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=NTL_5ILWjaOn02JYBUkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX/BVBys08Rruf
 8qsUhU3yTm2ludqxuVHWI+wJ7lzoHJ9kxUcLlo22HAy6lqqplrb265aV9LPapHRAMIFUQ/W6OfI
 D1H4S9tdOvBmsxQa/ZHQpk+jJKgwgDetCBWgjgDi5YapL6YDegCKYMMNLH3bKDCJ46kGAIpRQR0
 Oh45V7eqyMsvS550ADiSm1pJrbx93iPuDCHAXfGYC5q05o8Vr7znpeS051Xuipjp0vzTyZBfhLw
 OnLF20kpPVbrtbX4qgwUwSFFlux0rb2Nt+fos+B6QSylrvoZ2VBiCUtSmarGG1ZqEim9I3jnm+x
 gQJ5AnVtew6Jmy/NZUGK47aU06arLGxa4F9WJI8wcz4A9J/0QPJL7WCqdWtk0+pGm5G7FRgYA7j
 GH+AuZujQzdGWsBUvJLIb00Bu2YPdw==
X-Proofpoint-ORIG-GUID: Okv_b2dA7goPfVslLrFJ1Pz62Mszw652
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
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


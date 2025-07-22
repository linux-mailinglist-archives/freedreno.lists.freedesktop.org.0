Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6DB0D2B0
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 09:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2355810E5FA;
	Tue, 22 Jul 2025 07:23:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBt+M+UI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC6B10E5F8
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:34 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIhARx012291
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SRoknLhESGJkp/W59IYd/1yIvuO8rKzibCESNkSnMiA=; b=cBt+M+UIJuLQzsUe
 WWeUa0SdQ6edqvThTF2bTw/Wu+iMg3JtCyK29PyhTe/DP7aeq/IIpbOwmleTHBBL
 c4bAwVXhZ23icfbCpFeqVmDRRHZ5oTUuE+Q8Z3WRi3BhZFjI+9t/mHao5p7Utp2t
 CR06uTWPKapPTfLAbLKTsIOLxWbGmZX1foQAgVYgRA7aGimYPnXiI7qXYomGPhut
 BYbLL3C5f4rlfK4a76Z5L71bn/yuldDJ+e3YQFZ9tK7Isv1L/ekoujcZxk26Nx6a
 6pOVw008CXEatIHEknT25levLSKz7JzqeKKPOECWxD9r5IulLAKR3ykKPmz+OMoF
 Cf6wbg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459pyx1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3130b8246c8so1569613a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753169013; x=1753773813;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SRoknLhESGJkp/W59IYd/1yIvuO8rKzibCESNkSnMiA=;
 b=B7a1bzi6hmF+YmGYr8Tj0V6cPE7PUSzbT6WWL1JpduzAlewzO4YG71n7CAqvAj+pj0
 U4poz+EssxGugJrsiYx/2OjbGS9I+ei+6c+1Wm1xmm/+QwJr/zrBv7JCb2tzJlpdS5jJ
 q79UVPBcavNjNLzfApS965F8D2YvAm8MMNE+2cwA8djkyY3aeqorOMZSGRO+U50nBXad
 5whit1hJQqNSq1XB0xo+jNDC+rBzZrJfoWy0B6QZs4Htd3EgISOOLV4Auqv4fxTeyQsE
 JVeKlWTvhRyS5xztvu07fOvVBd+rD/gJnnUYa1OC4NRCxyB8pg5g1fuDhpWbeD0rZTz8
 bn/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNo1fcFTNRGlwV0CIWtr7prNc2H3mDDMxBsuPRXRcF4uvKWU3GlY6dGSo47fGTC4i7NtjIY6/kbxc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZOKeyGqChB514YneeCTkbbFZPNHdYX11H75vaBMiwPJqRwpZd
 nDqbby2S8a9gxommhzghbKwGvw2sBqNdQF8Jwm+l6B6lXLQ3BxXJOtsYmCEOUp9mu0DcBb8ejcD
 B8OiG7o1Ncs3Esr+vHUFR/wMVr+UGlxzKE28z0Inw0W+qPnE8QkzVcC0+Onudl+fr6xqrXx67vB
 wr6ac=
X-Gm-Gg: ASbGncv5X8omxuWFrME2I48hoAJMl2lLoXgA8aJcd5VDgWuZgq6ugTW2d+eW4voQZBL
 pBlrcQdoUI/qWUfpdd6UBFmjpl3mC8/q47SOedBsxq5KOTC2WighZ80ynsd5Ek/2Er72O0WOFZd
 HPe3XFDQm6l9DRc4dH4dx4BVUh8bLPoVXc4J5cMXzsaHC0WrdwbLnWI9NzpzytkWmYvrsaW2W5B
 1gSoECw7hhVgH3i7tEhP4+GwXbVQ666Zc8JM0DD7BcV1M+zuy6ystduCjlJKPjeKXPjr9DPRLOy
 h0awNMtPB4JNWRGt6hLiac88cjYgStsdhk4fdfIWEWoYVVkEkuY/T7wVSRpbJnuQuRw7zEKHoZB
 CSIkTe9dGXBBttH9eKKuUtXbO2PaqR/5DxkKmbCgAi6G4yxqD+Ku+7V+J
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c9e76ae7amr13793085a91.3.1753169012527; 
 Tue, 22 Jul 2025 00:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFko6zdDLS9yGWBWKIKCenAy/9fb0yFHvW+++dTlsCyxV/jrbgXYH4ktmzFN6HzFm/3zlSHSw==
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-31c9e76ae7amr13793061a91.3.1753169012023; 
 Tue, 22 Jul 2025 00:23:32 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:31 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:11 +0800
Subject: [PATCH v2 10/13] phy: qcom: qmp-usbc: Track PHYs for standalone
 DP/USB3.0 handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-10-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=4083;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=x52wj5u+rb6dbB9m5Z9EVaM2Qq3LqnWRHa5RdOZnzXM=;
 b=htKC4pfBN+sR8v9mfOnbuVOX4GlHHUEvwakJuhy6tTezZjlR8N3uaHroW6IAc7yy0WQJgl5V7
 Q7hKjifp+bVBs2A+gPwSVkicyslpzb5ZWiQa7F77q4VpAWJJKTjDhlO
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: h9SWODXCIltsBpZ-N9uMKFtFINRKuu58
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687f3c75 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vLThFRzmIc36aVVRt4AA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: h9SWODXCIltsBpZ-N9uMKFtFINRKuu58
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX8kaNBUlXFlTW
 3tkxaw7MsX6x5Om55AndKpYg7jAeR4vpy3GTLV6KmusOPduDp3ayzrfZNjDiXWaRNY2JDz6sMTQ
 MsqbcIp/EF4z0IksEPhj0dE5w4U0A0+lEF5S2F6pNDz8SUrSFIb4kyBbAKsca+2jXWYS+SGeYLY
 pLe9RbFuCAcGhZSAnYgCEzlvlCzL76th7xDPTm9z2DgqTqatPhMwEorh1y6Tl6LRho603HWmBej
 64WKPJs9k06EqlTeTK6S5oawOdu6SiJLCY/wsvzmyiHp5duKfjxUuOHfsLTp2c2wa4IusWj5s1R
 iJ6RIWeiDCDiozda6ZDs51oq1mMsHa+ItRl4yDncBLfQU14/G9nHN7/LGqKK64LdFF6hJukVojV
 cUfun2MN0GlgTNOJX60od+LbG2KGvxpJBWRvawCMnDIpWahz/gbHJx3fZ6WtBN8z28+d1Fld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

Introduce a local list to track registered PHY instances, enabling
identification of standalone DP and USB3.0 PHYs that share the same TCSR
region.

This allows the driver to detect and manage mutually exclusive PHYs at
runtime, preventing configuration conflicts when both PHYs are present
on the same platform but operate independently.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 51 ++++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 6291298904de9717283e59f1ca2a845b46146d52..e97a206a10554b2d157d1fadd66d66386eec6c40 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -514,8 +514,13 @@ struct qmp_usbc {
 	u32 dp_phy_mode_reg;
 
 	struct typec_switch_dev *sw;
+
+	struct list_head list;
 };
 
+static LIST_HEAD(phy_list);
+static DEFINE_MUTEX(phy_list_mutex);
+
 static inline void qphy_setbits(void __iomem *base, u32 offset, u32 val)
 {
 	u32 reg;
@@ -1107,6 +1112,25 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_check_mutex_phy(struct qmp_usbc *qmp)
+{
+	struct qmp_usbc *mutex_qmp = NULL;
+
+	mutex_lock(&phy_list_mutex);
+	list_for_each_entry(mutex_qmp, &phy_list, list) {
+		if (qmp->type != mutex_qmp->type &&
+		    mutex_qmp->dp_phy_mode_reg == qmp->dp_phy_mode_reg &&
+		    mutex_qmp->init_count > 0) {
+			dev_info(qmp->dev, "Mutex phy busy!\n");
+			mutex_unlock(&phy_list_mutex);
+			return -EBUSY;
+		}
+	}
+	mutex_unlock(&phy_list_mutex);
+
+	return 0;
+}
+
 static int qmp_usbc_usb_enable(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
@@ -1114,6 +1138,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_generic_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -1166,6 +1194,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_generic_init(phy);
 	if (ret) {
 		dev_err(qmp->dev, "type(%d) com_init fail\n", qmp->type);
@@ -1772,15 +1804,16 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 	return 0;
 }
 
-static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
+static int qmp_usbc_parse_usb_tcsr(struct qmp_usbc *qmp)
 {
 	struct of_phandle_args tcsr_args;
 	struct device *dev = qmp->dev;
 	int ret;
 
-	/*  for backwards compatibility ignore if there is no property */
+	/*  for backwards compatibility ignore if there is 1 or no property */
 	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
 					       &tcsr_args);
+
 	if (ret == -ENOENT)
 		return 0;
 	else if (ret < 0)
@@ -1793,6 +1826,13 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 
 	qmp->vls_clamp_reg = tcsr_args.args[0];
 
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 1,
+					       &tcsr_args);
+	if (ret == -ENOENT)
+		return 0;
+
+	qmp->dp_phy_mode_reg = tcsr_args.args[0];
+
 	return 0;
 }
 
@@ -2051,6 +2091,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	mutex_init(&qmp->phy_mutex);
+	INIT_LIST_HEAD(&qmp->list);
 
 	qmp->type = data_cfg->type;
 	qmp->cfg = data_cfg->cfg;
@@ -2064,7 +2105,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		if (!qmp->layout)
 			return -ENOMEM;
 
-		ret = qmp_usbc_parse_vls_clamp(qmp);
+		ret = qmp_usbc_parse_usb_tcsr(qmp);
 		if (ret)
 			return ret;
 
@@ -2139,6 +2180,10 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 		}
 	}
 
+	mutex_lock(&phy_list_mutex);
+	list_add_tail(&qmp->list, &phy_list);
+	mutex_unlock(&phy_list_mutex);
+
 	phy_set_drvdata(qmp->phy, qmp);
 
 	of_node_put(np);

-- 
2.34.1


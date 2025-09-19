Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 047E8B89EBA
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 16:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D437110EA14;
	Fri, 19 Sep 2025 14:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="frgj73cC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E0610EA0D
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:02 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J9WDa6007093
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vZiouIkqwuEXWY6n8RmAMyZHUHfsJ1HpkFbjJVrd10Q=; b=frgj73cC8TTtvavt
 Wd3nBUlV0Gq9luP56eV27Meg9OMzrCWhXp3RTOSTbtL6LEuGvSqKaYDMCfah0fBi
 VhrW0kK2VCTYjUqqXfEMNONFSf6WR40CsEIipqZDFCF/MCjo/T1/8jOdLv1c0KjH
 CKBrSMUUaNffcdhqMdMATlNQzz7r9lAkzuD0ZLqpNvTrJEzJTjZrVGpMuQ+FT4n4
 j+wqZyy403Msy7Os+QjIOzcAw995kF28E5wZETCqqZ3JVNtU8IaLr5wix8kkbkRI
 fflsEFMOLK3AVpliAXkzrvoVi6XPOPXqOB0xUuOQZI3I/6NnifO/yNaOzRvqATMh
 Gu502g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498ebew6va-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-269b2d8af0cso2826585ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 07:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291961; x=1758896761;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZiouIkqwuEXWY6n8RmAMyZHUHfsJ1HpkFbjJVrd10Q=;
 b=U5xUS3j3E5vCMnwwW2pi8VZx4XOKGB8jM3m6qOiQSA73xFikZdZ0oHHjC/nYCVc3N5
 CAMee2iAF+aO3MrFWG9yXi0zKw6XT/f/eRHpSJAR6QmZmb97rz3bgaNFAnTITjJ+Ps5+
 3nQBdrRdjbHkqV4fSU0rMb/9cS18RiG9etqVICrOShIju/vfnerOhrobKXW8riceBHlS
 iPC9XRQWBCTfMhhho2hfTAqUW/B8YeHxbniMsmcwJH3gRyE7ruHvF6q4fthp+ZsIV6K6
 5AOApKTnqFUxNbEHdWn6HeuqyQZZCyapZHjDsmp0qTCTfeXl+WfqoKnS2nEQw/JPuNkq
 eJ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoZBmCG0n0y5Uh1mQGdq+mN9Sl5726it9H624v6tdek0RUqenBNWpTwff1V9qn3d8vaL8UX6vG6r0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHnIgN/dwA55Ea0GBoRA6IL5RGiCD2KfDGcN8PwAU6W3EJ2Wyi
 p5p2Cm3i+bNHGqpH5GcHWfmSfcooM7BqKi3w22PoAFMuqaD4AOweFa9wpab+q9/ZTA9VGIJ36m8
 XuqtnG8oJK/Z2MWE6AuLwX7/C4RsYLY8blUjynGY6kRb8+uLy4zWJg/0EUEkHmhmQYYsIlNg=
X-Gm-Gg: ASbGncseheacpk07HoYEnerklSHmGrAKTcn/eczLrJ7/z22U5XDtJq4RTDST0uATeRU
 ZqJtMz6537hqhs/Fcb0KoeikmHSuA84ehNI/k2jQsACAUWzj7Ht7FykAxH8C/I+GQYqv3XmjYvE
 p+bA/mtuYtPIdTMlB2EZ6Q1xzMnkzFB4wXvTL9jk7cQis6+EFQkzFZeaMn33aT9AXZqJbJH83zj
 WYmetVDyp4wN/fxCcGEvgVL0nNSWCt8BC6jT4nguGzjxUkreQ/xX1puWyPL8SmhyF6ICbbQH/xp
 CEfaM1zFEZcjvhX96hm+N5WLONpfxajkSSQo2DUBzKtvjz5WrQLgkpGw9PWHTzvDaXdZQrxbiYW
 fLjVukzh2S0eGUg==
X-Received: by 2002:a17:903:1cc:b0:253:a668:b638 with SMTP id
 d9443c01a7336-269ba40ac13mr27964575ad.2.1758291961048; 
 Fri, 19 Sep 2025 07:26:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW/WGzLDodG98wkkzW1+1CcHHUv5fJVGPnsFeMb4qTDtiiEpVeyW35NkEbhYoWwReS8eZH+Q==
X-Received: by 2002:a17:903:1cc:b0:253:a668:b638 with SMTP id
 d9443c01a7336-269ba40ac13mr27964085ad.2.1758291960575; 
 Fri, 19 Sep 2025 07:26:00 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:26:00 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:25 +0800
Subject: [PATCH v5 08/14] phy: qcom: qmp-usbc: Add TCSR parsing and PHY
 mode setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-8-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291894; l=2759;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=zQm7xoATNcQDtX7SbZxZLRT+sVir+FtQeIRb1OzNIbI=;
 b=EwyQaS9J5/X0EbdYFn5jwxIbQpOofUaOCkwUg+4xDM9/U/lcsRns9MK9JmlDfzU6LUq1gRmQp
 n87WsJ0jOHcAcGcwXxm927IBd8ngExNLZP6+/NEiEDHieVyW7NStZ8V
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: N73jWgpe2WufcS1AxdVD5UcdK8UoSZMV
X-Authority-Analysis: v=2.4 cv=H6/bw/Yi c=1 sm=1 tr=0 ts=68cd67fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JdgWeW5AdtZ5oeTK9qIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: N73jWgpe2WufcS1AxdVD5UcdK8UoSZMV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3NCBTYWx0ZWRfX0WeZ5WtBBcOx
 5Z7jfg/8diTMgapjyqoeqKX78WPUla3tthAxpwm3FDAR3ZdEB94qTZTvFP4BEfBGyYtnxVl1aZv
 ndPL4p3HCLMg7HGvHyZyxUnetBuC0VdbVpvEYueECIm/MAF8fRHXeNov75UpuJBEF3MY9byz4ZR
 Fxs4MzKQ0rGQXhXurCPd1cyLyH0rXdHpVdaVmpuo5Dur4tYraB1AK3M1D+gq95jkZr8ZVRyL/0r
 Mn667RFzRy77/eLJSzHcSRPPPaqSI4eNy1wiRXjSk3nnOxRGJnnBLHXTPi4BIgXXCdtsbVxWi5+
 zO6SHkFlHNdg9zMn8LyKEV4RmT6rmCgeYpVHON0rCnC7UwcgvN7RA5wZDk2NRPVJr7zICYQo3nQ
 0bD63MpB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180074
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

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index d570ce486aee8e8a3cf3f7bb312a00bc1cd03d82..cb0197538befa6e7a5408c8d2d45225aa9520e8b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -533,6 +533,12 @@ static const struct qmp_phy_cfg qcs615_usb3phy_cfg = {
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
@@ -673,6 +679,8 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 	if (ret)
 		goto out_unlock;
 
+	qmp_usbc_set_phy_mode(qmp, false);
+
 	ret = qmp_usbc_usb_power_on(phy);
 	if (ret) {
 		qmp_usbc_com_exit(phy);
@@ -1117,6 +1125,7 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
 		qmp_usbc_com_exit(qmp->usb_phy);
 
 		qmp_usbc_com_init(qmp->usb_phy);
+		qmp_usbc_set_phy_mode(qmp, false);
 		qmp_usbc_usb_power_on(qmp->usb_phy);
 	}
 
@@ -1267,15 +1276,16 @@ static int qmp_usbc_parse_dt(struct qmp_usbc *qmp)
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
@@ -1288,6 +1298,9 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 
 	qmp->vls_clamp_reg = tcsr_args.args[0];
 
+	if (args_count > 1)
+		qmp->dp_phy_mode_reg = tcsr_args.args[1];
+
 	return 0;
 }
 
@@ -1323,7 +1336,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = qmp_usbc_parse_vls_clamp(qmp);
+	ret = qmp_usbc_parse_tcsr(qmp);
 	if (ret)
 		return ret;
 

-- 
2.34.1


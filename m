Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EC8B5368E
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:56:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CC710E3A7;
	Thu, 11 Sep 2025 14:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aANXaWnH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221E610E395
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBQn9u026440
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R/i0u1DnuXxgdpameCKVEnYo7itVnONwyzPQHpKD6Jw=; b=aANXaWnHNd0bBEmx
 JolRBQNocvb9jYBXiwV4otosafTRSNJ+SDyPn+7SIte68TZ5NrVC+jE1oE0Qr7FJ
 1+rkjgls8i3AT7kGRrgYh4QpAn1HKyJ2TggJvrmxyVvBN8CkR7cWAwhfTO2wkAwc
 NJdY+hEet/ZFgJTqafSo8GrrwvTRB6Km26gwHGV4d9NZeBrivFbwGhxWLXqbHzYH
 KF6C6+ZL/3tPuQ4WFB7spG+nsk997ObF+Wp9zUQbxUTWNdgkKKoZHAUQqhDJ8Wi/
 rBMQyUUtdMwl7qahL4taoNUps1+DCMrU7B5IvuTetGrCrVHd+6iujvnA/xm0Y6K9
 ZP/H0A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj1045e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:56:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b5228e3fee5so38597a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602608; x=1758207408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/i0u1DnuXxgdpameCKVEnYo7itVnONwyzPQHpKD6Jw=;
 b=dkEOIAT1tDUHLlhIKNvkgDoSkKJeiw7JG9bIikh1W5RTPylhKtbcAP7VcPiZLUcyup
 fV/FxU8YDm0ix/GO9drQUAcgN1KJQgoidvpWESYZNVuMadDjZGrHFFTCUnTOUs3a2/7g
 7QYrY8yFCH7WEdEqo6JS/AZ2FkdfmB4pm/dSP3LAAdfx/KbwlQWV9Gr/+yKJnauadqGa
 E1cEnB2/esHC6W6HseFVcw3je4aCayca5xp+na35UwEd7vN+OXfh5d/i+Lxa9xDDlRzq
 QVO0SwsOQ/PdLIxlLpc9po2r4dDRUwubHqzaxWDMC5+HXjMB84WR4fc0TfzXsMwMoKmE
 X1xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE9vEV8kHXCZRbsTpajGd5rH+zdGqIvBas883thne4/Fdy2ivlgHZ8aZ8u+RGl2Vz/cke9hTBUyTI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyWct5vy9O7Bk77ESBfhNo1ePSLXhqTVI1TSfPskDhnEtJuMHW
 MEW22/MxFxslcLq6lZSPo2kPJ02opvmz+5hH+4BtT+Tt2AMHEPkzYTB/EiUUxyly2hEbTX+boN3
 mFeIimVoIRz3vjG26/j3t2hPL2wrHdJvZKTpzBzLpwulnEukhj5HYSGX47DTEgrAzlidJql4=
X-Gm-Gg: ASbGncujo4ZjTVioS1vSM8URdQyWPcjkJf1T8vRzWKyKvqkIqNu9lE4j99TscuQmOpC
 CAQGpXAe08thXGimD2F1y5w3BN9B+qBLw0GnBxwS9KXMQlWRTOnNQZad6y0QYhGTi0Ssia9oH9L
 0iRcyR54dSgYpeLHC4tolBwEVhIq7W9IoYYtxzlgit5nhG3s1qXLCE+QzXRJRYxtJLXm8rG5qzY
 qkbMCgrk1IhNY3X2wjzcabEr95EimmdpjT7ViNRbFRF6IBj/bwCPWdS/CLTUhU188dhrxOOQpr2
 uP7h98HXzZeTShHJ7+ZeKXKlWGhT3sc70v3wqpij3sYXUo0N7Q3NzEdlBU8E3v95+zisDycK6ij
 h8J1Zrid74WjvtTvz5R7PL42oVCfksEpZmMw8OBNMuhCJXWguQWNJHaKj
X-Received: by 2002:a05:6a20:4322:b0:24a:3b34:19cb with SMTP id
 adf61e73a8af0-2534441f6cdmr16687143637.3.1757602607829; 
 Thu, 11 Sep 2025 07:56:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJdLqhTy32FV7HxAKLg0I05c1SykuXTMvfqc6IROeB1TisqANAWPSDFKILlfoT4H5LPXJ5uA==
X-Received: by 2002:a05:6a20:4322:b0:24a:3b34:19cb with SMTP id
 adf61e73a8af0-2534441f6cdmr16687125637.3.1757602607368; 
 Thu, 11 Sep 2025 07:56:47 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:56:47 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:08 +0800
Subject: [PATCH v4 11/13] phy: qcom: qmp-usbc: Add USB/DP mutex handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-11-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602528; l=1610;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=g9Ir7Zqj4Q4z8+mdh4A2GkwyNH8GzAMmXDyXe7Z6swk=;
 b=zShFKpvyuFRXIRnT3yvPFCLUyh2L+HHbKIjDXahHxUeMEbq+jDSj/Gm5JVMNb7D6BthxSFcZI
 PDNrU61G8ZOC9dCZ8/sgo78JVqZE19eXdfvyh2YWG/Q9XQmAFkMAr1r
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: qXlzPE03VtFOyc9uSRNHqtFu6AqntOov
X-Proofpoint-GUID: qXlzPE03VtFOyc9uSRNHqtFu6AqntOov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxY8T349RDjJz
 5aZITQRgH2yIOovqQiep8DI2+jJj+Wg2tYXw62z/uaZkRePYdhUJy8D6N2nA7NOIDxJ9t2Fc+m5
 u5whygA8fXGD1d5P7szjTTOk+PABNUCMGnN2Ec30zTEiTYklGfP5R547sAwExD4/IoSrfq/LiYk
 OKXyqUoV2KYvA5kai9ZYWtQdDWWEx+3iGSEAy1ywOPn+D5Xa0Cbv4+R2LR5NKQs4uhGjvC/kAjc
 E1ck9xzUYlG/Yj0QBGftwQ54Vrrba9a8e2TxM49W3HdE9/dl1xyDDrZl6OHmwgn0epvwuGb4dbc
 c5GqqamX7mnp4cbKxlSicDqAwBMVs2+7KD7rm0RGY3WmTWloxOIt4t3Xq73Z6MmYeeMH22iEklc
 jj0uNvyK
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c2e331 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=_IuPrrw32zr4QVSE3DwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

Introduce mutual exclusion between USB and DP PHY modes to prevent
simultaneous activation.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 613239d15a6a3bba47a647db4e663713f127c93e..866277036089c588cf0c63204efb91bbec5430ae 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -1061,6 +1061,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
 	return 0;
 }
 
+static int qmp_check_mutex_phy(struct qmp_usbc *qmp, bool is_dp)
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
@@ -1068,6 +1081,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp, false);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -1121,6 +1138,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_check_mutex_phy(qmp, true);
+	if (ret)
+		goto dp_init_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto dp_init_unlock;

-- 
2.34.1


Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65468B89EC7
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 16:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ACC10EA17;
	Fri, 19 Sep 2025 14:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SwB0s+Wy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E275310EA14
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J6I4SY010342
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zCtPUXVGiI4OAMFxMM1v+W6OUs1HWL6gOP86Ti0GuRw=; b=SwB0s+WyW6KvaWL9
 MJlJlqhzBPohuawXRb2OtMdO7hYBzKO47yZ5mVXFGvUH8NYgnjXsC0jfI/uwYqax
 42C3B4RxEOzFl37QYjx4b3X58v6QAuLcqBaqrTool+bBEctS4kn9Z5SuvaLftLmd
 bIhH3xLqpFRpm8YCof1QwmSgqS80D73RZuUd8JPKOOJOuJdTr7EJgHK4cBTFB7tq
 KVM2mH1ZO/1imFqGV9MWY+KKRZE/r7KtJUg+KNrsjhwU+Mf4ohptGthzxtvizz9s
 +0lq17nJVsHnFfdqQWSnu4ta4qdvdzsv1DW3D2tevlEexYlLrRFhRVxlbr7Y+JqV
 0iR0Rg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 498q9db5xb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2698ede62c2so5951655ad.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 07:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291976; x=1758896776;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCtPUXVGiI4OAMFxMM1v+W6OUs1HWL6gOP86Ti0GuRw=;
 b=riboIaKKuGBam05UFMvkeMfFDBbI+Y6THf+AB2fpCwPMr+gWvJA6JyKoin3DRUAdR2
 bKDW65LDotkYe52d2J348XdChl8Hp8F58aQnzkuIJIXTdVbgCMwN5Jee2gaaSkpAl1W3
 XUtYdIs7Z3u1jCyTClGYsExKPcHYG12s91XJPmHMtrfCzAFlYVLStE+Yg/fhT8hXQJ/y
 KyTUeFdTLBEojn+9s9ycMc3vffz4tMuyu8csCCFEGnzYq/nsYfqANyPKLYptlRWvoIqe
 NzKn3BM3n+wbJwglaavVf2RReSMw0mpl0ahIcIoZpWvU1lj6BNpk1l8pP4SrGFv0YNTU
 ksHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMA2J05Gh168eygung6blAMHYYDnF5SDL3bzQmcK7WYX16ycWAdI+af/pUzX8e3vv0afWYGYTVkJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8qNTeLLvgr9vq4Kdd8kxB38hMrNyKOPMcdmGSXMGkntL5bIiI
 rypPLtRwHoILvHtHe7MKy30FgqYXYBPJR0xUYy+qbf8AHOWINLWTHRrVpoQd2TPyNUeKXHOuYTx
 ZEC69c1V182yewIgWT/EuCxoQCTx6JUme22E8APTpzt+w9qq6Kjy7v86IAaZTqC/6UUSldFU=
X-Gm-Gg: ASbGncvwijkU/TzeJPqX/9JAEn6or0E71QLsbd44D5/DrXPmUXswjjO0vgiplq0H2Ek
 T7UyCpgDJfYI4oZ4bONSvFdilXubWQSzbxzF8OIC1KQc5GKPlxf7KII2dKzPlcx1k4uf/MJlfDK
 QBUl3qGyf1sXjDWrXlWoAOPFuiqmGgkdThmITga655unwIWEd9hK18w89TM9ZXZLxZL9Xxkdjlp
 EhaYTO5UDJHl8WpIPkZ0U540TUT8z2ThiXK3wCWldCKfhjgHtB2AA4ZQOTo0Tsow0wTDP5h9E4j
 Uj8KcCL8uwYfqVMT6/MnwhVgdgAtQr54dTYE2WtFyJtUGBN27kVN2IcQHF38JjRnq8fQ2ueFMZZ
 0bz/5dQgiqC94IQ==
X-Received: by 2002:a17:903:60f:b0:269:af66:5e70 with SMTP id
 d9443c01a7336-269ba53ab71mr18398985ad.9.1758291975556; 
 Fri, 19 Sep 2025 07:26:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjyPEK1QysizToe/QvWiGmgoytkSIQmldJZSwEnBeedNOnUc+qD02mwjMOxWcY1o8sbdk5Ew==
X-Received: by 2002:a17:903:60f:b0:269:af66:5e70 with SMTP id
 d9443c01a7336-269ba53ab71mr18398725ad.9.1758291974951; 
 Fri, 19 Sep 2025 07:26:14 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:26:14 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:27 +0800
Subject: [PATCH v5 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-10-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291895; l=1866;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ZqkBdkbuOLKjKhpqL+qVKtuac3iLEKvjgh8IWhxZI7c=;
 b=O5F9/yXwTXdOv/GVyK3wv2N1g/rrnmq7IdOhKWoKm5ItBn+rhZs3wgEhpB2OqKYvn36rwXC0W
 BAB4OJbv2SFD08xVW9qM0ZS7Z5kv7ryh+7xs6mqcF8r1i83eHo/SKIp
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=YsAPR5YX c=1 sm=1 tr=0 ts=68cd6809 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RloG_8Ug8mropJZ47ewA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ofDh5Im3V8f1C-_UrCHeE1ij2Kk4VAT1
X-Proofpoint-ORIG-GUID: ofDh5Im3V8f1C-_UrCHeE1ij2Kk4VAT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDE2MyBTYWx0ZWRfX9MKWuvFgGIIo
 ISnMtlw1bJkP6hEA17PUPfV9s5dOjoXOIh6Dukl8G+/yD+ap+Lh0jSr5xRjDlVWkxJpwhewNrSZ
 E/9yReXzGQ/MXfGfnrxEJKxACM1OHO/G7CyvQszx3wf24mBN0EPR6+cQ+ZjXd9rBY0w5nQEQHDp
 /M+6SjsSAlOa4MVVtaIhJ7IGV532iOU4HVkuNapbph+sx2sUxxpR3Ha1g6+1vDvCMra30JJcznA
 EU3sotTgng0FK49arMAfYCSJ/GeiqshRMoQKLOHuMuNGmYw41e1uMC3Rau42J5maMSKpup6ekrp
 pvTlU59B3N0GPEQSpazDTYsE3qD2m1+3pkQPBdPk97yZJ7XS265f/h5XZ9Hd4W0V/tv9SdXVslo
 aaN0jUbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509180163
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

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 74dcf954845bcf8209202b75e9db10c3f6bdebd9..8030422d64382aa231d69dec9788778cdb0f218e 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -670,6 +670,19 @@ static int qmp_usbc_usb_power_off(struct phy *phy)
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
@@ -677,6 +690,10 @@ static int qmp_usbc_usb_enable(struct phy *phy)
 
 	mutex_lock(&qmp->phy_mutex);
 
+	ret = qmp_usbc_check_phy_status(qmp, false);
+	if (ret)
+		goto out_unlock;
+
 	ret = qmp_usbc_com_init(phy);
 	if (ret)
 		goto out_unlock;
@@ -730,6 +747,10 @@ static int qmp_usbc_dp_enable(struct phy *phy)
 
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


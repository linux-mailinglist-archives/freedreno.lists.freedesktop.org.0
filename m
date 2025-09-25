Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F19B9DC85
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 09:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F259C10E850;
	Thu, 25 Sep 2025 07:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N32WQhdq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83910E85C
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:30 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1GpE8018069
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sOHfeo7BhLeEryk+wi9AeSYQSxkknTWJ2p+RSrBRhUI=; b=N32WQhdq3ymRD3Zo
 i4qGopQmu+qbIGWgAlWPAKBRLjAyD+amd3AK1kTYO7nMAgcFZDLsIDafvzHyKRL+
 AmL7lroXwB35S+aHUKb5sZWzv80k0QoXCDw80ae4yRo/eNCh4FndPB+ruIHdK24W
 8NUkW13KHN6EdNYsU2fCynL4Hm5GTi1wk5ukRP2YBtIx/kbZqP5Q+fvD9hGpvRAQ
 Rxfbdo15Tv7AFRE+RBCWShwyLYRDxIZcpCmYrycuVAWHir6ylBV7SiB6yvdtWg//
 jIzaVumtPYmyYFoqoHWpQR2+YxIoh2gHBD4kMJAk8FACQ64bcWTrPfPf6A+ah0mS
 pxGqiA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkb3s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3327e438680so141578a91.3
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783989; x=1759388789;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sOHfeo7BhLeEryk+wi9AeSYQSxkknTWJ2p+RSrBRhUI=;
 b=Gsx/EaSdRAcl+4l1q6tbUib75HY+639pKc+uvjCGYB5IrirulEzEX1dWFKQZxX0CsB
 RUvox+r7rQbLNrjnSRdA49SSOFU0M7MWNggXuHK/NqSWy4SuvSQetgxI75qwHKOvZueK
 WAHybItFbr/hgqQf4gVo72xPXCaUNyPa3n0GpXAfurpBEKa9ucB6uuWNmWWYtXezAfdy
 SW/zmJShIlj3g9ZawsdCWYToOoCPKm5UkOIgYUpdyT7AC+NE9GlmWwHnEFDAGsZEvB+r
 O0d47+BN0m4i6kpz0EEWPuteVTFUZnbcFbX71JSfgeYtUa4alVk0LdpMf2pc3MxeElAz
 gh2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWrK0moytkiJV+nUiGkfed3pV8CCen9X4FMh4psKyZwGE2/Jz4lCvdzAfzUP7/FNS+sdaxoGQW808=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzevTc7McZJAxxLOmZCeTOdB+MpmxAultnxYjcbDCRVhny62Rk8
 2dIGj7LiFpkgxgaTD9iUNTKfYumOWBVZWjhk0QdFt1nMoiDLSLrde164vFwv2wZw2cS+r7NYCmm
 75KH9snvQYnUqoSg658VBAeAKSv1k+CKaKIC5ILQdxei4zf6qGlsoAKfbvlzvIpRqfeDT21k=
X-Gm-Gg: ASbGnctp6fGgjhQgYeOBNRCw2SxhJX8l6qniLFAjhRITcEY7v6DloCPRUUtdL4ncWyx
 oudBF1StYsDLTnQWaHaf3dO9FSB4++8MdFmhbYfqqttTIpIGQq2pFK4yw8PZlH7PelzGcrRT03S
 F0/SVGeHFYtGvCHQR8DNK6kS55AIHXva/AHD/AxMuPsfM1RN5Jey/+UEx7YCAPhL/jpEW++Et8/
 z4hcT+b8IJjdxWnqUB8Q1VMR/G6d/iQlToh74eyF5Unowoz0EhdQv9MsR7CBwiCw5gCrxMVFZhn
 8r3gQ+q5Xzg1vkRBsCGnx78yLm2ohRVbjGeuBAA0Nae9eHWCymDC3aM47gx34BV0DeIvWdNOp0T
 puFci0jMVCx+gbvrGotCRrkymeWNdbM/fH9lM1RJmergcymSwT5XyZs9o
X-Received: by 2002:a17:90b:1642:b0:32a:8b55:5b82 with SMTP id
 98e67ed59e1d1-3342a138dafmr1622722a91.0.1758783988694; 
 Thu, 25 Sep 2025 00:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFMPsmZvnd6dVbwELL53pC8yqLIr3147s8iCrXFpjob11Il+gTCOSC49HD8pbmJr5jpEtF9w==
X-Received: by 2002:a17:90b:1642:b0:32a:8b55:5b82 with SMTP id
 98e67ed59e1d1-3342a138dafmr1622701a91.0.1758783988144; 
 Thu, 25 Sep 2025 00:06:28 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:27 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:56 +0800
Subject: [PATCH v6 10/14] phy: qcom: qmp-usbc: Add USB/DP exclude handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-10-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783910; l=1866;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=X4PFHrUfP0rzxFwmdjEfi+hC/7SrgdK5syWA8qItXag=;
 b=w15jBmT/se5LKcZFvbQZtG5NncJK6g9/eYBpM53QIj2XHBW23jnAJfjZfDdu8EV5FM/icrIMI
 BaasMjAbiAKAsRn7tS72IxN0cw52XUOulIwMc629p4TQfSAOO9IN5Po
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: xWsMFjlLEB79-0P8KXF6w1cOES9Cn8Qp
X-Proofpoint-ORIG-GUID: xWsMFjlLEB79-0P8KXF6w1cOES9Cn8Qp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9J33rP8mentC
 /SEYxvMqb6IGRJn+ntlu2oj+Q5LA5s0/bFtDFeleDMAXJOsSUdp0hQKJIVkHOkA0mS4Ngw5OpO3
 8Ca2s6p6pbV4M4sOwoQGw11zArHmYvHFX7ob3mIKKx9vVrC99yzcml+EhNw5rsXXnZM3qoAqQqB
 mbnppVcdABRhyghIF/pYZoxKedruY/yqqEJUD7Vy3hocwDS9wOh7k1pngSw1NNOokV/vPcehBej
 GkXBoxu9gMaPlrWg7aP/fQO+G24m/+wHTtMTMBpB6Q5XI/aIZcT52UhZrwbuy+X9gWlSKQJWVRz
 h/7nRaQ0x6v6G4XL0yT0U34sAkdqXRmf89Y0/2U65o7WjujTaPlNM80/zxY6he36SNDJ9MPohhb
 Y3mOiQ9e
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d4e9f6 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=RloG_8Ug8mropJZ47ewA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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


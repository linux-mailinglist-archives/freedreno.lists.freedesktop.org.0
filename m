Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B98A6B9DC48
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 09:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B12610E859;
	Thu, 25 Sep 2025 07:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFrevY6y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E5910E85B
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4a7Au026648
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=; b=mFrevY6ycobFm4F3
 AKnprbvloiBNdlfGAw6CJph+D1IOBgdWLan8NptDUin9rEm6/9B6rry8SwlTPCKw
 cpoBPbNO4ivPkKV2tvzoXs8n+reW8hA/FShtfkMTolDVB3K5xCOYbwOGu4YTDYxz
 brwxOn/d0Kk351N7oMMKevVB1rS0eNJ3bJpLhMEX52Ah2nRRg69TGN8cuD3499Zc
 kTcy3ybrwGLUMhLEVJlM/lG1ibDdYidh1jUeHLNs+kaBVZRhFmwz4CBfeahQf31V
 oco0IEJc9Pd9STaD1vbJLK2ks2QuLxK6YTrP2FO35hJyh+0ZYvXNZ6fkhnxrLpr9
 9gmjrA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup0bvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-32ed9dbba55so191473a91.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783968; x=1759388768;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IxgE0hKaY239kxGeqZ+8x/JCG89cRYkF0bkaQ2dVCzM=;
 b=QTD3ODDYPS+kxlQRYekwrWDLODljqRv/MI0ZVi721pvsAXFH7MUMODRtTXmaN54CC6
 Rnd3FIV5XhMX3yPWMcZcgTXYzscMRXPJ1+tofVqdh1G+yHJ7wN/XvJTS0VM40pQ6F4Sr
 tzzY3jNPjizGbLw9BURVyd8B8WXOmkqv0cIgE/gWRQ56Z7Kg3WiZgLom7FFUM1y4H6fj
 5N57x/YjOTB5PKjfzMGAf2KUYkG6ft2YGSEX95wk9J8o0ro4cZRqMhXcPQLAcVF5HpUr
 dvHmKjgjMGb/vi1heBmPIyrdqfoXP4ycf1sCtwpQe5VUtpHUPEFhC5LwNT4TZmkIsi+x
 lziQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Mb8fEDJGAtP6G+qzoCK+VaBaPSCuN1XqvFyALvrXoCeM8VRgkJmVzDumBYxPWAZoWlyo9NGuukM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwXxGcyjqPQGjONcpXBHY37+kht7ws+usDM9o3+bsWf/wM1tmRI
 4fUgDttI0qID2UKq+HNNUUyp9y5qNb9W2oLO+5cVntdy774QzeUeqv75GKOflu+Q4coYW48EFUi
 vwEtp1c3Fpm+p91uIuc1nfwIes2HS/hCd0q2EdDAC7t4s4BMSKA/6cD0KEXGOO2JUeP/RAHo=
X-Gm-Gg: ASbGncuFsvggkKS8s60rAM24hS6JCzdzXLmsTjw9b6X9V2cprRKv9qvuq0O68dUAfOJ
 JQLEOP9Frcy1VWlqeFQK94KJNdLgBp9eSCsumRs4iIJ2cVVzP8nomSW7LAPUc4oQSZhzdOdPgXo
 Dsg1PzBK7IenVOXWJNSKt6GiFDUmeM57L7MSquqk25UbJ1/4yvNUz3+BJ1wZWvlJbEOeWAno+a6
 za7Lh9HYrl7jyQFXHXGD2vyNdb7UZoI8vZm0iPhZ527hVqwfmbk+VPbSUVtimWg9UOQJ4Iel56l
 hR2iNmhGrIHSLWLrweFAnC9llejcbGBN9tau4Otvhh0w5HhldhLzBSvvgMwaT0JDGWGPhE069EK
 fxm18fpfiMZuRmSzUQyZ0ZcpRfr8anX1miKZiDIfrd9ks3G6nlZRG2c9T
X-Received: by 2002:a17:90b:1a81:b0:32e:1213:1ec1 with SMTP id
 98e67ed59e1d1-3342a2c1012mr1392351a91.3.1758783968300; 
 Thu, 25 Sep 2025 00:06:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqm4vqi9INx9yrFdrRGXI6EToe4coF15uJ9HBu3jvVIDzDTGN/9Crhz4syIBdRqrXfjzrKqg==
X-Received: by 2002:a17:90b:1a81:b0:32e:1213:1ec1 with SMTP id
 98e67ed59e1d1-3342a2c1012mr1392327a91.3.1758783967897; 
 Thu, 25 Sep 2025 00:06:07 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:53 +0800
Subject: [PATCH v6 07/14] phy: qcom: qmp-usbc: Move USB-only init to
 usb_power_on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-7-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783910; l=2424;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=2OW0hX9TF4LQlObLysgxoFrzLXkqUgu/cavYoT3SHP8=;
 b=Zt3LO6ayN2gVmBZz9fMbnffGNND2tPNJsWMfyvfI7ZhWbNlv4laRaW2taqVXBUAQuoOOJ358i
 WNh/BeOChdWDMyylnbxEoajRmPXHQasqALO3KOps5erPlBA080l0SFx
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e9e1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JIg05Gv9We-wtn8mShgA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX2M/ZPInNLHEK
 Znq5G+GlojO2hnThS1dEt/WA1xqiqrozp1QuJinTPpKH5oLS6W7MyXuFR+2snoE7+wLq9VS/03O
 81ivgsUOMRjB72fpZlgF9Yue4r1H8AK5ahpA4MacDflYkIQtMt/AuxpkbVfkkvUubosC9VyrUHp
 b6NRP6Y2a6IOON1Tkk/UTb0Fm34AOfRcQwn9pfGNwNWzGvtH3Cv16aek951VnnwEohnZXBtDZ6S
 pkeZGK++TZq6cCmzq/+tEulsnlmbpxhhwvJ2FvWlTkcHhqhQ1H3l00LtefvsZYAEIR8cxmKLkyK
 dgTL30++jr3Ryd+fnmru85zI3c+CdLmx/zjODFFsbVfuh0++iBwndySGN7HATIrC1BUD6DXeago
 55FO4z+R
X-Proofpoint-GUID: xgKkaugAnd5IWb_0oKe_Kh7PcC0p6YBj
X-Proofpoint-ORIG-GUID: xgKkaugAnd5IWb_0oKe_Kh7PcC0p6YBj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042
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

The current implementation programs USB-specific registers in
qmp_usbc_com_init(), which is shared by both USB and DP modes. This
causes unnecessary configuration when the PHY is used for DP.

Move USB-only register setup from com_init to qmp_usbc_usb_power_on,
so it runs only for USB mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 7139f4dab82fd7b0d1362dddefba178465e76fa4..a971bdc3e767727e69ea07b14d9a036347d365f4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -30,6 +30,8 @@
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
+#define SW_PORTSELECT_VAL			BIT(0)
+#define SW_PORTSELECT_MUX			BIT(1)
 
 /* set of registers with offsets different per-PHY */
 enum qphy_reg_layout {
@@ -531,8 +533,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *pcs = qmp->pcs;
-	u32 val = 0;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -557,16 +557,6 @@ static int qmp_usbc_com_init(struct phy *phy)
 	if (ret)
 		goto err_assert_reset;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
-
-#define SW_PORTSELECT_VAL			BIT(0)
-#define SW_PORTSELECT_MUX			BIT(1)
-	/* Use software based port select and switch on typec orientation */
-	val = SW_PORTSELECT_MUX;
-	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
-		val |= SW_PORTSELECT_VAL;
-	writel(val, qmp->pcs_misc);
-
 	return 0;
 
 err_assert_reset:
@@ -599,6 +589,14 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
 	unsigned int val;
 	int ret;
 
+	qphy_setbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL], SW_PWRDN);
+
+	/* Use software based port select and switch on typec orientation */
+	val = SW_PORTSELECT_MUX;
+	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
+		val |= SW_PORTSELECT_VAL;
+	writel(val, qmp->pcs_misc);
+
 	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
 		      cfg->serdes_tbl_num);
 

-- 
2.34.1


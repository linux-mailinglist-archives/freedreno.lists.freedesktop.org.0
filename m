Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FBCB9DC63
	for <lists+freedreno@lfdr.de>; Thu, 25 Sep 2025 09:06:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439F010E85F;
	Thu, 25 Sep 2025 07:06:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBmoQazD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853AA10E860
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0KaOu017453
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y92IX8yih7rAKX9K1Ho2mfy8GLr4Y08/lKKaRrWHxvM=; b=bBmoQazDbXi+yyAN
 /xWwQC5UMbbF2crWnQnHfsqmtqKTZlBj81Nr+VDWjkC5W4D7MPDMVorqkk4ssJ/1
 xrWQqlYiNmtKp+oXAGoCbmkEl2QOaI7qLpQwhEWGW7TPQe0FaU0qU61voSF5YsVP
 bX3kcVjltI2HM3w+p7ymDxN0qMgNiLEoY+YXr6rMOCvmBBUW5JDSpBvSB9ytqobx
 W3/k22clBLAakYsw71NL/7MG9VR8WjHGmk3P/8NbReQpV7I6d2seEie29mp4CgOU
 648OK8QPjTM54rnesv+5aPZwFYALwCJMdbF1jZUPjUpRmskB8DmkbXAKBKVGBbBq
 nv5t3Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0f9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 07:06:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3306bae2119so300022a91.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Sep 2025 00:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758783982; x=1759388782;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y92IX8yih7rAKX9K1Ho2mfy8GLr4Y08/lKKaRrWHxvM=;
 b=OaxHOnaQ4MBJ7OK6dGWUs8OeVGFS9fD3TgCG1UaFPd3B6AhW2vhCOTvi6ZMfAnIaD/
 PT3vpl3YfjWleAzo96w1MMGonazqwrgmiHTHaZOxEIsyA+7MeHZ8SkuW+bD/qfDvVHBn
 wOkTFENokhjK+2Yi3BNzMzGGVOZ3li0bLo+5MBINap8VT1LwWl1c0be/JLYqysmJD3vi
 Le5HKFflmzOAYh69TschlFtmzPb2QgB4zOneBpHrkVtupaCKGboCJMY14eAWE3hTCla8
 skoH7oFF0ndaPvtV22o1c1kIRCsSmpuz/9W1bZ/2l09sEcTXJ0IdlimLl4ynIPWEeqTl
 eVAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFh8cUkYAk8DYehb+9zrTkfRBFTk6zBzzA45lIs4iZC9e1DuvX56OvyboBxjk2sl2IxfJufveGAtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT1Gbo3CpT8WdS1WUR/CU6onruDsy0tuvbA64acacXpnpZj5ix
 o4t9M0LMhyaY+EJOAdg+BB4t6VWIIqwd3F3ytuPdfDPzL/kljRX21F0YF0dRuy8qEKuB7VBh23Q
 b/arM1Dc/T9ffrsHwjTGt13lD+cVRXpAdJgroUzu7P9u6HPn0Nhjjh0qIJfKvAjUY98996sw=
X-Gm-Gg: ASbGncsb4/Y/rWK292UGtOU4wfsgk6mC+ilsH5M4mqgQFLseVqBNXbb3G8/UgqSZnkP
 VFPT3sCuVi8fpzq65EI0jMV1A/JiJgXxSgt2FWiUntSpM8E5aRVBQ2dgdzp+9hQ4oYwOGmp+DxU
 TKGo+FDbJNrO6xfik+HENEkd3n7JvG2gM5gXIDqWNw1LacOorlgXjTvZbTibn/h6Z7WLddW3YoT
 jJdUmdjE51hRmyoKf4uHD/Qn7Q72XG0JMOxpN7A7uNxtYoUk9/l+6TtLP+nwAyyM52WrMD1M5ea
 UmlOiy/andbSpKKrV4gFg0NaDbvVPQMTsX3IKU1b6j9XS6h0OoB9CDxHkmoSTsXqasBox3hmWgr
 V9m9OHoTzn7lUTiW9m0JcDinEHBTX/yCUeUWsaIQCu2fUDiORGXdrPGfx
X-Received: by 2002:a17:90b:3e86:b0:32e:74b6:4ef9 with SMTP id
 98e67ed59e1d1-3342a14d070mr1460417a91.0.1758783981943; 
 Thu, 25 Sep 2025 00:06:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVJUgOXOgcJy7m1Ri1LQlK1+kpAFT006YGG5mO4DwrycGUMXIxaJCXosIVFVpl7iMocv/LOQ==
X-Received: by 2002:a17:90b:3e86:b0:32e:74b6:4ef9 with SMTP id
 98e67ed59e1d1-3342a14d070mr1460388a91.0.1758783981458; 
 Thu, 25 Sep 2025 00:06:21 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3342a2bd584sm914253a91.0.2025.09.25.00.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 00:06:21 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 15:04:55 +0800
Subject: [PATCH v6 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-add-displayport-support-for-qcs615-platform-v6-9-419fe5963819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758783910; l=6447;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=LgO4dxC3/fyEINo3QtKn8terWYpqw7iknLpLIm5TGwU=;
 b=zWCI+Y6nYrd6jOeKJbvuKnKkhi579sNsoRkkNE3Ap9IpMp3B6DTUyrGf+V3pboIrED88kMcoi
 3aRsE0/vFR9C4RZUhCPJhLZ2XLOZLdVkp7VOnpfXz2OlmdvlLfAz9Wz
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: A1rk8OIyVIinBKRGzyRYi-tAroyqRnMP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX7K2i+oNQ7egK
 jJDXvJPiS3FNikCp9qF7RarTD3AqlL/kxld9jv0AOKxpxnDmfjDWEsKRBlb6RWSVwdj0dovGsYR
 Kv83KeWBXjBLcd8GP67BDzfYjiFidas0Iah7HURuLpTTDk3pz3EAyLy8Eij9AGYGRiqHyJ0lUkY
 yp4A3crFidaIb1sgVAs1lepy8K474YBUqH7BgA8Ykbx+6MFy8Bv/pXIYPpxI2BxBk+2dalmWbU1
 t/5F1edtCidjDsIlWXjXkM/bUUgaJmSym0L4BV+S/qCuDXgitxKk+Yvk4eXOh9PoICDY9Joz/69
 BH7ZahPl9DKvORBAxM9dm/qlETbBLvXB6XKSqaG/4Hwjdpu8BpylgbTO9Ptef0MZlFMdkyz24Sg
 CXT33iC8
X-Proofpoint-GUID: A1rk8OIyVIinBKRGzyRYi-tAroyqRnMP
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e9ee cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U7rhxC6dmq8FdBza6woA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011
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

Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
switchable PHYs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 194 ++++++++++++++++++++++++++++++-
 1 file changed, 193 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index fab6ccc4a5f12a4096e9a71f066f8ccec73adad2..3580c19fd62e02aa373cec42e9f53143f39214df 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -29,6 +29,8 @@
 #include "phy-qcom-qmp.h"
 #include "phy-qcom-qmp-pcs-misc-v3.h"
 
+#include "phy-qcom-qmp-dp-phy.h"
+
 #define PHY_INIT_COMPLETE_TIMEOUT		10000
 #define SW_PORTSELECT_VAL			BIT(0)
 #define SW_PORTSELECT_MUX			BIT(1)
@@ -711,6 +713,159 @@ static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submod
 	return 0;
 }
 
+static int qmp_usbc_dp_enable(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret;
+
+	if (qmp->dp_init_count) {
+		dev_err(qmp->dev, "DP already inited\n");
+		return 0;
+	}
+
+	mutex_lock(&qmp->phy_mutex);
+
+	ret = qmp_usbc_com_init(phy);
+	if (ret)
+		goto dp_init_unlock;
+
+	qmp_usbc_set_phy_mode(qmp, true);
+
+	cfg->dp_aux_init(qmp);
+
+	qmp->dp_init_count++;
+
+dp_init_unlock:
+	mutex_unlock(&qmp->phy_mutex);
+	return ret;
+}
+
+static int qmp_usbc_dp_disable(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+
+	mutex_lock(&qmp->phy_mutex);
+
+	qmp_usbc_com_exit(phy);
+
+	qmp->dp_init_count--;
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qmp_usbc_dp_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	const struct phy_configure_opts_dp *dp_opts = &opts->dp;
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	mutex_lock(&qmp->phy_mutex);
+
+	memcpy(&qmp->dp_opts, dp_opts, sizeof(*dp_opts));
+	if (qmp->dp_opts.set_voltages) {
+		cfg->configure_dp_tx(qmp);
+		qmp->dp_opts.set_voltages = 0;
+	}
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qmp_usbc_dp_calibrate(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	int ret = 0;
+
+	mutex_lock(&qmp->phy_mutex);
+
+	if (cfg->calibrate_dp_phy) {
+		ret = cfg->calibrate_dp_phy(qmp);
+		if (ret) {
+			dev_err(qmp->dev, "dp calibrate err(%d)\n", ret);
+			mutex_unlock(&qmp->phy_mutex);
+			return ret;
+		}
+	}
+
+	mutex_unlock(&qmp->phy_mutex);
+	return 0;
+}
+
+static int qmp_usbc_dp_serdes_init(struct qmp_usbc *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *serdes = qmp->dp_serdes;
+	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
+
+	qmp_configure(qmp->dev, serdes, cfg->dp_serdes_tbl,
+		      cfg->dp_serdes_tbl_num);
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_rbr,
+			      cfg->serdes_tbl_rbr_num);
+		break;
+	case 2700:
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_hbr,
+			      cfg->serdes_tbl_hbr_num);
+		break;
+	case 5400:
+		qmp_configure(qmp->dev, serdes, cfg->serdes_tbl_hbr2,
+			      cfg->serdes_tbl_hbr2_num);
+		break;
+	default:
+		/* Other link rates aren't supported */
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qmp_usbc_dp_power_on(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+
+	void __iomem *tx = qmp->dp_tx;
+	void __iomem *tx2 = qmp->dp_tx2;
+
+	mutex_lock(&qmp->phy_mutex);
+
+	qmp_usbc_dp_serdes_init(qmp);
+
+	qmp_configure_lane(qmp->dev, tx, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 1);
+	qmp_configure_lane(qmp->dev, tx2, cfg->dp_tx_tbl, cfg->dp_tx_tbl_num, 2);
+
+	/* Configure special DP tx tunings */
+	cfg->configure_dp_tx(qmp);
+
+	/* Configure link rate, swing, etc. */
+	cfg->configure_dp_phy(qmp);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
+static int qmp_usbc_dp_power_off(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+
+	mutex_lock(&qmp->phy_mutex);
+
+	/* Assert DP PHY power down */
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, qmp->dp_dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
 static const struct phy_ops qmp_usbc_usb_phy_ops = {
 	.init		= qmp_usbc_usb_enable,
 	.exit		= qmp_usbc_usb_disable,
@@ -718,6 +873,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_ops qmp_usbc_dp_phy_ops = {
+	.init		= qmp_usbc_dp_enable,
+	.exit		= qmp_usbc_dp_disable,
+	.configure	= qmp_usbc_dp_configure,
+	.calibrate	= qmp_usbc_dp_calibrate,
+	.power_on	= qmp_usbc_dp_power_on,
+	.power_off	= qmp_usbc_dp_power_off,
+	.owner		= THIS_MODULE,
+};
+
 static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -1300,6 +1465,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
 	return 0;
 }
 
+static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	struct qmp_usbc *qmp = dev_get_drvdata(dev);
+
+	if (args->args_count == 0)
+		return qmp->usb_phy;
+
+	switch (args->args[0]) {
+	case QMP_USB43DP_USB3_PHY:
+		return qmp->usb_phy;
+	case QMP_USB43DP_DP_PHY:
+		return qmp->dp_phy ?: ERR_PTR(-ENODEV);
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
 static int qmp_usbc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1370,9 +1552,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
 
+	if (qmp->dp_serdes != 0) {
+		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
+		if (IS_ERR(qmp->dp_phy)) {
+			ret = PTR_ERR(qmp->dp_phy);
+			dev_err(dev, "failed to create PHY: %d\n", ret);
+			goto err_node_put;
+		}
+		phy_set_drvdata(qmp->dp_phy, qmp);
+	}
+
 	of_node_put(np);
 
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 

-- 
2.34.1


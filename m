Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE11B89EC0
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 16:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 656CF10EA0D;
	Fri, 19 Sep 2025 14:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cYn5Onil";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10C6F10EA17
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:10 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J9BiVk021854
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5aiRCCE9ocbA/hLxwlTICCbBNjV8GTxNbYTql/HA9AY=; b=cYn5Onilx02UziOR
 ieo1krNIgxSDaCAw5KRrwuJ2emGei5yJgBVM5gD834uC6pq/TkM+dKJY9NL8hZxp
 tekWIa2M63Q9Dct5FFW/2PVMcIu+dV06Qw0PFiZs13o8+wEDKd3HoKWXeEeuA4o4
 z+KDHE55DwZ6ZKDeH7uunrCAbbClRiZjFEokbchkyYCwWXXVE1GtuhlbBFcWpdw2
 o02+Fqyz7m5nq34eNydnE60nx8NAeExAs+F5ySsZmmmMqddV83LQgqdyrZYO8DoH
 BLURuzoUMHLpbDoHQ1QWfKAUZz9ZDUuD07A5zZdtJ4VdU6TXBnPd6BgerQOUGFGQ
 GPU6lg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy2npr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 14:26:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-26b3e727467so2157245ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 07:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758291968; x=1758896768;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5aiRCCE9ocbA/hLxwlTICCbBNjV8GTxNbYTql/HA9AY=;
 b=GZWUH9O6NXigz+KGXARKGtgoCCYfhnnJLBqNY4xc/UjkdKUO7TseXavo8O0BKbH+rb
 rcMTyARwkhWXhilM/l8L73s4bjgOzJSVmmiDBd0GJmafQi34hcJncFcLZjLgT+/wH1FL
 IrqvhUxlafAfuVSQiT/R7rkZVmTvM7yRxYWvqksU8hmd9ubvS6LcmmrBYupWZGxsc6qo
 iVSHLyjDeBGW+99Tyu/dv1Q3qwVCZjC4y3WMABPiV7+qyfH7SdRRBi04zS+Z7GNCbtGZ
 2VQu2zHVsY7GS/mtbXr24ejRHLQlLfdmm6KKACCVTudlarh90Mn/dNQj+IGuiAYDyLNJ
 GT1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCl4F1yzh4w16uzyeUOILF7h9Lwj3tqY2GDXawwq+gZeBzmC68A1zuS/q3HzLmR+lmi418+fMpVdU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yygkwu1NhLvuINLBjBgzpuYL3vBssEKi0Mm4273o6nLIQf1JUZ2
 w0f/eIWEliX74pZ8pfERixFS4Wcg4Gpv/HpBjpJkeEW0T4L9Nvtg1HlDgHHY2jU9QfZha3RLjZq
 WAD7HIpQhCvE7kwEUFn2Co9vJGkwIfXI+BSpOS50F2l2yc4sU5CvBMStI8zx/ehyM5D9CoxA=
X-Gm-Gg: ASbGncuFltBItHKC3Z0CztQTHmGXLG1fDOKM27Dr6hUimumAmkbq9TxytVmTHFV9CQV
 ea2nyZ1fmf9z1h2dKolp9Gera15rNZojznWT9c0klVOuZkH8IOLQZfNxMTt8xLThsyej22sXWeW
 j8tYfT50+g2k+WMTcNGXI/6nYgvecS8LYVdUOpBkPfKmWw+oTMhVTwHDIRXe+BhSaUNl2efZvB3
 LJ0J07EvWldGiArEFyiLvZ79LQEAp/Dw5nRIMOakDyk/jPGq5o+NIxw7xENC0nbwq9048lZLovV
 5IFyVT9PCdwW6ahDMvaDSujCsObMnC9f5MhV67k+WrGARb9h6wHMajucZ7VZqEv1e3aM2m/0UDF
 OwdZKZ24/prnF2w==
X-Received: by 2002:a17:902:f904:b0:261:500a:5742 with SMTP id
 d9443c01a7336-269ba547cc5mr18602765ad.10.1758291968434; 
 Fri, 19 Sep 2025 07:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHadt6BN7UHxCs91ZL5/MN6Y/c2n9SW35yuaMVxqkLFd9EHXiFLAAcXdqXX+9UDIM2eiq4k+A==
X-Received: by 2002:a17:902:f904:b0:261:500a:5742 with SMTP id
 d9443c01a7336-269ba547cc5mr18602365ad.10.1758291967777; 
 Fri, 19 Sep 2025 07:26:07 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 07:26:07 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:26 +0800
Subject: [PATCH v5 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291894; l=6380;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=GCe+y+ihdduBCycjVbFmGe//h71+pv3uLemlzIyg5DM=;
 b=3umBmQ8TuHOP5HpaoxXj1jkMkdQm1WdIzzpKNRdgsCfHfHddJZ9nxvUObk/m9vhZAFEYtFg51
 B7FRXBXwNP9AReKCbUCBh3/DVESKmfF8EzrpwXupfPYOEm5oD4bbYDw
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX26HXEsPcIArX
 7jYENNpCid34TKZJNbZS/5WvUaeIClrJFnX+wD0SRXWbdtwda/jdLX1Eh/RVCXlvUyWRvMYQa2i
 z80mQGxIY7RpEbLp4HPOraCHe+FmTOMNZIjv9ikAOURIdgIsCIHD66bZqrkY+fjq+IgUATwVN92
 TPDN8Y4wui/zi3yHcJD8oaDHJvuNYSizYkxSquq5BJ1sXACff2V/bMYHmbQjZ7Y6Osi3sDDBGWT
 A1OUVcy+J7KSrALih2TpEOs/R8Xk0Vr/vGQqQPLugTUJKbSD0/h8rbQLhVbJsDj+j3YGes6sjac
 XhbY7kz+2TMi7OTsZe6HPmEETzd6JYnfb0JrDCeZ8cBUGHxI1EAOOSap7DJoYQ0UQC9ZmJF6NJ2
 vdekp0+v
X-Proofpoint-ORIG-GUID: uxN6S7Ap7Fski5nj1XIAXlW_3UyzlvWu
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cd6801 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=U7rhxC6dmq8FdBza6woA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: uxN6S7Ap7Fski5nj1XIAXlW_3UyzlvWu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 194 ++++++++++++++++++++++++++++++-
 1 file changed, 193 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index cb0197538befa6e7a5408c8d2d45225aa9520e8b..74dcf954845bcf8209202b75e9db10c3f6bdebd9 100644
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
@@ -715,6 +717,159 @@ static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submod
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
@@ -722,6 +877,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
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
@@ -1304,6 +1469,23 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
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
@@ -1374,9 +1556,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
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


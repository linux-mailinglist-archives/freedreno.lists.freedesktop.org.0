Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F60B0D2AB
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 09:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2169110E5F5;
	Tue, 22 Jul 2025 07:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfZXKYwu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717E110E5F8
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M4SqRD001048
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kBouSENjpa2uWcyVTh9mDvQj4v7j/QXBjCY9PoNaZfs=; b=BfZXKYwuo2e8wX7v
 f5qTZxLftqqQvsdv4sCXpZpM0GbrJiQenqbGce1BZR/yCZKRFe6GmLndbO7TIQ/T
 9j6C3ygjnOi3qAk9Zym533m6zFT8ZtnefPlav1ugjogAXRDlBsiRby7npwR8n3o7
 lHVqGLy5Qt+5JTPc2i7k4qclErDZUV2cdR+X9TU2u+aRUSu7KsUNuGWMtBt8QnuP
 FeKCKo5FxvWci9rbdmu9SmztN+gzzv+JzA0SIzqczIvaFMEcJzEa4HvwmGgLvYF9
 Y4u7wTZwEp8zR6KKnkkyqopd3YSXyAZZqwBXtAOn6x/rXoHTyhBmmxEiK9MqnoFT
 3E1Vkw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dgcgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-318eed27daaso1203231a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753169006; x=1753773806;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kBouSENjpa2uWcyVTh9mDvQj4v7j/QXBjCY9PoNaZfs=;
 b=DKKE0zsOv9EY1iVfHp6l4jy9zo82YxiuAArZmSL1CB4J+4tdvc+JMrMG/tUckC0gRU
 w0mZZ6FGKxsyVAzIvUwrp9IiCBXL04YIfM7lK7BTAK43pPqQjhOyXBCa1mMj+IASTeDx
 ZBDly+vYiuX6KE9v2VPX/obnOj/0UeV0goRMEt+9YT437WOY3GcNVn5fS+Dn55LRdBNL
 Fw8c7yUkt1d3Wbw9xUy5CLkL2oKbovsDMs3Vs8skCFSgchXaG0SywddLQ3zECmkSW0ah
 QGteBsvv0iZ8Ra0Plv403VoY0Ozu4cckP1lXBktKbvTYjVkUBMxjlfOUH6SjIalWeiJa
 x29w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV87Yry+Mf5Cp67gIhYSq96+5zRmRY5XCmV08nWMN5YuGsVmrFHj4+0UkN2Emx+NnDd3M3wd3H3C30=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzoyfr1Qpq9TRc+tGyv9euL9zr/hUlM5iSeD/3GHpaYS+SOuZul
 STkaD1ErRRbcCq2KEGkBCyfMjKO9L9Yuw//CHEkeaWvv1nxe7E0B4AKLdiGzx00sZIuNbYWAyem
 UDdpGGsEfzt4/O934g6Scb9vG4ckR0z85wD2W1oJ3S98XSxDcTgTRzvUEqNDFtUs9fIuzjhU=
X-Gm-Gg: ASbGncub/RDOzc92U90e7JV4SsmTNrM7nwSAv5zXTyDY/g61FwdgavARJrvJ+F/NAY4
 8JnCsnVB7Ky6nbjmLimAMo1iV4FfRMzXuVDA6XIV7uodnhtsupmviU++pUZFjo6n4Ilbn94atYD
 XZFU550oN9S4i+/vA8N7e0kTcQM7iwi1QblFKLS+hTj5wp6TbQ+6trdjlhE5OeS8ORCQC+YNFqt
 gJX69KC9yJcy4K3mvlV8C+AkuLdQ9+BIp1aIOvoZBmd2XfI4/xIXqYZmBb5uxui1ZoN+cnWWsLa
 pGCh71i4oCq4LBIGYyDcZaG6VbJU5bZU82WZHZmKqsUhMU1vbVfqwJKupdcBRkJErAtdccmFUTm
 xgP4i6PiwEID4fkCGMu0lLQPzcBEn4JraWgSM4qeBwyoW8mhPUu7MdGCZ
X-Received: by 2002:a17:902:e74d:b0:23d:dcc2:4e9 with SMTP id
 d9443c01a7336-23e24ee8938mr120426595ad.5.1753169005715; 
 Tue, 22 Jul 2025 00:23:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeLmSSAA/kn5WLLS85VO9IAQffvJ1+BOwB4B+JyNmGv7o3XWzjKrK/T2BV7NO4ukDIL8/Y9g==
X-Received: by 2002:a17:902:e74d:b0:23d:dcc2:4e9 with SMTP id
 d9443c01a7336-23e24ee8938mr120426175ad.5.1753169005011; 
 Tue, 22 Jul 2025 00:23:25 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:24 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:10 +0800
Subject: [PATCH v2 09/13] phy: qcom: qmp-usbc: Wire up DP PHY ops and flow
 for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-9-42b4037171f8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=16498;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=lPQiwwQXsnw1J7JUgfbArsi1t8dQOJ18Rw4y+r8Vi3U=;
 b=cnSZMRx3fl39Sxqqg/gVwaRo9hi+a8KSipuUd94bsxZOJtMvGXvhNbZ+PO0oDkbQTqqDwXwtT
 CiHkglxHprVAObHZyonenccHKREiKaC3NMx3bVBEPTyyJl71WLj6Sbd
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f3c6f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=FmUrSGrLgLJVcwyJgzEA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 4qYIRibf1CesocNaiBF5omBhCEUW45vL
X-Proofpoint-ORIG-GUID: 4qYIRibf1CesocNaiBF5omBhCEUW45vL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX9dFo+BDiiPn+
 g9amRS6yOlARBSUXeY+J7wqNnnvJ9+B9qp5V5Ru9mxiGVVXB7+4IQ3/gMHrhLImu30/3M1KVkin
 cQfocbK6lQkY4n1dbhAB50b+FNGLwXhffOOt6dLn15WzjYbE3jB+He7hqgVRCwRaBI89Hkyuf6v
 Af8FtQPwCdS0RfOnzmqARzmhYRvo6gIr7TFqXJYnInFfJlS64xQEVbRCE9DsluHhJFCGfTgXBsR
 vnS9mALEjY/QNuzGOft4LCwQhGYe7NyNM4E71h83dmGN1lewCg+risPnuPtOLgAg2RaHfcNcX1u
 nennjh2tzuYM7dOShwVkLMg/ZF8ceeZQ0k/OdndCYOO1R1yn6BgFXqy2W4OjwOZ1VnyXOFx/FQY
 MasN04ok+C66BnPzAQxb3JUXV/ymUmI5+6kRXnL2EqEjzBkw8MZVISeETv7vchoVk/Oz3omV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Connect all DP PHY operation callbacks for QCS615, including init,
power_on/off, configure, and calibrate. This patch also adds
support for DP-specific clock registration, TCSR parsing, and
AUX bridge integration.

With this change, the DP PHY functional flow is fully implemented and
aligned with the QMP combo PHY design.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 486 ++++++++++++++++++++++++++++++-
 1 file changed, 484 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 13228a21644271567d4281169ff1c1f316465d81..6291298904de9717283e59f1ca2a845b46146d52 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -22,6 +22,8 @@
 #include <linux/slab.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_mux.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
+#include <drm/bridge/aux-bridge.h>
 
 #include "phy-qcom-qmp-common.h"
 
@@ -1151,6 +1153,163 @@ static int qmp_usbc_usb_set_mode(struct phy *phy, enum phy_mode mode, int submod
 	return 0;
 }
 
+static int qmp_usbc_dp_enable(struct phy *phy)
+{
+	struct qmp_usbc *qmp = phy_get_drvdata(phy);
+	const struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+	int ret;
+
+	if (qmp->init_count) {
+		dev_err(qmp->dev, "type(%d) inited(%d)\n", qmp->type, qmp->init_count);
+		return 0;
+	}
+
+	mutex_lock(&qmp->phy_mutex);
+
+	ret = qmp_usbc_generic_init(phy);
+	if (ret) {
+		dev_err(qmp->dev, "type(%d) com_init fail\n", qmp->type);
+		goto dp_init_unlock;
+	}
+
+	cfg->dp_aux_init(qmp);
+
+	qmp->init_count++;
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
+	qmp_usbc_generic_exit(phy);
+
+	qmp->init_count--;
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
+	struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+
+	mutex_lock(&qmp->phy_mutex);
+
+	memcpy(&layout->dp_opts, dp_opts, sizeof(*dp_opts));
+	if (layout->dp_opts.set_voltages) {
+		cfg->configure_dp_tx(qmp);
+		layout->dp_opts.set_voltages = 0;
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
+	struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
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
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+	void __iomem *serdes = layout->dp_serdes;
+	const struct phy_configure_opts_dp *dp_opts = &layout->dp_opts;
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
+	const struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+
+	void __iomem *tx = layout->dp_tx;
+	void __iomem *tx2 = layout->dp_tx2;
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
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+
+	mutex_lock(&qmp->phy_mutex);
+
+	/* Assert DP PHY power down */
+	writel(DP_PHY_PD_CTL_PSR_PWRDN, layout->dp_phy + QSERDES_DP_PHY_PD_CTL);
+
+	mutex_unlock(&qmp->phy_mutex);
+
+	return 0;
+}
+
 static const struct phy_ops qmp_usbc_usb_phy_ops = {
 	.init		= qmp_usbc_usb_enable,
 	.exit		= qmp_usbc_usb_disable,
@@ -1158,6 +1317,16 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
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
 	const struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
@@ -1284,6 +1453,32 @@ static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
 			dev_err(dev, "failed at devm_regulator_bulk_get\n");
 			return ret;
 		}
+	} else {
+		struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+		int num = cfg->num_vregs;
+
+		qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
+		if (!qmp->vregs)
+			return -ENOMEM;
+
+		for (i = 0; i < num; i++)
+			qmp->vregs[i].supply = cfg->vreg_list[i].name;
+
+		ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
+		if (ret) {
+			dev_err(dev, "failed at devm_regulator_bulk_get\n");
+			return ret;
+		}
+
+		for (i = 0; i < num; i++) {
+			ret = regulator_set_load(qmp->vregs[i].consumer,
+						 cfg->vreg_list[i].enable_load);
+			if (ret) {
+				dev_err(dev, "failed to set load at %s\n",
+					qmp->vregs[i].supply);
+				return ret;
+			}
+		}
 	}
 
 	return 0;
@@ -1337,6 +1532,28 @@ static void phy_clk_release_provider(void *res)
 	of_clk_del_provider(res);
 }
 
+static struct clk_hw *qmp_usbc_clks_hw_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct qmp_usbc *qmp = data;
+
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+		return &layout->pipe_clk_fixed.hw;
+	}
+
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+
+	switch (clkspec->args[0]) {
+	case QMP_USB43DP_DP_LINK_CLK:
+		return &layout->dp_link_hw;
+	case QMP_USB43DP_DP_VCO_DIV_CLK:
+		return &layout->dp_pixel_hw;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
 /*
  * Register a fixed rate pipe clock.
  *
@@ -1379,9 +1596,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 	if (ret)
 		return ret;
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
+	ret = of_clk_add_hw_provider(np, qmp_usbc_clks_hw_get, qmp);
+	if (ret) {
+		dev_err(qmp->dev, "add provider fail ret:%d\n", ret);
 		return ret;
+	}
 
 	/*
 	 * Roll a devm action because the clock provider is the child node, but
@@ -1577,6 +1796,238 @@ static int qmp_usbc_parse_vls_clamp(struct qmp_usbc *qmp)
 	return 0;
 }
 
+static int qmp_usbc_parse_dp_tcsr(struct qmp_usbc *qmp)
+{
+	struct of_phandle_args tcsr_args;
+	struct device *dev = qmp->dev;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(dev->of_node, "qcom,tcsr-reg", 1, 0,
+					       &tcsr_args);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to parse qcom,tcsr-reg\n");
+
+	qmp->tcsr_map = syscon_node_to_regmap(tcsr_args.np);
+	of_node_put(tcsr_args.np);
+	if (IS_ERR(qmp->tcsr_map))
+		return PTR_ERR(qmp->tcsr_map);
+
+	qmp->dp_phy_mode_reg = tcsr_args.args[0];
+
+	return 0;
+}
+
+static int qmp_usbc_parse_dp_dt(struct qmp_usbc *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+	struct qmp_phy_dp_cfg *cfg = to_dp_cfg(qmp);
+	const struct qmp_usbc_dp_offsets *offs = cfg->offsets;
+	struct device *dev = qmp->dev;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	layout->dp_serdes = base + offs->dp_serdes;
+	layout->dp_tx = base + offs->dp_txa;
+	layout->dp_tx2 = base + offs->dp_txb;
+	layout->dp_phy = base + offs->dp_phy;
+
+	ret = qmp_usbc_clk_init(qmp);
+	if (ret) {
+		dev_err(dev, "clk init fail, ret:%d\n", ret);
+		return ret;
+	}
+
+	ret = qmp_usbc_reset_init(qmp, dpphy_reset_l,
+				  ARRAY_SIZE(dpphy_reset_l));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/*
+ * Display Port PLL driver block diagram for branch clocks
+ *
+ *              +------------------------------+
+ *              |         DP_VCO_CLK           |
+ *              |                              |
+ *              |    +-------------------+     |
+ *              |    |   (DP PLL/VCO)    |     |
+ *              |    +---------+---------+     |
+ *              |              v               |
+ *              |   +----------+-----------+   |
+ *              |   | hsclk_divsel_clk_src |   |
+ *              |   +----------+-----------+   |
+ *              +------------------------------+
+ *                              |
+ *          +---------<---------v------------>----------+
+ *          |                                           |
+ * +--------v----------------+                          |
+ * |    dp_phy_pll_link_clk  |                          |
+ * |     link_clk            |                          |
+ * +--------+----------------+                          |
+ *          |                                           |
+ *          |                                           |
+ *          v                                           v
+ * Input to DISPCC block                                |
+ * for link clk, crypto clk                             |
+ * and interface clock                                  |
+ *                                                      |
+ *                                                      |
+ *      +--------<------------+-----------------+---<---+
+ *      |                     |                 |
+ * +----v---------+  +--------v-----+  +--------v------+
+ * | vco_divided  |  | vco_divided  |  | vco_divided   |
+ * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
+ * |              |  |              |  |               |
+ * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
+ * +-------+------+  +-----+--------+  +--------+------+
+ *         |                 |                  |
+ *         v---->----------v-------------<------v
+ *                         |
+ *              +----------+-----------------+
+ *              |   dp_phy_pll_vco_div_clk   |
+ *              +---------+------------------+
+ *                        |
+ *                        v
+ *              Input to DISPCC block
+ *              for DP pixel clock
+ *
+ */
+static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 1620000000UL / 2:
+	case 2700000000UL / 2:
+	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct qmp_phy_dp_layout *layout;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	layout = container_of(hw, struct qmp_phy_dp_layout, dp_pixel_hw);
+
+	dp_opts = &layout->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		return 1620000000UL / 2;
+	case 2700:
+		return 2700000000UL / 2;
+	case 5400:
+		return 5400000000UL / 4;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_pixel_clk_ops = {
+	.determine_rate	= qmp_dp_pixel_clk_determine_rate,
+	.recalc_rate	= qmp_dp_pixel_clk_recalc_rate,
+};
+
+static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 162000000:
+	case 270000000:
+	case 540000000:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct qmp_phy_dp_layout *layout;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	layout = container_of(hw, struct qmp_phy_dp_layout, dp_link_hw);
+	dp_opts = &layout->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+		return dp_opts->link_rate * 100000;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_link_clk_ops = {
+	.determine_rate	= qmp_dp_link_clk_determine_rate,
+	.recalc_rate	= qmp_dp_link_clk_recalc_rate,
+};
+
+static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node *np)
+{
+	struct clk_init_data init = { };
+	int ret = 0;
+	struct qmp_phy_dp_layout *layout = to_dp_layout(qmp);
+
+	ret = of_property_read_string_index(np, "clock-output-names", 0, &init.name);
+	if (ret < 0) {
+		dev_err(qmp->dev, "%pOFn: No link clock-output-names\n", np);
+		return ret;
+	}
+
+	init.ops = &qmp_dp_link_clk_ops;
+	layout->dp_link_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &layout->dp_link_hw);
+	if (ret < 0) {
+		dev_err(qmp->dev, "link clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	ret = of_property_read_string_index(np, "clock-output-names", 1, &init.name);
+	if (ret) {
+		dev_err(qmp->dev, "%pOFn: No div clock-output-names\n", np);
+		return ret;
+	}
+
+	init.ops = &qmp_dp_pixel_clk_ops;
+	layout->dp_pixel_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &layout->dp_pixel_hw);
+	if (ret) {
+		dev_err(qmp->dev, "pxl clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qmp_dp_register_clocks(struct qmp_usbc *qmp, struct device_node *dp_np)
+{
+	int ret;
+
+	ret = phy_dp_clks_register(qmp, dp_np);
+	if (ret) {
+		dev_err(qmp->dev, "dp clk reg fail ret:%d\n", ret);
+		return ret;
+	}
+
+	ret = of_clk_add_hw_provider(dp_np, qmp_usbc_clks_hw_get, qmp);
+	if (ret) {
+		dev_err(qmp->dev, "add provider fail ret:%d\n", ret);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, dp_np);
+}
+
 static int qmp_usbc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1625,9 +2076,29 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 			np = of_node_get(dev->of_node);
 			ret = qmp_usbc_parse_usb_dt(qmp);
 		}
+		if (ret)
+			goto err_node_put;
+	} else {
+		qmp->layout = devm_kzalloc(dev, sizeof(struct qmp_phy_dp_layout), GFP_KERNEL);
+		if (!qmp->layout)
+			return -ENOMEM;
 
+		np = of_node_get(dev->of_node);
+		ret = qmp_usbc_parse_dp_tcsr(qmp);
 		if (ret)
 			goto err_node_put;
+
+		ret = qmp_usbc_parse_dp_dt(qmp);
+		if (ret) {
+			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
+			goto err_node_put;
+		}
+
+		ret = drm_aux_bridge_register(dev);
+		if (ret) {
+			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
+			goto err_node_put;
+		}
 	}
 
 	ret = qmp_usbc_typec_switch_register(qmp);
@@ -1655,6 +2126,17 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to create PHY: %d\n", ret);
 			goto err_node_put;
 		}
+	} else {
+		ret = qmp_dp_register_clocks(qmp, np);
+		if (ret)
+			goto err_node_put;
+
+		qmp->phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
+		if (IS_ERR(qmp->phy)) {
+			ret = PTR_ERR(qmp->phy);
+			dev_err(dev, "failed to create PHY: %d\n", ret);
+			goto err_node_put;
+		}
 	}
 
 	phy_set_drvdata(qmp->phy, qmp);

-- 
2.34.1


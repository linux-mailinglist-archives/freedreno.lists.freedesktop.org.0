Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5246AAFEB41
	for <lists+freedreno@lfdr.de>; Wed,  9 Jul 2025 16:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C76A10E05D;
	Wed,  9 Jul 2025 14:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IoakLytA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27B6110E03A
 for <freedreno@lists.freedesktop.org>; Wed,  9 Jul 2025 14:08:44 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 569CoZwP016444
 for <freedreno@lists.freedesktop.org>; Wed, 9 Jul 2025 14:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=rPPPL4r56hsvE66g/qgGzmPaE4vb8iTxuoc
 fJHXWXUI=; b=IoakLytAlZco8p/91uXuY0gtrPN0/idlEnX8Y9KjnZ7UnlUxrIw
 T+zuG4lDSprHwG3errVFAub5pFNhvnBoCS59tsY3qOu9FF5wI6plVt8G5xlAPi5G
 QbHX0wSsZsLuCwVkHMSGywmr+9BScmLLClwA7gK4PGzBaQdbWpJVXmGAZMG5AgRD
 TfftCB9y/uFJkoRizTqCRnMVqIieDYRTu8R1eBKrt9QCIpCf/pxFUXUs5ai7DjEc
 yEbgkP5egB3saD81bMpyBU7ltQdFYX5eLEps86gpMXUXsRm8dvKJRRJ42WPWXPlL
 X6oCHMw8vN/vnyHw7/aTRHCMQ7cpbJl8/0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap1abh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jul 2025 14:08:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4a584d0669fso117880191cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jul 2025 07:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752070122; x=1752674922;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rPPPL4r56hsvE66g/qgGzmPaE4vb8iTxuocfJHXWXUI=;
 b=kN/mC8cBwtctufoplnET0EPTlescEMwqAPL7eAIpMJgUMHPFRcJHbDgZLNNknWqlAO
 wV+nbHNhhRgeAQNs6DADJ0SZ5bxHkVJLGdV8q/RfyfPMq2DVkqOqgBmatecOIFWLr4Gy
 7jLyXWtO0IJ9m7f1f7uyn8XNyENr60bA/xxJzfqXz5Ha9MEBsPuf37rEkJSJc5cWdopJ
 TvQodI/YTJrfYm/FwU1ZfLLq6YUKYtECDojJk4y3aTc4srlEK5lFpgaTYpmGm0ZYRfj4
 fgiQRs5sJ5PRB9QvK8th9G1VtMPhn0aeo13bGd9CEJm5/ssjKcrtCpuG0iCxJux1/MSx
 2FDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHzrQNjFCJRtthFKK7Rit4BANXy3ls6fueeA4Z64sASx7Uu37kbtLNl5qYyh0VgEiMC/bAPn0kzz0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6XlUokQzyOwoifwZIDZrIu68qcHlnWq019qwsdEwNxcEqS+Ih
 6FJUHxvYo5n5CUp+7kdrWb3WCQe78QEfPBpvCTFDTua86+O6nGmbofXqDOQ8jEUTGv2mmwSEeo8
 2bfl7gpZRzPqTCWeRrHXYrzMajmSyQ8/OYxD81qG4tERRvcRoxSaUWLHD/Nu/FjG52ntjAtI=
X-Gm-Gg: ASbGncugLaWWRtqbKvWp/D5IYiMxrAUyDyNG5yRu9gsc2XVfv/q2cCmh8F76OOasCN4
 vbv+wF/YOoD7K8vBMXjtRSZJKuXQqd8d5qeEuztMdiLqAe/yS4B9QaJtUZgPFK8QH/epLgDt8uu
 w+S4IrxoQArOmIe1Bfl0UjDNxrDGtX0nGjnRc1xxBuhASxnaotpTxsll+ZYLcnwgAUOB8EQ8Ri6
 OXgNDJICJzgezvgJeg5oyKbjMx18uqN/4uTQr4NFqyV3cR5HawKxs2co2iASVxWsk0OaTZfBe+5
 YmR8LVvLJ4WjrWuf1U1cUcJO+XXK9elGX2Z2tk9zL2+kB7IhTW3ko3ExbQ==
X-Received: by 2002:a05:622a:4d47:b0:4a9:c8c2:12cf with SMTP id
 d75a77b69052e-4a9ded44edemr33688401cf.36.1752070121473; 
 Wed, 09 Jul 2025 07:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp7LPf+6/idzkddzwujz3AEqLRHZrm21CUjTuJ/s23DbxIJCpdWglwm/uYktDx/4ddjHotCQ==
X-Received: by 2002:a05:622a:4d47:b0:4a9:c8c2:12cf with SMTP id
 d75a77b69052e-4a9ded44edemr33687861cf.36.1752070120920; 
 Wed, 09 Jul 2025 07:08:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com
 ([2a01:e0a:82c:5f0:55d5:c328:45d2:bf55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50503c4sm25555615e9.11.2025.07.09.07.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jul 2025 07:08:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, abhinav.kumar@linux.dev,
 jessica.zhang@oss.qualcomm.com, sean@poorly.run,
 marijn.suijten@somainline.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3] drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue
Date: Wed,  9 Jul 2025 16:08:36 +0200
Message-Id: <20250709140836.124143-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e77eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=Hn5eap2Cq60OI_ydS0cA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: tcJyOLivXwwkB419a2RHcNOUbbawBHgk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDEyNyBTYWx0ZWRfX/7iyIxFX80oI
 //grKlN09+CyTS+Sw32k+gxK5xv8L4U+L5lCRntVVm5Ny1L/GIxtv62h9Wb9k5Qi1qI5knLyNvi
 GqUSFFBOW8BBFfJHXinAXuGPn+Y8+NDXdQZVHqdN2c5yMnAYLUe5R/CVfU7jU2nD7sQShKkPn+t
 vtUPpS+RH33v0NuzjrosgOtl0w94kqjZDcGRM/7t/NwqvYvss8ydft7nbQtv8u3QAvJj/TtT5SK
 Qk2Bd3p9Xvq1RUhqXWc/kUlw+FTFLtU2KC2Tug/AXXxNAoh6akZL/dYkjaZofKfhugzVm4KEPom
 BDwsvFAEluYOpXAtr7GO++ciTHyn7u1/+jG/YgVIVN6NiRZI34NoOEwnKK5gjI0V3/WgV6Erjkv
 7wJONM9e0F514tGdRd1YWu0lx6YvbHR78JPj02PeSBTv74g7jUwwfHvpSfjmJwnuwR1Qkv1G
X-Proofpoint-GUID: tcJyOLivXwwkB419a2RHcNOUbbawBHgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_03,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090127
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

To configure and enable the DSI PHY PLL clocks, the MDSS AHB clock must
be active for MMIO operations. Typically, this AHB clock is enabled as
part of the DSI PHY interface enabling (dsi_phy_enable_resource).

However, since these PLL clocks are registered as clock entities, they
can be enabled independently of the DSI PHY interface, leading to
enabling failures and subsequent warnings:

```
msm_dsi_phy 5e94400.phy: [drm:dsi_pll_14nm_vco_prepare] *ERROR* DSI PLL lock failed
------------[ cut here ]------------
dsi0pllbyte already disabled
WARNING: CPU: 3 PID: 1 at drivers/clk/clk.c:1194 clk_core_disable+0xa4/0xac
CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted:
Tainted: [W]=WARN
Hardware name: Qualcomm Technologies, Inc. Robotics RB1 (DT)
pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[...]
```

This issue is particularly prevalent at boot time during the disabling of
unused clocks (clk_disable_unused()) which includes enabling the parent
clock(s) when CLK_OPS_PARENT_ENABLE flag is set (this is the case for the
14nm DSI PHY PLL consumers).

To resolve this issue, we move the AHB clock as a PM dependency of the DSI
PHY device (via pm_clk). Since the DSI PHY device is the parent of the PLL
clocks, this resolves the PLL/AHB dependency. Now the AHB clock is enabled
prior the PLL clk_prepare callback, as part of the runtime-resume chain.

We also eliminate dsi_phy_[enable|disable]_resource functions, which are
superseded by runtime PM.

Note that it breaks compatibility with kernels before 6.0, as we do not
support anymore the legacy `iface_clk` name.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 v3: Drop extra pm_runtime calls from probe
     Reword resume error on message 
     Document compatibility break

 v2: Move AHB clock into a proper PM dep instead of manually toggling it
     from the PLL clock driver.

 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 59 ++++++++-------------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |  1 -
 2 files changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 5973d7325699..cd6bc1fdd038 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -5,6 +5,8 @@
 
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <dt-bindings/phy/phy.h>
 
 #include "dsi_phy.h"
@@ -511,30 +513,6 @@ int msm_dsi_cphy_timing_calc_v4(struct msm_dsi_dphy_timing *timing,
 	return 0;
 }
 
-static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
-{
-	struct device *dev = &phy->pdev->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
-
-	ret = clk_prepare_enable(phy->ahb_clk);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: can't enable ahb clk, %d\n", __func__, ret);
-		pm_runtime_put_sync(dev);
-	}
-
-	return ret;
-}
-
-static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
-{
-	clk_disable_unprepare(phy->ahb_clk);
-	pm_runtime_put(&phy->pdev->dev);
-}
-
 static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
@@ -696,22 +674,20 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	phy->ahb_clk = msm_clk_get(pdev, "iface");
-	if (IS_ERR(phy->ahb_clk))
-		return dev_err_probe(dev, PTR_ERR(phy->ahb_clk),
-				     "Unable to get ahb clk\n");
+	platform_set_drvdata(pdev, phy);
 
-	ret = devm_pm_runtime_enable(&pdev->dev);
+	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	/* PLL init will call into clk_register which requires
-	 * register access, so we need to enable power and ahb clock.
-	 */
-	ret = dsi_phy_enable_resource(phy);
+	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;
 
+	ret = pm_clk_add(dev, "iface");
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Unable to get iface clk\n");
+
 	if (phy->cfg->ops.pll_init) {
 		ret = phy->cfg->ops.pll_init(phy);
 		if (ret)
@@ -725,18 +701,19 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to register clk provider\n");
 
-	dsi_phy_disable_resource(phy);
-
-	platform_set_drvdata(pdev, phy);
-
 	return 0;
 }
 
+static const struct dev_pm_ops dsi_phy_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver dsi_phy_platform_driver = {
 	.probe      = dsi_phy_driver_probe,
 	.driver     = {
 		.name   = "msm_dsi_phy",
 		.of_match_table = dsi_phy_dt_match,
+		.pm = &dsi_phy_pm_ops,
 	},
 };
 
@@ -762,9 +739,9 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 
 	dev = &phy->pdev->dev;
 
-	ret = dsi_phy_enable_resource(phy);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "%s: resource enable failed, %d\n",
+		DRM_DEV_ERROR(dev, "%s: resume failed, %d\n",
 			__func__, ret);
 		goto res_en_fail;
 	}
@@ -808,7 +785,7 @@ int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
 phy_en_fail:
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
 reg_en_fail:
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(dev);
 res_en_fail:
 	return ret;
 }
@@ -821,7 +798,7 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy)
 	phy->cfg->ops.disable(phy);
 
 	regulator_bulk_disable(phy->cfg->num_regulators, phy->supplies);
-	dsi_phy_disable_resource(phy);
+	pm_runtime_put(&phy->pdev->dev);
 }
 
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 7ea608f620fe..0c65821a3db2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -103,7 +103,6 @@ struct msm_dsi_phy {
 	phys_addr_t lane_size;
 	int id;
 
-	struct clk *ahb_clk;
 	struct regulator_bulk_data *supplies;
 
 	struct msm_dsi_dphy_timing timing;
-- 
2.34.1


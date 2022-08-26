Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CD65A24A8
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB9310E7D8;
	Fri, 26 Aug 2022 09:39:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1C910E7ED
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:36 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id bt10so1303553lfb.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=+1bTBy3Qw5DuGoK8+Tzb6Ah6TNqnmwTNraiwhKdmwR4=;
 b=KFQFh51NXldRfmWT+gLJbwjEPJH4OXGKTJ1OPeKDKoW0cC4+Xm6fDQqMfrmOFCeiAa
 ji4BkNcCnvd7B0NYLzkJcfFYgoAoHl2awys2xtMoThO0ol4f9e1sVrdjBTfJAW2fney/
 E9APrOwdQPiQ6gibX+bDaeTLsjYkvIPuqvMDEUugYN97oVl1UEfioNEwDDIKyE8ZOWRI
 nLlbQknq/L92oZXcAzi2mhotP+SXjGrOtgMyuoZSW0AOjgh3zA0sgoYFCnVbDLai6pLH
 9NaGcsAhyHrSGJCAsCloGNCO+e8plOWhUGUBtmZ+l21eNZov5XSXlQEv95rAP4tUiKWc
 lbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=+1bTBy3Qw5DuGoK8+Tzb6Ah6TNqnmwTNraiwhKdmwR4=;
 b=BkIn7pbvJMY9NamxKq8b4M/wT7ICg9+k1m0kt4ZgrUgLp9JXX0sSQZo1Tkg+gokFOB
 oursrbefZ3rCVd+mJThpn1X7nk7YvnXA1kL/a9o9Bvpvo0/SPRAKcSwsaXYn+BFpy7j9
 XPNEmtNNCEVGlryMFSs538WkgnJLyRT4h+tMTRwmv36oayAdf2NQGGGV/xuFKQqI9Wht
 dM4sh2it2B+C4xNbj7f1l4/gX6mktF9CNEsYEDLQpiFb2pgeW4acj0A8ikMtLgz1qAZX
 3qb18WC+H4llNB6+I+6IqaiX2MOEWoL/hHJPHl6QvFl6fKbld89dBm2mosQsdpNe6/Dh
 VydQ==
X-Gm-Message-State: ACgBeo3V0Wv9yQG3i2p4FtztMzUnlMjST4y6m2qcs/DQuD2Qs14TMR6j
 +09f4jmLDAL93RvugVrd23/jeg==
X-Google-Smtp-Source: AA6agR4MjTSK2a1wzZxnLil7UixcsK3+uoWW4eB3KQNvXFBfuAFSTWRzpvfb3Zi9fnV7B7YxwTWPiA==
X-Received: by 2002:a05:6512:6c8:b0:48a:f375:9ecc with SMTP id
 u8-20020a05651206c800b0048af3759eccmr2151757lff.206.1661506774245; 
 Fri, 26 Aug 2022 02:39:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 26 Aug 2022 12:39:27 +0300
Message-Id: <20220826093927.851597-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/5] drm/msm/hdmi: move msm_hdmi_get_phy() to
 msm_hdmi_dev_probe()
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

To continue the idea of failing the probe() rather than failing the
bind(), move the call to msm_hdmi_get_phy() function to
msm_hdmi_dev_probe(), so that the driver fails the probe if PHY is not
yet available rather than succeeding the probe and then failing the
bind() with -EPROBE_DEFER.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 40 ++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 926274eeee25..adaa67d9a78d 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -68,14 +68,17 @@ static void msm_hdmi_destroy(struct hdmi *hdmi)
 		destroy_workqueue(hdmi->workq);
 	msm_hdmi_hdcp_destroy(hdmi);
 
+	if (hdmi->i2c)
+		msm_hdmi_i2c_destroy(hdmi->i2c);
+}
+
+static void msm_hdmi_put_phy(struct hdmi *hdmi)
+{
 	if (hdmi->phy_dev) {
 		put_device(hdmi->phy_dev);
 		hdmi->phy = NULL;
 		hdmi->phy_dev = NULL;
 	}
-
-	if (hdmi->i2c)
-		msm_hdmi_i2c_destroy(hdmi->i2c);
 }
 
 static int msm_hdmi_get_phy(struct hdmi *hdmi)
@@ -91,19 +94,15 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
 	}
 
 	phy_pdev = of_find_device_by_node(phy_node);
-	if (phy_pdev)
-		hdmi->phy = platform_get_drvdata(phy_pdev);
-
 	of_node_put(phy_node);
 
-	if (!phy_pdev) {
-		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
-		return -EPROBE_DEFER;
-	}
+	if (!phy_pdev)
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
+
+	hdmi->phy = platform_get_drvdata(phy_pdev);
 	if (!hdmi->phy) {
-		DRM_DEV_ERROR(&pdev->dev, "phy driver is not ready\n");
 		put_device(&phy_pdev->dev);
-		return -EPROBE_DEFER;
+		return dev_err_probe(&pdev->dev, -EPROBE_DEFER, "phy driver is not ready\n");
 	}
 
 	hdmi->phy_dev = &phy_pdev->dev;
@@ -130,12 +129,6 @@ static int msm_hdmi_init(struct hdmi *hdmi)
 		goto fail;
 	}
 
-	ret = msm_hdmi_get_phy(hdmi);
-	if (ret) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
-		goto fail;
-	}
-
 	hdmi->hdcp_ctrl = msm_hdmi_hdcp_init(hdmi);
 	if (IS_ERR(hdmi->hdcp_ctrl)) {
 		dev_warn(&pdev->dev, "failed to init hdcp: disabled\n");
@@ -528,6 +521,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (hdmi->hpd_gpiod)
 		gpiod_set_consumer_name(hdmi->hpd_gpiod, "HDMI_HPD");
 
+	ret = msm_hdmi_get_phy(hdmi);
+	if (ret) {
+		DRM_DEV_ERROR(&pdev->dev, "failed to get phy\n");
+		return ret;
+	}
+
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
 		return ret;
@@ -539,7 +538,12 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 
 static int msm_hdmi_dev_remove(struct platform_device *pdev)
 {
+	struct hdmi *hdmi = dev_get_drvdata(&pdev->dev);
+
 	component_del(&pdev->dev, &msm_hdmi_ops);
+
+	msm_hdmi_put_phy(hdmi);
+
 	return 0;
 }
 
-- 
2.35.1


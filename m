Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8649C913674
	for <lists+freedreno@lfdr.de>; Sun, 23 Jun 2024 00:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560A10EDF9;
	Sat, 22 Jun 2024 22:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Z9lhANYC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47BC510EDF6
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 22:02:29 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso31578971fa.0
 for <freedreno@lists.freedesktop.org>; Sat, 22 Jun 2024 15:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719093747; x=1719698547; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Yx+JI017WinXbQ5IxwQW21eqYtv0eFPwBD3pRx15tvM=;
 b=Z9lhANYCPrCOQa5/U8pbAz8m4/YYd63iJL3JXt9TCiMZDSSo+j5M+1eNaraDrfJWHf
 JwmZKC5CE9ZVM8kzovcdX/YdQqUPeQKPOtWK5gi0V4IBj2DXDkULqPH6C1t61+z0xYdL
 bkpcCB6DdF9OVA7riDQ4ppH9RNDajjEWStU5/3HQp5RlDOS6TPUuMD73gXcBOWfq+ukA
 ufK272Ibrm/eXJV1GP0dSv8rqAT4YkIFQstb0sB7js5KYkFbY8Ed78aj78/lD14suuDK
 uwk8dgVr56a9OlMbfOlhLPAAEAgC6KWVZymyMsHXJRYXycHrc33NnO/LhlyBu3Uze/Zz
 78AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719093747; x=1719698547;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Yx+JI017WinXbQ5IxwQW21eqYtv0eFPwBD3pRx15tvM=;
 b=oGkSsyEOwa2JzcxkvALoA8lSX738EF5asM+jzec6Xcs/11CoCuEf3kh5JGDyhVD8Ao
 UQkMxXoZd+xEO5swwz5+1ftiK6qUUy+Aei4yfIMOqCQuhH9eOZp9ebrW8Iggq3TKhYqQ
 asuNvjXGEJqB/GEhPJFFsY82W4mHFyzFxKrKh4lUqlL9LsXRb00FMKqRCR4SCHwwL1vq
 kqA4f0lvRdaUDm21x2+L/QPc+oR3s8DX6COZ2C9rBURvemOASCT9dARmUrRHWZl6jB+T
 suW2UO1s2qFamY27LYmh+0uIoxP2y5wRwdtKCIXduBMRe7Qxgj7wOf3nA640Y5sFCQxC
 9Eiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2IIBZ+RcuRXcQZsRc6ut1YOldSjtQF5VmQRQus6EsjBvr3LlBv9J9hHsPm51k+ja5Jn8d0kdTXm67LQZwlhwZf2sIPofntUfVypoMdnll
X-Gm-Message-State: AOJu0YxpkIC3LoGF3Tj4JVGr1MPfUxGYEBLEvkZ/vwIWSB2SXrwdMQkR
 A5ZmK3F1kBMKRqbID5YWS2sz0FAEuT8jRyboiab/Suirbt89XAgTAaXmsXQdBwSfeEPrc/QZXrF
 Y5XY=
X-Google-Smtp-Source: AGHT+IECgjKIiTyRvwZJCRLLvKjR/DBRsJBoyU/RXQ90jopy3B6oRVzRtd9sHMtVwYMsadrxrC4ibw==
X-Received: by 2002:a2e:8011:0:b0:2ec:165a:2254 with SMTP id
 38308e7fff4ca-2ec5b3077c0mr3541661fa.44.1719093747447; 
 Sat, 22 Jun 2024 15:02:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 15:02:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:25 +0300
Subject: [PATCH v3 12/13] drm/msm/hdmi: ensure that HDMI is up if HPD is
 requested
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-12-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3766;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e9w+F4AfC0WhIbmyBrInkYJ4EpCvrEa584Hzzbn41wE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0npUzi13UHgxCGRdtwhPdIm+QR0wlzt4HJH8
 X2QpYkRZPaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6QAKCRCLPIo+Aiko
 1XSlB/9FpKQBBnW2K+qy6NxMi02ycBFGVFlHaocEuj+Vwulnc7iQESd4/vrNdFCM9Mfh9JRn3KC
 RnAhzomMC/CgLbFo24+HPl+F5Gvd1MhOMOGxRWPE9T/sprrNdfSlldUUuT2PuZh0IPrWuMb+Jtx
 3kE/nDwH8wBRnSeEfKqvXLEn6QTUWwFX9tc2N3AXPnKogBzBGbpurwUMzK03FniUjJmCPC5Myla
 vC+avuJGU9G0mwXJrBr1AWVxuquUVoYZL8wbOMXxi6X5sTunbmFkHmY0Bnp9C/tH0lQqPg2gsB2
 skILo/o85KvqLKQJHMCTjPQ1vCKyYCv+PPF0WRxGtcRSj95O
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 97faa7d26cc9..9f1de4c9ffdf 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -384,6 +384,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 6faf4397ed58..9961dae9e9b3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -42,6 +42,8 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool hpd_enabled;
+	struct mutex state_mutex; /* protects two booleans */
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index c15c49c08d30..7bf1c3b379c1 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -308,11 +308,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	hdmi->pixclock = conn_state->hdmi.tmds_char_rate;
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
 
@@ -337,7 +339,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -346,6 +351,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		hdmi->power_on = false;
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_bridge_atomic_set_timings(struct hdmi *hdmi,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index d3353c6148ed..cb89e9e2c6ea 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -73,10 +73,14 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
+	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
 	msm_hdmi_set_mode(hdmi, true);
 
+	hdmi->hpd_enabled = true;
+	mutex_unlock(&hdmi->state_mutex);
+
 	hdmi_write(hdmi, REG_HDMI_USEC_REFTIMER, 0x0001001b);
 
 	/* enable HPD events: */
@@ -106,7 +110,10 @@ void msm_hdmi_hpd_disable(struct hdmi *hdmi)
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
-	msm_hdmi_set_mode(hdmi, false);
+	mutex_lock(&hdmi->state_mutex);
+	hdmi->hpd_enabled = false;
+	msm_hdmi_set_mode(hdmi, hdmi->power_on);
+	mutex_unlock(&hdmi->state_mutex);
 
 	pm_runtime_put(dev);
 }

-- 
2.39.2


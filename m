Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4788771CD
	for <lists+freedreno@lfdr.de>; Sat,  9 Mar 2024 16:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EE3111213D;
	Sat,  9 Mar 2024 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="J9w4UHFG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E83A11213A
 for <freedreno@lists.freedesktop.org>; Sat,  9 Mar 2024 15:09:12 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d269b2ff48so45572861fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 09 Mar 2024 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709996950; x=1710601750; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xNGj9hvd5eMMotayR67It4TFcWGQFtfA/p9pyF/5mE0=;
 b=J9w4UHFG4Pusl4tfeZiQjO4qeQOLr5Bi9rOR5CKrOn7gVlcBBiyz3T8Mr8s2RwOGzN
 r0TX5gtRwxLrTavPDueoQ6SeLdbo8Yuy1FIRSLvFNE7+MgGVmDeL6q6+/e+Ps49cd3Aq
 CYzvg06LqGjkDzcf3N99QSWT5raH3leOtQU/k3rg0YbEZp7h/+tlUdbT9txBxbBgq/MR
 XHD1cH1P18REKR5g9Bfrvsv8LfudBAunQyNwK1Z96tgXifxAarpOrjjxNAh9nO3ejA0g
 npt5/3Cu+EjRYByi2Cd/6Afl8mhb1dSZUDfVzh7Wrhh13kYfp7WkCPEnPgbwRhx/+ESe
 S29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709996950; x=1710601750;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xNGj9hvd5eMMotayR67It4TFcWGQFtfA/p9pyF/5mE0=;
 b=Hlo0lm49VAQ8/mGZjhxQ+4Vtf+skUYsPCfnqHVbk2KatUkbrswJYnTEgAdR/eu8jtS
 xP6TixmK9j0J0zLdGsrl6PkjaQJd8jp7QC2dYQh2JLfYArnQyOXp9QAE1IFIcidnepfw
 l7RvFolxqld1dPIHZTUglS+hcyyfv9/bjBUfribQrjY7pFjIcaKshRh7kZxdGbP/5+ve
 w3snPbsV9GXdC21mmd0s92Gbb06GwljIpI6orMdmgQDqlKp3E+XBiiPsKKEamz87kAbz
 kK1D7JzyykDFOQmZTwEK4WKKbZo+h8qRwBZ3Nr2ehpoFQcdZE7TKqvfgErsAavfIf9ZJ
 liIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi6PMFHO8sPviqXKKawkML0/J/gPWQSp0E6SYYN2J6V7TgziIe6Q5YlW72oCQB9sj2Zg4TVA7vnZHUAbEB1UWWY0igwSMG37sx1Rgc2PVm
X-Gm-Message-State: AOJu0Yxp8kRuJnzWz5bhpflz/vg+ilrkmPR/Z8OrIUBV3NGsYeCPdN7L
 VL8pDGb8BEX08sd+YFVvYfDiLGtRRaNdSrXfKHxPifRSBWUiy2KgaxLCJE31mcQ=
X-Google-Smtp-Source: AGHT+IEHNSWqX0gXHFX29xuxi93+Jfhzbx2TyMa/UqdM693sNC4YDSZ/Of892Jm2Pp9Awa4lM82QPQ==
X-Received: by 2002:a2e:8007:0:b0:2d3:dcb0:56d9 with SMTP id
 j7-20020a2e8007000000b002d3dcb056d9mr1461938ljg.29.1709996950750; 
 Sat, 09 Mar 2024 07:09:10 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 m1-20020a2eb6c1000000b002d4062c833dsm328511ljo.98.2024.03.09.07.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Mar 2024 07:09:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 09 Mar 2024 17:09:07 +0200
Subject: [PATCH 3/3] drm/msm/dsi: simplify connector creation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-fd-dsi-cleanup-bridges-v1-3-962ebdba82ed@linaro.org>
References: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
In-Reply-To: <20240309-fd-dsi-cleanup-bridges-v1-0-962ebdba82ed@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4757;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sQ9dGrX0/pUk+Y+5/wO+qeOzx57mrk8gd0lJNrR0tkU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7HuTSHu38iYiw5kUL9hewWylm4rO5ExjUE6u6
 7tGAahVjqiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZex7kwAKCRCLPIo+Aiko
 1Ys2CACm3di5oU6X/lXIp+QIh9BnCKdasPf41Phfo4D3UzixHBdHYXeI7lluOz9oMgmjSHRdpvp
 FVkQ9j6PxkGDSJqzkAGrGgsSnZNuAPAD3zEGaB1hVPgoY2I2lns2L/4uPm8YN0VPPqSfNWm9k52
 L0xRdKYFer8SMAasJZtU+XlLQFBotC2ddTel8mWz3gQLQPMUuDTKZbp72ZKu3ZE2cHIkH+UDXz2
 g2MXSbL0VrR3WPilOUl3p/8U4s5h+LBRor8p9bncTwA4fld+P2R5Qygq6w49bXuPDhSp5s8Urli
 SFUxGJM76aFA8Fud8Z3Bx08MbDAPgA0/0lzbhcw/aXZVVu6a
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

Instead of having two functions, msm_dsi_manager_bridge_init()
and msm_dsi_manager_ext_bridge_init(), merge them into
msm_dsi_manager_connector_init(), moving drm_bridge_attach() to be
called from the bridge's attach callback (as most other bridges do).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         | 10 +--------
 drivers/gpu/drm/msm/dsi/dsi.h         |  5 ++---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 41 +++++++++++++++--------------------
 3 files changed, 21 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 38f10f7a10d3..efd7c23b662f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -232,7 +232,6 @@ void __exit msm_dsi_unregister(void)
 int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 			 struct drm_encoder *encoder)
 {
-	struct drm_bridge *bridge;
 	int ret;
 
 	msm_dsi->dev = dev;
@@ -252,14 +251,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		return 0;
 	}
 
-	bridge = msm_dsi_manager_bridge_init(msm_dsi, encoder);
-	if (IS_ERR(bridge)) {
-		ret = PTR_ERR(bridge);
-		DRM_DEV_ERROR(dev->dev, "failed to create dsi bridge: %d\n", ret);
-		return ret;
-	}
-
-	ret = msm_dsi_manager_ext_bridge_init(msm_dsi->id, bridge);
+	ret = msm_dsi_manager_connector_init(msm_dsi, encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dsi connector: %d\n", ret);
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 0adef65be1de..afc290408ba4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -47,9 +47,8 @@ struct msm_dsi {
 };
 
 /* dsi manager */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
-					       struct drm_encoder *encoder);
-int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge);
+int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
+				   struct drm_encoder *encoder);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index b7c52b14c790..5b3f3068fd92 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -423,7 +423,18 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 	return msm_dsi_host_check_dsc(host, mode);
 }
 
+static int dsi_mgr_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+
+	return drm_bridge_attach(bridge->encoder, msm_dsi->next_bridge,
+				 bridge, flags);
+}
+
 static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
+	.attach = dsi_mgr_bridge_attach,
 	.pre_enable = dsi_mgr_bridge_pre_enable,
 	.post_disable = dsi_mgr_bridge_post_disable,
 	.mode_set = dsi_mgr_bridge_mode_set,
@@ -431,17 +442,19 @@ static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
 };
 
 /* initialize bridge */
-struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
-					       struct drm_encoder *encoder)
+int msm_dsi_manager_connector_init(struct msm_dsi *msm_dsi,
+				   struct drm_encoder *encoder)
 {
+	struct drm_device *dev = msm_dsi->dev;
 	struct drm_bridge *bridge;
 	struct dsi_bridge *dsi_bridge;
+	struct drm_connector *connector;
 	int ret;
 
 	dsi_bridge = devm_kzalloc(msm_dsi->dev->dev,
 				sizeof(*dsi_bridge), GFP_KERNEL);
 	if (!dsi_bridge)
-		return ERR_PTR(-ENOMEM);
+		return -ENOMEM;
 
 	dsi_bridge->id = msm_dsi->id;
 
@@ -450,27 +463,9 @@ struct drm_bridge *msm_dsi_manager_bridge_init(struct msm_dsi *msm_dsi,
 
 	ret = devm_drm_bridge_add(msm_dsi->dev->dev, bridge);
 	if (ret)
-		return ERR_PTR(ret);
-
-	ret = drm_bridge_attach(encoder, bridge, NULL, 0);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return bridge;
-}
-
-int msm_dsi_manager_ext_bridge_init(u8 id, struct drm_bridge *int_bridge)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct drm_device *dev = msm_dsi->dev;
-	struct drm_encoder *encoder;
-	struct drm_connector *connector;
-	int ret;
-
-	encoder = int_bridge->encoder;
+		return ret;
 
-	ret = drm_bridge_attach(encoder, msm_dsi->next_bridge, int_bridge,
-			DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (ret)
 		return ret;
 

-- 
2.39.2


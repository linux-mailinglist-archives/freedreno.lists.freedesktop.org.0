Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B4A2D204
	for <lists+freedreno@lfdr.de>; Sat,  8 Feb 2025 01:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0254410E11F;
	Sat,  8 Feb 2025 00:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wb24BX+x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D651A10E039
 for <freedreno@lists.freedesktop.org>; Sat,  8 Feb 2025 00:27:16 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5450408455dso342338e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Feb 2025 16:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738974435; x=1739579235; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
 b=wb24BX+xZxewmT3d1SCRRAe8Au0d3WEQwDDfZyNOmpE6Xfd6ODNJLK5q9D1ht0PFmI
 IpOy860FGtz6rWPIeNvsSSRDYeGB3CnioYfMgJY48Uss/htQOuWqdRqeLYTEOvB2Ii7L
 m19eUKPEpsGVmJB6q86IrFyj3nPlnlEC85Yh00zD9lXhetd3i6OoeH6UrL54CZMddjJL
 zzyQTq9ZdXQcMHrG488QFcvrbL1t1KPhlzyVEy4VnKyoPJB14qxrgKWADYZTDKdyBRjU
 HvjD2Gav61w04BctYclDyp/vtv3PEAD4AVmsw0pkV4u16z0hjzISFjOn50QtEbMBlmhK
 P66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738974435; x=1739579235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cQ4eiEd6P4+c5hYs9d14pRxOxpaCXWHbXbrnXxZW1Kg=;
 b=JRnView+m531eE5IhrrNbKX+VTYiIiS5m+VrUuSi8u4ETypBjHW8wtMGxkSAPEms5t
 M1/9Yh5MCVBpj8R3y7baNcPjnI3plmntYDmbXFe7jEjrxnS8gtlbN+9FdXsPy9Aap5RK
 F6PwgnHfCOeq+4BWtATgHZmMnEvw6aJHB7YZo7LX1Kt5e4ucybwdush13J0XiZHc/xc2
 tuy2qRUkoCq5Ro+lfTAOCPlS9zxxnPK1BrapBzkwZnC1H9UdZQ5o9gMYsYNZbOluO2ss
 1IzVdLt0NLNiM3c1Z27m5MY5CLsNG3VNCKVfeV6CRopDNhlF6ncTBMz+xTGmoFntSEUN
 AC3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ7Btbq548KRS9vgotBJLEYjVjckqOBUviXidhTAdFu4/w3zFybXMcnQfOt/eOIi+iWHrQgtOS434=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy58b+QEF45jTtU7kS/N1JNyFMhb3g54iP4nYmYYmzVRWFlbXHD
 jLSKvDRtkyqdQbicy7F0BzBLib7J8sFxkBr4YgsvPIKUrBLdc7IzuR1hWyrK4v4=
X-Gm-Gg: ASbGncsvk1ysfBpQxTjBZSgfrubkQTNmDH3C9SzYerInV6N1hCdvfcUGbEXSVce0g51
 xR3JruBOoJNYrZegnyXsFN8dHss7i9bfaIjmd3qya01sklgVRZSNJrrFauiI6fjJ3qnBrhMfbID
 UyIWvlWWYgZSaIXunIq2SpnU5s/LoGN14iosPi/C+yPuL6fHT2adLJMzV2KUtFvfag6XWmgdIRm
 891bk4QNMif+SQL8ziwH/nTrF+xuKo/nI1M9mthPkTKc4pTeP0vYOm0DxA9zbqcPTN5k7Z+HhMP
 BgSKcqP9Npr4pAcnAh6zRFM=
X-Google-Smtp-Source: AGHT+IE0HRYadLgRlFKRYvwewdKyRJrqdIwef+bzOoB0eCBwvioFcB13g7Pms7VdBytcIFx7GOh01w==
X-Received: by 2002:a05:6512:36c2:b0:543:baa3:87a9 with SMTP id
 2adb3069b0e04-54414ae62a8mr1280181e87.49.1738974435149; 
 Fri, 07 Feb 2025 16:27:15 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5441060413asm588785e87.222.2025.02.07.16.27.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:27:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 08 Feb 2025 02:27:03 +0200
Subject: [PATCH v7 4/7] drm/msm/hdmi: get rid of hdmi_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250208-bridge-hdmi-connector-v7-4-0c3837f00258@linaro.org>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
In-Reply-To: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=kwW90yaGXjA8kr6gl2QdxUU01rGJmaVy/t2QVZCPXNM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnpqTVhekXNgRhbLo/MXTHBp+Ns1DBrCTeoHx8m
 2qQDmR13leJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6ak1QAKCRCLPIo+Aiko
 1WDCCACfkXHtGNmUhx68GPVqzQoQbhU68C4O524tof04eeulXgnYHBmCdk5Vi4r5ynnRCpdLuge
 kCIECZgv5ymAymrGv8LjSUSNWI0RjujMmltE9uANd4IhKtseKx7rhd5F+/bxDRH8ZgDhqSa7zSV
 QM6VNcw9csfYsqDu2dVfUc9uIIDAb7Pv4ILiWv5txe/G0AsB18djO2MD4zsQrYSgsM4Kops3ZZq
 2Oz+MvRFEMirCLf3/uhgsrqAz/hMh88zbi9yZUUty0OQ4rQx+nOHMwYX83xjjWgH8kr+u1nNDxZ
 2oDOdbC6xcILj3Vp9d0p9uTRarqCMygGrzhfA9j8csBcUHzs
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

Use connector->display_info.is_hdmi instead of manually using
drm_detect_hdmi_monitor().

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 17 +++--------------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b14205cb9e977edd0d849e0eafe9b69c0da594bd..6b77e0fb8d5ec218dfbf58215e2e12ad1dfb1b85 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -25,7 +25,7 @@ void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	if (power_on) {
 		ctrl |= HDMI_CTRL_ENABLE;
-		if (!hdmi->hdmi_mode) {
+		if (!hdmi->connector->display_info.is_hdmi) {
 			ctrl |= HDMI_CTRL_HDMI;
 			hdmi_write(hdmi, REG_HDMI_CTRL, ctrl);
 			ctrl &= ~HDMI_CTRL_HDMI;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 8faad8440cf70f792da353978b990861b0677ed8..cdd3bd4f37831f9a606a4c3627a48364f5d4025f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -67,8 +67,6 @@ struct hdmi {
 	/* the encoder we are hooked to (outside of hdmi block) */
 	struct drm_encoder *encoder;
 
-	bool hdmi_mode;               /* are we in hdmi mode? */
-
 	int irq;
 	struct workqueue_struct *workq;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4f8e4ffdb2e058ecf243bb319c12c444cb2e5200..15ab0858105328c2f774ec1f79423614bbbaeb41 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -232,7 +232,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode)
+		if (connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 	}
 
@@ -264,7 +264,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	if (hdmi->power_on) {
 		power_off(bridge);
 		hdmi->power_on = false;
-		if (hdmi->hdmi_mode)
+		if (hdmi->connector->display_info.is_hdmi)
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
@@ -320,7 +320,7 @@ static void msm_hdmi_set_timings(struct hdmi *hdmi,
 	DBG("frame_ctrl=%08x", frame_ctrl);
 	hdmi_write(hdmi, REG_HDMI_FRAME_CTRL, frame_ctrl);
 
-	if (hdmi->hdmi_mode)
+	if (hdmi->connector->display_info.is_hdmi)
 		msm_hdmi_audio_update(hdmi);
 }
 
@@ -339,17 +339,6 @@ static const struct drm_edid *msm_hdmi_bridge_edid_read(struct drm_bridge *bridg
 
 	hdmi_write(hdmi, REG_HDMI_CTRL, hdmi_ctrl);
 
-	if (drm_edid) {
-		/*
-		 * FIXME: This should use connector->display_info.is_hdmi from a
-		 * path that has read the EDID and called
-		 * drm_edid_connector_update().
-		 */
-		const struct edid *edid = drm_edid_raw(drm_edid);
-
-		hdmi->hdmi_mode = drm_detect_hdmi_monitor(edid);
-	}
-
 	return drm_edid;
 }
 

-- 
2.39.5


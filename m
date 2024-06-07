Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B790048B
	for <lists+freedreno@lfdr.de>; Fri,  7 Jun 2024 15:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8C510EC2D;
	Fri,  7 Jun 2024 13:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zg1SFYaO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 146C410EC2D
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jun 2024 13:23:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-52bc29c79fdso383591e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jun 2024 06:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717766588; x=1718371388; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=d6C2WBjw85TMMZ9GIIugc3NhLWza5ZaClpp5YdwIj3Y=;
 b=Zg1SFYaOjzj7qeQgM+m4pqHipgyO9V+MCwcFGf+OjI0jMvIsbCch3q9ystc4yM0i8/
 zI4HpsjoeU+2I4M1zxGReaTX3+BiNDj8nXmhyVpPvwibnlRsYE4sUOD0YK6wQMNAIoDB
 HugnTG6QGK/E8QAmmC/WJS2G5pPqxZgfXosIYsFV0Hl5vt/rLh+T2KWwDTksyd2RgMUn
 A7f/9Tn9gLPzKAfmfLL6mxtvY7GGKqn8qsaRiDixG+GD/vVgHXvrw0qbF8/JLER0bzQz
 se0cAcGaejAvrBThP0Papj6j0RfnDpVlhH0vuoDn5FOGQdHzkaU4+Dlvze/7KJFe8b9a
 fc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717766588; x=1718371388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d6C2WBjw85TMMZ9GIIugc3NhLWza5ZaClpp5YdwIj3Y=;
 b=U3M61DVdCrgvPVsHv/xSEiv9qoI5X6Cymch34/qsp3rMnLoEIldPFL8iPrqEEHT7SO
 bFdQffL3RPulJcUSmEPIAtmFhpgnYpwD+LVM8jJfhVyIM15Ow3yb25H/po3+fivuNB4p
 cS1Q3CPrEfK0cEami82FP6PXbEToIMkcZ83BqGSteVMmo+uxo6a9PF0busu4+xcHvfjf
 /htHywyeAzwp/YhRRLkHEMsDRsB+a+g8fVk8idvA82QgGQCxv0IY3HsqZV9G2eyWu//m
 iQJZf1K+wstLRoZhJQoZ2ffpoioN2maodFeu+L8Rfk3NXPQ+3SSmdfJACpH4NkBj/x4u
 2XqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGJdmelZQV/qSMkN7UTwI7V+9UkQ5vmEFoxgHJwS0ZfRcWYiQUAUl2gZjuZq26LHxFWguz1QIRjGEa1CLKaiZf4E+ufJ7b/BfMFEop+iXj
X-Gm-Message-State: AOJu0YwyBwgCzUHNL2mkbqgtT3I8VYLAF0a5dH8A/coGq9FgbU8Bql2C
 s0L5BdnBfQXoxQgRfz0YvC6jCDC/LKZ4/u5f2pooLuSTnr1lCitql+l8TiuBZMM=
X-Google-Smtp-Source: AGHT+IHUCKO97Y5eJOp7MZjYCpuQE1noO8w19BMp7fZbGoZnZna/4yKtjoyrieL3UxUSco//uNuYhg==
X-Received: by 2002:a05:6512:5c6:b0:52b:9530:f0b9 with SMTP id
 2adb3069b0e04-52bb9fd8c7fmr1765707e87.67.1717766588037; 
 Fri, 07 Jun 2024 06:23:08 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52bc27640easm80944e87.104.2024.06.07.06.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jun 2024 06:23:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 07 Jun 2024 16:23:01 +0300
Subject: [PATCH v5 4/9] drm/msm/hdmi: switch to atomic bridge callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240607-bridge-hdmi-connector-v5-4-ab384e6021af@linaro.org>
References: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
In-Reply-To: <20240607-bridge-hdmi-connector-v5-0-ab384e6021af@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2170;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ATNJtCzOXDVp1OKwxiEV9jk7WYH4jasM/bHZPYZfo4g=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmYwm2pVFRim5aY30nLbQ1ioxf5cLI53C8wh4y+
 oW0k/2ldPeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmMJtgAKCRCLPIo+Aiko
 1dWPB/9U75hLW4yxzPnUtMrXjokMKyYjy5944uLa49im7YSrXOjsCQQzVETe9Qy1CjP6GnpqfSQ
 7d+++cJ+KeMq/6OUvhVf5RpyRdmKYXupEr4ZxhV5C78apq9Q7VsE6ZP2KRGbfgH0FWNvh/Vue+C
 1R8NKGXYgzHf3nJOtcQE4hvPUVt3s442NTxITBVQZoFUTGFLb6jTmc26Wi1iSdiDdUJbm5ClINP
 +Sp9/hRNbujhAZC+pfdh964CWKBGq07T8y8eCYrYsLmUrGD2GwPKjdwjNNM0xZmi1vj9DJTK+Qe
 lhEpo904/WdltMnPfxeiZwxzu/rMwO/8IxfX3ywVrS+vjzgZ
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

Change MSM HDMI bridge to use atomic_* callbacks in preparation to
enablign the HDMI connector support.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 4a5b5112227f..d839c71091dc 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -126,7 +126,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -152,7 +153,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -299,8 +301,11 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.edid_read = msm_hdmi_bridge_edid_read,

-- 
2.39.2


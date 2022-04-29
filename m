Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C36475154F8
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 21:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6160410F0E3;
	Fri, 29 Apr 2022 19:57:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE0810F0E3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 19:57:37 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id bn33so11722029ljb.6
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 12:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
 b=MtCRAIFnfLZUrDUX5UFQZqf2hTBZYDYuPU1iAUIBIABeOJn6mQ/ulydY9I6+XwXAlh
 a+YJFB1B6V0UCJvEb1bk4uzcXfViufL71Woz3R/7aTKdSBmpkOEiztGmhrycjiB+/Ocj
 AqPnacpAjusZiSM9aI/5VlsYczvM59+jzoDErjspgXvmWoxeAtY3PjxaQue2Ti62uaMi
 z3RtlHH5NH1GvbXfOVZ1/vegXyOSlvGR+xNmnzPOlsfbNOBQG15LEeb5WXG92NJ/YWn6
 ni2JtozGH8fXugekhAx5zjgy/VOcfF1j2YquUAw4EcNGbW/JSJ6DegHDhZCb/WJ9pv/+
 wgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
 b=vqv1M0JBKK5/L7uUgzLLVXa8Nny2316hIuWkLK2L2trrnGSIAP7nFcmMf7cIaJ/4SU
 WBdvA9PbKhCc3zBMIDrjwVEuqs9tvKEw6d9DBE4TksGrCwTVIyjkbmOHEgreGmOA0N4+
 gEve9lFnzKJ5+Q78CcVsmAfg+i6WgVOP3Vocd4FBxXklQ6/aR57xF1qOrxdJlO8s6Z6j
 u37wk8r3ah9uxw+Is9osFwL+bZ/ZlL5c9fOvAEDMlRviP3VOy/RKNYN9hrUXY+lSGGjn
 6pNJSFa9bRcTSZ4rOe5rZAAFwYE3xcf421ZYVdqLW3t9+wiyUkOAv8fi6rEqH6dpHOqP
 L5og==
X-Gm-Message-State: AOAM53188r0D0xFVB20uSQZml4FRkdxKbOIErD4Mir3UKLZAb+w3gKTy
 1U6H2owVQfv5n9Xo4KnbY+wyHg==
X-Google-Smtp-Source: ABdhPJwutlRCQm7Ts3tuPRWgP036d46B10TsEYXjiWciXpakVkQ8/p7sXMJj+y6carkW0PXYyxz80A==
X-Received: by 2002:a2e:bc0c:0:b0:24f:166c:9279 with SMTP id
 b12-20020a2ebc0c000000b0024f166c9279mr498455ljf.504.1651262256130; 
 Fri, 29 Apr 2022 12:57:36 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 j17-20020ac253b1000000b0047255d2118csm10601lfh.187.2022.04.29.12.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:57:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 29 Apr 2022 22:57:29 +0300
Message-Id: <20220429195731.3716446-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
References: <20220429195731.3716446-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v2 3/5] drm/bridge_connector: implement
 oob_hotplug_event
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Implement the oob_hotplug_event() callback. Translate it to the the HPD
notification sent to the HPD bridge in the chain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index a0b742ebb330..b14af1c7ac07 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -123,6 +123,17 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	drm_kms_helper_hotplug_event(dev);
 }
 
+static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
+						   enum drm_connector_status status)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *hpd = bridge_connector->bridge_hpd;
+
+	if (hpd)
+		drm_bridge_hpd_notify(hpd, status);
+}
+
 /**
  * drm_bridge_connector_enable_hpd - Enable hot-plug detection for the connector
  * @connector: The DRM bridge connector
@@ -233,6 +244,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
+	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
 };
 
 /* -----------------------------------------------------------------------------
-- 
2.35.1


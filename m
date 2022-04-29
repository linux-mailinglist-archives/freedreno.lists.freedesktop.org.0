Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BC3515477
	for <lists+freedreno@lfdr.de>; Fri, 29 Apr 2022 21:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE67810E908;
	Fri, 29 Apr 2022 19:29:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B3F10E81A
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 19:29:35 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id h29so8491683lfj.2
 for <freedreno@lists.freedesktop.org>; Fri, 29 Apr 2022 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
 b=Ko1AxuJM2eP1Ei1Sjoh5rpqurh+hCqMjC52gROd4yaSlDbxO7zSgfbtz0UhkBYrzV2
 SkhLCSxxlE5wug28wbd7kYDf2a3o3Sj2eoQuBDC2fmRTUl4NzyM4IcY5t5ClBhVHuaBQ
 mQlYjciWeICPTJW6WMAy7UfpQHqCgL543Lip7ScUrF+WvDagfV9PdNHH9kGq4EOA/1J+
 GsQmIM3UH0VtD/u16A/r9o6haeCbGPLYtcGAZnvBAJNiI5jCO/q1kSExLl4Rd548a5EW
 K7apr6klMxiwt055UZRhJHnONtcASn1cl8CgP1lsqQ5Nrjag3F+Xne48rXY4KdcqFc2F
 4fmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SqMz6+QA40GWihsDI2sybGR2gK7KNbiJwJGp8fjNk80=;
 b=lU1j40QKvwxfZBOmsYrbiRIx5WMvl5p5hcON3NMDNWe96vxNFVso40mTcvfcj1i+Up
 xAp4cs2l3dO9drIi1E6/KOnyMy9Fk5BbQkcqAXOjNXnSWBaYN7RUner69ivPUebQ4VDi
 wnBsj0qPLBBcYrbdzRBXUVAOI8KTcx9r6Z0EsxQ+25advydX/lzvtgrqIDJIeBYzRjv3
 /urOP4lStHWzrCCK2+zUfWhzCm2slc8CAR1Z987oZZO3P9t3m+iH2Sbb3CRe9B1LGIba
 YaCUIOZaKA+o3Hg99BfSElwtaXzvIEuiQMF+cJrk4UuzssqHJBDJ1b3Y75xMJYHaQTJp
 I5YA==
X-Gm-Message-State: AOAM532QTv0UxycD6ZUM3gqy0DS4RG2Z6VGVWsp3EKY4yRa9JpwpK69j
 8s/0GFTyFzGn/7MTD1OfNlizx1lSl50JFA==
X-Google-Smtp-Source: ABdhPJwaHubY6aVhB4RinSAXXT9idb/jHyZNS0vOzM4aU2LS5OIMn/oSoxCOAWQdtDpsekahizZXrA==
X-Received: by 2002:a05:6512:4021:b0:472:2513:4503 with SMTP id
 br33-20020a056512402100b0047225134503mr495697lfb.357.1651260573643; 
 Fri, 29 Apr 2022 12:29:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y10-20020ac24e6a000000b0047255d211e7sm5522lfs.278.2022.04.29.12.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 12:29:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Fri, 29 Apr 2022 22:29:27 +0300
Message-Id: <20220429192928.3697407-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
References: <20220429192928.3697407-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 3/4] drm/bridge_connector: implement
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


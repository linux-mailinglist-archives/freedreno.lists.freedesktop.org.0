Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A65224C7
	for <lists+freedreno@lfdr.de>; Tue, 10 May 2022 21:30:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C06410E536;
	Tue, 10 May 2022 19:30:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3673A10E505
 for <freedreno@lists.freedesktop.org>; Tue, 10 May 2022 19:30:02 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 gj17-20020a17090b109100b001d8b390f77bso2833659pjb.1
 for <freedreno@lists.freedesktop.org>; Tue, 10 May 2022 12:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spc3e6Lp3Smlzf38aH5fCH48i9kTiBR8/UYKG1CLueQ=;
 b=cz0Xr0eL1ajvZSsgLbzZbq39CiowXavZ6oKFanIVRSuNSdPrMxAI9a+lUYIybRRI8Z
 l9f9QgXxhrErMb0+Rw3GcIBYoSBZvvHafQIs7JEGkOMAMdASorM5GZlqQ/R8kl67yLk+
 MbgQgs1sU2wNKMz62e7ITFkvv7ogeaeVCTLPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spc3e6Lp3Smlzf38aH5fCH48i9kTiBR8/UYKG1CLueQ=;
 b=4bA3yPVVklnov3fipDE1Ye9tXF/4zMJfgF73yMtfVDnws8iTj8TQZX5VRhURSR8DdJ
 Sqpu4OMjuXi56FyGBzs1qj1ypLUjvsdSolPBkTOr5j6E17W+lh4WdI1MR2Yrd6HvAKT3
 RncTdt9ezhuKpAKHCFdZWuyjGmZ/K1LNtmUA35igUD8dNQggUWkJbPnP74m95RLJ6FS5
 0s0TayH+0Rd4LaPcQa/v9p6K6b7U7siKi+s/8BkMalcy6Ur2V9CPIQJw/TOx8Mhpfu56
 iuLHE4LfK8ceaZdgfeSEbbadCXwZJKW57eLG9ZuZ+z6MUGZ0tWgad43Na8THfaQbzVEK
 5VKg==
X-Gm-Message-State: AOAM533h7+tfUFZBg4e3LQkemBzSirztFwahHMCE50fdyzw+FUaPNka6
 hO8JsUdKnSAESoi7ZI4kyMmhh9PMIKBZ8i0GFh0=
X-Google-Smtp-Source: ABdhPJzOGtFQdD3JQK9OwWb3IO12+CBeitf6Rww1LcnbNvhYQovH5NU3lYy2huG1tVOn6wVcGz6pqg==
X-Received: by 2002:a17:90b:1001:b0:1d8:4978:c7d5 with SMTP id
 gm1-20020a17090b100100b001d84978c7d5mr1405066pjb.167.1652211001798; 
 Tue, 10 May 2022 12:30:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:6f08:624c:c762:d238])
 by smtp.gmail.com with ESMTPSA id
 s43-20020a056a001c6b00b0050dc762819dsm10786989pfw.119.2022.05.10.12.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 12:30:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Date: Tue, 10 May 2022 12:29:43 -0700
Message-Id: <20220510122726.v3.3.Iba4b9bf6c7a1ee5ea2835ad7bd5eaf84d7688520@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220510192944.2408515-1-dianders@chromium.org>
References: <20220510192944.2408515-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 3/4] drm/bridge: Add devm_drm_bridge_add()
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This adds a devm managed version of drm_bridge_add(). Like other
"devm" function listed in drm_bridge.h, this function takes an
explicit "dev" to use for the lifetime management. A few notes:
* In general we have a "struct device" for bridges that makes a good
  candidate for where the lifetime matches exactly what we want.
* The "bridge->dev->dev" device appears to be the encoder
  device. That's not the right device to use for lifetime management.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("drm/bridge: Add devm_drm_bridge_add()") new for v3.

 drivers/gpu/drm/drm_bridge.c | 23 +++++++++++++++++++++++
 include/drm/drm_bridge.h     |  1 +
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c96847fc0ebc..e275b4ca344b 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -170,6 +170,29 @@ void drm_bridge_add(struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(drm_bridge_add);
 
+static void drm_bridge_remove_void(void *bridge)
+{
+	drm_bridge_remove(bridge);
+}
+
+/**
+ * devm_drm_bridge_add - devm managed version of drm_bridge_add()
+ *
+ * @dev: device to tie the bridge lifetime to
+ * @bridge: bridge control structure
+ *
+ * This is the managed version of drm_bridge_add() which automatically
+ * calls drm_bridge_remove() when @dev is unbound.
+ *
+ * Return: 0 if no error or negative error code.
+ */
+int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
+{
+	drm_bridge_add(bridge);
+	return devm_add_action_or_reset(dev, drm_bridge_remove_void, bridge);
+}
+EXPORT_SYMBOL(devm_drm_bridge_add);
+
 /**
  * drm_bridge_remove - remove the given bridge from the global bridge list
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index f27b4060faa2..42aec8612f37 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -796,6 +796,7 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 }
 
 void drm_bridge_add(struct drm_bridge *bridge);
+int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
-- 
2.36.0.550.gb090851708-goog


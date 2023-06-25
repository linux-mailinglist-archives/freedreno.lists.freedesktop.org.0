Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E668073D095
	for <lists+freedreno@lfdr.de>; Sun, 25 Jun 2023 13:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DFC10E180;
	Sun, 25 Jun 2023 11:42:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7AE10E17C
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:34 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f86dbce369so2830787e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693353; x=1690285353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JRCcVx5yqkWjx+j8HRIisuUziAvNRbEhBQXvfMXuZd8=;
 b=l03zKow5647+l5uNvEOvclkTiqWG965H4wqbDIqh2y8vH8NEUWgZwEv7r6IlcabhTF
 BoTk1ggbF/1vLmC1qFPlhuDc1FAoVGdAYTgW9JJ6dAdCQiuFRo5X3KXBQ/nlv20OvGSx
 6jEFE9ppAu0hGi4si53AZrSdZOej/zMrh0zhyjBdUeFJc4vyXFCjay6o286oo0kINLy/
 FIxMtHJmVgbdAV/yuVtaMORxNjOcEwpRDVal+J+boSCp+L8XnMmE2LEAR+nLN9p1horC
 RrNCUfyjM2kR7v5rYAXqeAl0ofxT3gluVN7t0zMbuj5SP16YQqRBvOt/WPkwEWwT9KYT
 J/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693353; x=1690285353;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JRCcVx5yqkWjx+j8HRIisuUziAvNRbEhBQXvfMXuZd8=;
 b=Fsrkdm0LUEBpJd4npllNQJJVUTjIWHINwTZJgYg6W3EXhHrEhBLOhafJIxkfEfNh4E
 1JQrH3p7KkCELwCboQYvMAhqsu9p1rsaTg4nqD40yarRSpOT8N/pObOwo9UBCTj78rpg
 JpI6d6zH9TxRBAKyDvxWoXy4lov+9pOC9eM7LavYa4Shvt0AAorG/FjOUePA3NvZFFXl
 Zs4ok4GytzuRYW7wj/HG4NtieAg6ECcW3lhvf2sOLNpycTFqS7filg/incTdmGlXKGjT
 aoqLVGhjmWfY2EX0E7KRFXhRlt18M8bemS4tzptnLf1jGDnMv+w0yE15kQFB6a7aGVY0
 s1qw==
X-Gm-Message-State: AC+VfDxis+TyH2R/TX3eIGYBY/6lf22Mt+qr49DwBnHM9K5DqNb3ULsa
 gNISRzo1lpGsBW8KWXg4uUlL1A==
X-Google-Smtp-Source: ACHHUZ7docs3bpHHggTQnwRK9vZD9G6BzpVgE1c++x/CDmK3D6Xsv/RdHy9EgpRd+K39O/pVejaPOw==
X-Received: by 2002:ac2:498f:0:b0:4f8:6cf1:8163 with SMTP id
 f15-20020ac2498f000000b004f86cf18163mr12237375lfl.18.1687693353048; 
 Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Sun, 25 Jun 2023 14:42:18 +0300
Message-Id: <20230625114222.96689-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 11/15] drm/msm/hdmi: switch to
 atomic_pre_enable/post_disable
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In preparation of reworking the HDMI mode setting, switch pre_enable and
post_disable callbacks to their atomic variants.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index fbcf4dd91cd9..f9293f7d8f34 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -128,7 +128,8 @@ static void msm_hdmi_config_avi_infoframe(struct hdmi *hdmi)
 	hdmi_write(hdmi, REG_HDMI_INFOFRAME_CTRL1, val);
 }
 
-static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -154,7 +155,8 @@ static void msm_hdmi_bridge_pre_enable(struct drm_bridge *bridge)
 		msm_hdmi_hdcp_on(hdmi->hdcp_ctrl);
 }
 
-static void msm_hdmi_bridge_post_disable(struct drm_bridge *bridge)
+static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
+						struct drm_bridge_state *old_bridge_state)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -291,8 +293,13 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-	.pre_enable = msm_hdmi_bridge_pre_enable,
-	.post_disable = msm_hdmi_bridge_post_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+
+	.atomic_pre_enable = msm_hdmi_bridge_atomic_pre_enable,
+	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
+
 	.mode_set = msm_hdmi_bridge_mode_set,
 	.mode_valid = msm_hdmi_bridge_mode_valid,
 	.get_edid = msm_hdmi_bridge_get_edid,
-- 
2.39.2

